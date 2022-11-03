import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projeto_repositories_git_clean/src/core/usecases/usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/usecases/sign_out_usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/usecases/sign_up_usecase.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final SignOutUsecase signOutUsecase;

  UserLoginCubit({
    required this.signInUsecase,
    required this.signUpUsecase,
    required this.signOutUsecase,
  }) : super(UserLoginInitial());
  Future<void> submitSignIn({required UserLoginEntity user}) async {
    emit(UserLoadingState());
    try {
      await signInUsecase.call(user);
      emit(UserLoadedState());
    } catch (_) {
      emit(UserFailureState());
    }
  }

  Future<void> submitSignUp({required UserLoginEntity user}) async {
    emit(UserLoadingState());
    try {
      await signUpUsecase.call(user);
      emit(UserLoadedState());
    } catch (_) {
      emit(UserFailureState());
    }
  }

  Future<void> signOut() async {
    emit(UserLoadingState());
    try {
      await signOutUsecase.call(NoParams());
      emit(UserLoadedState());
    } catch (_) {
      emit(UserFailureState());
    }
  }
}
