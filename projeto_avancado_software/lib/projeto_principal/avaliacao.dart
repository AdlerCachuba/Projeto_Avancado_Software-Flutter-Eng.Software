import 'dart:io';
import 'dart:math';

class CupomDesconto {
  String identificadorDoCupom;
  double valorDoDesconto;
  bool isValido;
  CupomDesconto({
    required this.identificadorDoCupom,
    required this.valorDoDesconto,
    required this.isValido,
  });
}

class Produto {
  String nome;
  double impostoISS;
  double impostoICMS;
  Produto({
    required this.nome,
    required this.impostoISS,
    required this.impostoICMS,
  });
}

class DescontoFiscal {
  double descontoImpostoISS;
  double descontoImpostoICMS;
  DescontoFiscal({
    required this.descontoImpostoISS,
    required this.descontoImpostoICMS,
  });
}

class NotaFiscal {
  double impostoISS;
  double impostoICMS;
  bool isEmitida;
  bool isCancelada;
  bool isReemisao;
  NotaFiscal({
    required this.impostoISS,
    required this.impostoICMS,
    required this.isEmitida,
    required this.isCancelada,
    required this.isReemisao,
  });
}

class Fatura{
  double valorFaturaTotal;
  Fatura({
    required this.valorFaturaTotal,
});
}

class ContraLancamento{
  double valorContraLancamento;
  bool abatimentoFiscal;
  ContraLancamento({
    required this.valorContraLancamento,
    required this.abatimentoFiscal,
});
}

class CreditoFiscal{
  double valorFiscal;
  CreditoFiscal({
    required this.valorFiscal,
  });
}

class CreditoFinanceiro{
  double valorFinanceiro;
  CreditoFinanceiro({
    required this.valorFinanceiro,
  });
}

class Credito{
  CreditoFinanceiro creditoFinanceiro;
  CreditoFiscal creditoFiscal;
  Credito({
    required this.creditoFiscal,
    required this.creditoFinanceiro,
});
}

class ValoresFaturaNFISSeNFICMS{
  double valorFatura;
  double valorNFISS;
  double valorNFICMS;
  ValoresFaturaNFISSeNFICMS({
    required this.valorFatura,
    required this.valorNFISS,
    required this.valorNFICMS,
  });
}

List<CupomDesconto> listaCuponsDoSistema = [
  CupomDesconto(identificadorDoCupom: "ArKlPm", valorDoDesconto: 5, isValido: true),
];

NotaFiscal notaFiscal1001 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);


// De acordo com o Domínio de Negócio/Escopo do seu projeto (tem que ser único - diferente dos colegas e do exemplo de aula),
// elaborar 10 funções correlatas que tratem regras de negócio ou que de suporte a requisitos do projeto.
// As funções elaboradas deverá possuir:
//    * (i)  anonymous function e/ou arrow function (pelo menos 2 exemplos);
//    * (ii) parâmetros posicionais obrigatórios e opcionais;
//    * (iii) parâmetros nomeados obrigatórios e opcionais;
//    * (iv) testes unitários.

// Como é avaliação, pode-se inserir comentários para explicar/justificar a solução/implementação.
// Caso não tenha, irei interpretar conforme apresentado.
// Critérios de Avaliação: (Tudo que estudamos durante o período)
//    * Alinhamento com o escopo/domínio;
//    * Complexidade e/ou relevância da função;
//    * Baixo acoplamento (capacidade de reuso) e coesão das definições;
//    * Coesão e coerência na sintaxe e semântica;
//    * Legibilidade do código, nomenclatura sugestivas das funções, variáveis e parâmetros;
//    * Uso correto e adequado do tratamento de erros e validações.

/////////////////////////////////////////////////////////
////////////////////Função 01////////////////////////////
/////////////////////////////////////////////////////////
//Criar função para criar o cupom de desconto e adicionar na lista de cupons válidos
//É passado por parametro a lista dos cupons válidos a ser adicionado, e o valor do cupom que deseja ser criado.
//E retorna o cupom de desconto
CupomDesconto criaCupomDeDesconto(List<CupomDesconto> listaDeCuponsValidos, double valorDoCupom){
  CupomDesconto cupomDesconto = CupomDesconto(
      identificadorDoCupom: gerarCodigoAleatorioConformeTamanho(tamanho: 5),
      valorDoDesconto: valorDoCupom,
      isValido: true
  );
  listaDeCuponsValidos.add(cupomDesconto);
  return cupomDesconto;
}
// A gente passa o tamanho do código que vamos querer, se o usuário não informar por padrão será 8.
// E geramos um código aleatório do cupom
String gerarCodigoAleatorioConformeTamanho({int tamanho = 8}) {
  var r = Random();
  return String.fromCharCodes(List.generate(tamanho, (index) => r.nextInt(33) + 89));
}


