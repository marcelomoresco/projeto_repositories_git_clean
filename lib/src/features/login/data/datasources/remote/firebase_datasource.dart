import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';

abstract class IFirebaseRemoteDatasource {
  Future<void> signIn(UserLoginEntity user);
  Future<void> signUp(UserLoginEntity user);
  Future<void> signOut();
}
