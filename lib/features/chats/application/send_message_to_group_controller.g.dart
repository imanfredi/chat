// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_to_group_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendMessageToGroupController
    on SendMessageToGroupControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: 'SendMessageToGroupControllerBase.state'))
          .value;

  late final _$_sendMessageToGroupFutureAtom = Atom(
      name: 'SendMessageToGroupControllerBase._sendMessageToGroupFuture',
      context: context);

  @override
  ObservableFuture<Either<Failure, Message>>? get _sendMessageToGroupFuture {
    _$_sendMessageToGroupFutureAtom.reportRead();
    return super._sendMessageToGroupFuture;
  }

  @override
  set _sendMessageToGroupFuture(
      ObservableFuture<Either<Failure, Message>>? value) {
    _$_sendMessageToGroupFutureAtom
        .reportWrite(value, super._sendMessageToGroupFuture, () {
      super._sendMessageToGroupFuture = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: 'SendMessageToGroupControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$sendMessageAsyncAction = AsyncAction(
      'SendMessageToGroupControllerBase.sendMessage',
      context: context);

  @override
  Future<dynamic> sendMessage(
      {required String groupId, required String messageContent}) {
    return _$sendMessageAsyncAction.run(() =>
        super.sendMessage(groupId: groupId, messageContent: messageContent));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
