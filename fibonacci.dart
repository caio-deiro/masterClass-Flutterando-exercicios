import 'dart:io';

void main() {
  print(
      'escolha a quantidade de numeros da sequencia de fibonacci que serao impressos:\n');
  var numero = int.parse(stdin.readLineSync()!);
  for (var i = 0; i < numero; i++) {
    print(finaboncci(i));
  }
}

int finaboncci(int n) {
  if (n < 2) return n;
  return finaboncci(n - 1) + finaboncci(n - 2);
}
