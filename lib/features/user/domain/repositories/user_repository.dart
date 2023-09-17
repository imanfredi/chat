import 'package:chat/features/user/domain/models/user.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, AppUser>> getUserByEmail({
    required String email,
  });

  Future<Either<Failure, AppUser>> createUser({
    required String email,
    required String id,
  });
}
