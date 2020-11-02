import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    //reação que sempre acontece quando algo é lido ou modificado
    autorun((_) {
      //sempre que tiver uma mudança no e-mail ele vai printar para mim o email
      //print(email);
      print(formularioValido);
    });
  }

  @observable
  String email = "";

  @action
  void setEmail(String valor) => email = valor;

  @observable
  String senha = "";

  @action
  void setSenha(String valor) => senha = valor;

  @observable
  bool senhaVisivel = false;

  //troca de false para true ou true para false
  @action
  void ativarSenhaVisivel() => senhaVisivel = !senhaVisivel;

  //pode ser combinado os computed
  @computed
  bool get emailValida => email.length >= 6;

  //pode ser combinado os computed
  @computed
  bool get senhaValida => senha.length >= 6;

  //operações com mais de um campo que retorna um valor novo
  @computed
  bool get formularioValido => emailValida && senhaValida;
}
