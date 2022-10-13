// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/entities/user_git_repositories_entity.dart';
import '../../../domain/usecases/git_repositories/get_git_repositories_usecase.dart';
import '../../../domain/usecases/users/get_user_usecase.dart';

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
}
