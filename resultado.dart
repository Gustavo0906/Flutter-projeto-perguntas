import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao >= 15) {
      return "Parabens";
    } else {
      return "Você não passou";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            "Reiniciar",
            style: TextStyle(fontSize: 20),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
