// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/features/domain/repositories/github_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../../entities/user_entity.dart';

class SaveUserUsecase implements Usecase<Unit, UserEntity> {
  final IGithubRepository githubRepository;

  SaveUserUsecase({
    required this.githubRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await githubRepository.saveUser(user);
  }
}
