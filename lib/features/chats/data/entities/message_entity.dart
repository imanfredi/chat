import 'package:chat/features/chats/data/entities/member_entity.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageEntity {
  final String content;
  final MemberEntity messenger;
  final String id;
  final DateTime? creationTime;

  static const String collectionName = 'messages';

  const MessageEntity({
    required this.id,
    required this.messenger,
    required this.content,
    required this.creationTime,
  });

  factory MessageEntity.fromJson({
    required String messageId,
    required Map<String, dynamic> json,
  }) {
    DateTime? creationTime = json['creationTime'] != null
        ? ((json['creationTime'] as Timestamp).toDate())
        : null;
    MemberEntity memberEntity = MemberEntity.fromJson(
        userId: json['messenger']['id'], json: json['messenger']);

    return MessageEntity(
      id: messageId,
      content: json['content'],
      creationTime: creationTime,
      messenger: memberEntity,
    );
  }

  Message toModel() {
    return Message(
      id: id,
      messenger: messenger.toModel(),
      creationTime: creationTime!,
      content: content,
    );
  }
}
