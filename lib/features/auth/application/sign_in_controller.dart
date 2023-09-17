import 'package:chat/config/router.dart';
import 'package:chat/dependency_injector.dart';
import 'package:chat/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat/features/chats/presentation/screens/chats_screen.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:chat/main.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @observable
  ObservableFuture<Either<Failure, AppUser>>? _signInFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_signInFuture == null ||
        _signInFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _signInFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    errorMessage = null;
    _signInFuture = ObservableFuture(
      _authRepository.signInWithEmailAndPassword(
          email: email, password: password),
    );
    Either<Failure, AppUser> signInEither = await _signInFuture!;

    signInEither.fold((l) {
      errorMessage = l.message;
    }, (user) {
      authStore.setUser(user);
      router.goNamed(ChatsScreen.routeName);
    });
  }
}
