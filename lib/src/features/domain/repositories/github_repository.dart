import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_git_repositories_entity.dart';

import '../../../core/error/failures.dart';
import '../entities/users_entity.dart';

abstract class IGithubRepository {
  Future<Either<Failure, UserEntity>> getUser(String username);
  Future<Either<Failure, Unit>> removeUserFromFavorites(String username);
  Future<Either<Failure, Unit>> saveUser(UserEntity user);
  Future<Either<Failure, UsersEntity>> getFavoritesUsers();
  Future<Either<Failure, UsersEntity>> getUserByName(String name);
  Future<Either<Failure, List<UserGitRepositoriesEntity>>> getGitRepositories(
      String username);
}
