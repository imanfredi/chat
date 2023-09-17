import 'package:chat/config/router.dart';
import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:chat/features/chats/domain/repositories/chat_repository.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/main.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'send_message_to_group_controller.g.dart';

class SendMessageToGroupController = SendMessageToGroupControllerBase
    with _$SendMessageToGroupController;

abstract class SendMessageToGroupControllerBase with Store {
  final ChatRepository _chatRepository = getIt<ChatRepository>();

  @observable
  ObservableFuture<Either<Failure, Message>>? _sendMessageToGroupFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_sendMessageToGroupFuture == null ||
        _sendMessageToGroupFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _sendMessageToGroupFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future sendMessage({
    required String groupId,
    required String messageContent,
  }) async {
    errorMessage = null;
    _sendMessageToGroupFuture =
        ObservableFuture(_chatRepository.sendMessageToGroup(
      messenger: authStore.user!,
      messageContent: messageContent,
      groupId: groupId,
    ));
    Either<Failure, Message> sendMessageToGroupEither =
        await _sendMessageToGroupFuture!;

    sendMessageToGroupEither.fold((l) {
      errorMessage = l.message;
    }, (message) {});
  }
}
