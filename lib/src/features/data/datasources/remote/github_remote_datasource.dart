import 'package:projeto_repositories_git_clean/src/features/data/models/user_git_repositories_model.dart';

import '../../models/user_model.dart';
import '../../models/users_model.dart';

abstract class IGithubRemoteDataSource {
  Future<UsersModel> getUsersWithName(String name);
  Future<UserModel> getUser(String username);
  Future<List<UserGitRepositoriesModel>> getGitRepositories(String username);
}
