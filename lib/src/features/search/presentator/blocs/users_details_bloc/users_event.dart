part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUsersByNameEvent extends UsersEvent {
  final String username;
  const GetUsersByNameEvent({required this.username});

  @override
  List<Object> get props => [username];
}
