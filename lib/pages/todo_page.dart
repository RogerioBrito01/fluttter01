import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/custom_button._widget.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

TextEditingController _lista = TextEditingController();
//criando uma lista do tipo string
List<String> tarefa = [];

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              //chamando um campo de testo
              TextField(
                controller: _lista,
              ),
              //criando um container de altua 300 para definir o tamanho do campo da lista
              Container(
                height: 300,
                //criando uma lista com um a possibilidade de um linha de divisão
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    //pegando o tamanho da lista
                    itemCount: tarefa.length,
                    //criando o builder da lista com os paramentros contex e index
                    itemBuilder: (context, index) {
                      //retornadno uma lissta de titulos que pega a lista de tarefa e retona pelo index
                      return ListTile(
                        title: Text(tarefa[index]),
                        onLongPress: () {
                          setState(() {
                            //removendo a tarefa pelo index
                            tarefa.removeAt(index);
                          });
                        },
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //botão para add as tarefas na lista
            FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  //se a lista de texto for maior que 0 tem testo entao add
                  if (_lista.text.length > 0) {
                    setState(() {
                      tarefa.add(_lista.text);
                    });
                    // se não limpa
                    _lista.clear();
                  }
                }),
            //botão para remover um item ao manter pressionado
            FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () {
                  if (_lista.text.length > 0) {
                    setState(() {
                      tarefa = [];
                    });
                    _lista.clear();
                  }
                }),
          ],
        ));
  }
}
