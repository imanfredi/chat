import 'package:chat/features/chats/data/entities/member_entity.dart';
import 'package:chat/features/chats/data/entities/message_entity.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:equatable/equatable.dart';

class GroupChatEntity extends Equatable {
  static const String collectionName = 'groups';

  final String id;
  final List<MemberEntity> members;
  final String groupName;
  final MessageEntity? lastMessage;

  const GroupChatEntity({
    required this.id,
    required this.members,
    required this.groupName,
    required this.lastMessage,
  });

  factory GroupChatEntity.fromJson({
    required String groupId,
    required Map<String, dynamic> json,
  }) {
    List<MemberEntity> memberEntities = [];

    json['members'].forEach(
      (m) {
        final Map<String, dynamic> member = Map<String, dynamic>.from(m);
        memberEntities
            .add(MemberEntity.fromJson(userId: member['id'], json: member));
      },
    );

    MessageEntity? lastMessage = json['lastMessage'] == null
        ? null
        : MessageEntity.fromJson(
            messageId: json['lastMessage']['id'], json: json['lastMessage']);

    return GroupChatEntity(
        id: groupId,
        members: memberEntities,
        groupName: json['groupName'],
        lastMessage: lastMessage);
  }

  GroupChat toModel() {
    return GroupChat(
      id: id,
      members: members.map((m) => m.toModel()).toList(),
      lastMessage: lastMessage?.toModel(),
      groupName: groupName,
    );
  }

  @override
  List<Object?> get props => [id];
}
