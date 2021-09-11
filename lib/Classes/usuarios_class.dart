class Usuario {
  String id = '';
  String codSistema = '';
  String nome = '';
  String dtInicial = '';
  String dtfinal = '';
  String cargo = '';
  String senha = '';
  String tipoUser = '';

  Usuario(
      {required this.id,
      required this.codSistema,
      required this.nome,
      required this.dtInicial,
      required this.dtfinal,
      required this.cargo,
      required this.senha,
      required this.tipoUser});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codSistema = json['cod_Sistema'];
    nome = json['Nome'];
    dtInicial = json['DtInicial'];
    dtfinal = json['Dtfinal'];
    cargo = json['Cargo'];
    senha = json['Senha'];
    tipoUser = json['Tipo_User'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cod_Sistema'] = this.codSistema;
    data['Nome'] = this.nome;
    data['DtInicial'] = this.dtInicial;
    data['Dtfinal'] = this.dtfinal;
    data['Cargo'] = this.cargo;
    data['Senha'] = this.senha;
    data['Tipo_User'] = this.tipoUser;
    return data;
  }

  @override
  String toString() {
    return 'usuario(id: $id, codSistema: $codSistema, nome: $nome, dtInicial: $dtInicial, dtfinal: $dtfinal, cargo: $cargo, senha: $senha, tipoUser: $tipoUser)';
  }
}
