import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/domain/models/member.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class ChatRepository {
  Future<Either<Failure, Chat>> getChatById({
    required String chatId,
  });

  Future<Either<Failure, List<GroupChat>>> getChatsFromUser({
    required AppUser user,
  });

  Future<Either<Failure, GroupChat>> createGroup({
    required AppUser creator,
    required String groupName,
  });

  Future<Either<Failure, Member>> addUserToGroup({
    required String groupId,
    required AppUser user,
  });

  Future<Either<Failure, Message>> sendMessageToGroup({
    required AppUser messenger,
    required String messageContent,
    required String groupId,
  });
}
