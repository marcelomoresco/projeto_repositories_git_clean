import 'package:dartz/dartz.dart';

import '../../models/user_model.dart';
import '../../models/users_model.dart';

const String CACHED_USERS = 'CACHED_USERS';

abstract class IGithubLocalDataSource {
  Future<Unit> saveUser(UserModel userToCache);
  Future<Unit> removeUser(String username);
  Future<UserModel> getCachedUser(String username);
  Future<UsersModel> getBookmarkedUsers();
}
