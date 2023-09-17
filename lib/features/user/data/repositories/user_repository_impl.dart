import 'package:chat/dependency_injector.dart';
import 'package:chat/features/core/error/exception.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/data/datasources/user_data_source.dart';
import 'package:chat/features/user/data/entities/app_user_entity.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:chat/features/user/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource = getIt<UserDatasource>();

  @override
  Future<Either<Failure, AppUser>> getUserByEmail({
    required String email,
  }) async {
    try {
      final Option<AppUserEntity> userEntity =
          await _userDatasource.getUserByEmail(email: email);

      if (userEntity.isNone()) {
        return Left(UserNotFoundFailure(email: email));
      }

      return Right(userEntity.toNullable()!.toModel());
    } on ServerException catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUser>> createUser({
    required String email,
    required String id,
  }) async {
    try {
      final AppUserEntity user =
          await _userDatasource.createUser(email: email, id: id);
      return Right(user.toModel());
    } on ServerException catch (e) {
      return const Left(
          ServerFailure(description: 'Error while creating user'));
    }
  }
}
