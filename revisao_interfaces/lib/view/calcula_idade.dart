import 'package:flutter/material.dart'; //é pra android, o cupertino é pra IOS

class CalculaIdade extends StatelessWidget {
  String? nome;
  int? anoNascimento;
  int? idade;

  dialog(String mensagem, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(mensagem),
      ),
    );
  }

  int getIdade(int anoNascimento) {
    var aonAtual = DateTime.now().year;
    var idade = aonAtual - anoNascimento;
    return idade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcula Idade'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (valorDigitado) => nome = valorDigitado,
              decoration: const InputDecoration(
                  label: Text('Nome'), hintText: 'Digite o seu nome :'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (valorDigitado2) =>
                  anoNascimento = int.parse(valorDigitado2),
              decoration: const InputDecoration(
                  label: Text('Ano Nascimento'),
                  hintText: 'Digite o ano de nascimento :'),
            ),
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () => dialog(
                  'Sua idade é igual a ${getIdade(anoNascimento!).toString()}',
                  context),
            ),
          ],
        ),
      ),
    );
  }
}
