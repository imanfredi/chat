// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignOutController on _SignOutControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_SignOutControllerBase.state'))
          .value;

  late final _$_signOutFutureAtom =
      Atom(name: '_SignOutControllerBase._signOutFuture', context: context);

  @override
  ObservableFuture<Either<Failure, void>>? get _signOutFuture {
    _$_signOutFutureAtom.reportRead();
    return super._signOutFuture;
  }

  @override
  set _signOutFuture(ObservableFuture<Either<Failure, void>>? value) {
    _$_signOutFutureAtom.reportWrite(value, super._signOutFuture, () {
      super._signOutFuture = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignOutControllerBase.errorMessage', context: context);

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

  late final _$signOutAsyncAction =
      AsyncAction('_SignOutControllerBase.signOut', context: context);

  @override
  Future<dynamic> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
