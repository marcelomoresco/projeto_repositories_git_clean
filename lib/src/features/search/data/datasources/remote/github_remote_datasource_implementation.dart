// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:projeto_repositories_git_clean/src/features/search/data/models/users_model.dart';

import '../../../../../core/error/exceptions.dart';
import '../../models/user_git_repositories_model.dart';
import '../../models/user_model.dart';
import 'github_remote_datasource.dart';

class GithubRemoteDatasourceImplementation implements IGithubRemoteDataSource {
  final http.Client client;

  GithubRemoteDatasourceImplementation({
    required this.client,
  });

  @override
  Future<List<UserGitRepositoriesModel>> getGitRepositories(
      String username) async {
    final response = await client.get(
      Uri.parse("https://api.github.com/users/$username/repos"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var models = jsonDecode(response.body);
      List<UserGitRepositoriesModel> gitModels = [];

      //testado!
      for (var model in models) {
        UserGitRepositoriesModel gitModel =
            UserGitRepositoriesModel.fromJson(model);
        gitModels.add(gitModel);
      }

      return gitModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUser(String username) async {
    final response = await client.get(
      Uri.parse("https://api.github.com/users/$username"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return UserModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UsersModel> getUsersWithName(String name) async {
    final response = await client.get(
      Uri.parse("https://api.github.com/search/users?q=$name+in:user"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return UsersModel.fromJson(json);
    } else {
      throw ServerException();
    }
  }
}
