import 'dart:convert';

import 'package:http/http.dart' as http;

class PedidosService {
  static Future<bool> pedidos(String numero) async {
    //  var url =
    //     Uri.parse('https://app.omie.com.br/api/v1/produtos/pedidoetapas/');

    Map<String, dynamic> param = {
      "call": "ListarEtapasPedido",
      "app_key": "1638081361917",
      "app_secret": "55c34c03f7437cd56d7b98e96f180e41",
      "param": [
        {"cCodIntPed": "233", "nPagina": 1, "nRegPorPagina": 20}
      ]
    };

    print("Parametros antes: $param");

    var body = json.encode(param);

    print("Parametros depois: $body");

    //  var response = await http.post(url,
    //      headers: <String, String>{
    //        'Content-Type': 'application/json ; charset=UTF-8'
    //      },
    //      body: body);
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8'
    };

    var response = await http.post(
        Uri.parse('https://app.omie.com.br/api/v1/produtos/pedidoetapas/'),
        headers: header,
        body: body);

    print('Response : ${response.headers}');

    print('Response status: ${response.statusCode}');

    print('Response body: ${response.body}');

    return true;
  }
}
