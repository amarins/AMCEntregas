import 'package:amc_pedidos/pages/PedidosPage.dart';
import 'package:amc_pedidos/pages/PerfilPage.dart';
import 'package:amc_pedidos/pages/Servi%C3%A7osPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [PedidosPage(), ServicosPage(), PerfilPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMC Entregas'),
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_sharp),
              label: "Minhas Entregas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services_sharp), label: "Meus Serviços"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Meu Perfil"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
