// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_groups_from_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetGroupsFromUserController on _GetGroupsFromUserController, Store {
  late final _$chatsAtom =
      Atom(name: '_GetGroupsFromUserController.chats', context: context);

  @override
  ObservableList<GroupChat> get chats {
    _$chatsAtom.reportRead();
    return super.chats;
  }

  @override
  set chats(ObservableList<GroupChat> value) {
    _$chatsAtom.reportWrite(value, super.chats, () {
      super.chats = value;
    });
  }

  late final _$_GetGroupsFromUserControllerActionController =
      ActionController(name: '_GetGroupsFromUserController', context: context);

  @override
  void listenToGroupIds() {
    final _$actionInfo = _$_GetGroupsFromUserControllerActionController
        .startAction(name: '_GetGroupsFromUserController.listenToGroupIds');
    try {
      return super.listenToGroupIds();
    } finally {
      _$_GetGroupsFromUserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chats: ${chats}
    ''';
  }
}
