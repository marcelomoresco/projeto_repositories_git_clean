import 'package:dartz/dartz.dart';
import 'package:projeto_repositories_git_clean/src/core/error/failures.dart';
import 'package:projeto_repositories_git_clean/src/core/usecases/usecase.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/repository/firebase_repository.dart';

class SignOutUsecase implements Usecase<void, NoParams> {
  final FirebaseRepository firebaseRepository;

  SignOutUsecase({required this.firebaseRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await firebaseRepository.signOut();
  }
}
