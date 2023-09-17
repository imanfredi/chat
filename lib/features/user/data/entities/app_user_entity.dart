import 'package:chat/features/user/domain/models/user.dart';

class AppUserEntity {
  static const String collectionName = 'users';

  final String id;
  final String email;

  const AppUserEntity({
    required this.id,
    required this.email,
  });

  factory AppUserEntity.fromJson({
    required String userId,
    required Map<String, dynamic> json,
  }) {
    return AppUserEntity(
      id: userId,
      email: json['email'],
    );
  }

  AppUser toModel() {
    return AppUser(
      id: id,
      email: email,
    );
  }
}
