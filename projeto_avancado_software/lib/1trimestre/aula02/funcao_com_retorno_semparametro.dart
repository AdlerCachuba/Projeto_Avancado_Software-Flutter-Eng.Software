import 'dart:io';

void show() {
// ENTRADA: salario, desconto (recebidos pelo terminal)
// RESULTADO: retorna resultado da subtração salario - desconto se saldo suficiente,se não retorna "Saldo Insuficiente"

  print(calcularSalario());
}

String calcularSalario() {
  print('Salario: ');
  var salario = double.parse(stdin
      .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null

  print('Desconto: ');
  var desconto = double.parse(stdin
      .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null

  if (salario > desconto) {
    return ("Saldo: ${salario - desconto}");
  } else if (salario == desconto) {
    return ("O salario é igual o desconto. Resultado 0.");
  } else {
    return ("Saldo Insuficiente");
  }
}

String verificaAprovacaoSeMediaMaiorQueSeis() {
  print("Nota 1: ");
  var nota1 = double.parse(stdin
      .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null

  print("Nota 2: ");
  var nota2 = double.parse(stdin
      .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null

  var media = (nota1 + nota2) / 2;
  return media >= 6 ? 'Aprovado' : 'Reprovado';
}
