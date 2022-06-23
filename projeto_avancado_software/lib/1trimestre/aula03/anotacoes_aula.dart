//objetivo entneder o Function:

void show() {
  // verificarAprovacao(10, 5, verificarPelaMedia);

  // Uso da função anonima.
  // em funções anonimas a gente tem a arrow function.
  //  verificarAprovacao(10, 5,(nota1,nota2){
  //  double media = (nota1+nota2)/2
  // if(media >=6){
  //   return 'aprovado';
  // }else{
  //   return 'aprovado';
  // }
  verificarAprovacao(
      10,
      5,
      (nota1, nota2) =>
          (((nota1 + nota2) / 2) >= 6) ? 'aprovado' : 'reprovado');
}

String verificarAprovacao(double nota1, double nota2, Function acao) {
  return acao(nota1, nota2);
}

String verificarPelaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  if (media >= 6) {
    return "Aprovado";
  } else {
    return "Reprovado";
  }
}

String verificarPelaMaiorNota(double nota1, double nota2) {
  //aprovação pela maior nota
  double maior = nota1;
  if (nota2 > nota1) {
    maior = nota2;
  }
  if (maior >= 6) {
    return "Aprovado";
  } else {
    return "Reprovado";
  }
}

String verificarPelaMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) {
    menor = nota2;
  }
  if (menor >= 6) {
    return "Aprovado";
  } else {
    return "Reprovado";
  }
}

// Atividade II
// Define 3 funções do mesmo contexto e uma interface para estas funções:
// --> Interface Salario
// --> Receber salario e um valor. Bonificar o valor no salário e informar se o total é maior que o salário mínimo.
// --> Receber salario e um valor. Descontor o valor no salário e informar se ainda resta salário a receber.
// --> Receber salario e um valor. Neste caso o valor é o bonus que tem encargos de 10%, Aidcionar o bonus e retornar o valor do salário.

//Atividade III
// Pensar em um projeto único
// Fazer um exemplo seu
//
