  int get idade {
    var aonAtual = DateTime.now().year;
    var idade = aonAtual - _anoNascimento;
    return idade;
  }