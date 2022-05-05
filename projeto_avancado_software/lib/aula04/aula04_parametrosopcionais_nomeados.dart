void main() {
  //explicação da aula pós intervalo
  print(verificarAprovacao(10, 8));

  //adicionando a média que é um valor opcional
  print(verificarAprovacao(10, 8, 7));

  //Então como os parametros são nomeados, a gente diz qual ele é e coloca o valor.
  print(verificarAprovacaoParametroNomeado(
      nota1: 7, nota2: 8, mediaAprovacao: 7));
  print(verificarAprovacaoParametroNomeado(
      nota2: 7, nota1: 8, mediaAprovacao: 7));
}

// o [] deixa o valor como opcional, caso não tenha, será o valor definido (6)
String verificarAprovacao(double nota1, double nota2,
    [double mediaAprovacao = 6]) {
  var media = (nota1 + nota2) / 2;
  if (media >= mediaAprovacao) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

String verificarAprovacaoParametroNomeado(
    {required double nota1, required double nota2, double mediaAprovacao = 6}) {
  var media = (nota1 + nota2) / 2;
  if (media >= mediaAprovacao) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

String verificarAprovacaoParametroNomeadoMisturado(
     double nota1,{required double nota2, double mediaAprovacao = 6}) {
  var media = (nota1 + nota2) / 2;
  if (media >= mediaAprovacao) {
    return 'aprovado';
  } else {
    return 'reprovado';
  }
}

/*
Duas funções com parâmetros opcionais (valor padrão);
Uma função com parâmetros nomeados obrigatórios;
Uma função com parâmetros nomeados opcionais;
Uma função com parâmetros nomeados obrigatórios e opcionais;
Uma única função com parâmetros nomeados e anônimos;

1) Em que caso os parâmetros nomeados são úteis? 
2) Por padrão os parâmetros nomeados são opcionais ou obrigatórios? Caso sejam opcionais, como torná-los obrigatórios?
3) Qual a sintaxe para fazer a chamada de uma função com os parâmetros nomeados? 
4) É possível definir uma única função com parâmetros nomeados e anônimos?
5) Quais são as vantagens em utilizar parâmetros nomeados? 
6) Quais são as diferenças entre parâmetros nomeados e anônimos?
*/