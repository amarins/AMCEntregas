import 'package:amc_pedidos/Services/LoginServices.dart';
import 'package:amc_pedidos/pages/HomePage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final _ctrlLogin = TextEditingController();
  final _ctrlSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AMC Entregas e Servicos",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            _textFormField("Login", "Digite Seu Email",
                controller: _ctrlLogin, validator: _validaLogin),
            _textFormField("Senha", "Digite Sua Senha",
                senha: true, controller: _ctrlSenha, validator: validaSenha),
            _raisedButton("Login", Colors.blueAccent, context),
          ],
        ),
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool senha = false,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
        controller: controller,
        validator: validator,
        obscureText: senha,
        decoration: InputDecoration(labelText: label, hintText: hint));
  }

  String? _validaLogin(text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String? validaSenha(text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  _raisedButton(String texto, Color cor, BuildContext context) {
    return RaisedButton(
        color: cor,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickButton(context);
        });
  }

  Future<void> _onClickButton(BuildContext context) async {
    bool formOK = _formKey.currentState!.validate();

    if (!formOK) {
      return;
    }

    String Email = _ctrlLogin.text;
    String senha = _ctrlSenha.text;

    //   print("Login: $Email , Senha: $senha ");

    // ignore: unused_local_variable
    var usuario = LoginService.login(Email, senha);

    if (usuario != null) {
      // print("Login Sucesso");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    }

    _AbreHomepage(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }

    if (Email.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Erro"),
              content: Text("Login e/ou Senha inválido(s)"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    }
  }
}
