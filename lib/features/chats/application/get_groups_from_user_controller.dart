import 'dart:async';

import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/data/entities/group_chat_entity.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/domain/repositories/chat_repository.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/data/entities/app_user_entity.dart';
import 'package:chat/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'get_groups_from_user_controller.g.dart';

class GetGroupsFromUserController = _GetGroupsFromUserController
    with _$GetGroupsFromUserController;

abstract class _GetGroupsFromUserController with Store {
  final ChatRepository _chatRepository = getIt<ChatRepository>();
  StreamSubscription<dynamic>? groupIdsListener;

  List<StreamSubscription<dynamic>> groupsListener = [];
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  @observable
  ObservableList<GroupChat> chats = ObservableList();

  @action
  void listenToGroupIds() {
    groupIdsListener = _db
        .collection(AppUserEntity.collectionName)
        .doc(authStore.user!.id)
        .collection('groups')
        .snapshots()
        .listen(
      (ids) {
        for (var doc in ids.docChanges) {
          if (doc.type == DocumentChangeType.added) {
            String id = doc.doc.data()!['id'];
            groupsListener.add(_db
                .collection(GroupChatEntity.collectionName)
                .doc(id)
                .snapshots()
                .listen((g) {
              int index = chats.indexWhere((c) => c.id == g.id);
              GroupChatEntity chatEntity =
                  GroupChatEntity.fromJson(groupId: g.id, json: g.data()!);
              modifyItem(chatEntity: chatEntity, index: index);
            }));
          }
        }
      },
    );
  }

  @action
  void modifyItem({
    required GroupChatEntity chatEntity,
    required int index,
  }) {
    if (chatEntity.lastMessage == null ||
        chatEntity.lastMessage!.creationTime != null) {
      if (index != -1) {
        chats[index] = chatEntity.toModel();
      } else {
        chats.add(chatEntity.toModel());
      }
    }
  }

  void cancelListenToGroupIds() {
    groupIdsListener!.cancel();
    for (var l in groupsListener) {
      l.cancel();
    }
  }
}
