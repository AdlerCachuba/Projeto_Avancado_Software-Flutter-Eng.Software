double calcularValorComDesconto(double valor, double desconto) {
  return (valor - desconto);
}

double calculaValorComDescontoPremium(double valor, double desconto) {
  return (valor - desconto - 10);
}

double verificaValorComDesconto(double valor, double desconto, Function acao) {
  return acao(valor, desconto);
}

void show() {
  verificaValorComDesconto(
      10,
      5,
      (valor, desconto) => ((valor - desconto) >= 100)
          ? (valor - desconto - 10)
          : (valor - desconto));
}

double calcularValorTotalDeUmItemEstoque(double valor, int quantidade) {
  return (valor * quantidade);
}

//Função sem retorno e sem parametro.
void imprimeMensagemBoasVindas() {
  print("Bem vindo ao pet mais.");
}

//Função sem retorno e com parametro
void imprimeMensagemPersonalizada(String mensagem) {
  print(mensagem);
}

//Função com retorno e sem parametro
String retornaMensagemDeBoasVindas() {
  return ("Bem vindo ao pet mais");
}

//Função com retorno e com parametro
double calculaValorConformeCliente(int tipoCliente, double valor) {
  double resultado;
  if (tipoCliente == 1) {
    // Segmentação 01 - Cliente Premium
    // Clientes premium recebem desconto de 10 reais em suas compras com valor igual ou maior a 100 reais
    if (valor >= 100) {
      resultado = valor - 10;
      return resultado;
    } else {
      return valor;
    }
  } else if (tipoCliente == 2) {
    // Segmentação 02 - Clientes VIP
    // Clientes VIP recebem desconto de 10% em suas compras com valor igual ou maior a 100 reais
    if (valor >= 100) {
      resultado = valor - (valor * 0.10);
      return resultado;
    } else {
      return valor;
    }
  } else {
    //Segmentação 03 - Clientes normais
    // Clientes normais não recebem desconto.
    return valor;
  }
}
