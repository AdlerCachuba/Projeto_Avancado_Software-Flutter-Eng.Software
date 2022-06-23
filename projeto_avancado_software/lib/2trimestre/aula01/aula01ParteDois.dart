import 'dart:io';

main() {
  Estado estado = Estado(nome: "Parana", sigla: "PR");
  Cidade cidade = Cidade(nome: "Paranavai", estado: estado);
  Aluno aluno = Aluno(
      nome: "Ciclano",
      numero: 5,
      valido: true,
      cidade: cidade,
      registroAcademico: 55);
}

class Pessoa {
  final String nome;
  final int numero;
  final bool valido;
  final Cidade cidade;

  Pessoa(
      {required this.nome,
      required this.numero,
      required this.valido,
      required this.cidade});
}

//interface e herança usa extends
class Aluno extends Pessoa {
  int registroAcademico;

  Aluno(
      {required String nome,
      required int numero,
      required bool valido,
      required Cidade cidade,
      required this.registroAcademico})
      : super(nome: nome, numero: numero, valido: valido, cidade: cidade);
}

class Estado {
  String nome;
  String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  String nome;
  Estado estado;
  Cidade({required this.nome, required this.estado});
}
