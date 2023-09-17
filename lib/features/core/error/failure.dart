import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, this.description = ""});

  final String message;
  final String description;

  @override
  List<Object?> get props => [message, description];
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({
    required String message,
    required String description,
  }) : super(message: message, description: description);
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure({
    String? email,
  }) : super(message: _failureMessage, description: email ?? '');

  static const _failureMessage = "User not found";
}

class ServerFailure extends Failure {
  const ServerFailure({
    String description = '',
  }) : super(message: _failureMessage, description: description);

  static const _failureMessage = "Server Failure";
}
