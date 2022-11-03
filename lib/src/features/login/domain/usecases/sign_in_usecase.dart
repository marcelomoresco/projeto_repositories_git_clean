import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/core/usecases/usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/repository/firebase_repository.dart';

class SignInUsecase implements Usecase<Unit, UserLoginEntity> {
  final FirebaseRepository firebaseRepository;

  SignInUsecase({required this.firebaseRepository});

  @override
  Future<Either<Failure, Unit>> call(UserLoginEntity user) async {
    return await firebaseRepository.signIn(user);
  }
}
