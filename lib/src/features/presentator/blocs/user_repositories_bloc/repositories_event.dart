// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'repositories_bloc.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object> get props => [];
}

class GetUserRepositoriesEvent extends RepositoriesEvent {
  final String username;

  const GetUserRepositoriesEvent({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}
