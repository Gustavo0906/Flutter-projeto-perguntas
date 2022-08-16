import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';
import 'dart:io';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      "texto": "Pergunta 01",
      "resposta": [
        {"texto": "Resposta 01", "pontuacao": 10},
        {"texto": "Resposta 02", "pontuacao": 0},
        {"texto": "Resposta 03", "pontuacao": 0},
        {"texto": "Resposta 04", "pontuacao": 5},
      ]
    },
    {
      "texto": "Pergunta 02",
      "resposta": [
        {"texto": "Resposta 01", "pontuacao": 0},
        {"texto": "Resposta 02", "pontuacao": 5},
        {"texto": "Resposta 03", "pontuacao": 10},
        {"texto": "Resposta 04", "pontuacao": 0}
      ]
    },
    {
      "texto": "Pergunta 03",
      "resposta": [
        {"texto": "Resposta 01", "pontuacao": 0},
        {"texto": "Resposta 02", "pontuacao": 0},
        {"texto": "Resposta 03", "pontuacao": 5},
        {"texto": "Resposta 04", "pontuacao": 10},
      ]
    }
  ];

  void _responder(int pontuacao) {
    //Responsavel por fazer a atualização de perguntas
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntasSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reinicarQuestionario() {
    setState(() {
      _perguntasSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntasSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntasSelecionada: _perguntasSelecionada,
                perguntas: _perguntas,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reinicarQuestionario),
      ),
    );
  }
}

// Statless ele não permite mudança a menos que dê um refresh
class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
