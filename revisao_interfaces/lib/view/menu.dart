import 'package:flutter/material.dart';

//tudo que a gente vê na tela é um widget, um texto, botão

//Stateless = não tem gerenciamento de estado na tela
//Statefull = tem gerenciamento de estado na tela, reconhece a atualização

//a gente usa o container pra colocar os elementos na tela, que é o Scaffold também
class Menu extends StatelessWidget {
  Widget criarBotao(String rotulo, VoidCallback? acao) {
    return ElevatedButton(
      child: Text(rotulo),
      onPressed: acao,
    );
  }

  //Todo Widget precisa do método build
  @override // o Contexto carrega o contexto do widget
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // o center centraliza o botão no eito X
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          criarBotao(
              'Contador', () => Navigator.pushNamed(context, '/contador')),
          criarBotao(
              'Hello World', () => Navigator.pushNamed(context, '/hello')),
          criarBotao('Calcular idade',
              () => Navigator.pushNamed(context, '/calculaIdade')),
          criarBotao('Calculadora',
              () => Navigator.pushNamed(context, '/calculadora')),
        ],
      ),
    ) // aqui geralmente é um widget, como é um menu, aqui é os botões.
        );
  }
}
