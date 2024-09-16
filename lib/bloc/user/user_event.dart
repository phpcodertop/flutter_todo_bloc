part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserLoadingEvent extends UserEvent {}
class UserLogOutEvent extends UserEvent {}

class UserLoadedEvent extends UserEvent{
  final User user;

  UserLoadedEvent({required this.user});
}

class UserSavingEvent extends UserEvent {
  final int id;
  final String username;
  final String email;

  const UserSavingEvent({
    required this.id,
    required this.username,
    required this.email,
  });
}

class UserSignUpEvent extends UserEvent {
  final String username;
  final String email;
  final String password;

  const UserSignUpEvent({
    required this.username,
    required this.email,
    required this.password,
  });
}

class UserLoginEvent extends UserEvent {
  final String email;
  final String password;

  const UserLoginEvent({
    required this.email,
    required this.password,
  });
}