// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserGitRepositoriesEntity extends Equatable {
  final int repoId;
  final String name;
  final String description;
  final String language;
  final String visibility;
  final int forks_count;
  final bool isFavorite;

  const UserGitRepositoriesEntity({
    required this.repoId,
    required this.name,
    required this.description,
    required this.language,
    required this.visibility,
    required this.forks_count,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        repoId,
        name,
        description,
        language,
        visibility,
        isFavorite,
      ];
}
