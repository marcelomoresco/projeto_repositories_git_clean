// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../entities/users_entity.dart';
import '../../repositories/github_repository.dart';

class GetUsersByNameUsecase implements Usecase<UsersEntity, String> {
  final IGithubRepository githubRepository;

  GetUsersByNameUsecase({
    required this.githubRepository,
  });

  @override
  Future<Either<Failure, UsersEntity>> call(String name) async {
    return await githubRepository.getUserByName(name);
  }
}
