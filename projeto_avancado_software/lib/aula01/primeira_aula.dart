import 'dart:async';
import 'dart:io';

void executar() {
  print('tipos de variaveis');
  String nomeProduto = 'Lacta';
  String tipoProduto = 'Chocolate';
  double precoProduto = 10;
  int quantidade = 2;
  double total = precoProduto * quantidade;
  bool disponivel = true; //2posibilidades true/false
  // isso é feito em tempo de execução

  print('nome' +
      nomeProduto +
      '\n a descrição é:' +
      tipoProduto); // mas nao poderia colocar o precoProduto aqui por exemplo, porque 2 String e um double nãa daria certo

  print('nome $nomeProduto \n a descrição é: ${tipoProduto}');

  print('''
  nome do produto é $nomeProduto,
  descrição do produto é $tipoProduto,
  quantidade: $quantidade,
  total:$total,
  disponivel:$disponivel
  ''');

  //pode trocar o tipo dele , ele vira varias coisas ao mesmo tempo
  dynamic produto = 'prestígio';
  print(produto);

  produto = 10.0;
  print(produto);

  //a partir do dart 2.12 null safety - por padrão as variáveis não podem ser nulas.
  //String nome = null; //acusa erro

  //para ela poder ser nula você coloca o ?
  String? nome = null;

  var nomeProduto2 = 'Lacta';
  var tipoProduto2 = 'Chocolate';
  var precoProduto2 = 10;
  var quantidade2 = 2;
  var total2 = precoProduto * quantidade;
  var disponivel2 = true;

  //var pega o tipo da primeira atribuição e não pode mudar mais
  var x = "sou uma string";
  //x = 10; //não pode trocar o tipo.

  //nomeProduto2 = null; //aqui dá erro

  //mas aqui não, ele é um tipo nulo, e na próxima vez que vc atribuir ele vai ser setado.
  var nomeRecebendoNull = null;

  var resultado = stdin.readLineSync();

  print('o nome digitado é: $resultado');

  //String resultadoQueDaErro = stdin.readLineSync(); // aqui dá erro pq pode retornar null
  String? resultadoQuePodeSerNull = stdin.readLineSync();
  String forcandoQuePodeSerErro = stdin
      .readLineSync()!; //assim permite, mas pode dar erro, o exclamação força permitir

  String entrada = stdin.readLineSync()!;
  int idade = int.parse(entrada);
  //double.parse(idade);
  //idade.toString();
  // ...

/**
>>>> REGRA PARA TODOS: não pode solicitar valores calculados
 
1) solicitar os dados de um curso. Imprima o nome do curso a carga horária do Curso, quantidade de série, % mínimo de presença,
 a quantidade máxima de faltas e a média para a aprovação do curso.
 
 
*/
/*
  Curso curso = Curso();

  print('Digite o nome do curso ');
  curso.nomeDoCurso = stdin.readLineSync();

  print('Digite a carga horaria ');
  curso.cargaHoraria = stdin.readLineSync();

  print('Digite a quantidade de faltas maxima permitida ');
  curso.quantidadeDeFaltasMaxima = stdin.readLineSync();

  print('Digite o minimo de presença ');
  curso.minimoPresenca = stdin.readLineSync();

  print('Digite a media para passar de ano');
  curso.media = stdin.readLineSync();

  print('Digite a quantidade de series que tem no curso: ');
  curso.quantidadeDeSeries = stdin.readLineSync();
*/
  //const e final, const é definid oem tempo de compilação
  //final em tempo de execução

  // operador relacional é uma instrução
  var idade3 = 20;
  String resultado2;
  if (idade3 > 18) {
    resultado = 'é maior';
  } else {
    resultado = 'é menor';
    resultado += '...';
  }

  String resultado3 = (idade > 18) ? 'é maior' : 'é menor';

  print('Digite a nota 1');
  double nota1 = double.parse(stdin.readLineSync() ?? '0');

  print('Digite a nota 2');
  double nota2 = double.parse(stdin.readLineSync() ?? '0');

  print('Digite a nota 3');
  double nota3 = double.parse(stdin.readLineSync() ?? '0');

  double maiorNota = nota1;
  double media = nota1 + nota2 + nota3 / 3;
  //5instrucoes

  if (nota2 > maiorNota && nota2 > nota3) {
    // +3 instrucoes
    maiorNota = nota2; //+1 se verdadeiro
  }
  if (nota3 > maiorNota && nota3 > nota2) {
    // +3 instrucoes
    maiorNota = nota3; //+1 se verdadeiro
  }
  print('A maior nota é : $maiorNota'); //+1 instrução
  print('A média é igual a $media'); //+1 instrução

  //imprimir numeros temrinados com 5, de 0 a 100
  //contar instrução

  for (int x = 0; x <= 100; x++) {
    if (x % 10 == 5) {
      print(x);
    }
  }

  //List<String> listaInteger = new List<String>();
  var listaInteger = <String>[];
  listaInteger.add('Paulo');
  listaInteger.add('pokemon');
  listaInteger.add('lua');

  for (var nome in listaInteger) {
    print(nome);
  }

  for (var y = 0; y < listaInteger.length; y++) {
    print(listaInteger[y]);
  }

  var verifica = 0;
  while (verifica < listaInteger.length) {
    print(listaInteger[verifica]);
    verifica++;
  }

//função anonima que recebe um nome em cada iteração e imprime o nome.
  listaInteger.forEach((nome) {
    print(nome);
  });

  listaInteger.forEach((nome) => print(nome));
  listaInteger.forEach(print);
}
