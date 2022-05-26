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

List<CupomDesconto> listaCuponsDoSistema = [
  CupomDesconto(identificadorDoCupom: "ArKlPm", valorDoDesconto: 5, isValido: true),
];


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
void criaCupomDeDesconto(List<CupomDesconto> listaDeCuponsValidos, double valorDoCupom){
  CupomDesconto cupomDesconto = CupomDesconto(
      identificadorDoCupom: gerarCodigoAleatorioConformeTamanho(tamanho: 5),
      valorDoDesconto: valorDoCupom,
      isValido: true
  );
  listaDeCuponsValidos.add(cupomDesconto);
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
// Todos os contras lançamentos relacionado ao imposto de ISS recebe o abatimentoFiscal como true.
// Logo, se o contralançamento possui o abatimento fiscal, esse desconto deve ser aplicado no impostoISS da nota fiscal
// E também no valor da fatura, caso o contraLançamento NÃO SEJA VALIDADO será gerado uma exceção.
List<double>? aplicaContraLancamentoNaNotaFiscal(ContraLancamento contraLancamento, NotaFiscal notaFiscal, Fatura fatura){
  List<double> listaValoresDa_Fatura_NFISS_eNFICMS = [];
  try {
    if (validaContraLancamento(contraLancamento, notaFiscal, fatura)) {
      if (contraLancamento.abatimentoFiscal) {
        notaFiscal.impostoISS -= contraLancamento.valorContraLancamento;
      }
      fatura.valorFaturaTotal -= contraLancamento.valorContraLancamento;

      listaValoresDa_Fatura_NFISS_eNFICMS.add(fatura.valorFaturaTotal);
      listaValoresDa_Fatura_NFISS_eNFICMS.add(notaFiscal.impostoISS);
      listaValoresDa_Fatura_NFISS_eNFICMS.add(notaFiscal.impostoICMS);

      return listaValoresDa_Fatura_NFISS_eNFICMS;
    } else {
      throw new Exception();
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
// UMA NOTA FISCAL SÓ PODE SER RE-EMITIDA SE O VALOR DA FATURA E DA NOTA FISCAL FOREM IGUAIS!
// Caso contrário é obrigatório gerar uma exceção.
// Para re-emetir uma nota fiscal é necessário que ela já tenha sido emitida
// Quando nós fazemos uma re-emição da nota fiscal nós alteramos o atributo da nota fiscal anterior de isCancelada para true.
// E emitimos uma nova nota fiscal, com o atributo de isReemisao para true.
// Isso é utilizado para o envio de pulsos de comunicação com o SAP.
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
    throw new Exception();
  }
}


/////////////////////////////////////////////////////////
//////////////////////Funcao 06/////////////////////////
/////////////////////////////////////////////////////////

