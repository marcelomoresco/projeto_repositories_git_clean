// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_repositories_git_clean/src/core/conts/strings/custom_failures_messages.dart';

import 'package:projeto_repositories_git_clean/src/features/domain/usecases/users/get_users_by_name_usecase.dart';

import '../../../domain/entities/users_entity.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersByNameUsecase getUsersByNameUsecase;

  UsersBloc({
    required this.getUsersByNameUsecase,
  }) : super(UsersInitial()) {
    on<GetUsersByNameEvent>(_onGetUsersByName);
  }

  void _onGetUsersByName(
      GetUsersByNameEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoadingState());
    final result = await getUsersByNameUsecase(event.username);

    result.fold(
        (failure) => emit(const UsersErrorState(
            errorMessage: AppFailureMessages.SERVER_FAILURE)),
        (newUsers) => emit(UsersLoadedState(users: newUsers)));
  }
}
