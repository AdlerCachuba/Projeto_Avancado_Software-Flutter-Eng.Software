import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaTarefa extends StatelessWidget {
  Future<List<Map<String, Object?>>> buscarDados() async {
    //o object garante que pode receber qualquer valor

    // o map assim garante uma linha do banco
    // Map<String, Object?> dados = {'nome': 'José', 'sobrenome': 'Silva'};

    await Future.delayed(const Duration(seconds: 2));

    //Dessa forma pega todos registros, pegando do banco.
    List<Map<String, Object?>> tarefas = [
      {'nome': 'Homologação', 'descricao': 'Realizar a homologação'},
      {
        'nome': 'Testes',
        'descricao': 'Silva ira fazer os testes dentro do cenário.'
      },
      {'nome': 'Manutenção', 'descricao': 'Cleber realizará a manutenção '},
    ];

    return tarefas;
  }

  Future<List<Map<String, Object?>>> buscarDadosDoBanco() async {
    String caminhoBD = join(await getDatabasesPath(), 'banco.bd');
    Database banco = await openDatabase(
      caminhoBD,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE tarefa(
          id INTEGER PRIMARY KEY,
          nome TEXT NOT NULL,
          descricao TEXT NOT NULL
        )

      ''');
        db.execute('''
          INSERT INTO tarefa (nome,descricao) VALUES ("CRUD","Descricao do CRUD") 
        ''');
        db.execute('''
          INSERT INTO tarefa (nome,descricao) VALUES ("Tarefa TCC","Tarefas de tcc") 
        ''');
        db.execute('''
          INSERT INTO tarefa (nome,descricao) VALUES ("Tarefas de marketing","Descricao marketing") 
        ''');
      },
    );

    List<Map<String, Object?>> tarefas =
        await banco.rawQuery('SELECT * FROM tarefa');

    //exemplo de como dar pra fazer também \/
    //List<Map<String, Object?>> tarefas2 = await banco.query('tarefa');
    return tarefas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/formTarefa'),
          )
        ],
      ),
      body: FutureBuilder(
        future: buscarDadosDoBanco(),
        // o dados futuros é o resultado do buscarDados acima
        builder:
            (context, AsyncSnapshot<List<Map<String, Object?>>> dadosFuturos) {
          if (!dadosFuturos.hasData) return const CircularProgressIndicator();
          var tarefas = dadosFuturos.data!;
          return ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (context, contador) {
              var tarefa = tarefas[contador];
              return ListTile(
                title: Text(tarefa['nome'].toString()),
                subtitle: Text(tarefa['descricao'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
