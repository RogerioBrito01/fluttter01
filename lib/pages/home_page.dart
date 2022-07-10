import 'package:flutter/material.dart';
import 'package:flutter01/pages/todo_page.dart';
import 'package:flutter01/widgets/costa_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rogerio'),
      ),
      //chamando o drawer personalizado
      drawer: CostaDrawer(),
      body: Container(
        //chamando a lista personalizada
        child: TodoList(),
      ),
    );
  }
}
