import 'dart:io';

import 'package:dartz/dartz.dart';

PessoaCompradora cliente = PessoaCompradora(nome: "Cleber", valorTotal: 0);
List<String> listaDeErrosDaExecucao = new List.empty();

List<Produto> listaProdutos = [
  Produto(nome: 'Ração cachorro PetMais 100g', valor: 20.0, id: 1),
  Produto(nome: 'Ração gato PetMais 100g', valor: 25.0, id: 2)
];

List<CupomDesconto> listaCuponsValidos = [
  CupomDesconto(identificadorDoCupom: 111, valorDoDesconto: 5),
  CupomDesconto(identificadorDoCupom: 222, valorDoDesconto: 10)
];

class CupomDesconto {
  int identificadorDoCupom;
  double valorDoDesconto;
  CupomDesconto({
    required this.identificadorDoCupom,
    required this.valorDoDesconto,
  });
}

class CupomDescontoPremium {
  int identificadorDoCupom;
  double valorDoDescontoPremium;
  CupomDescontoPremium({
    required this.identificadorDoCupom,
    required this.valorDoDescontoPremium,
  });
}

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

class PessoaCompradora {
  String nome;
  double valorTotal;
  PessoaCompradora({
    required this.nome,
    required this.valorTotal,
  });
}

void exibirMenu() {
  print("Bem vindo a loja Pet Mais! ");
  print("1 - Ver produtos");
  print("2 - Comprar produto");
  print("3 - Valor total do carrinho");
  print("4 - Aplicar cupom de desconto!");
  print("5 - Sair do programa.");
  try {
    var opcao;
    while (opcao != 5) {
      opcao = int.parse(stdin
          .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null
      if (opcao == 1) {
        verProdutos();
      }
      if (opcao == 2) {
        comprarProdutos();
      }
      if (opcao == 3) {
        print("O valor total do seu carrinho é: " +
            cliente.valorTotal.toString());
      }
      if (opcao == 4) {
        print("Digite o código do cupom de desconto:");
        var cupomDesconto = int.parse(stdin.readLineSync()!);
        verificaCupomDesconto(cupomDesconto);
      }
      if (opcao == 5) {
        print("Obrigado por usar nosso sistema PetMais ! Até logo!");
        break;
      }
    }
  } catch (a) {
    print("A opção que você digitou causou uma exção no sistema.");
  }
}

void verificaCupomDesconto(int cupomDesconto) {
  for (var x = 0; x <= listaCuponsValidos.length; x++) {
    if (listaCuponsValidos[x].identificadorDoCupom == cupomDesconto) {
      aplicaDesconto(cliente, listaCuponsValidos[x]);
      break;
    }
  }
}

void aplicaDesconto(PessoaCompradora cliente, CupomDesconto cupomDesconto) {
  try {
    if (cupomDesconto.valorDoDesconto <= 0) {
      print("Erro! Cupom com problema.");
      print("Cupom com o identificador" +
          cupomDesconto.identificadorDoCupom.toString() +
          " está com problema.");
      print("Favor ligar para a central de descontos (11)3422 2841");
      throw new ValorCupomMenorIgualAZero("Cupom menor a zero");
    } else {
      cliente.valorTotal -= cupomDesconto.valorDoDesconto;
      print("Cupom aplicado com sucesso!");
    }
  } on ValorProdutoMenorIgualAZero catch (causaDoErro) {
    listaDeErrosDaExecucao.add(causaDoErro.toString());
  } catch (Exception) {
    print("Ops, algo de errado aconteceu. Chamar suporte.");
  }
}

void verProdutos() {
  try {
    if (listaProdutos.length <= 0) {
      throw ItemNaoEncontrado("");
    } else {
      for (var x = 0; x <= listaProdutos.length; x++) {
        print("Nome do produto: " + listaProdutos[x].nome);
        print("Valor do produto:" + listaProdutos[x].valor.toString());
        print("Id do produto:" + listaProdutos[x].id);
        print("-------------------------------------");
      }
    }
  } on ItemNaoEncontrado catch (causaDoErro) {
    listaDeErrosDaExecucao.add(causaDoErro.toString());
  } catch (ItemNaoEncontrado) {
    print("Ops, algo de errado aconteceu. Chamar suporte.");
  }
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
        efetuaPedido(cliente, listaProdutos[i]);
      }
    }
  } on ItemNaoEncontrado catch (mensagem) {
    print(mensagem.motivo);
  } catch (mensagemErro) {
    print(mensagemErro.toString());
  }
}

void efetuaPedido(PessoaCompradora pessoaCompradora, Produto produto) {
  try {
    if (produto.valor <= 0) {
      print("Tem algo de errado com esse produto. Favor chamar o suporte.");
      throw new ValorProdutoMenorIgualAZero(
          "Produto com valor menor ou igual a zero. Favor chamar o suporte.");
    } else {
      pessoaCompradora.valorTotal += produto.valor;
      print("Produto faturado com sucesso!");
    }
  } on ValorProdutoMenorIgualAZero catch (causaDoErro) {
    listaDeErrosDaExecucao.add(causaDoErro.toString());
  } catch (causaDoErro) {}
}

class ValorProdutoMenorIgualAZero implements Exception {
  String causaDoErro;
  ValorProdutoMenorIgualAZero(this.causaDoErro);
}

class ValorCupomMenorIgualAZero implements Exception {
  String causaDoErro;
  ValorCupomMenorIgualAZero(this.causaDoErro);
}

class ItemNaoEncontrado implements Exception {
  String motivo;
  ItemNaoEncontrado(this.motivo);
}

//Para testar o Either
class TestaEither {
  // o late serve para dizer que o desconto vai ser instanciado mais tarde
  late Either<CupomDesconto, CupomDescontoPremium> desconto;
  TestaEither(dynamic escolha) {
    if (desconto is CupomDescontoPremium)
      desconto = Right(escolha);
    //atribui ao da direita, cupomDescontoPremium
    else
      desconto = Left(escolha);
    //Atribui ao da esquerda, cupomdesconto
  }
}
