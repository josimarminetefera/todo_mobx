import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  //existe dois estados o observable e os computed

  @observable
  String novoTexto = "";

  @action
  void setNovoTexto(String valor) => novoTexto = valor;

  @computed
  bool get formularioValido => novoTexto.isNotEmpty;

  /*@observable
  List<String> listaCompleta = [];

  @action
  void adicionarLista() {
    //quando eu adiciono um item na lista isso não altera o estado do observable.
    //listaCompleta.add(novoTexto);
    //assim eu adiciono o item e sempre crio uma nova lista.
    // os dois pontos é para pegar a cascarta "..add"
    listaCompleta = List.from(listaCompleta..add(novoTexto));
  }*/

  //para o que esta acima podemos usar o ObservableList
  ObservableList<String> listaCompleta = ObservableList<String>();

  @action
  void adicionarLista() {
    listaCompleta.add(novoTexto);
  }
}
