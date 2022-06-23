//objetivo entneder o contexto:

String verificaAprovacaoCompleto(int opcao, double nota1, double nota2) {
  // o switch case só tme um desempenho maior quando tem mais que 7
  if (opcao == 1) {
    //aprovação pela media
    double media = (nota1 + nota2) / 2;
    if (media >= 6) {
      return "Aprovado";
    } else {
      return "Reprovado";
    }
  } else if (opcao == 2) {
    //aprovação pela maior nota
    double maior = nota1;
    if (nota2 > nota1) {
      maior = nota2;
    }
    if (maior >= 6) {
      return "Aprovado";
    } else {
      return "Reprovado";
    }
  } else {
    //aprovação pela menor nota
    double menor = nota1;
    if (nota2 < nota1) {
      menor = nota2;
    }
    if (menor >= 6) {
      return "Aprovado";
    } else {
      return "Reprovado";
    }
  }
}

String verificarAprovacao(int opcao, double nota1, double nota2) {
  if (opcao == 1) {
    return verificarPelaMedia(nota1, nota2);
  } else if (opcao == 2) {
    return verificarPelaMaiorNota(nota1, nota2);
  } else {
    return verificarPelaMenorNota(nota1, nota2);
  }
}

String verificarPelaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  if (media >= 6) {
    return "Aprovado";
  } else {
    return "Reprovado";
  }
}

String verificarPelaMaiorNota(double nota1, double nota2) {
  //aprovação pela maior nota
  double maior = nota1;
  if (nota2 > nota1) {
    maior = nota2;
  }
  if (maior >= 6) {
    return "Aprovado";
  } else {
    return "Reprovado";
  }
}

String verificarPelaMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) {
    menor = nota2;
  }
  if (menor >= 6) {
    return "Aprovado";
  } else {
    return "Reprovado";
  }
}

