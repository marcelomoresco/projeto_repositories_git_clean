// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_git_repositories_entity.dart';

import 'package:projeto_repositories_git_clean/src/features/domain/usecases/favorites/get_favorites_users_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/favorites/remove_users_from_favorites_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/git_repositories/get_git_repositories_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/users/get_user_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/users/save_users_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetUserUsecase getUserUseCase;
  final GetGitRepositoriesUsecase getGitRepositoriesUsecase;
  SearchBloc({
    required this.getGitRepositoriesUsecase,
    required this.getUserUseCase,
  }) : super(SearchInitialState()) {
    on<GetUserInfoEvent>(_onGetUserInfoEvent);
    on<GetUserRepositoriesGitEvent>(_onGetUserRepositoriesGitEvent);
  }

  void _onGetUserInfoEvent(
      GetUserInfoEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    final result = await getUserUseCase(event.username);

    result.fold(
      (failure) =>
          emit(const SearchErrorState(errorMessage: "Erro ao consultar!")),
      (user) => emit(SearchLoadedState(user: user)),
    );
  }

  void _onGetUserRepositoriesGitEvent(
      GetUserRepositoriesGitEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    final result = await getGitRepositoriesUsecase(event.username);
    print(result);

    result.fold(
      (failure) =>
          emit(const SearchErrorState(errorMessage: "Erro ao consultar!")),
      (userGit) => emit(SearchLoadedState(usersGit: userGit)),
    );
  }
}
