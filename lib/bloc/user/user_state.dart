part of 'user_bloc.dart';

abstract class UserState {
  const UserState();
}

final class UserInitial extends UserState {}

final class UserLoadedState extends UserState {
  final User user;
  const UserLoadedState({ required this.user });
}

final class UserLoadingState extends UserState {
  const UserLoadingState();
}

class UserErrorState  extends UserState{
  final String errorMessage;
  const UserErrorState(this.errorMessage);
}
