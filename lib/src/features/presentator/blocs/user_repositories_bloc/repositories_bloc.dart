import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/usecases/git_repositories/get_git_repositories_usecase.dart';

import '../../../domain/entities/user_git_repositories_entity.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final GetGitRepositoriesUsecase getGitRepositoriesUsecase;

  RepositoriesBloc({required this.getGitRepositoriesUsecase})
      : super(RepositoriesInitialState()) {
    on<GetUserRepositoriesEvent>(_onGetUserRepositoriesEvent);
  }

  void _onGetUserRepositoriesEvent(
      GetUserRepositoriesEvent event, Emitter<RepositoriesState> emit) async {
    emit(RepositoriesLoadingState());

    final result = await getGitRepositoriesUsecase(event.username);

    result.fold(
      (failure) => emit(
        const RepositoriesErrorState(
            errorMessage: "Erro ao fazer a consulta de repositórios!"),
      ),
      (repositories) => emit(
        RepositoriesLoadedState(userGitRepositoriesEntity: repositories),
      ),
    );
  }
}
