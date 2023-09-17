import 'dart:async';

import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/data/entities/chat_entity.dart';
import 'package:chat/features/chats/data/entities/message_entity.dart';
import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'get_messages_controller.g.dart';

class GetMessagesController = _GetMessagesControllerBase
    with _$GetMessagesController;

abstract class _GetMessagesControllerBase with Store {
  StreamSubscription<dynamic>? messageListener;

  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  @action
  Future listenToChat({
    required String chatId,
  }) async {
    messageListener = _db
        .collection(ChatEntity.collectionName)
        .doc(chatId)
        .collection(MessageEntity.collectionName)
        .orderBy('creationTime', descending: false)
        .snapshots()
        .listen((messages) {
      for (var message in messages.docChanges) {
        MessageEntity messageEntity = MessageEntity.fromJson(
            messageId: message.doc.id, json: message.doc.data()!);
        if (messageEntity.creationTime != null) {
          addMessageToChat(messageEntity.toModel());
        }
      }
    });
  }

  @action
  addMessageToChat(Message message) {
    messages.insert(0, message);
  }

  Future cancelListener() async {
    messageListener?.cancel();
  }
}
