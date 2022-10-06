// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final UsersEntity users;

  const UsersLoadedState({
    required this.users,
  });

  @override
  List<Object> get props => [users];
}

class UsersErrorState extends UsersState {
  final String errorMessage;

  const UsersErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
