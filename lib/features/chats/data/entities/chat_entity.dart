import 'package:chat/features/chats/data/entities/message_entity.dart';
import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/domain/models/member.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  static const String collectionName = 'chats';

  final String groupId;
  final List<MessageEntity> messages;

  const ChatEntity({
    required this.groupId,
    required this.messages,
  });

  factory ChatEntity.fromJson({
    required String groupId,
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> messages,
  }) {
    List<MessageEntity> messagesEntities = messages
        .map((m) => MessageEntity.fromJson(messageId: m.id, json: m.data()))
        .toList();

    return ChatEntity(
      groupId: groupId,
      messages: messagesEntities,
    );
  }

  Chat toModel({
    required List<Member> members,
    required String groupName,
  }) {
    return Chat(
      id: groupId,
      members: members,
      groupName: groupName,
      messages: messages.map((m) => m.toModel()).toList(),
    );
  }

  @override
  List<Object?> get props => [groupId];
}
