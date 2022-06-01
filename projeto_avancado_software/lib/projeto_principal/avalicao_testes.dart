
import 'avaliacao.dart';
import 'avaliacao.dart';
import 'package:test/test.dart';

void main() {

  CupomDesconto cupomDescontoTeste = CupomDesconto(identificadorDoCupom: "xawerqt", valorDoDesconto: 20, isValido: true);
  List<CupomDesconto> listaCuponsDoSistema = [
    CupomDesconto(identificadorDoCupom: "ArKlPm", valorDoDesconto: 5, isValido: true),
  ];
  NotaFiscal notaFiscal1001 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
  NotaFiscal notaFiscal4004 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: false, isCancelada: true, isReemisao: false);

  Fatura faturaComValor100 = Fatura(valorFaturaTotal: 100);
  Fatura faturaComValor200 = Fatura(valorFaturaTotal: 200);
  Produto internet100mb = Produto(nome: "Internet 100mbs", impostoISS: 0, impostoICMS: 50);
  Produto instalacaoInternet = Produto(nome: "Instalacao internet", impostoISS: 50, impostoICMS: 0);
  DescontoFiscal descontoFiscalICMS = DescontoFiscal(descontoImpostoISS: 0, descontoImpostoICMS: 10);
  DescontoFiscal descontoFiscalISS = DescontoFiscal(descontoImpostoISS: 10, descontoImpostoICMS: 0);
  ContraLancamento contraLancamentoComAbatimentoFiscal = ContraLancamento(valorContraLancamento: 20, abatimentoFiscal: true);
  ContraLancamento contraLancamentoSemAbatimentoFiscal = ContraLancamento(valorContraLancamento: 20, abatimentoFiscal: false);
  ContraLancamento contraLancamentoComAbatimentoFiscalValorSuperior = ContraLancamento(valorContraLancamento: 90000, abatimentoFiscal: true);
  ContraLancamento contraLancamentoSemAbatimentoFiscalValorSuperior = ContraLancamento(valorContraLancamento: 90000, abatimentoFiscal: false);

  //TESTE PARA FUNÇÃO 01 - CRIA CUPOM DE DESCONTO
  group('Testa o método que gera o cupom', (){
    test('Verifica se o tamanho da geração do cupom padrão gera 8 identificadores.', () {
      expect(gerarCodigoAleatorioConformeTamanho(),8 );
    });
    test('Verifica se a alteração de tamanho da geração do cupom.', () {
      expect(gerarCodigoAleatorioConformeTamanho(tamanho: 9),9 );
    });
  });

  group('Testa todos os atributos do cupom gerado', (){
    test('Verifica se o valor do cupom é de 20.00', () {
      expect(criaCupomDeDesconto(listaCuponsDoSistema,20).valorDoDesconto,20 );
    });
    test('Verifica se o cupom criado é válido', () {
      expect(criaCupomDeDesconto(listaCuponsDoSistema,20).isValido,true );
    });
    test('Verifica se o tamanho do cupom possui 5 identificadores.', () {
      expect(criaCupomDeDesconto(listaCuponsDoSistema,20).identificadorDoCupom.length,5 );
    });
  });

  //TESTE PARA FUNÇÃO 02 - Função responsável por validar o cupom e aplicar ele na fatura.
  //Após essa aplicação o cupom passa o estado de isValido para false
  group('Testa a utilização do cupom na fatura', (){
    test('Verifica se o cupom de desconto fica invalidado após usar na fatura', () {
      validaCupomEAplicaNaFatura(listaCuponsDoSistema[0],listaCuponsDoSistema,faturaComValor100);
      expect(listaCuponsDoSistema[0].isValido, false);
    });
    test('Valida que o valor da fatura foi alterado', () {
      validaCupomEAplicaNaFatura(listaCuponsDoSistema[0],listaCuponsDoSistema,faturaComValor100);
      expect(faturaComValor100.valorFaturaTotal,95);
    });
  });


  //TESTE PARA FUNÇÃO 03 -
  // Se existe um desconto a ser aplicado no valor da nota fiscal,
  // Esse mesmo desconto deve ser aplicado na nota fiscal do produto do mesmo imposto
  // Caso o desconto seja de outra origem do imposto, ele não poderá ser aplicado para emitir a NF.
  group('Testa a emissão da nota fiscal sem desconto', (){
    test('Testa se foi emitida', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).isEmitida, true);
    });
    test('Testa que não foi cancelada', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).isCancelada, false);
    });
    test('Testa o valor do imposto ICMS', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).impostoICMS, 50);
    });
    test('Testa o valor do imposto ISS', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).impostoISS, 0);
    });
    test('Testa que não foi uma reemisão', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).isReemisao, false);
    });
  });

  group('Testa a emissão da nota fiscal com desconto', (){
    test('Testa se foi emitida', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).isEmitida, true);
    });
    test('Testa que não foi cancelada', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).isCancelada, false);
    });
    test('Testa se o valor do desconto fiscal afetou o imposto ICMS da NF', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb,desconto: descontoFiscalICMS).impostoICMS, 40);
    });
    test('Testa se o valor do desconto fiscal afetou o imposto ISS da NF', () {
      expect(emiteNotaFiscalDoProduto(produto: instalacaoInternet,desconto: descontoFiscalISS).impostoISS, 40);
    });
    test('Testa que não foi uma reemisão', () {
      expect(emiteNotaFiscalDoProduto(produto: internet100mb).isReemisao, false);
    });
  });

  //TESTE PARA FUNÇÃO 04 -
