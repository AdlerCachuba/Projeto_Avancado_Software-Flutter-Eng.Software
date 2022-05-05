// Atividade I
//1. Qual a diferença entre a 1 e a 2 forma? O que melhorou , o que piorou?
// Melhorou bastante na segunda, diexando mais fácil de ler, e manutenção.

//2. O que é e para que serve parametros do tipo função? Em que caso utilizamos?
// Parametros servem para passar valores para a função, e utilizamos em casos que temos algo variavel, e que pode mudar, com opor exemplo uma opção do que a função deve fazer.


// Atividade II - Defina 3 funções do mesmo contexto
// e uma interface para estas funções
// função escolher funções do salario

double bonificaSalario(double salario, double valor) {
  double resultado = salario + valor;
  return resultado;
}

double descontaSalario(double salario, double valor) {
  double resultado = salario - valor;
  return resultado;
}

double bonificaValorEmDezPorCento(double salario, double valor) {
  double resultado = valor - (valor * 0.10) + salario;
  return resultado;
}

double funcoesMenu(int opcao, double salario, double valor) {
  if (opcao == 1) {
    return bonificaSalario(salario,valor);
  } else if (opcao == 2) {
    return descontaSalario(salario,valor);
  } else {
    return bonificaValorEmDezPorCento(salario,valor);
  }
}
