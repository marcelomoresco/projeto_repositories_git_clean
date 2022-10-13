// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'repositories_bloc.dart';

abstract class RepositoriesState extends Equatable {
  const RepositoriesState();

  @override
  List<Object> get props => [];
}

class RepositoriesInitialState extends RepositoriesState {}

class RepositoriesLoadingState extends RepositoriesState {}

class RepositoriesLoadedState extends RepositoriesState {
  final List<UserGitRepositoriesEntity> userGitRepositoriesEntity;
  const RepositoriesLoadedState({
    required this.userGitRepositoriesEntity,
  });

  @override
  List<Object> get props => [userGitRepositoriesEntity];
}

class RepositoriesErrorState extends RepositoriesState {
  final String errorMessage;

  const RepositoriesErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
