import 'package:projeto_repositories_git_clean/src/features/search/data/models/user_model.dart';

import '../../domain/entities/users_entity.dart';

class UsersModel extends UsersEntity {
  final List<UserModel?>? users;

  const UsersModel({required this.users}) : super(users: users);
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      users: (json['items'] as List)
          .map((item) => item == null
              ? null
              : UserModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
