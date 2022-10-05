// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/core/usecases/usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/repositories/github_repository.dart';

class RemoveUsersFromFavoritesUsecase implements Usecase<Unit, String> {
  final IGithubRepository githubRepository;

  RemoveUsersFromFavoritesUsecase({
    required this.githubRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(String username) async {
    return await githubRepository.removeUserFromFavorites(username);
  }
}
