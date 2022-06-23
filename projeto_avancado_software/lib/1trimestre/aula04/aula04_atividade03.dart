// Atividade III
// https://github.com/heliokamakawa/flutter_course/blob/master/module4/b_anonymous_functions/lib/g_atividade_semantica.dart

import 'dart:io';

void main() {}

/*
Exercício 01 - implemente as funções
a) Função que solicite um número e realizar validações: (1) se é par; (2) maior que zero; (3) se é um número primo.
função "hospedeira" : solicitar um número
*/
void solicitaNumeroEFazValidacao(Function(int id) validacao) {
  print("Digite um número:");
  var id = int.parse(stdin.readLineSync()!);
  print(validacao(id) ? "Válido" : "Inválido");
}

bool ehPar(int numero) {
  return numero % 2 == 0;
}

bool maiorQueZero(int numero) {
  return numero > 0;
}

bool ehPrimo(int numero) {
  int fatores = 0;
  for (int i = 1; i <= numero; i++) {
    if (numero % i == 0) {
      fatores++;
    }
  }
  return fatores <= 2 ? true : false;
}

/*
b) Função que solicite a data inicial e retorne quanto tempo passou em: (1) anos; (2) dias; e (3) horas.
*/
void solicitaDataEFazValidacao(Function(DateTime data) funcaoCalculaData) {
  int dia = 27;
  print("Digite o dia");
  // int dia = int.parse(stdin.readLineSync()!);
  int mes = 04;
  print("Digite o mês");
  // int mes = int.parse(stdin.readLineSync()!);
  int ano = 2021;
  print("Digite o ano");
  // int ano = int.parse(stdin.readLineSync()!);
  print(funcaoCalculaData(DateTime.utc(ano, mes, dia)));
}

String calcularQuantidadeAnos(DateTime data) {
  DateTime hoje = DateTime.now();
  return (hoje.difference(data).inDays / 365).toString();
}

String calcularQuantidadeDias(DateTime data) {
  DateTime hoje = DateTime.now();
  return (hoje.difference(data).inDays).toString();
}

String calcularQuantidadeHoras(DateTime data) {
  DateTime hoje = DateTime.now();
  return (hoje.difference(data).inHours).toString();
}

/*
c) Função que solicite a quantidade de dias trabalhadas, valor que recebe por hora e calcule o salarário para: (1) auxiliar; (2) júnior; e (3) pleno.
Exercício 02 - para cada função "hospedeira", defina uma função anônima.
*/

void solicitaQtdDiasTrabalhados(Function calculaDiasConformeCargo) {
  print("Digite a quantidade de dias:");
  int quantidadeDeDias = int.parse(stdin.readLineSync()!);
  print("Digite o valor da hora trabalhada:");
  double valorHora = double.parse(stdin.readLineSync()!);
  print(calculaDiasConformeCargo(quantidadeDeDias, valorHora));
}

String calcAuxiliar(int quantidadeDeDias, double valorHora) {
  var salario = quantidadeDeDias * valorHora;
  var desconto = salario * 0.5;
  return (salario - desconto).toString();
}

String calcJunior(int quantidadeDeDias, double valorHora) {
  var salario = quantidadeDeDias * valorHora;
  var desconto = salario * 0.5;
  var bonusSalario = 15;
  return (salario - desconto + bonusSalario).toString();
}

String calcPleno(int quantidadeDeDias, double valorHora) {
  var salario = quantidadeDeDias * valorHora;
  var desconto = salario * 0.7;
  var bonusSalario = 30;
  return (salario - desconto + bonusSalario).toString();
}
