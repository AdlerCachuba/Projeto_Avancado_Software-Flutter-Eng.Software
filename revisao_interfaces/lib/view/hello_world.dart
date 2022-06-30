import 'package:flutter/material.dart'; //é pra android, o cupertino é pra IOS

class HelloWorld extends StatelessWidget {
  String? nome;

  dialog(String mensagem, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              onChanged: (valorDigitado) => nome = valorDigitado,
              decoration: const InputDecoration(
                  label: Text('Nome'), hintText: 'Digite o seu nome :'),
            ),
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () => dialog('Hello World $nome', context),
            ),
          ],
        ),
      ),
    );
  }
}
