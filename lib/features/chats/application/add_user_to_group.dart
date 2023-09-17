import 'package:chat/config/router.dart';
import 'package:chat/dependency_injector.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/domain/models/member.dart';
import 'package:chat/features/chats/domain/repositories/chat_repository.dart';
import 'package:chat/features/chats/presentation/screens/conversation_screen.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'add_user_to_group.g.dart';

class AddUserToGroupController = _AddUserToGroupControllerBase
    with _$AddUserToGroupController;

abstract class _AddUserToGroupControllerBase with Store {
  final ChatRepository _chatRepository = getIt<ChatRepository>();

  @observable
  ObservableFuture<Either<Failure, Member>>? _addUserToGroupFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_addUserToGroupFuture == null ||
        _addUserToGroupFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _addUserToGroupFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future addUserToGroup({
    required String groupId,
    required AppUser user,
  }) async {
    errorMessage = null;
    _addUserToGroupFuture = ObservableFuture(_chatRepository.addUserToGroup(
      groupId: groupId,
      user: user,
    ));
    Either<Failure, Member> addUserToGroupEither = await _addUserToGroupFuture!;

    addUserToGroupEither.fold((l) {
      errorMessage = l.message;
    }, (chat) {
      router.goNamed(
        ConversationScreen.routeName,
        pathParameters: {"id": chat.id},
      );
    });
  }
}
