import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_todo/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late User currentUser;
  UserBloc() : super(UserInitial()) {
    on<UserLoadingEvent>((event, emit) async{
      emit(const UserLoadingState());

      SharedPreferences pref =
      await SharedPreferences.getInstance();

      bool? isAuthenticated = pref.getBool('is_authenticated');
      if(isAuthenticated == null) return;

      // get the user by email
      String? email = pref.getString('auth_email');

      User user = await UserService().getByEmail(email!);
      currentUser = user;
      emit(UserLoadedState(user: user));
    });

    on<UserSavingEvent>((event, emit) async {
      emit(const UserLoadingState());
      Map<String, dynamic> userData = {
        'username' : event.username,
        'email' : event.email,
      };
      await UserService().update(event.id, userData);
      User user = await UserService().getByEmail(event.email);
      currentUser = user;
      saveUserToLocalStorage(user);
      emit(UserLoadedState(user: user));
    });

    on<UserLoginEvent>((event, emit) async {
      emit(const UserLoadingState());

      UserService userService = UserService();
      dynamic user = await userService.canLoginUsingEmailAndPassword(event.email, event.password);

      if (user == false) {
        emit(const UserErrorState('Invalid credentials.'));
        return;
      }

      saveUserToLocalStorage(user);
      currentUser = user;
      emit(UserLoadedState(user: user));
    });

    on<UserSignUpEvent>((event, emit) async {
      emit(const UserLoadingState());
      User user = User(
        username: event.username,
        email: event.email,
        password: md5
            .convert(utf8.encode(event.password))
            .toString(),
        createdAt: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        updatedAt: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
      );

      UserService userService = UserService();

      if (await userService.emailExists(event.email) ==
          true) {
        emit(const UserErrorState('Email Exists.'));
        return;
      }

      await userService.create(user);
      saveUserToLocalStorage(user);
      currentUser = user;
      emit(UserLoadedState(user: user));
    });

    on<UserLogOutEvent>((event, emit) async {
      await clearLocalStorage();
      emit(const UserLoadingState());
    });

  }

  Future<void> saveUserToLocalStorage(User user) async {
    // save auth user to shared preferences
    SharedPreferences pref =
        await SharedPreferences.getInstance();
    await pref.setString(
        'auth_username', user.username.toString());
    await pref.setString(
        'auth_email', user.email.toString());
    await pref.setString(
        'auth_password', user.password.toString());
    await pref.setBool('is_authenticated', true);
  }

  Future<void> clearLocalStorage() async {
    // save auth user to shared preferences
    SharedPreferences pref =
    await SharedPreferences.getInstance();
    await pref.clear();
  }
}
