// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Funcionarios {

  String? cpf;
  String? nome;
  String? dataContratacao;
  String? dataDemissao;
  String? dataNascimento;
  String? cargo;
  Funcionarios({
    this.cpf,
    this.nome,
    this.dataContratacao,
    this.dataDemissao,
    this.dataNascimento,
    this.cargo,
  });

  Funcionarios copyWith({
    String? cpf,
    String? nome,
    String? dataContratacao,
    String? dataDemissao,
    String? dataNascimento,
    String? cargo,
  }) {
    return Funcionarios(
      cpf: cpf ?? this.cpf,
      nome: nome ?? this.nome,
      dataContratacao: dataContratacao ?? this.dataContratacao,
      dataDemissao: dataDemissao ?? this.dataDemissao,
      dataNascimento: dataNascimento ?? this.dataNascimento,
      cargo: cargo ?? this.cargo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CPF': cpf,
      'Nome': nome,
      'DataContratacao': dataContratacao,
      'DataDemissao': dataDemissao,
      'DataNascimento': dataNascimento,
      'Cargo': cargo,
    };
  }

  factory Funcionarios.fromMap(Map<String, dynamic> map) {
    return Funcionarios(
      cpf: map['CPF'] != null ? map['CPF'] as String : null,
      nome: map['Nome'] != null ? map['Nome'] as String : null,
      dataContratacao: map['DataContratacao'] != null ? map['DataContratacao'] as String : null,
      dataDemissao: map['DataDemissao'] != null ? map['DataDemissao'] as String : null,
      dataNascimento: map['DataNascimento'] != null ? map['DataNascimento'] as String : null,
      cargo: map['Cargo'] != null ? map['Cargo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Funcionarios.fromJson(String source) => Funcionarios.fromMap(json.decode(source) as Map<String, dynamic>);
  

  @override
  String toString() {
    return 'Funcionarios(CPF: $cpf, Nome: $nome, DataContratacao: $dataContratacao, DataDemissao: $dataDemissao, DataNascimento: $dataNascimento, Cargo: $cargo)';
  }

  @override
  bool operator ==(covariant Funcionarios other) {
    if (identical(this, other)) return true;
  
    return 
      other.cpf == cpf &&
      other.nome == nome &&
      other.dataContratacao == dataContratacao &&
      other.dataDemissao == dataDemissao &&
      other.dataNascimento == dataNascimento &&
      other.cargo == cargo;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
      nome.hashCode ^
      dataContratacao.hashCode ^
      dataDemissao.hashCode ^
      dataNascimento.hashCode ^
      cargo.hashCode;
  }
}

