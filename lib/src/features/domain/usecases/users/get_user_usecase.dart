// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/core/usecases/usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/entities/user_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/repositories/github_repository.dart';

class GetUserUsecase implements Usecase<UserEntity, String> {
  final IGithubRepository githubRepository;
  GetUserUsecase({
    required this.githubRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> call(String username) async {
    return await githubRepository.getUser(username);
  }
}
