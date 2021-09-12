import 'package:amc_pedidos/pages/HomePage.dart';
import 'package:amc_pedidos/pages/PedidosPage.dart';
import 'package:amc_pedidos/pages/PerfilPage.dart';
import 'package:amc_pedidos/pages/Servi%C3%A7osPage.dart';
import 'package:amc_pedidos/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMC Controle de Entrega',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        '/Pedidos': (context) => PedidosPage(),
        '/servicos': (context) => ServicosPage(),
        '/Perfil': (context) => PerfilPage(),
      },
      //home: LoginPage(),
    );
  }
}
