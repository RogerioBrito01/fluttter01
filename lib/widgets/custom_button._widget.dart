import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConstomButtonWidgt extends StatelessWidget {
  //Definindo os atributos que iram ser obrigatários, ou seja, aqueles atributos que não serão
//iguais em todos os botoes tipo testo, cor
  final VoidCallback onPressed;
  final String title;
  final bool disable;
  final double? titleSize;
  const ConstomButtonWidgt(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.disable = false,
      this.titleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Tipo de widget que sera personalizado
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      //Estilizando o botão e definindo a cor par desabilitado ou pressionado, ou nem um dos dois status   dos
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) return Colors.red;
            if (states.contains(MaterialState.pressed)) return Colors.blue;
            return Colors.green;
          }),
          //Colocando uma borda aredondada de 10
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          //definido o tamanho do testo para quando estiver pressionado ou não
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return TextStyle(
                fontSize: titleSize != null ? titleSize! * 2 : 28,
              );
            }
            {
              return TextStyle(fontSize: titleSize);
            }
          })),
    );
  }
}
