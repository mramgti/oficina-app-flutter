import 'dart:convert';

class Clientes {
  String? cpf;
  String? nome;
  String? email;
  String? dataNascimento;
  String? dataCadastro;
  String? codOrdemServico;

  Clientes({
    this.cpf,
    this.nome,
    this.email,
    this.dataNascimento,
    this.dataCadastro,
    this.codOrdemServico,
  });

  Clientes copyWith({
    String? cpf,
    String? nome,
    String? email,
    String? dataNascimento,
    String? dataCadastro,
    String? codOrdemServico,
  }) {
    return Clientes(
      cpf: cpf ?? this.cpf,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      dataCadastro: dataCadastro ?? this.dataCadastro,
      codOrdemServico: codOrdemServico ?? this.codOrdemServico,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CPF': cpf,
      'Nome': nome,
      'Email': email,
      'DataNascimento': dataNascimento,
      'DataCadastro': dataCadastro,
      'CodOrdemServico': codOrdemServico,
    };
  }

  factory Clientes.fromMap(Map<String, dynamic> map) {
    return Clientes(
      cpf: map['CPF'] != null ? map['CPF'] as String : null,
      nome: map['Nome'] != null ? map['Nome'] as String : null,
      email: map['Email'] != null ? map['Email'] as String : null,
      dataNascimento: map['DataNascimento'] != null ? map['DataNascimento'] as String : null,
      dataCadastro: map['DataCadastro'] != null ? map['DataCadastro'] as String : null,
      codOrdemServico: map['CodOrdemServico'] != null ? map['CodOrdemServico'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clientes.fromJson(String source) => Clientes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Clientes(CPF: $cpf, Nome: $nome, Email: $email, DataNascimento: $dataNascimento, DataCadastro: $dataCadastro, CodOrdemServico: $codOrdemServico)';
  }

  @override
  bool operator ==(covariant Clientes other) {
    if (identical(this, other)) return true;
    return 
      other.cpf == cpf &&
      other.nome == nome &&
      other.email == email &&
      other.dataNascimento == dataNascimento &&
      other.dataCadastro == dataCadastro &&
      other.codOrdemServico == codOrdemServico;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
      nome.hashCode ^
      email.hashCode ^
      dataNascimento.hashCode ^
      dataCadastro.hashCode ^
      codOrdemServico.hashCode;
  }
}
