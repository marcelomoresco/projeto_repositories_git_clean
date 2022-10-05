import '../../domain/entities/user_git_repositories_entity.dart';

class UserGitRepositoriesModel extends UserGitRepositoriesEntity {
  const UserGitRepositoriesModel({
    required int repoId,
    required String name,
    required String description,
    required String visibility,
    required String language,
    required int forks_count,
  }) : super(
          repoId: repoId,
          name: name,
          description: description,
          visibility: visibility,
          language: language,
          forks_count: forks_count,
        );

  factory UserGitRepositoriesModel.fromJson(Map<String, dynamic> json) {
    return UserGitRepositoriesModel(
      repoId: json['id'],
      name: json['name'],
      description: json['description'],
      visibility: json['visibility'],
      language: json['language'],
      forks_count: json['forks_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': repoId,
      "name": name,
      "description": description,
      "visibility": visibility,
      "language": language,
      "forks_count": forks_count,
    };
  }
}
