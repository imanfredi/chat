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

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @observable
  ObservableFuture<Either<Failure, AppUser>>? _signUpFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_signUpFuture == null ||
        _signUpFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _signUpFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future signUp({
    required String email,
    required String password,
  }) async {
    errorMessage = null;
    _signUpFuture = ObservableFuture(_authRepository.signUpWithEmailAndPassword(
        email: email, password: password));
    Either<Failure, AppUser> signUpEither = await _signUpFuture!;

    signUpEither.fold((l) {
      errorMessage = l.message;
    }, (user) {
      authStore.setUser(user);
      router.goNamed(ChatsScreen.routeName);
    });
  }
}
