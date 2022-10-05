import 'dart:convert';

import 'package:projeto_repositories_git_clean/src/features/data/models/users_model.dart';

import 'package:projeto_repositories_git_clean/src/features/data/models/user_model.dart';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import 'github_local_datasource.dart';

const String CACHED_USERS = 'CACHED_USERS';

class GithubLocalDataSourceImplementation implements IGithubLocalDataSource {
  final SharedPreferences sharedPreferences;

  GithubLocalDataSourceImplementation({required this.sharedPreferences});

  UsersModel usersModel = const UsersModel(users: []);

  @override
  Future<Unit> saveUser(UserModel userToCache) {
    try {
      getBookmarkedUsers();
    } on CacheException {
      throw CacheException();
    }

    final userIndex = usersModel.users!
        .indexWhere((element) => element!.login == userToCache.login);

    if (userIndex != -1) throw UserAlreadyCachedException();

    usersModel.users!.add(userToCache);
    sharedPreferences.setString(CACHED_USERS, json.encode(usersModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<Unit> removeUser(String username) {
    try {
      getBookmarkedUsers();
    } on CacheException {}

    final userIndex =
        usersModel.users!.indexWhere((element) => element!.login == username);

    if (userIndex == -1) throw CacheException();

    usersModel.users!.removeAt(userIndex);
    sharedPreferences.setString(CACHED_USERS, json.encode(usersModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCachedUser(String username) {
    final jsonString = sharedPreferences.getString(CACHED_USERS);

    final usersModel = UsersModel.fromJson(jsonDecode(jsonString!));
    final userIndex =
        usersModel.users!.indexWhere((element) => element!.login == username);

    if (userIndex == -1) throw CacheException();

    return Future.value(usersModel.users![userIndex]);
  }

  @override
  Future<UsersModel> getBookmarkedUsers() {
    final jsonString = sharedPreferences.getString(CACHED_USERS);

    if (jsonString == null) throw CacheException();

    usersModel = UsersModel.fromJson(json.decode(jsonString));
    return Future.value(usersModel);
  }
}
