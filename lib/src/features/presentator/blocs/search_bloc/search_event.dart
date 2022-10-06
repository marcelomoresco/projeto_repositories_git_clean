// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfoEvent extends SearchEvent {
  final String username;

  const GetUserInfoEvent({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}

class GetUserRepositoriesGitEvent extends SearchEvent {
  final String username;

  const GetUserRepositoriesGitEvent({
    required this.username,
  });

  @override
  List<Object> get props => [username];
}
