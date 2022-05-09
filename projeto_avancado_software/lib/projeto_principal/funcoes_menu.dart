import 'dart:io';

List<Produto> listaProdutos = [
  Produto(nome: 'Ração cachorro PetMais 100g', valor: 20.0, id: 1),
  Produto(nome: 'Ração gato PetMais 100g', valor: 25.0, id: 2)
];

class Produto {
  var id;
  String nome;
  double valor;
  Produto({
    required this.id,
    required this.nome,
    required this.valor,
  });
}

void exibirMenu() {
  print("Bem vindo a loja Pet Mais! ");
  print("1 - Ver produtos");
  print("2 - Comprar produto");
  try {
    var opcao = int.parse(stdin
        .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null
    if (opcao == 1) {
      verProdutos();
    }
    if (opcao == 2) {
      comprarProdutos();
    }
    if (opcao == 3) {
      print('Vamos causar um erro no sistema.');
      var x = 3 / 0;
      print(x);
    }
  } catch (a) {
    print("A opção que você digitou causou uma exção no sistema.");
  }
}

void verProdutos() {
  print("Itens disponíveis:");
  print(listaProdutos);
}

void comprarProdutos() {
  print("Qual item deseja comprar? Digite o id do produto:");
  var itemId = int.parse(stdin
      .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null
  try {
    for (var i = 0; i < listaProdutos.length; i++) {
      if (itemId == listaProdutos[i]) {
        print("Item encontrado ! O nome do item é" + listaProdutos[i].nome);
        print("Estamos faturando seu produto. Aguarde um momento");
      }
    }
  } on ItemNaoEncontrado catch (mensagem) {
    print(mensagem.motivo);
  } catch (mensagemErro) {
    print(mensagemErro.toString());
  }
}

class ItemNaoEncontrado implements Exception {
  String motivo;
  ItemNaoEncontrado(this.motivo);
}
