// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<bool> _$formularioValidoComputed;

  @override
  bool get formularioValido => (_$formularioValidoComputed ??= Computed<bool>(
          () => super.formularioValido,
          name: '_ListStore.formularioValido'))
      .value;

  final _$novoTextoAtom = Atom(name: '_ListStore.novoTexto');

  @override
  String get novoTexto {
    _$novoTextoAtom.reportRead();
    return super.novoTexto;
  }

  @override
  set novoTexto(String value) {
    _$novoTextoAtom.reportWrite(value, super.novoTexto, () {
      super.novoTexto = value;
    });
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNovoTexto(String valor) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setNovoTexto');
    try {
      return super.setNovoTexto(valor);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarLista() {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.adicionarLista');
    try {
      return super.adicionarLista();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
novoTexto: ${novoTexto},
formularioValido: ${formularioValido}
    ''';
  }
}
