// import 'package:c_depuracao/ver_aprovacao/calculo_nota.dart' as nota;
// import 'package:c_depuracao/ver_aprovacao/calculo_presenca.dart' as presenca;
import 'calculo_nota.dart' as nota;
import 'calculo_presenca.dart' as presenca;

String verificarAprovacao(
    double nota1,
    double nota2,
    double media,
    int quantidadePresenca,
    int cargaHorariaDisciplina,
    double percentualMinimoPresenca) {
  var aprovadoNota = verificarAprovacaoNota(nota1, nota2,media);
  var aprovadoPresenca = verificarAprovacaoPresenca(
      quantidadePresenca, cargaHorariaDisciplina, 6);
  var resultado = 'aprovado';
  if (!aprovadoNota) resultado = 'reprovado por nota';
  if (!aprovadoPresenca)
    resultado = 'reprovado por presença';
  if (!aprovadoPresenca && !aprovadoNota)
    resultado = 'reprovado por nota e presença';
  return resultado;
}

bool verificarAprovacaoNota(double nota1, double nota2, [double media = 6]) {
  return (nota.calcularMedia(nota1, nota2) >= media);
}

bool verificarAprovacaoPresenca(int quantidadePresenca,
    int cargaHorariaDisciplina, double percentualMinimoPresenca) {
  return (presenca.calcularPercentualPresenca(
          quantidadePresenca, cargaHorariaDisciplina) >
      percentualMinimoPresenca);
}
