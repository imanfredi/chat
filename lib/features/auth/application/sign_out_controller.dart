import 'package:chat/config/router.dart';
import 'package:chat/dependency_injector.dart';
import 'package:chat/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat/features/auth/presentation/screens/auth_screen.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/core/error/failure.dart';
import 'package:chat/main.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';

part 'sign_out_controller.g.dart';

class SignOutController = _SignOutControllerBase with _$SignOutController;

abstract class _SignOutControllerBase with Store {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @observable
  ObservableFuture<Either<Failure, void>>? _signOutFuture;

  @observable
  String? errorMessage;

  @computed
  StoreState get state {
    if (_signOutFuture == null ||
        _signOutFuture!.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _signOutFuture!.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future signOut() async {
    errorMessage = null;
    _signOutFuture = ObservableFuture(_authRepository.signOut());
    Either<Failure, void> signOutEither = await _signOutFuture!;

    signOutEither.fold((l) {
      errorMessage = l.message;
    }, (r) {
      authStore.setUser(null);
      router.goNamed(AuthScreen.routeName);
    });
  }
}
