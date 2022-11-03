part of 'user_login_cubit.dart';

abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object> get props => [];
}

class UserLoginInitial extends UserLoginState {}

class UserFailureState extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserLoginState {
  @override
  List<Object> get props => [];
}
