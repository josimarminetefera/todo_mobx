import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todomobx/stores/list_store.dart';
import 'package:todomobx/stores/login_store.dart';
import 'package:todomobx/widgets/custom_icon_button.dart';
import 'package:todomobx/widgets/custom_text_field.dart';

import 'login_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListStore listStore = ListStore();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        //estamos fazendo dentro de uma função que só é chamado uma vez por isso listen: false
                        //se eu alterasse o valor do provider ai esta parte aqui seria notificada ai o app também ia voltar para a tela de login
                        Provider.of<LoginStore>(context, listen: false).sair();
                        //depois vou para minha tela anterior
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Observer(builder: (_) {
                          return CustomTextField(
                            controller: controller,
                            hint: 'Tarefa',
                            onChanged: listStore.setNovoTexto,
                            suffix: listStore.formularioValido
                                ? CustomIconButton(
                              radius: 32,
                              iconData: Icons.add,
                              onTap: () {
                                listStore.adicionarLista();
                                //sempre que terminar de executar todos widgts da tela ele executa o que esta aqui dentro
                                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                  controller.clear();
                                });
                              },
                            )
                                : null,
                          );
                        }),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              return ListView.separated(
                                itemCount: listStore.listaCompleta.length,
                                itemBuilder: (_, index) {
                                  final todo = listStore.listaCompleta[index];
                                  return Observer(builder: (_) {
                                    return ListTile(
                                      title: Text(
                                        todo.titulo,
                                        style: TextStyle(
                                          decoration: todo.feito ? TextDecoration.lineThrough : null,
                                          color: todo.feito ? Colors.grey : Colors.black,
                                        ),
                                      ),
                                      onTap: todo.acaoFeito,
                                    );
                                  });
                                },
                                separatorBuilder: (_, __) {
                                  return Divider();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
