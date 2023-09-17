import 'package:chat/features/chats/domain/models/member.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String content;
  final Member messenger;
  final String id;
  final DateTime creationTime;

  const Message({
    required this.content,
    required this.messenger,
    required this.id,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [id];

  bool isMine(String id) {
    return messenger.id == id;
  }
}
