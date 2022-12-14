import 'dart:convert';

void main(List<String> args) {
  var response = '';
  var dot = DotEnv();
  response = dot.readEnv('JWT_ACCESS_TOKEN_EXPIRESIN');
  print(response);
}

//TODO : FALTA APENAS O REGEXP PARA O PROGRAMA FICAR 100%

class DotEnv {
  var mapEnv = {};
  var line = LineSplitter();
  List<String> values = [];
  List<String> keys = [];
  var docEnv = """
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/fteam?schema=public"
SWAGGER=true
JWT_ACCESS_TOKEN_EXPIRESIN=1800 # 30 min
JWT_REFRESH_TOKEN_EXPIRESIN=259200 # 3 days
""";
  String readEnv(String key) {
    var response = '';
    List<String> list = [];
    var envSplit = line.convert(docEnv);
    for (var i = 0; i < envSplit.length; i++) {
      list.addAll(envSplit[i].split('='));

      keys.add(list[0]);

      values.add(list[1]);
      mapEnv.putIfAbsent(keys[i], () => values[i]);
      list.clear();
    }

    mapEnv.forEach((mapKey, value) {
      if (mapKey.toString() == key) {
        response = value.toString();
      }
    });
    return response;
  }
}
