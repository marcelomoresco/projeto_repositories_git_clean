import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';

abstract class FirebaseRepository {
  Future<Either<Failure, Unit>> signIn(UserLoginEntity user);
  Future<Either<Failure, Unit>> signUp(UserLoginEntity user);
  Future<Either<Failure, void>> signOut();
}
