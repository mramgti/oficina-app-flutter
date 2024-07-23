import 'dart:convert';

class Endereco {
  int? codEndereco;
  String? rua;
  String? numero;
  String? bairro;
  String? cidade;
  String? estado;
  String? cep;

  Endereco({
    this.codEndereco,
    this.rua,
    this.numero,
    this.bairro,
    this.cidade,
    this.estado,
    this.cep,
  });

  Endereco copyWith({
    int? codEndereco,
    String? rua,
    String? numero,
    String? bairro,
    String? cidade,
    String? estado,
    String? cep,
  }) {
    return Endereco(
      codEndereco: codEndereco ?? this.codEndereco,
      rua: rua ?? this.rua,
      numero: numero ?? this.numero,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      estado: estado ?? this.estado,
      cep: cep ?? this.cep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodEndereco': codEndereco,
      'Rua': rua,
      'Numero': numero,
      'Bairro': bairro,
      'Cidade': cidade,
      'Estado': estado,
      'CEP': cep,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      codEndereco: map['CodEndereco'] != null ? map['CodEndereco'] as int : null,
      rua: map['Rua'] != null ? map['Rua'] as String : null,
      numero: map['Numero'] != null ? map['Numero'] as String : null,
      bairro: map['Bairro'] != null ? map['Bairro'] as String : null,
      cidade: map['Cidade'] != null ? map['Cidade'] as String : null,
      estado: map['Estado'] != null ? map['Estado'] as String : null,
      cep: map['CEP'] != null ? map['CEP'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) => Endereco.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Endereco(CodEndereco: $codEndereco, Rua: $rua, Numero: $numero, Bairro: $bairro, Cidade: $cidade, Estado: $estado, CEP: $cep)';
  }

  @override
  bool operator ==(covariant Endereco other) {
    if (identical(this, other)) return true;
    return 
      other.codEndereco == codEndereco &&
      other.rua == rua &&
      other.numero == numero &&
      other.bairro == bairro &&
      other.cidade == cidade &&
      other.estado == estado &&
      other.cep == cep;
  }

  @override
  int get hashCode {
    return codEndereco.hashCode ^
      rua.hashCode ^
      numero.hashCode ^
      bairro.hashCode ^
      cidade.hashCode ^
      estado.hashCode ^
      cep.hashCode;
  }
}