/////////////////////////////////////////////////////////
//////////////////////Funcao 02 /////////////////////////
/////////////////////////////////////////////////////////
//Função responsável por validar o cupom e aplicar ele.
//Após essa aplicação o cupom passa o estado de isValido para false
void validaCupomEAplicaNaFatura(CupomDesconto cupomDesconto, List<CupomDesconto> listaDeCuponsValidos, Fatura fatura){
  for(int x =0; x< listaDeCuponsValidos.length ; x++){
    if(listaDeCuponsValidos[x].identificadorDoCupom == cupomDesconto.identificadorDoCupom){
      cupomDesconto.isValido = false;
      fatura.valorFaturaTotal -= cupomDesconto.valorDoDesconto;
    }
  }
}

/////////////////////////////////////////////////////////
//////////////////////Funcao 03 /////////////////////////
/////////////////////////////////////////////////////////
// Se existe um desconto a ser aplicado no valor da nota fiscal,
// Esse mesmo desconto deve ser aplicado na nota fiscal do produto do mesmo imposto
// Caso o desconto seja de outra origem do imposto, ele não poderá ser aplicado para emitir a NF.
NotaFiscal emiteNotaFiscalDoProduto({required Produto produto, DescontoFiscal? desconto}){
  NotaFiscal notaFiscal = NotaFiscal(impostoISS: produto.impostoISS, impostoICMS: produto.impostoICMS,isEmitida: true,isCancelada: false,isReemisao: false);
  if(desconto != null) {
    if (produto.impostoICMS > 0 && desconto.descontoImpostoICMS > 0) {
      notaFiscal.impostoICMS-=desconto.descontoImpostoICMS;
    }
    if(produto.impostoISS  > 0 && desconto.descontoImpostoISS > 0){
      notaFiscal.impostoISS-=desconto.descontoImpostoISS;
    }
  }
  return notaFiscal;
}

/////////////////////////////////////////////////////////
//////////////////////Funcao 04 /////////////////////////
/////////////////////////////////////////////////////////
// Todos os contras lançamentos que possuem abatimentoFiscal como true irão descontar o imposto ISS da NF.
// Todos contra-lançamentos abatem no valor da fatura.
// Caso o contraLançamento NÃO SEJA VALIDADO será gerado uma exceção.
//A função retornar a classe ValoresFaturaNFISSeNFICMS usada para armazenar os valores quando aplicado um contra lançamento.
//
// O motivo de existir essa classe de retorno é : Retornar dados que são armazenados no histórico após
// usar um contra lançamento, útil para possiveis auditorias e também facilita para testar a função
ValoresFaturaNFISSeNFICMS? aplicaContraLancamentoNaFaturaENotaFiscal(ContraLancamento contraLancamento, NotaFiscal notaFiscal, Fatura fatura){
  try {
    if (validaContraLancamento(contraLancamento, notaFiscal, fatura)) {
      if ((contraLancamento.abatimentoFiscal) && (contraLancamento.valorContraLancamento < notaFiscal.impostoISS)) {
        notaFiscal.impostoISS -= contraLancamento.valorContraLancamento;
      }
      fatura.valorFaturaTotal -= contraLancamento.valorContraLancamento;
      //Classe criada para armazenar os valores após o ContraLancamento na nota fiscal.
      ValoresFaturaNFISSeNFICMS valoresFaturaNFISSeNFICMS = ValoresFaturaNFISSeNFICMS(valorFatura: fatura.valorFaturaTotal, valorNFISS: notaFiscal.impostoISS, valorNFICMS: notaFiscal.impostoICMS);
      return valoresFaturaNFISSeNFICMS;
    } else {
      throw new Exception("Valor do Contra Lançamento Maior que a Fatura e/ou a NotaFiscal");
    }
  }catch(Exception){
  }
}

//Função responsável por validar o contra lançamento.
//O contralançamento precisa ter um valor MENOR que da fatura e do valor de impostoISS da nota Fiscal.
bool validaContraLancamento(ContraLancamento contraLancamento, NotaFiscal notaFiscal, Fatura fatura){
  if(!(contraLancamento.valorContraLancamento > notaFiscal.impostoISS) || !(contraLancamento.valorContraLancamento > fatura.valorFaturaTotal)){
    return true;
  }else{
    return false;
  }
}



