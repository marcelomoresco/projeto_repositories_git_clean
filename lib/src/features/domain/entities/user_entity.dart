// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String login;
  final String avatar_url;
  final String name;
  final String bio;
  final String location;
  final int followers;
  final int following;

  const UserEntity({
    required this.id,
    required this.login,
    required this.avatar_url,
    required this.name,
    required this.bio,
    required this.location,
    required this.followers,
    required this.following,
  });

  @override
  List<Object?> get props => [
        id,
        login,
        avatar_url,
        name,
        bio,
        location,
        followers,
        following,
      ];
}
