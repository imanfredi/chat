import 'package:chat/features/chats/domain/models/member.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:equatable/equatable.dart';

class GroupChat extends Equatable {
  final String id;
  final List<Member> members;
  final String groupName;
  final Message? lastMessage;

  const GroupChat({
    required this.id,
    required this.members,
    required this.groupName,
    required this.lastMessage,
  });

  @override
  List<Object?> get props {
    List<Object> prop = [id];
    if (lastMessage != null) {
      prop.add(lastMessage!.id);
    }
    return prop;
  }
}
