
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

CupomDesconto cupomDescontoTeste = CupomDesconto(identificadorDoCupom: "xawerqt", valorDoDesconto: 20, isValido: true);
CupomDesconto cupomDesconto1010 = CupomDesconto(identificadorDoCupom: "1010", valorDoDesconto: 10, isValido: true);
CupomDesconto cupomDesconto2030 = CupomDesconto(identificadorDoCupom: "2030", valorDoDesconto: 100, isValido: true);

List<CupomDesconto> listaCuponsDoSistema = [
  CupomDesconto(identificadorDoCupom: "ArKlPm", valorDoDesconto: 5, isValido: true),
];
NotaFiscal notaFiscal1001 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal1002 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal1003 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal1004 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal4004 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: false, isCancelada: true, isReemisao: false);
NotaFiscal notaFiscal5005 = NotaFiscal(impostoISS: 200, impostoICMS: 200, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal6006 = NotaFiscal(impostoISS: 700, impostoICMS: 700, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal7007 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal8008 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal9009 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal9999 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
NotaFiscal notaFiscal9989 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);

NotaFiscal notaFiscalInvalida1001 = NotaFiscal(impostoISS: -200, impostoICMS: -200, isEmitida: false, isCancelada: true, isReemisao: false);


Fatura faturaComValor50 = Fatura(valorFaturaTotal: 50);
Fatura faturaComValor100 = Fatura(valorFaturaTotal: 100);
Fatura outraFaturaComValor100 = Fatura(valorFaturaTotal: 100);
Fatura faturaCiclano = Fatura(valorFaturaTotal: 100);
Fatura faturaBeltrano = Fatura(valorFaturaTotal: 100);
Fatura faturaComValor200 = Fatura(valorFaturaTotal: 200);


Produto internet100mb = Produto(nome: "Internet 100mbs", impostoISS: 0, impostoICMS: 50);
Produto instalacaoInternet = Produto(nome: "Instalacao internet", impostoISS: 50, impostoICMS: 0);
DescontoFiscal descontoFiscalICMS = DescontoFiscal(descontoImpostoISS: 0, descontoImpostoICMS: 10);
DescontoFiscal descontoFiscalISS = DescontoFiscal(descontoImpostoISS: 10, descontoImpostoICMS: 0);
ContraLancamento contraLancamentoComAbatimentoFiscal = ContraLancamento(valorContraLancamento: 20, abatimentoFiscal: true);
ContraLancamento contraLancamentoComAbatimentoFiscal1002 = ContraLancamento(valorContraLancamento: 20, abatimentoFiscal: true);
ContraLancamento contraLancamentoSemAbatimentoFiscal1003 = ContraLancamento(valorContraLancamento: 20, abatimentoFiscal: false);

ContraLancamento contraLancamentoSemAbatimentoFiscal = ContraLancamento(valorContraLancamento: 20, abatimentoFiscal: false);
ContraLancamento contraLancamentoComAbatimentoFiscalValorSuperior = ContraLancamento(valorContraLancamento: 90000, abatimentoFiscal: true);
ContraLancamento contraLancamentoSemAbatimentoFiscalValorSuperior = ContraLancamento(valorContraLancamento: 90000, abatimentoFiscal: false);
