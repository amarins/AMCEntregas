import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:amc_pedidos/Classes/usuarios_class.dart';

class LoginService {
  static get nome => null;

  static Future<Usuario> login(String Email, String senha) async {
    var usuario;

    var url = Uri.parse(
        'https://higienic.com.br/higienic_api/usuarios/login.php?Usuario=$Email&Senha=$senha');

    //var header = {"Content-Type": "application/json"};

    // Map params = {
    //   "call": "ListarEtapasPedido",
    //   "app_key": "1638081361917",
    //   "app_secret": "55c34c03f7437cd56d7b98e96f180e41",
    //   "param": [
    //     {"cCodIntPed": "233"}
    //   ]
    // };

    // var _body = json.encode(params);
    //  print("Header: $header");
    //  print("Json enviado: $_body");

    var response = await http.post(url);

    var ret = response.statusCode;
    var resultado = response.body;
    print("Retorno code: $ret");
    print("Retorno Body: $resultado");

    Map<String, dynamic> result = jsonDecode(response.body)[0];

    if (response.statusCode == 200) {
      usuario = Usuario.fromJson(result);
      print("Retorno : $usuario");
    } else {
      usuario = null;
    }
    return usuario;
  }
}
