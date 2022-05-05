import 'package:projeto_principal/projeto_principal.dart' as projeto_principal;
import 'package:projeto_principal/funcoes_loja.dart' as funcoes_loja;

void main() {
  //Segmentação 01 - valor de 100 reais de compra, será o resultado de 90, pois tem o desconto de 10.
  double resultado = funcoes_loja.calculaValorConformeCliente(1, 100);
  print(resultado);
}
