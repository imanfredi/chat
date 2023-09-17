// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetMessagesController on _GetMessagesControllerBase, Store {
  late final _$messagesAtom =
      Atom(name: '_GetMessagesControllerBase.messages', context: context);

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$listenToChatAsyncAction =
      AsyncAction('_GetMessagesControllerBase.listenToChat', context: context);

  @override
  Future<dynamic> listenToChat({required String chatId}) {
    return _$listenToChatAsyncAction
        .run(() => super.listenToChat(chatId: chatId));
  }

  late final _$_GetMessagesControllerBaseActionController =
      ActionController(name: '_GetMessagesControllerBase', context: context);

  @override
  dynamic addMessageToChat(Message message) {
    final _$actionInfo = _$_GetMessagesControllerBaseActionController
        .startAction(name: '_GetMessagesControllerBase.addMessageToChat');
    try {
      return super.addMessageToChat(message);
    } finally {
      _$_GetMessagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
