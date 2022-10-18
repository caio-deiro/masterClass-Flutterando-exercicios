void main(List<String> args) {
  var n1 = 50.0;
  var n2 = 20.0;
  var n3 = 80.0;
  var n4 = 10.0;

  var result = regraDeTres(value1: n2, value3: n4, value2: n1);
  print('o resultado foi = $result');
}

double regraDeTres({
  double value0 = 0.0,
  double value1 = 0.0,
  double value2 = 0.0,
  double value3 = 0.0,
}) {
  var x = [value0, value1, value2, value3];
  var quantidadeValoresPadroes =
      x.where((element) => element == 0.0).toList().length;
  var value = 0.0;
  if (quantidadeValoresPadroes > 1) {
    print('deve deixar apenas 1 valor em branco, para calculo da regra de 3');
  } else {
    if (x[0] == 0.0) {
      print('${x[1]} * ${x[2]} / ${x[3]}');
      value = (value1 * value2) / value3;
    } else if (x[1] == 0.0) {
      print('${x[0]} * ${x[3]} / ${x[2]}');
      value = (value0 * value3) / value2;
    } else if (x[2] == 0.0) {
      print('${x[0]} * ${x[3]} / ${x[1]}');
      value = (value0 * value3) / value1;
    } else {
      print('${x[1]} * ${x[2]} / ${x[0]}');
      value = (value1 * value2) / value0;
    }
  }
  return value;
}
