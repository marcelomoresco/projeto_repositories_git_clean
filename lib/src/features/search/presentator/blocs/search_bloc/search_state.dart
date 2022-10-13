// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final UserEntity? user;
  final UserGitRepositoriesEntity? usersGit;

  const SearchLoadedState({
    this.usersGit,
    this.user,
  });

  @override
  List<Object?> get props => [user, usersGit];
}

class SearchErrorState extends SearchState {
  final String errorMessage;
  const SearchErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
