import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //LoginStore loginStore = LoginStore();//quando eu passo a usar provider não precisa mais assim
  LoginStore loginStore;

  ReactionDisposer disposer;

  //melhor local para colocar o autoState dentro de um Statefull
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //atravez disso voce acessa o loginstore criado la no main
    loginStore = Provider.of<LoginStore>(context);
    
    //autorun é uma reação do mobx
    //autorun sempre vai executar uma vez passando os valores iniciais
    /*autorun((_) {
      print(loginStore.logado);
      if (loginStore.logado) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ListScreen()),
        );
      }
    });*/

    //esta aqui não executa no inicio do app ela vai esperar ter uma troca de valor.
    //primeiro parametro é para monitorar algum valor
    //segundo é o efeito que ela causa ou seja o resultado. este segundo resebe o resuiltado do observer
    disposer = reaction((_) => loginStore.logado, (logado) {
      if (loginStore.logado) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ListScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.carregando,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return CustomTextField(
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      obscure: !loginStore.senhaVisivel,
                      onChanged: loginStore.setSenha,
                      enabled: !loginStore.carregando,
                      suffix: CustomIconButton(
                        radius: 32,
                        iconData: loginStore.senhaVisivel ? Icons.visibility_off : Icons.visibility,
                        onTap: loginStore.ativarSenhaVisivel,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        height: 44,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: loginStore.carregando
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text('Login'),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            onPressed: loginStore.loginPrecionado),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
