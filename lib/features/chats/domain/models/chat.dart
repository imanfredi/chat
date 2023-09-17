import 'package:chat/features/chats/domain/models/member.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:equatable/equatable.dart';

class Chat extends Equatable {
  final String id;
  final List<Message> messages;
  final List<Member> members;
  final String groupName;

  const Chat({
    required this.id,
    required this.messages,
    required this.members,
    required this.groupName,
  });

  @override
  List<Object?> get props => [id];
}
