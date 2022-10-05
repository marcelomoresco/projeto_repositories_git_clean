// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {
  final GetFavoritesUsersUsecase getFavoritesUsersUsecase;

  const FavoritesLoadedState({
    required this.getFavoritesUsersUsecase,
  });

  @override
  List<Object> get props => [getFavoritesUsersUsecase];
}

class FavoritesErrorState extends FavoritesState {
  final String errorMessage;
  const FavoritesErrorState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