/////////////////////////////////////////////////////////
//////////////////////Funcao 05 /////////////////////////
/////////////////////////////////////////////////////////
// Função responsável pela re-emição da nota fiscal
// UMA NOTA FISCAL SÓ PODE SER RE-EMITIDA SE O VALOR DA FATURA E DE um dos valores de imposto da NOTA FISCAL FOREM IGUAIS!
// Caso contrário é obrigatório gerar uma exceção.
// Quando nós fazemos uma re-emição da nota fiscal nós alteramos o atributo da nota fiscal anterior de isCancelada para true.
// E emitimos uma nova nota fiscal, com o atributo de isReemisao para true.
// Isso é utilizado para o envio de pulsos de comunicação com o SAP para valida o CAR (Contas a receber)
NotaFiscal reemissaoDaNotaFiscal(NotaFiscal notaFiscalInicial,Fatura fatura, double impostoISSNovo, double impostoICMSNovo){
    confereValorFaturaENotaFiscal(notaFiscalInicial, fatura);
      notaFiscalInicial.isCancelada = true;
      NotaFiscal novaNotaFiscal = NotaFiscal(impostoISS: impostoISSNovo,
          impostoICMS: impostoICMSNovo,
          isEmitida: true,
          isCancelada: false,
          isReemisao: true);
      return novaNotaFiscal;
}

//Regra de negócio: responsável por verificar se os valor da fatura é igual a pelo menos UM dos impostos da nota fiscal.
void confereValorFaturaENotaFiscal(NotaFiscal notaFiscal, Fatura fatura){
  if(!(notaFiscal.impostoISS == fatura.valorFaturaTotal || notaFiscal.impostoICMS == fatura.valorFaturaTotal)){
    throw new Exception("Violou uma das regras de negócio, operação de reemisão negada.");
  }
}


/////////////////////////////////////////////////////////
//////////////////////Funcao 06/////////////////////////
/////////////////////////////////////////////////////////
// É uma função com parâmetros obrigatórios e
// nomeados que são responsáveis por validar a NotaFiscal
// Nele é passado uma função, que vai realizar a validação.

bool validaNotaFiscal({
  required NotaFiscal notaFiscal,
  required Function(NotaFiscal) validacaoNotaFiscal,
}) {
  if (!validacaoNotaFiscal(notaFiscal)) {
      throw new Exception("NotaFiscal Inválida.");
  }
  return true;
}

/////////////////////////////////////////////////////////
//////////////////////Funcao 07/////////////////////////
/////////////////////////////////////////////////////////
// Para validação é necessário que ela tenha sido emitida, e não pode ter sido cancelada.
// Então usamos uma arrow function, que é responsável por verificar as duas condições
// Aqui poderiamos usar qualquer outra verificação da nota fiscal
var x = validaNotaFiscal(
  notaFiscal: notaFiscal1001,
  validacaoNotaFiscal: (nf) => (nf.isCancelada != true && nf.isEmitida!=false),
);


/////////////////////////////////////////////////////////
//////////////////////Funcao 08/////////////////////////
/////////////////////////////////////////////////////////
// Uma função responsável por alterar a configuração fiscal do contra lançamento
// Quando é ligado o ABATIMENTOFISCAL do contra lançamento significa que esse valor irá interferir na fatura
// E também na somatória de valores da notaFiscal.É uma função com parâmetro nomeado obrigatório (contraLancamento)
ContraLancamento alteraConfiguracaoFiscal({
  required ContraLancamento contraLancamento,
}) {
  contraLancamento.abatimentoFiscal= true;
  return contraLancamento;
}


/////////////////////////////////////////////////////////
//////////////////////Funcao 09/////////////////////////
/////////////////////////////////////////////////////////
//Função responsável por receber um ContraLancamento e e devolver um CréditoFiscal
//Só é permitido devolver um crédito fiscal se o abatimentoFiscal desse contraLancamento estiver como TRUE
CreditoFiscal criaCreditoFiscalAPartirDeContraLancamento(ContraLancamento contraLancamento){
  if(!contraLancamento.abatimentoFiscal==true) {
    throw new Exception();
  }
  CreditoFiscal creditoFiscal = CreditoFiscal(
      valorFiscal: contraLancamento.valorContraLancamento);
  return creditoFiscal;
}


