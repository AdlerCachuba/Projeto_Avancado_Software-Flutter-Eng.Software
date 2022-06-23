void show() {
  print(calcularSalario(2000, 300));
  print(calcularSalario(30, 400));
}

// ENTRADA: salario, desconto (recebidos pelo parametro)
// RESULTADO: retorna resultado da subtração salario - desconto se saldo suficiente,se não retorna "Saldo Insuficiente"

String calcularSalario(double salario, double desconto) {
  if (salario > desconto) {
    return ("Saldo: ${salario - desconto}");
  } else if (salario == desconto) {
    return ("O salario é igual o desconto. Resultado 0.");
  } else {
    return ("Saldo Insuficiente");
  }
}

String verificaAprovacaoSeMediaMaiorQueSeis(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;
  return media >= 6 ? 'Aprovado' : 'Reprovado';
}
