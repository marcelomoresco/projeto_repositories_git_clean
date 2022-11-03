// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:projeto_repositories_git_clean/src/features/login/data/datasources/remote/firebase_datasource.dart';
import 'package:projeto_repositories_git_clean/src/features/login/domain/entities/user_login_entity.dart';

class FirebaseDatasourceImplementation implements IFirebaseRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  FirebaseDatasourceImplementation({
    required this.firebaseAuth,
  });

  @override
  Future<void> signIn(UserLoginEntity user) async => firebaseAuth
      .signInWithEmailAndPassword(email: user.email!, password: user.password!);

  @override
  Future<void> signOut() async => firebaseAuth.signOut();

  @override
  Future<void> signUp(UserLoginEntity user) async =>
      firebaseAuth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
}
