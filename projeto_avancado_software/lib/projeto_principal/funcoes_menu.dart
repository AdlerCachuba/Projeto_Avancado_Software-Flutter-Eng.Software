import 'dart:io';
import 'dart:math';

// import 'package:dartz/dartz.dart';

PessoaCompradora cliente = PessoaCompradora(nome: "Cleber", valorTotal: 0,descontoTotal: 0);

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
  double descontoTotal;
  PessoaCompradora({
    required this.nome,
    required this.valorTotal,
    required this.descontoTotal,
  });
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

// //Para testar o Either
// class TestaEither {
//   // o late serve para dizer que o desconto vai ser instanciado mais tarde
//   late Either<CupomDesconto, CupomDescontoPremium> desconto;
//   TestaEither(dynamic escolha) {
//     if (desconto is CupomDescontoPremium)
//       desconto = Right(escolha);
//     //atribui ao da direita, cupomDescontoPremium
//     else
//       desconto = Left(escolha);
//     //Atribui ao da esquerda, cupomdesconto
//   }
// }

// Função inicial para interagir com o usuário e escolher as opções.
// Enquanto o usuário não digita a opção 5, o programa continua rodando e interagindo com o usuário
void exibirMenu() {
  try {
    var opcao;
    while (opcao != 5) {
      opcoesDoMenu();
      print("Digite sua opção:");
      opcao = int.parse(stdin.readLineSync()!); // O ! permite e assume o risco de ser passado um valor null
      if (opcao == 1) {
        verProdutos();
      }
      if (opcao == 2) {
        comprarProdutos();
      }
      if (opcao == 3) {
        print("O valor total do seu carrinho é: " + cliente.valorTotal.toString());
      }
      if (opcao == 4) {
        print("Digite o código do cupom de desconto:");
        var cupomDesconto = int.parse(stdin.readLineSync()!);
        verificaCupomDesconto(cupomDesconto, listaCuponsValidos);
      }
      if (opcao == 5) {
        print("Obrigado por usar nosso sistema PetMais ! Até logo!");
        break;
      }
    }
  } catch (Exception) {
    print("A opção que você digitou causou uma exção no sistema.");
  }
}

// Função para mostrar os produtos cadastrados.
// Inicialmente a lista de produtos é carregada com 2 produtos.
// Caso a lista não tenha nenhum produto, será lançado uma exceção de ItemNaoEncontrado.
void verProdutos() {
  try {
    if (listaProdutos.length <= 0) {
      throw ItemNaoEncontrado("");
    } else {
      for (var x = 0; x < listaProdutos.length; x++) {
        print("Nome do produto: " + listaProdutos[x].nome.toString());
        print("Valor do produto:" + listaProdutos[x].valor.toString());
        print("Id do produto:" + listaProdutos[x].id.toString());
        print("-------------------------------------");
      }
    }
  } catch (ItemNaoEncontrado) {
    print("Ops, algo de errado aconteceu na hora de exibir os produtos. Chamar suporte.");
  } finally{
    print("Fim da lista de produtos.");
  }
}


// É uma função simples responsável por exibir as mensagens das opções do menu.
void opcoesDoMenu(){
  print("Bem vindo a loja Pet Mais! ");
  print("1 - Ver produtos");
  print("2 - Comprar produto");
  print("3 - Valor total do carrinho");
  print("4 - Aplicar cupom de desconto!");
  print("5 - Sair do programa.");
}

//Função que interage com o usuário, o usuário digita o id do produto que deseja comprar.
//O sistema busca o produto na lista de produtos, e imprime o nome na tela, e efetua o faturamento do produto.
//Essa função chama a função "efetuaPedido" que passa o produto da lista de produtos cadastrados, e o cliente.
void comprarProdutos() {
  print("Qual item deseja comprar? Digite o id do produto:");
  var itemId = int.parse(stdin
      .readLineSync()!); // O ! permite e assume o risco de ser passado um valor null
  try {
    for (var i = 0; i < listaProdutos.length; i++) {
      if (itemId == listaProdutos[i].id) {
        print("Item encontrado ! O nome do item é: " + listaProdutos[i].nome);
        print("Estamos faturando seu produto. Aguarde um momento");
        efetuaPedido(cliente, listaProdutos[i]);
      }
    }
  } catch (mensagemErro) {
    print(mensagemErro.toString());
  }
}


// Função para efetuar o pedido, é passado como parametro a pessoaCompradora e o produto que vai comprar
// Então é somado o valor do produto, ao valor total da pessoa compradora.
void efetuaPedido(PessoaCompradora pessoaCompradora, Produto produto) {
  try {
    if (produto.valor <= 0) {
      throw new ValorProdutoMenorIgualAZero("Produto com valor menor ou igual a zero. Favor chamar o suporte.");
    } else {
      pessoaCompradora.valorTotal += produto.valor;
      print("Produto faturado com sucesso!");
    }
  } catch (ValorProdutoMenorIgualAZero) {
    print("Tem algo de errado com esse produto. Favor chamar o suporte.");
  }
}


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




// função para validar o desconto


//Função responsável por verificar se o cupom de desconto digitado é válido.
//Se válido, aplica o desconto, caso contrário exibe mensagem avisando na tela.

void verificaCupomDesconto(int cupomDesconto, List<CupomDesconto> listaDosCuponsValidos) {
  for (var x = 0; x <= listaDosCuponsValidos.length; x++) {
    if (listaDosCuponsValidos[x].identificadorDoCupom == cupomDesconto) {
      aplicaDesconto(cliente, listaDosCuponsValidos[x]);
      break;
    }else{
      print("Seu cupom de desconto não foi encontrado na nossa base de dados.");
    }
  }
}

//Função responsável por aplicar o desconto no valor total do cliente
//O cupom de desconto desconta um valor fixo para o valor total do cliente.

void aplicaDesconto(PessoaCompradora cliente, CupomDesconto cupomDesconto) {
  try {
    if (cupomDesconto.valorDoDesconto <= 0) {
      throw new ValorCupomMenorIgualAZero("Cupom menor a zero");
    } else {
      cliente.descontoTotal += cupomDesconto.valorDoDesconto;
      print("Cupom aplicado com sucesso!");
    }
  } catch (ValorCupomMenorIgualAZero) {
    print("Erro! Cupom com problema.");
    print("Cupom com o identificador" + cupomDesconto.identificadorDoCupom.toString() + " está com problema no valor estabelecido.");
    print("Favor ligar para a central de descontos (11)3422 2841");
  }
}

