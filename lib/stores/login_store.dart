import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    //reação que sempre acontece quando algo é lido ou modificado
    autorun((_) {
      //sempre que tiver uma mudança no e-mail ele vai printar para mim o email
      //print(email);
      //print(formularioValido);
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

  @observable
  bool carregando = false;

  @action
  Future<void> entrar() async {
    carregando = true;

    await Future.delayed(Duration(seconds: 2));

    carregando = false;
    logado = true; //todos locais que estão observando o logado seram notificados quando eu alterar o valor para false ou true

    //resetar o email e a senha para o observable não achar que ainda tem valor dentro
    email = "";
    senha = "";
  }

  @action
  void sair() {
    logado = false;
  }

  @observable
  bool logado = false;

  //pode ser combinado os computed
  @computed
  bool get emailValida => email.length >= 6;

  //pode ser combinado os computed
  @computed
  bool get senhaValida => senha.length >= 6;

  //operações com mais de um campo que retorna um valor novo
  //@computed
  //bool get formularioValido => emailValida && senhaValida;//não preceisa deste pois o Function abaixo já faz isso

  @computed
  Function get loginPrecionado => (emailValida && senhaValida && !carregando) ? entrar : null;
}
