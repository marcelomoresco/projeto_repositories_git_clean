// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../entities/user_git_repositories_entity.dart';
import '../../repositories/github_repository.dart';

class GetGitRepositoriesUsecase
    implements Usecase<List<UserGitRepositoriesEntity>, String> {
  final IGithubRepository githubRepository;

  GetGitRepositoriesUsecase({
    required this.githubRepository,
  });

  @override
  Future<Either<Failure, List<UserGitRepositoriesEntity>>> call(
      String username) {
    return githubRepository.getGitRepositories(username);
  }
}
