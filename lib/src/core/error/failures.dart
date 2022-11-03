// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class OfflineFailure extends Failure {}

class FirebaseFailure extends Failure {
  final String? errorMessage;
  FirebaseFailure(
    this.errorMessage,
  );
}
