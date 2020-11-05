import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  _TodoStore(this.titulo);

  final String titulo;

  @observable
  bool feito = false;

  @action
  void acaoFeito() => feito = !feito;
}
