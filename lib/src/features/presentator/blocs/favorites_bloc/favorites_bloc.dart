// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_repositories_git_clean/src/core/usecases/usecase.dart';

import 'package:projeto_repositories_git_clean/src/features/domain/usecases/favorites/get_favorites_users_usecase.dart';

import '../../../domain/entities/user_git_repositories_entity.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUsersUsecase getFavoritesUsersUsecase;

  FavoritesBloc({
    required this.getFavoritesUsersUsecase,
  }) : super(FavoritesLoadingState()) {
    on<GetFavoritesEvent>(_onGetFavoritesEvent);
  }

  void _onGetFavoritesEvent(
      GetFavoritesEvent event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());
    try {
      final result = await getFavoritesUsersUsecase.call(NoParams());
      print(result);
      result.fold(
        (failed) => emit(const FavoritesErrorState(
            errorMessage: "Erro ao consultar favoritos!")),
        (sucess) => emit(
          FavoritesLoadedState(
            getFavoritesUsersUsecase: getFavoritesUsersUsecase,
          ),
        ),
      );
    } catch (_) {
      emit(
        const FavoritesErrorState(
          errorMessage: "Erro ao Carregar Favoritos",
        ),
      );
    }
  }
}
