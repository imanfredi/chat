// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInController on _SignInControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_SignInControllerBase.state'))
          .value;

  late final _$_signInFutureAtom =
      Atom(name: '_SignInControllerBase._signInFuture', context: context);

  @override
  ObservableFuture<Either<Failure, AppUser>>? get _signInFuture {
    _$_signInFutureAtom.reportRead();
    return super._signInFuture;
  }

  @override
  set _signInFuture(ObservableFuture<Either<Failure, AppUser>>? value) {
    _$_signInFutureAtom.reportWrite(value, super._signInFuture, () {
      super._signInFuture = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignInControllerBase.errorMessage', context: context);

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

  late final _$signInAsyncAction =
      AsyncAction('_SignInControllerBase.signIn', context: context);

  @override
  Future<void> signIn({required String email, required String password}) {
    return _$signInAsyncAction
        .run(() => super.signIn(email: email, password: password));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
