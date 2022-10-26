void main(List<String> arguments) {
  cardValidate('5245 3443 5098 9865');
}

cardValidate(String number) {
  var totalAmount = 0;
  var listNumber = number.replaceAll(' ', '').split('');
  var lastNumber = listNumber[listNumber.length - 1];
  listNumber.removeLast();
  var listOfFinalValues = [];
  print(listNumber);
  var listNumberInt = listNumber.map((e) => int.parse(e)).toList();

  for (var i = 0; i < listNumberInt.length; i++) {
    if (i % 2 == 0) {
      var value = (listNumberInt[i] * 2);
      if (value > 9) {
        var valueSplit = value.toString().split('');
        var valueWithTwoDigits =
            int.parse(valueSplit[0]) + int.parse(valueSplit[1]);
        listOfFinalValues.add(valueWithTwoDigits);
      } else {
        listOfFinalValues.add(value);
      }
    } else {
      var value = (listNumberInt[i] * 1);
      if (value > 9) {
        var valueSplit = value.toString().split('');
        var valueWithTwoDigits =
            int.parse(valueSplit[0]) + int.parse(valueSplit[1]);
        listOfFinalValues.add(valueWithTwoDigits);
      } else {
        listOfFinalValues.add(value);
      }
    }
  }
  print(listOfFinalValues);
  totalAmount = listOfFinalValues.reduce((value, element) => value + element);
  print(totalAmount);
  var result = 10 - (totalAmount % 10);
  var lastNumberInt = int.parse(lastNumber);
  result == lastNumberInt
      ? print('O cartão é valido!')
      : print('O cartão não é valido!');
}
