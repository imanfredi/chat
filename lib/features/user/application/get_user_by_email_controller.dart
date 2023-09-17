import 'package:chat/dependency_injector.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:chat/features/user/domain/repositories/user_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'get_user_by_email_controller.g.dart';

class GetUserByEmailController = _GetUserByEmailControllerBase
    with _$GetUserByEmailController;

abstract class _GetUserByEmailControllerBase with Store {
  final UserRepository _userRepository = getIt<UserRepository>();

  @observable
  ObservableFuture<Either<Failure, AppUser>>? _getUserByEmailFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_getUserByEmailFuture == null ||
        _getUserByEmailFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _getUserByEmailFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future<AppUser?> getUserByEmail({
    required String email,
  }) async {
    errorMessage = null;
    _getUserByEmailFuture =
        ObservableFuture(_userRepository.getUserByEmail(email: email));
    Either<Failure, AppUser> userEither = await _getUserByEmailFuture!;

    return userEither.fold((l) {
      errorMessage = l.message;
      return null;
    }, (r) {
      return r;
    });
  }
}
