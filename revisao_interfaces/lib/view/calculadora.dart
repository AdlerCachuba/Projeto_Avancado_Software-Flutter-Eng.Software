import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String? valor;

  String? adicionaNumero(String numeroDigitado) {
    setState(() {
      if (valor == null) {
        valor = numeroDigitado;
      } else {
        valor = valor! + numeroDigitado;
      }
    });

    return valor;
  }

  Widget criarBotao(String rotulo, VoidCallback? acao) {
    return OutlinedButton(
      child: Text(rotulo),
      onPressed: acao,
    );
  }

  bool verificaOperador(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void calculaValor(String valor) {
    var resultado;
    for (var i = 0; i < valor.length - 1; i++) {
      if (verificaOperador(valor[i])) {
        if (valor[i] == '+') {
          resultado = double.parse(valor[i - 1]) + double.parse(valor[i + 1]);
        }
        if (valor[i] == '-') {
          resultado = double.parse(valor[i - 1]) - double.parse(valor[i + 1]);
        }
        if (valor[i] == 'x') {
          var resultado =
              double.parse(valor[i - 1]) * double.parse(valor[i + 1]);
        }
        if (valor[i] == '/') {
          var resultado =
              double.parse(valor[i - 1]) / double.parse(valor[i + 1]);
        }
      }
    }
    valor = resultado.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  valor.toString(),
                ),
              ),
              Row(
                children: [
                  criarBotao('1', () => adicionaNumero('1')),
                  criarBotao('2', () => adicionaNumero('2')),
                  criarBotao('3', () => adicionaNumero('3')),
                  criarBotao('+', () => adicionaNumero('+')),
                ],
              ),
              Row(
                children: [
                  criarBotao('4', () => adicionaNumero('4')),
                  criarBotao('5', () => adicionaNumero('5')),
                  criarBotao('6', () => adicionaNumero('6')),
                  criarBotao('-', () => adicionaNumero('-')),
                ],
              ),
              Row(
                children: [
                  criarBotao('7', () => adicionaNumero('7')),
                  criarBotao('8', () => adicionaNumero('8')),
                  criarBotao('9', () => adicionaNumero('9')),
                  criarBotao('x', () => adicionaNumero('x')),
                ],
              ),
              Row(
                children: [
                  criarBotao('0', () => adicionaNumero('0')),
                  criarBotao(',', () => adicionaNumero(',')),
                  criarBotao('/', () => adicionaNumero('/')),
                  criarBotao('=', () => calculaValor(valor!)),
                ],
              )
            ],
          ),
        ));
  }
}
