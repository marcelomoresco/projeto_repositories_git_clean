// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_entity.dart';

class UsersEntity extends Equatable {
  final List<UserEntity?>? users;

  const UsersEntity({
    required this.users,
  });

  @override
  List<Object?> get props => [users];
}
