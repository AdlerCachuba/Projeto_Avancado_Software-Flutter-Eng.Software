//Atividade II
// https://github.com/heliokamakawa/flutter_course/blob/master/module4/b_anonymous_functions/lib/f_atividade_sintaxe.dart

void main() {
  // Atividade II → Realize as atividades abaixo
  double valor = 100.00;
  double salario = 1000.00;

/*
  //Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.
   adicionarSalario(salario, valor, ePositivo);

  //Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.
  adicionarSalario(salario, valor, (valor) {
    return (valor) > 0;
  });


  //Exercício 3  - refaça o exe anterior, utilizando a arrow function.
   
  adicionarSalario(salario, valor, (valor) => valor > 0);



  //Exercício 4  - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.

  adicionarSalarioComDoisParametros(salario, valor, valorMenorQueSalario);

  adicionarSalarioComDoisParametros(salario, valor, (salario, valor) {
    return (valor < salario) ? true : false;
  });

  adicionarSalarioComDoisParametros(
      salario, valor, (salario, valor) => valor < salario);

*/
  //Exercício 5  - refaça o exe c porém fazendo uma validação sua.

  adicionarSalario(salario, valor, (valor) => valor != 0);

  //Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.

  var list = [1, 2, 3];
  list.forEach((item) {
    print(item);
  });

  List<int> lista2 = list.map((e) => e + 2).toList();
  print(lista2);

  /*
  Exercício 6 - Conseguiu entender:
    - O contexto em que é útil utilizar funções anônimas?
    R: Sim, a ideia de utilizar funções anonimas é reduzir a quantidade de funções, já implementando ela diretamente onde é necessário.

    - Os requisitos necessários para usar funções anônimas? 
    R: Sim, é necessário utilizar a sintaxe corretamente

    - diferença entre função nomeada e anônimas?
    R: Sim, funções nomeadas são quando criamos uma função 'do zero', e dando um nome a ela.
    E funções anônimas são funções que você cria sem nome apenas para um objetivo específico.

    - diferença entre anonymous function e arrow function?
    R: 
    
    Em que caso devemos utilizar Arrow Function? O que devemos considerar?
    R: 
  
  */
}

void adicionarSalario(
    double salario, double valor, Function(double valor) validacao) {
  bool eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  } else {
    print('valor inválido');
  }
}

void adicionarSalarioComDoisParametros(double salario, double valor,
    Function(double salario, double valor) validacao) {
  bool eValido = validacao(salario, valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  } else {
    print('valor é menor que salario');
  }
}

bool ePositivo(double numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}

bool valorMenorQueSalario(double valor, double salario) {
  if (valor > salario) {
    return true;
  } else {
    return false;
  }
}
