import 'dart:io';

void main() {
  var minhaClasse5 = MinhaClasseQuatro("Nome");
  minhaClasse5.valido = true;

  var minhaClasseCompleta = MinhaClasseCompleta("Nome", 50, true);
  minhaClasseCompleta.nome = stdin.readLineSync();
  print(minhaClasseCompleta.nome);

  var aluno = MinhaClasseSimples();

  //o ! assume o risco que não vai ter nulo.
  aluno.nome = stdin.readLineSync()!;

  var nome = stdin.readLineSync()!;
  var numero = int.parse(stdin.readLineSync()!);
  var valido = stdin.readLineSync()! == 'S';
  var alunoFinal = MinhaClasseFinal(nome, numero, valido);
  print(alunoFinal.nome);

  var alunoFinalNomeado =
      MinhaClasseFinalNomeada(nome: nome, numero: numero, valido: valido);
}

//Por padrão é público, e sempre que criamos vem com construtor.
MinhaClasse minhaClasse = new MinhaClasse();

//Não precisa do new
MinhaClasse minhaClasse2 = MinhaClasse();

class MinhaClasse {}

// o _ define que é privado, o encasulapmento é feito por arquivos
// Logo, essa classe só rodaria aqui dentro desse arquivo.
class _MinhaClasseDois {
  _MinhaClasseDois() {
    print('minha classe');
  }
}

// O ? Define que o atributo pode ser nulo
class MinhaClasseQuatro {
  String? nome;
  int? numero;
  bool? valido;
  MinhaClasseQuatro(String valor) {
    nome = valor;
  }
}

class MinhaClasseCompleta {
  String? nome;
  int? numero;
  bool? valido;
  MinhaClasseCompleta(String nome, int numero, bool valido) {
    this.nome = nome;
    this.numero = numero;
    this.valido = valido;
  }
}

//Fazendo isso
class MinhaClasseSimplificada {
  String? nome;
  int? numero;
  bool? valido;
  MinhaClasseSimplificada(this.nome, this.numero, this.valido);
}

//Fazendo isso
class MinhaClasseSimples {
  late String? nome;
  late int? numero;
  late bool? valido;
  MinhaClasseSimples();
}

// //Não é bom fazer atributos private a menos que vc esteja validando alguma coisa.
// class MinhaClassePrivada {
//   String _nome;
//   int? _numero;
//   bool? _valido;

//   //É uma propriedade por usar o get...
//   String get nome {
//     return _nome;
//   }

//   // ou o set..
//   set nome(String nome) {
//     _nome = nome;
//   }

//   // mas também funciona AS IS java
//   String getNome() {
//     return _nome;
//   }

//   MinhaClassePrivada();
// }

// final define isso em execução
// o const define em compilação
class MinhaClasseFinal {
  final String nome;
  final int numero;
  final bool valido;
  MinhaClasseFinal(this.nome, this.numero, this.valido);
}

//Usando parametro nomeado
class MinhaClasseFinalNomeada {
  final String nome;
  final int numero;
  final bool valido;
  MinhaClasseFinalNomeada(
      {required this.nome, required this.numero, required this.valido});
}

class AlunoDidatico {
  final String nome;
  final int numero;
  final bool valido;
  //definir ano do nasc. e fazer validação
  int _anoNascimento;

  set anoNascimento(int anoNascimento) {
    if (anoNascimento > 0) _anoNascimento = anoNascimento;
  }

  //criar uma propriedade idade
  int get idade {
    var aonAtual = DateTime.now().year;
    var idade = aonAtual - _anoNascimento;
    return idade;
  }

  AlunoDidatico(this.nome, this.numero, this.valido, this._anoNascimento);
}

class Pessoa {
  late String nome;
  late int numero;
  late bool valido;
  
  Pessoa(this.nome, this.numero, this.valido);
}

//interface e herança usa extends
class Aluno extends Pessoa {

  late int registroAcademico;

  Aluno(String nome, int numero, bool valido, this.registroAcademico)
      : super(nome, numero, valido);
}

class Professor extends Pessoa {
  late int siape;

  Professor(String nome, int numero, bool valido, this.siape)
      : super(nome, numero, valido);
}

