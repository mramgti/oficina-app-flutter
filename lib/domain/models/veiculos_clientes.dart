import 'dart:convert';

class VeiculosClientes {
  int? codVeiculo;
  String? cpfCliente;

  VeiculosClientes({
    this.codVeiculo,
    this.cpfCliente,
  });

  VeiculosClientes copyWith({
    int? codVeiculo,
    String? cpfCliente,
  }) {
    return VeiculosClientes(
      codVeiculo: codVeiculo ?? this.codVeiculo,
      cpfCliente: cpfCliente ?? this.cpfCliente,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodVeiculo': codVeiculo,
      'CPFCliente': cpfCliente,
    };
  }

  factory VeiculosClientes.fromMap(Map<String, dynamic> map) {
    return VeiculosClientes(
      codVeiculo: map['CodVeiculo'] != null ? map['CodVeiculo'] as int : null,
      cpfCliente: map['CPFCliente'] != null ? map['CPFCliente'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VeiculosClientes.fromJson(String source) => VeiculosClientes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VeiculosClientes(CodVeiculo: $codVeiculo, CPFCliente: $cpfCliente)';
  }

  @override
  bool operator ==(covariant VeiculosClientes other) {
    if (identical(this, other)) return true;
    return 
      other.codVeiculo == codVeiculo &&
      other.cpfCliente == cpfCliente;
  }

  @override
  int get hashCode {
    return codVeiculo.hashCode ^
      cpfCliente.hashCode;
  }
}