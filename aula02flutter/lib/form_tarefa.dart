import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FormTarefa extends StatelessWidget {
  String? nome, descricao;

  Future salvar(String nome, String descricao, [int? id]) async {
    try {
      var caminho = join(await getDatabasesPath(), 'banco.bd');
      var banco = await openDatabase(caminho);
      String sql;
      if (id == null) {
        // o ?,? é o que prepara o comando dizendo q vai inserir ovalor, e evita sql injection
        sql = 'INSERT INTO tarefa (nome,descricao) VALUES (?,?)';
        banco.rawInsert(sql, [nome, descricao]);
      } else {
        sql = 'UPDATE tarefa SET nome = ?, descricao = ? WHERE id = ?';
        banco.rawUpdate(sql, [nome, descricao, id]);
      }
    } catch (e) {
      print(e);
    }
  }

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
        title: Text('Calcula Idade'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (valorDigitado) => nome = valorDigitado,
              decoration: const InputDecoration(
                  label: Text('Nome'), hintText: 'Digite o nome da demanda:'),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (valorDigitado) => descricao = valorDigitado,
              decoration: const InputDecoration(
                  label: Text('Descrição'),
                  hintText: 'Digite a descrição da demanda:'),
            ),
            ElevatedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (nome == null || descricao == null) {
                    dialog("Nome ou descrição da demanda não foram preenchidos",
                        context);
                  } else {
                    salvar(nome!, descricao!);
                    dialog("Tarefa salva com sucesso", context);
                    Navigator.of(context).pushNamed('/');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
