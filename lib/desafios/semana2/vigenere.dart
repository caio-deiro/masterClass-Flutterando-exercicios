import 'dart:math';

void main(List<String> args) {
  var vigenere = Vigenere('rosas');
  print('gerando a key... ${vigenere.generateKey()}');
  print('codificando o texto... ${vigenere.encodeText()}');
  print('decodificando o texto... ${vigenere.decodeText()}');
}

class Vigenere {
  final String userInput;

  Vigenere(this.userInput);

  var keyList = [];
  String encodeResult = '';
  String decodeResult = '';
  var characters = 'abcdefghijklmnopkrstuvxwyz'.toUpperCase().split('');

  //* Gera uma key a partir da mensagem dada
  String generateKey() {
    for (var i = 0; i < userInput.length; i++) {
      var random = Random().nextInt(characters.length);
      keyList.add(characters[random].toUpperCase());
    }
    return keyList.join('');
  }

  //* Codifica a mensagem
  encodeText() {
    var userInputList = userInput.toUpperCase().split('');
    var encodeList = [];
    for (var i = 0; i < userInputList.length; i++) {
      encodeList.add(
          (characters.indexWhere((element) => element == userInputList[i]) +
                  characters.indexWhere((element) => element == keyList[i])) %
              characters.length);
    }
    encodeResult = List.generate(encodeList.length,
            (index) => characters.elementAt(encodeList[index]))
        .join()
        .toUpperCase();
    return encodeResult;
  }

  //* Decodifica a mensagem
  decodeText() {
    var decodeList = [];
    for (var i = 0; i < encodeResult.length; i++) {
      decodeList.add(((characters
                      .indexWhere((element) => element == encodeResult[i]) -
                  characters.indexWhere((element) => element == keyList[i])) +
              characters.length) %
          characters.length);
    }
    decodeResult = List.generate(
            decodeList.length, (index) => characters[decodeList[index]])
        .join()
        .toUpperCase();
    return decodeResult;
  }
}
