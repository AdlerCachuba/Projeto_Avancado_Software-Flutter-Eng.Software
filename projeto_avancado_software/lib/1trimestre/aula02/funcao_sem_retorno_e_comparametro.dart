void show() {
  calcularSalario(1000, 100);
  calcularSalario(100, 8000);
}

// ENTRADA: salario, desconto (recebidos pelo parametro)
// RESULTADO: exibe o resultado da subtração salario - desconto se saldo suficiente,se não exibe "Saldo Insuficiente"

void calcularSalario(double salario, double desconto) {
  if (salario > desconto) {
    print("Saldo: ${salario - desconto}");
  } else if (salario == desconto) {
    print("O Salário é igual o desconto. Resultado 0.");
  } else {
    print("Saldo Insuficiente");
  }
}

void verificaAprovacaoSeMediaMaiorQueSeis(double nota1, double nota2) {
  var media = (nota1 + nota2) / 2;
  print(media >= 6 ? "Aprovado" : "Reprovado");
}
