// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/core/error/exceptions.dart';
import 'package:projeto_repositories_git_clean/src/features/data/models/user_git_repositories_model.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/user_git_repositories_entity.dart';
import '../../domain/entities/users_entity.dart';
import '../../domain/repositories/github_repository.dart';
import '../datasources/local/github_local_datasource.dart';
import '../datasources/remote/github_remote_datasource.dart';
import '../models/user_model.dart';

class GithutRepositoryImplementation implements IGithubRepository {
  final IGithubLocalDataSource githubLocalDataSource;
  final IGithubRemoteDataSource githubRemoteDataSource;
  final NetworkInfo networkInfo;

  GithutRepositoryImplementation({
    required this.githubLocalDataSource,
    required this.githubRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UsersEntity>> getFavoritesUsers() async {
    try {
      final users = await githubLocalDataSource.getBookmarkedUsers();
      return Right(users);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  /*@override
  Future<Either<Failure, UserGitRepositoriesEntity>> getGitRepositories(
      String username) async {
    try {
      final gitRepositories =
          await githubRemoteDataSource.getGitRepositories(username);
      return Right(gitRepositories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }*/

  @override
  Future<Either<Failure, UserEntity>> getUser(String username) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await githubRemoteDataSource.getUser(username);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final user = await githubLocalDataSource.getCachedUser(username);
        return Right(user);
      } on CacheException {
        return Left(OfflineFailure());
      }
    }
  }

  @override
  Future<Either<Failure, UsersEntity>> getUserByName(String name) async {
    if (await networkInfo.isConnected) {
      try {
        final users = await githubRemoteDataSource.getUsersWithName(name);
        return Right(users);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeUserFromFavorites(String username) async {
    try {
      await githubLocalDataSource.removeUser(username);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveUser(UserEntity user) async {
    /*await githubLocalDataSource.saveUser(user);
    return const Right(unit);*/
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserGitRepositoriesEntity>> getGitRepositories(
      String username) async {
    /*if (await networkInfo.isConnected) {
      try {
        final users = await githubRemoteDataSource.getGitRepositories(username);
        return Right(users);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }*/
    throw UnimplementedError();
  }
}
