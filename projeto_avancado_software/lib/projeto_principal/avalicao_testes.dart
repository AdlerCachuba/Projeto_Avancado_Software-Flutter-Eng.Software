
import 'avaliacao.dart';
import 'avaliacao.dart';
import 'package:test/test.dart';

void main() {

  CupomDesconto cupomDescontoTeste = CupomDesconto(identificadorDoCupom: "xawerqt", valorDoDesconto: 20, isValido: true);
  List<CupomDesconto> listaCuponsDoSistema = [
    CupomDesconto(identificadorDoCupom: "ArKlPm", valorDoDesconto: 5, isValido: true),
  ];
  NotaFiscal notaFiscal1001 = NotaFiscal(impostoISS: 100, impostoICMS: 100, isEmitida: true, isCancelada: false, isReemisao: false);
  Fatura faturaComValor100 = Fatura(valorFaturaTotal: 100);
  Produto internet100mb = Produto(nome: "Internet 100mbs", impostoISS: 0, impostoICMS: 50);
  Produto instalacaoInternet = Produto(nome: "Instalacao internet", impostoISS: 50, impostoICMS: 0);
  DescontoFiscal descontoFiscalICMS = DescontoFiscal(descontoImpostoISS: 0, descontoImpostoICMS: 10);
  DescontoFiscal descontoFiscalISS = DescontoFiscal(descontoImpostoISS: 10, descontoImpostoICMS: 0);

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



}
