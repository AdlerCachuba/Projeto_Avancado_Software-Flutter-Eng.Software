// 1)Para atribuir um valor em um atributo, qual a diferença em: (i) atribuir um valor no atributo na  definição da classe;
// e (ii) solicitar o seu valor via parâmetro do construtor?

// R: Quando nós atribuimos o valor via parametro do construtor, nós estamos criando uma regra para que quando esse objeto seja criado
// é necessário que esses valores já sejam informados na construtação do objeto.
// Quando atribumos valor no atributo na definição da classe, nós estamos colocando um valor no atributo classe
// Caso seja um construtor vazio, por exemplo, seria possível criar o objeto e depois atribuir os valores a ele.

// 2)O que é para que ser construtor? Qual código pode-se definir nele?

// R: O construtor é o primeiro método a ser executado quando criamos um objeto.
// O construtor é responsável pela criação do objeto, quando criado o objeto, ele irá seguir as regras do construtor
// Sejam elas: Atribuição de atributos, funções, execuções de métodos.

// 3)Para que serve "final"? Em que caso utilizamos? Para coletar dados, qual a vantagem e desvantagem?

// O "final" define que o atributo é uma constante em tempo de execução, já o "const" define em tempo de compilação
// Usamos o final quando o valor não sofre mudanças, o final é que na execução nós podemos definir o valor
// A desvantagem principal é a criação de variaveis temporárias para atribuir ao objeto posteroirmente
// A principal vantagem é a segurança, visto que o valor será imutável

// 4) Crie e instancie as classes abaixo. Para cada atributo, atribua valores, altere os valores e imprima-os.
//     * → obrigatório
//     = valor (valor padrão)
//     ? pode ser nulo
//   Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não.
//   a) Bola{cor=branco,tamanho=7, categoria?}

void main(List<String> args) {
  var bola = Bola();
  bola.tamanho = 5;
  bola.categoria = "NovaCategoria";
  bola.cor = "vermelho";
  print(bola.cor);
  print(bola.categoria);
  print(bola.tamanho);

  var professor = Professor(5, "Fulano", 123241, "fulano@gmail.com");
  professor.cpf = 11111;
  professor.email = "fulanoooo@gmail.com";
  professor.id = 3;
  professor.nome = "Super Fulano";
  print(professor.id);
  print(professor.cpf);
  print(professor.email);
  print(professor.nome);

  var aluno = Aluno(cpf: 111, nome: "Super Aluno", ra: 12, telefone: 12);
  aluno.cpf = 222;
  aluno.nome = "Ex-SuperAluno";
  aluno.ra = 23;
  aluno.telefone = 23;
}

class Bola {
  String cor = "branco";
  int tamanho = 7;
  String? categoria;
}

//   b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor

class Professor {
  int id;
  String nome;
  int cpf;
  String email;
  Professor(this.id, this.nome, this.cpf, this.email);
}

//   c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, inicialize todos os atributos no contrutor utilizando parâmetros nomeados

class Aluno {
  final int ra;
  final String nome;
  final int cpf;
  final int telefone;

  set ra(int ra) {
    this.ra = ra;
  }

  set nome(String nome) {
    this.nome = nome;
  }

  set cpf(int cpf) {
    this.cpf = cpf;
  }

  set telefone(int telefone) {
    this.telefone = telefone;
  }

  Aluno(
      {required this.ra,
      required this.nome,
      required this.cpf,
      required this.telefone});
}

//   d) Peça{código, nome, descrição, preço de custo}
//     → get nome e descição, get preço de venda (30% sobre o preço de custo)
//     → set código - somente números positivos
//     → set preço de custo - somente valore positivos

class PecaExercicioD {
  int codigo;
  String nome;
  String descricao;
  double precoDeCusto;

  String getNome() {
    return this.nome;
  }

  String getDescricao() {
    return this.descricao;
  }

  double getPrecoDeVenda() {
    return precoDeCusto - (precoDeCusto * 0.7);
  }

  setCodigo(int codigo) {
    if (codigo > 0) this.codigo = codigo;
  }

  setPrecoDeCusto(double precoDeCusto) {
    if (precoDeCusto > 0) this.precoDeCusto = precoDeCusto;
  }

  PecaExercicioD(this.codigo, this.descricao, this.nome, this.precoDeCusto);
}

//   e) Carro{nome, ano fabricação}
//     → get tempo de uso, get nome e ano fabricação
//     → set ano fabricação - somente ano positivo e coerente

