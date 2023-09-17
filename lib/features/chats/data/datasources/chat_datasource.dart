import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/data/entities/chat_entity.dart';
import 'package:chat/features/chats/data/entities/group_chat_entity.dart';
import 'package:chat/features/chats/data/entities/member_entity.dart';
import 'package:chat/features/chats/data/entities/message_entity.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:chat/features/core/error/exception.dart';
import 'package:chat/features/user/data/datasources/user_data_source.dart';
import 'package:chat/features/user/data/entities/app_user_entity.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

abstract class ChatDatasource {
  Future<ChatEntity> getChatById({
    required String chatId,
  });

  Future<List<GroupChatEntity>> getChatsFromUser({
    required AppUser user,
  });

  Future<GroupChatEntity> createGroup({
    required AppUser creator,
    required String groupName,
  });

  Future<GroupChatEntity> getGroupById({
    required String groupId,
  });

  Future<MemberEntity> addUserToGroup({
    required String groupId,
    required AppUser user,
  });

  Future<MessageEntity> sendMessageToGroup({
    required AppUser messenger,
    required String groupId,
    required String messageContent,
  });
}

@Injectable(as: ChatDatasource)
class ChatDatasourceImpl implements ChatDatasource {
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();
  final UserDatasource _userDatasource = getIt<UserDatasource>();

  @override
  Future<List<GroupChatEntity>> getChatsFromUser({
    required AppUser user,
  }) async {
    try {
      List<String> ids =
          (await _userDatasource.getGroupsIdFromUser(userId: user.id));

      List<GroupChatEntity> groups = [];

      for (String id in ids) {
        final response =
            await _db.collection(GroupChatEntity.collectionName).doc(id).get();
        groups
            .add(GroupChatEntity.fromJson(groupId: id, json: response.data()!));
      }

      return groups;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<ChatEntity> getChatById({
    required String chatId,
  }) async {
    try {
      final response = await _db
          .collection(ChatEntity.collectionName)
          .doc(chatId)
          .collection(MessageEntity.collectionName)
          .orderBy('creationTime', descending: true)
          .get();

      if (response.docs.isEmpty) {
        return ChatEntity(groupId: chatId, messages: const []);
      }

      return ChatEntity.fromJson(groupId: chatId, messages: response.docs);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<GroupChatEntity> createGroup({
    required AppUser creator,
    required String groupName,
  }) async {
    try {
      final query = _db.collection(GroupChatEntity.collectionName);

      final groupDataMap = {
        'members': [
          {
            'id': creator.id,
            'email': creator.email,
          }
        ],
        'groupName': groupName,
      };

      final doc = await query.add(groupDataMap);

      await _userDatasource.addUserToGroup(user: creator, groupId: doc.id);

      return GroupChatEntity.fromJson(groupId: doc.id, json: groupDataMap);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<GroupChatEntity> getGroupById({
    required String groupId,
  }) async {
    try {
      final query = _db.collection(GroupChatEntity.collectionName).doc(groupId);

      final group = await query.get();

      return GroupChatEntity.fromJson(groupId: group.id, json: group.data()!);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<MemberEntity> addUserToGroup({
    required String groupId,
    required AppUser user,
  }) async {
    try {
      final memberMap = {
        'id': user.id,
        'email': user.email,
      };

      final query = _db.collection(GroupChatEntity.collectionName).doc(groupId);
      await query.update({
        "members": FieldValue.arrayUnion([memberMap]),
      });

      await _userDatasource.addUserToGroup(user: user, groupId: groupId);

      return MemberEntity.fromJson(json: memberMap, userId: user.id);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<MessageEntity> sendMessageToGroup({
    required AppUser messenger,
    required String groupId,
    required String messageContent,
  }) async {
    try {
      final messageMap = {
        'content': messageContent,
        'creationTime': FieldValue.serverTimestamp(),
        'messenger': {
          'id': messenger.id,
          'email': messenger.email,
        }
      };

      final queryMessage = _db
          .collection(ChatEntity.collectionName)
          .doc(groupId)
          .collection(MessageEntity.collectionName);

      final messageDoc = await queryMessage.add(messageMap);

      final queryGroup = _db.collection(GroupChatEntity.collectionName);

      messageMap['id'] = messageDoc.id;
      final doc =
          await queryGroup.doc(groupId).update({'lastMessage': messageMap});

      return MessageEntity.fromJson(messageId: messageDoc.id, json: messageMap);
    } catch (e) {
      throw ServerException();
    }
  }
}
