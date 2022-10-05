// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class StartFavoriteEvent extends FavoritesEvent {}

class GetFavoritesEvent extends FavoritesEvent {
  final GetFavoritesUsersUsecase getFavoritesUsersUsecase;

  const GetFavoritesEvent({
    required this.getFavoritesUsersUsecase,
  });

  @override
  List<Object> get props => [getFavoritesUsersUsecase];
}

class AddFavoritesEvent extends FavoritesEvent {
  final UserGitRepositoriesEntity githubRepositories;
  const AddFavoritesEvent({
    required this.githubRepositories,
  });

  @override
  List<Object> get props => [githubRepositories];
}

class RemoveFavoritesEvent extends FavoritesEvent {
  final UserGitRepositoriesEntity githubRepositories;

  const RemoveFavoritesEvent({
    required this.githubRepositories,
  });

  @override
  List<Object> get props => [githubRepositories];
}
