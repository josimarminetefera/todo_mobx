// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  final _$feitoAtom = Atom(name: '_TodoStore.feito');

  @override
  bool get feito {
    _$feitoAtom.reportRead();
    return super.feito;
  }

  @override
  set feito(bool value) {
    _$feitoAtom.reportWrite(value, super.feito, () {
      super.feito = value;
    });
  }

  final _$_TodoStoreActionController = ActionController(name: '_TodoStore');

  @override
  void acaoFeito() {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.acaoFeito');
    try {
      return super.acaoFeito();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feito: ${feito}
    ''';
  }
}
