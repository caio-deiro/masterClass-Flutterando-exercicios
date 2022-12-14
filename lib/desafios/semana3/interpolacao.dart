void main(List<String> args) {
  var inter = Interpolacao();

  print('o valor foi de : ${inter.lerpFunction(20, 40, 0.8)}');
}

class Interpolacao {
  double begin = 0.0;
  double end = 0.0;
  double percent = 0.0;

  lerpFunction(double? begin, double? end, double percent) {
    begin ??= 0.0;
    end ??= 0.0;
    return begin * (1.0 - percent) + end * percent;
  }
}
