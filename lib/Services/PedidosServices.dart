import 'dart:convert';

import 'package:http/http.dart' as http;

class PedidosService {
  static Future<bool> pedidos(String numero) async {
    var url =
        Uri.parse('https://app.omie.com.br/api/v1/produtos/pedidoetapas/');

    Map data = {
      'param': {'cCodIntPed': numero},
      'call': 'ListarEtapasPedido',
      "app_key": "1638081361917",
      "app_secret": "55c34c03f7437cd56d7b98e96f180e41"
    };

    var body = json.encode(data);

    var response = await http.post(
      url,
      body: body,
      headers: {"Content-Type": "application/json"},
    );

    print('Response : ${response.headers}');

    print('Response status: ${response.statusCode}');

    print('Response body: ${response.body}');

    return true;
  }
}
