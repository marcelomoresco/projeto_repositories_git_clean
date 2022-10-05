import 'package:projeto_repositories_git_clean/src/features/data/models/users_model.dart';

import 'package:projeto_repositories_git_clean/src/features/data/models/user_model.dart';

import 'package:dartz/dartz.dart';

import 'github_local_datasource.dart';

class GithubLocalDatasourceImplementation implements IGithubLocalDataSource {
  @override
  Future<UsersModel> getBookmarkedUsers() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCachedUser(String username) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeUser(String username) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> saveUser(UserModel userToCache) {
    throw UnimplementedError();
  }
}
