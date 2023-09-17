import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/data/datasources/chat_datasource.dart';
import 'package:chat/features/chats/data/entities/chat_entity.dart';
import 'package:chat/features/chats/data/entities/group_chat_entity.dart';
import 'package:chat/features/chats/data/entities/member_entity.dart';
import 'package:chat/features/chats/data/entities/message_entity.dart';
import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/domain/models/member.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:chat/features/chats/domain/repositories/chat_repository.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../user/domain/models/user.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatDatasource _chatDataSource = getIt<ChatDatasource>();

  @override
  Future<Either<Failure, List<GroupChat>>> getChatsFromUser({
    required AppUser user,
  }) async {
    try {
      List<GroupChatEntity> groups =
          await _chatDataSource.getChatsFromUser(user: user);
      return Right(groups.map((g) => g.toModel()).toList());
    } on Exception catch (e) {
      return const Left(FirebaseAuthFailure(message: '', description: ''));
    }
  }

  @override
  Future<Either<Failure, Chat>> getChatById({
    required String chatId,
  }) async {
    try {
      ChatEntity chatEntity = await _chatDataSource.getChatById(chatId: chatId);
      GroupChatEntity groupChatEntity =
          await _chatDataSource.getGroupById(groupId: chatId);

      GroupChat groupChat = groupChatEntity.toModel();

      return Right(chatEntity.toModel(
        members: groupChat.members,
        groupName: groupChat.groupName,
      ));
    } on Exception catch (e) {
      return const Left(FirebaseAuthFailure(message: '', description: ''));
    }
  }

  @override
  Future<Either<Failure, GroupChat>> createGroup({
    required AppUser creator,
    required String groupName,
  }) async {
    try {
      GroupChatEntity groupChatEntity = await _chatDataSource.createGroup(
        creator: creator,
        groupName: groupName,
      );
      return Right(groupChatEntity.toModel());
    } on Exception catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Member>> addUserToGroup({
    required String groupId,
    required AppUser user,
  }) async {
    try {
      MemberEntity memberEntity = await _chatDataSource.addUserToGroup(
        groupId: groupId,
        user: user,
      );
      return Right(memberEntity.toModel());
    } on Exception catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Message>> sendMessageToGroup({
    required AppUser messenger,
    required String messageContent,
    required String groupId,
  }) async {
    try {
      MessageEntity messageEntity = await _chatDataSource.sendMessageToGroup(
        messenger: messenger,
        groupId: groupId,
        messageContent: messageContent,
      );
      return Right(messageEntity.toModel());
    } on Exception catch (e) {
      return const Left(ServerFailure());
    }
  }


}
