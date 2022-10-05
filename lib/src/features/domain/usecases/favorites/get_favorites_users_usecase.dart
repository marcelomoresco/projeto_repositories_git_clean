// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/users_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/repositories/github_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetFavoritesUsersUsecase implements Usecase<UsersEntity, NoParams> {
  final IGithubRepository githubRepository;

  GetFavoritesUsersUsecase({
    required this.githubRepository,
  });

  @override
  Future<Either<Failure, UsersEntity>> call(NoParams params) async {
    return await githubRepository.getFavoritesUsers();
  }
}
