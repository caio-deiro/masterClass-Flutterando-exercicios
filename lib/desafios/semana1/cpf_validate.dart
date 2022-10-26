void main(List<String> args) {
  var reponse = firstDigitCpf('823.060.330-80');
  reponse ? print('CPF válido!') : print('CPF inválido!');
}

bool firstDigitCpf(String cpf) {
  List<int> finalListCpf = [];
  List<int> finalListCpf2 = [];
  List<int> lastNumbers = [];

  var count = 10;
  var count2 = 11;
  var onlyNumbersCpf =
      cpf.replaceAll(' ', '').replaceAll('.', '').replaceAll('-', '');
  var listCpf = onlyNumbersCpf.split('');
  var listCpfInt = listCpf.map((e) => int.parse(e)).toList();
  var listCpfInt2 = listCpf.map((e) => int.parse(e)).toList();
  for (var i = 10; i > 8; i--) {
    lastNumbers.addAll([listCpfInt[i]]);
  }
  //! validando primeiro digito
  for (var i = 0; i < 2; i++) {
    listCpfInt.removeLast();
  }

  for (var i = 0; i < listCpfInt.length; i++) {
    var value = (listCpfInt[i] * count);
    finalListCpf.add(value);
    count--;
  }

  var totalAmount = finalListCpf.reduce(
    (value, element) => value + element,
  );
  var firstDigite = false;
  var secondDigite = false;
  var result = (totalAmount % 11);
  if (result < 2) {
    var digito = 0;
    if (digito == lastNumbers[1]) {
      firstDigite = true;
    } else {
      firstDigite = false;
    }
  } else if (result >= 2) {
    var digito = (11 - result);
    if (digito == lastNumbers[1]) {
      firstDigite = true;
    } else {
      firstDigite = false;
    }
  } else {
    firstDigite = false;
  }

  //! validando segundo digito

  listCpfInt2.removeLast();

  for (var i = 0; i < listCpfInt2.length; i++) {
    var value = (listCpfInt2[i] * count2);
    finalListCpf2.add(value);
    count2--;
  }

  var totalAmount2 = finalListCpf2.reduce(
    (value, element) => value + element,
  );

  var result2 = (totalAmount2 % 11);
  if (result2 < 2) {
    var digito = 0;
    if (digito == lastNumbers[0]) {
      secondDigite = true;
    } else {
      secondDigite = false;
    }
  } else if (result2 >= 2) {
    var digito = (11 - result2);
    if (digito == lastNumbers[0]) {
      secondDigite = true;
    } else {
      secondDigite = false;
    }
  } else {
    secondDigite = false;
  }

  //! comparando valores dos 2 digitos e retornando um bool
  if (firstDigite && secondDigite) {
    return true;
  } else {
    return false;
  }
}