// Todos os contras lançamentos que possuem abatimentoFiscal como true irão descontar o imposto ISS da NF.
// Todos contra-lançamentos abatem no valor da fatura.
// Caso o contraLançamento NÃO SEJA VALIDADO será gerado uma exceção.
//A função retornar a classe ValoresFaturaNFISSeNFICMS usada para armazenar os valores quando aplicado um contra lançamento.
//
//  O motivo de existir essa classe de retorno é : Retornar dados que são armazenados no histórico após
//  usar um contra lançamento, útil para possiveis auditorias e também facilita para testar a função

  group('ContraLancamento COM abatimento fiscal', (){
    test('Testa se o valor abateu na fatura', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoComAbatimentoFiscal,notaFiscal1001,faturaComValor100)?.valorFatura,80 );
    });
    test('Testa se o valor abateu na NF ISS', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoComAbatimentoFiscal,notaFiscal1001,faturaComValor100)?.valorNFISS,80 );
    });
    test('Testa se o valor abateu na NF ICMS', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoComAbatimentoFiscal,notaFiscal1001,faturaComValor100)?.valorNFICMS,100 );
    });
  });

  group('ContraLancamento SEM abatimento fiscal', (){
    test('Testa se o valor abateu na fatura', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoSemAbatimentoFiscal,notaFiscal1001,faturaComValor100)?.valorFatura,80 );
    });
    test('Testa se o valor abateu na NF ISS', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoSemAbatimentoFiscal,notaFiscal1001,faturaComValor100)?.valorNFISS,100 );
    });
    test('Testa se o valor abateu na NF ICMS', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoSemAbatimentoFiscal,notaFiscal1001,faturaComValor100)?.valorNFICMS,100 );
    });
  });

  group('ContraLancamento que não são válidos e geram erros', (){
    test('Testa com o contra lançamento sem abatimento fiscal com valor superior a NF e Fatura', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoSemAbatimentoFiscalValorSuperior,notaFiscal1001,faturaComValor100),Exception("Valor do Contra Lançamento Maior que a Fatura e/ou a NotaFiscal"));
    });
    test('Testa com o contra lançamento com abatimento fiscal com valor superior a NF e Fatura', () {
      expect(aplicaContraLancamentoNaFaturaENotaFiscal(contraLancamentoComAbatimentoFiscalValorSuperior,notaFiscal1001,faturaComValor100),Exception("Valor do Contra Lançamento Maior que a Fatura e/ou a NotaFiscal"));
    });
  });

  group('Testes de Validação de ContraLancamentos', (){
    test('Testa se o contra lançamento sem abatimento fiscal é válido ', () {
      expect(validaContraLancamento(contraLancamentoSemAbatimentoFiscal,notaFiscal1001,faturaComValor100),true);
    });
    test('Testa se o contra lançamento com abatimento fiscal é válido', () {
      expect(validaContraLancamento(contraLancamentoComAbatimentoFiscal,notaFiscal1001,faturaComValor100),true);
    });
    test('Testa que o contra lançamento sem abatimento fiscal com valor maior que a fatura e a nota fiscal não é válido', () {
      expect(validaContraLancamento(contraLancamentoSemAbatimentoFiscalValorSuperior,notaFiscal1001,faturaComValor100),false);
    });
    test('Testa que o contra lançamento com abatimento fiscal com valor maior que a fatura e a nota fiscal não é válido', () {
      expect(validaContraLancamento(contraLancamentoComAbatimentoFiscalValorSuperior,notaFiscal1001,faturaComValor100),false);
    });
  });

  //TESTE PARA FUNÇÃO 05 -
  // UMA NOTA FISCAL SÓ PODE SER RE-EMITIDA SE O VALOR DA FATURA E DE um dos valores de imposto da NOTA FISCAL FOREM IGUAIS!
