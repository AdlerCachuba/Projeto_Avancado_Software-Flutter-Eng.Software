//import 'package:ver_aprovacao/verificar_aprovacao.dart' as aprovacao;
import 'ver_aprovacao/verificar_aprovacao.dart' as aprovacao;

String show() {
  var nota1 = 7.0;
  var nota2 = 8.0;
  var media = 7.0;
  var quantidadePresenca = 70;
  var cargaHorariaDisciplina = 80;
  var percentualMinimoPresenca = 75.0;
  return aprovacao.verificarAprovacao(nota1, nota2, media, quantidadePresenca,
      cargaHorariaDisciplina, percentualMinimoPresenca);
}

/*
Esta função tem o objetivo de verificar a aprovação pela nota e presença 
Considerando este cenário, quais são os possíveis contextos de teste? 

R:

4 cenários. 
Um aprovado pelas duas condições(nota e presença)
Dois cenários (nota e presença alterando entre aprovado e reprovado)
Um cenário reprovado pelas duas condições (nota e presença)

Cenário 01 - HappyDay 
Objetivo do cenário: verificaAprovadoNota TRUE e verificarAprovacaoPresenca TRUE.
Resultado esperado: Deve retornar aprovado.
*/
String happyDay() {
  var nota1 = 9.0;
  var nota2 = 8.0;
  var media = 6.0;
  var quantidadePresenca = 90;
  var cargaHorariaDisciplina = 80;
  var percentualMinimoPresenca = 75.0;
  return aprovacao.verificarAprovacao(nota1, nota2, media, quantidadePresenca,
      cargaHorariaDisciplina, percentualMinimoPresenca);
}

/*
Cenário 02 - AprovadoPorNotaReprovadoPorFalta
Objetivo do cenário:  verificaAprovadoNota TRUE e verificarAprovacaoPresenca FALSE.
Resultado esperado: Deve retornar reprovado por presença.

*/
String aprovadoPorNotaReprovadoPorFalta() {
  var nota1 = 7.0;
  var nota2 = 8.0;
  var media = 7.0;
  var quantidadePresenca = 10;
  var cargaHorariaDisciplina = 80;
  var percentualMinimoPresenca = 75.0;
  return aprovacao.verificarAprovacao(nota1, nota2, media, quantidadePresenca,
      cargaHorariaDisciplina, percentualMinimoPresenca);
}

/*
Cenário 03 - ReprovadoPorNotaAprovadoPorFalta
Objetivo do cenário:  verificaAprovadoNota FALSE e verificarAprovacaoPresenca TRUE.
Resultado esperado: Deve retornar reprovado por nota.

*/
String reprovadoPorNotaAprovadoPorFalta() {
  var nota1 = 2.0;
  var nota2 = 4.0;
  var media = 7.0;
  var quantidadePresenca = 100;
  var cargaHorariaDisciplina = 20;
  var percentualMinimoPresenca = 15.0;
  return aprovacao.verificarAprovacao(nota1, nota2, media, quantidadePresenca,
      cargaHorariaDisciplina, percentualMinimoPresenca);
}

/*
Cenário 04 - ReprovadoPorNotaReprovadoPorFalta
Objetivo do cenário:  verificaAprovadoNota FALSE e verificarAprovacaoPresenca FALSE.
Resultado esperado: Deve retornar reprovado por nota e presença.
*/

String reprovadoPorNotaReprovadoPorFalta() {
  var nota1 = 2.0;
  var nota2 = 4.0;
  var media = 7.0;
  var quantidadePresenca = 10;
  var cargaHorariaDisciplina = 80;
  var percentualMinimoPresenca = 75.0;
  return aprovacao.verificarAprovacao(nota1, nota2, media, quantidadePresenca,
      cargaHorariaDisciplina, percentualMinimoPresenca);
}
/*
Para cada cenário, os resultados gerados estão coerentes? 

R: Sim ! Cada cenário tem o seu resultado esperado. Poderia ser usado um "assert" para verificar se a mensagem retornada 
é a mesma que a esperada. 


Registros os erros encontrados e faça as alterações necessárias.
*/