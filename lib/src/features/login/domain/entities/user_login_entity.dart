// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserLoginEntity extends Equatable {
  final String? name;
  final String? email;
  final String? uid;
  final String? password;

  const UserLoginEntity({
    this.name,
    this.email,
    this.uid,
    this.password,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        uid,
        password,
      ];
}
