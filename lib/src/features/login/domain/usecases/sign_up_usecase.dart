import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/repository/firebase_repository.dart';

import '../../../../core/usecases/usecase.dart';

class SignUpUsecase implements Usecase<Unit, UserLoginEntity> {
  final FirebaseRepository firebaseRepository;

  SignUpUsecase({required this.firebaseRepository});

  @override
  Future<Either<Failure, Unit>> call(UserLoginEntity user) async {
    return await firebaseRepository.signUp(user);
  }
}