// Caso contrário é obrigatório gerar uma exceção.
// Quando nós fazemos uma re-emição da nota fiscal nós alteramos o atributo da nota fiscal anterior de isCancelada para true.
// E emitimos uma nova nota fiscal, com o atributo de isReemisao para true.
// Isso é utilizado para o envio de pulsos de comunicação com o SAP para valida o CAR (Contas a receber)

  group('Testes de Reemisao da nota fiscal', (){
    test('Testa se a nova nota fiscal criada foi emitida', () {
      expect(reemissaoDaNotaFiscal(notaFiscal1001, faturaComValor100, 50, 50).isEmitida,true);
    });
    test('Testa se a nova nota fiscal criada possui o valor de imposto ISS novo', () {
      expect(reemissaoDaNotaFiscal(notaFiscal1001, faturaComValor100, 50, 50).impostoISS,50);
    });
    test('Testa se a nova nota fiscal criada possui o valor de imposto ICMS novo', () {
      expect(reemissaoDaNotaFiscal(notaFiscal1001, faturaComValor100, 50, 50).impostoICMS,50);
    });
    test('Testa se a nova nota fiscal criada possui o atributo isReemisao como true', () {
      expect(reemissaoDaNotaFiscal(notaFiscal1001, faturaComValor100, 50, 50).isReemisao,true);
    });
    test('Testa se a nova nota fiscal criada possui o atributo isCancelada como false', () {
      expect(reemissaoDaNotaFiscal(notaFiscal1001, faturaComValor100, 50, 50).isCancelada,false);
    });
  });

  group('Testes que geram erro na Reemisao da nota fiscal', (){
    test('Fatura com valor diferente dos valores da nota fiscal', () {
      expect(reemissaoDaNotaFiscal(notaFiscal1001, faturaComValor200, 50, 50),Exception("Violou uma das regras de negócio, operação de reemisão negada."));
    });
  });


  //TESTES PARA FUNÇÃO 06 e 07
  // É uma função com parâmetros obrigatórios e
// nomeados que são responsáveis por validar a NotaFiscal
// Nele é passado uma função, que vai realizar a validação.
  group('Testes responsáveis por validar a notaFiscal ', (){
    test('Teste usando a arrow function para validar que a nota não foi cancelada e sim emitida', () {
      expect(validaNotaFiscal(
        notaFiscal: notaFiscal1001,
        validacaoNotaFiscal: (nf) => (nf.isCancelada != true && nf.isEmitida!=false),
      ),true);
    });
  });


// Para validação é necessário que ela tenha sido emitida, e não pode ter sido cancelada.
  group('Testes responsáveis por gerar exceção na validação da notaFiscal ', (){
    test('Teste que gera exceção ao tentar validar a nota fiscal', () {
      expect(validaNotaFiscal(
        notaFiscal: notaFiscal4004,
        validacaoNotaFiscal: (nf) => (nf.isCancelada != true && nf.isEmitida!=false),
      ),Exception("NotaFiscal Inválida."));
    });
  });


}
