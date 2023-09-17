import 'package:chat/dependency_injector.dart';
import 'package:chat/features/auth/data/datasources/auth_data_source.dart';
import 'package:chat/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/data/entities/app_user_entity.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:chat/features/user/domain/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource = getIt<AuthDataSource>();
  final UserRepository _userRepository = getIt<UserRepository>();

  @override
  Future<Either<Failure, AppUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await _authDataSource.signInWithEmailAndPassword(
          email: email, password: password);
      final userEither =
          await _userRepository.getUserByEmail(email: user!.email!);

      return Right(userEither.getRight().toNullable()!);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    } on Exception catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authDataSource.signOut();
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, AppUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await _authDataSource.signUpWithEmailAndPassword(
          email: email, password: password);

      final userEither =
          await _userRepository.createUser(email: user!.email!, id: user.uid);

      return Right(userEither.getRight().toNullable()!);
    } on FirebaseAuthException catch (e) {
      return Left(
        FirebaseAuthFailure(
          message: e.code,
          description: e.message ?? '',
        ),
      );
    }
  }
}
