import 'package:chat/config/router.dart';
import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/domain/repositories/chat_repository.dart';
import 'package:chat/features/chats/presentation/screens/conversation_screen.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/main.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'create_group_controller.g.dart';

class CreateGroupController = _CreateGroupControllerBase
    with _$CreateGroupController;

abstract class _CreateGroupControllerBase with Store {
  final ChatRepository _chatRepository = getIt<ChatRepository>();

  @observable
  ObservableFuture<Either<Failure, GroupChat>>? _createGroupFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_createGroupFuture == null ||
        _createGroupFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _createGroupFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future createGroup({
    required String groupName,
  }) async {
    errorMessage = null;
    _createGroupFuture = ObservableFuture(_chatRepository.createGroup(
      creator: authStore.user!,
      groupName: groupName,
    ));
    Either<Failure, GroupChat> createGroupEither = await _createGroupFuture!;

    createGroupEither.fold((l) {
      errorMessage = l.message;
    }, (chat) {
      router.goNamed(
        ConversationScreen.routeName,
        pathParameters: {"id": chat.id},
      );
    });
  }
}
