// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/features/login/data/datasources/remote/firebase_datasource.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/repository/firebase_repository.dart';

class FirebaseRepositoryImplementation implements FirebaseRepository {
  final IFirebaseRemoteDatasource firebaseRemoteDatasource;

  FirebaseRepositoryImplementation({
    required this.firebaseRemoteDatasource,
  });

  @override
  Future<Either<Failure, Unit>> signIn(UserLoginEntity user) async {
    try {
      await firebaseRemoteDatasource.signIn(user);
      return const Right(unit);
    } catch (e) {
      return Left(
        FirebaseFailure("Erro ao fazer contato com o Firebase"),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await firebaseRemoteDatasource.signOut();
      return Right(result);
    } catch (e) {
      return Left(
        FirebaseFailure("Erro ao fazer contato com o Firebase"),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(UserLoginEntity user) async {
    try {
      await firebaseRemoteDatasource.signUp(user);
      return const Right(unit);
    } catch (e) {
      return Left(
        FirebaseFailure("Erro ao fazer contato com o Firebase"),
      );
    }
  }
}
