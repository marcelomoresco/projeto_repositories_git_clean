import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required int id,
    required String login,
    required String avatar_url,
    required String name,
    required String bio,
    required String location,
    required int followers,
    required int following,
  }) : super(
          id: id,
          login: login,
          avatar_url: avatar_url,
          name: name,
          bio: bio,
          location: location,
          followers: followers,
          following: following,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      login: json['login'],
      avatar_url: json['avatar_url'],
      name: json['name'],
      bio: json['bio'],
      location: json['location'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "login": login,
      "name": name,
      "avatar_url": avatar_url,
      "bio": bio,
      "location": location,
      "followers": followers,
      "following": following,
    };
  }
}
