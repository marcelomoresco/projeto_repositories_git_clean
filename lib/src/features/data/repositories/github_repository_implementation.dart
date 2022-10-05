import 'package:projeto_repositories_git_clean/src/features/domain/entities/users_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_git_repositories_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_entity.dart';
import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/repositories/github_repository.dart';

class GithutRepositoryImplementation implements IGithubRepository {
  @override
  Future<Either<Failure, UsersEntity>> getFavoritesUsers() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserGitRepositoriesEntity>> getGitRepositories(
      String username) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUser(String username) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UsersEntity>> getUserByName(String name) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeUserFromFavorites(String username) {
    // TODO: implement removeUserFromFavorites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveUser(UserEntity user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
