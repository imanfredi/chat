import 'package:chat/features/chats/domain/models/member.dart';

class MemberEntity {
  static const String collectionName = 'users';

  final String id;
  final String email;

  const MemberEntity({
    required this.id,
    required this.email,
  });

  factory MemberEntity.fromJson({
    required String userId,
    required Map<String, dynamic> json,
  }) {
    return MemberEntity(
      id: userId,
      email: json['email'],
    );
  }

  Member toModel() {
    return Member(
      id: id,
      email: email,
    );
  }
}