class Carro {
  String nome;
  int anoFabricacao;

  int getTempoDeUso() {
    var anoAtual = DateTime.now().year;
    var tempoDeUso = anoAtual - this.anoFabricacao;
    return tempoDeUso;
  }

  String getNome() {
    return this.nome;
  }

  int? getAnoFabricacao() {
    if (this.anoFabricacao > 0) return this.anoFabricacao;
  }

  setAnoFabricacao(int anoFabricacao) {
    if (anoFabricacao > 1800) {
      this.anoFabricacao = anoFabricacao;
    }
  }

  Carro(this.nome, this.anoFabricacao);
}

//   f) Cidade{nome,Estado{nome,sigla}}

class Estado {
  String nome;
  String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  String nome;
  Estado estado;
  Cidade({required this.nome, required this.estado});
}

//   g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}

class Funcionario {
  final String nome;
  final int cpf;
  final int telefone;
  final Cidade cidade;

  Funcionario(
      {required this.nome,
      required this.cpf,
      required this.telefone,
      required this.cidade});
}

//   h) Peca{nome,Tipo{nome,Categoria{nome, descirção}},Unidade de Medida{sigla, descricao}, Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}

class Peca {
  String nome;
  Tipo tipo;
  UnidadeDeMedida unidadeDeMedida;
  Fabricante fabricante;

  Peca(this.fabricante, this.nome, this.tipo, this.unidadeDeMedida);
}

class Tipo {
  String nome;
  Categoria categoria;

  Tipo(this.categoria, this.nome);
}

class Categoria {
  String nome;
  String descricao;

  Categoria(this.descricao, this.nome);
}

class UnidadeDeMedida {
  String sigla;
  String descricao;

  UnidadeDeMedida(this.descricao, this.sigla);
}

class Fabricante {
  String nome;
  Cidade cidade;

  Fabricante(this.cidade, this.nome);
}

//   i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.

class AlunoComSobrenomeOpcional {
  String nome;
  String? sobreNome;
  String ultimoNome;

  AlunoComSobrenomeOpcional({required this.nome, this.sobreNome, required this.ultimoNome});
}

class NotaFiscal {
  double valor;
  double pendenciaFiscal;
  int anoEmissao;

  //Método
  double getValorLiquido() {
    if (pendenciaFiscal < valor) {
      return pendenciaFiscal - valor;
    } else {
      throw new Exception();
    }
  }
  //Propriedade
  double? get valorLiquido {
    if (pendenciaFiscal < valor) {
      return pendenciaFiscal - valor;
    } else {
      throw new Exception();
    }
  }

  //Metodo
  setValor(double valor) {
    this.valor = valor;
  }
  //Propriedade
  set valorDaNf(double valor) {
    this.valor = valor;
  }

  NotaFiscal(this.valor, this.pendenciaFiscal, this.anoEmissao);
}

class Empresa {
  int anoCriacao;
  int quantidadeDeAnosParados;

  int getAnosExistentes() {
    var anoAtual = DateTime.now().year;
    var tempoExistencia = anoAtual - this.anoCriacao;
    return tempoExistencia;
  }

  int getAnosAtivaNoMercado() {
    var tempoExistencia = getAnosExistentes() - this.quantidadeDeAnosParados;
    return tempoExistencia;
  }

  Empresa(this.anoCriacao, this.quantidadeDeAnosParados);
}

//Usando parametro nomeado
class MinhaClasseFinalNomeada {
  final String nome;
  final int numero;
  final bool valido;
  MinhaClasseFinalNomeada(
      {required this.nome, required this.numero, required this.valido});
}

class MinhaClassePrivada {
  String _nome;
  int? _numero;
  bool? _valido;

  //É uma propriedade por usar o get!
  String get nome {
    return _nome;
  }

  // Ou o set como propriedade
  set nome(String nome) {
    _nome = nome;
  }

  // mas também funciona AS IS java
  String getNome() {
    return _nome;
  }

  setNome(String nome) {
    this._nome = nome;
  }

  MinhaClassePrivada(this._nome);
}

// O _ define que é uma classe privada, o encasulapmento é feito por arquivos no dart.
// Logo, essa classe só rodaria aqui dentro desse arquivo, caso instanciada em outro arquivo não seria possível.
class _MinhaClasseDois {
  _MinhaClasseDois() {
    print('minha classe');
  }
}
