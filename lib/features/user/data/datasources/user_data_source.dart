import 'package:chat/dependency_injector.dart';
import 'package:chat/features/core/error/exception.dart';
import 'package:chat/features/user/data/entities/app_user_entity.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class UserDatasource {
  Future<Option<AppUserEntity>> getUserByEmail({
    required String email,
  });

  Future<AppUserEntity> createUser({
    required String id,
    required String email,
  });

  Future<void> addUserToGroup({
    required AppUser user,
    required String groupId,
  });

  Future<Option<AppUserEntity>> getUserById({
    required String userId,
  });

  Future<List<String>> getGroupsIdFromUser({
    required String userId,
  });
}

@Injectable(as: UserDatasource)
class UserDatasourceImpl implements UserDatasource {
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  @override
  Future<Option<AppUserEntity>> getUserByEmail({
    required String email,
  }) async {
    try {
      final response =
          await _db.collection("users").where("email", isEqualTo: email).get();
      if (response.docs.isEmpty) {
        return const Option.none();
      }

      final userDoc = response.docs.first;

      AppUserEntity userEntity = AppUserEntity.fromJson(
        userId: userDoc.id,
        json: userDoc.data(),
      );
      return Option.of(userEntity);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<AppUserEntity> createUser({
    required String id,
    required String email,
  }) async {
    try {
      final query = _db.collection(AppUserEntity.collectionName).doc(id);

      final userDataMap = {
        'email': email,
      };

      await query.set(userDataMap);

      return AppUserEntity.fromJson(userId: id, json: userDataMap);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> addUserToGroup({
    required AppUser user,
    required String groupId,
  }) async {
    try {
      await _db
          .collection(AppUserEntity.collectionName)
          .doc(user.id)
          .collection('groups')
          .add({'id': groupId});
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Option<AppUserEntity>> getUserById({
    required String userId,
  }) async {
    try {
      final response = await _db.collection("users").doc(userId).get();
      if (!response.exists) {
        return const Option.none();
      }

      AppUserEntity userEntity = AppUserEntity.fromJson(
        userId: response.id,
        json: response.data()!,
      );
      return Option.of(userEntity);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getGroupsIdFromUser({
    required String userId,
  }) async {
    try {
      final response =
          await _db.collection("users").doc(userId).collection('groups').get();
      if (response.docs.isEmpty) {
        return List.of([]);
      }

      List<String> ids =
          (response.docs.map((g) => g.data()['id'] as String).toList());

      return ids;
    } catch (e) {
      throw ServerException();
    }
  }
}
