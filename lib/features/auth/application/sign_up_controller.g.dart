// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_SignUpControllerBase.state'))
          .value;

  late final _$_signUpFutureAtom =
      Atom(name: '_SignUpControllerBase._signUpFuture', context: context);

  @override
  ObservableFuture<Either<Failure, AppUser>>? get _signUpFuture {
    _$_signUpFutureAtom.reportRead();
    return super._signUpFuture;
  }

  @override
  set _signUpFuture(ObservableFuture<Either<Failure, AppUser>>? value) {
    _$_signUpFutureAtom.reportWrite(value, super._signUpFuture, () {
      super._signUpFuture = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignUpControllerBase.errorMessage', context: context);

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

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpControllerBase.signUp', context: context);

  @override
  Future<dynamic> signUp({required String email, required String password}) {
    return _$signUpAsyncAction
        .run(() => super.signUp(email: email, password: password));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
