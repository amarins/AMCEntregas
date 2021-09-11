import 'package:amc_pedidos/Services/PedidosServices.dart';
import 'package:flutter/material.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  static const String _title = 'AMC Entregas';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //  appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: buildListview(),
      ),
    );
  }

  buildListview() {
    var response = PedidosService.pedidos("233");
    final itens = List<String>.generate(10, (i) => "Pedido n°: $i");

    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.home),
          title: Text('${itens[index]}'),
          subtitle: Text("cliente: SB Montenegro"),
          trailing: Icon(Icons.check_circle),
          onTap: () {
            debugPrint('${itens[index]} Selecionado');
          },
        );
      },
    );
  }
}
