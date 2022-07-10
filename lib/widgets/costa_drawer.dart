import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CostaDrawer extends StatefulWidget {
  const CostaDrawer({Key? key}) : super(key: key);

  @override
  State<CostaDrawer> createState() => _CostaDrawerState();
}

class _CostaDrawerState extends State<CostaDrawer> {
  @override
  Widget build(BuildContext context) {
    //criando o drawer customizado
    return Drawer(
      // criando uma lista
      child: ListView(
        children: [
          //criando uma cabeçalho para o drawer
          //Colocando o nome e o email do usuario e um avatar
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text('rogerio'),
              accountEmail: Text('rb29GAMIAL.COM')),
          //criando uma lista de título com  um testo e uma navegação
          ListTile(
            title: Text('Button'),
            onTap: () {
              Navigator.of(context).pushNamed('/button');
            },
          ),
          const ListTile(
            title: Text('rota01'),
          ),
          const ListTile(
            title: Text('rota01'),
          )
        ],
      ),
    );
  }
}
