import 'dart:convert';

class Telefone {
  String? cpf;
  String? ddd;
  String? numero;

  Telefone({
    this.cpf,
    this.ddd,
    this.numero,
  });

  Telefone copyWith({
    String? cpf,
    String? ddd,
    String? numero,
  }) {
    return Telefone(
      cpf: cpf ?? this.cpf,
      ddd: ddd ?? this.ddd,
      numero: numero ?? this.numero,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CPF': cpf,
      'DDD': ddd,
      'Numero': numero,
    };
  }

  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      cpf: map['CPF'] != null ? map['CPF'] as String : null,
      ddd: map['DDD'] != null ? map['DDD'] as String : null,
      numero: map['Numero'] != null ? map['Numero'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Telefone.fromJson(String source) => Telefone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Telefone(CPF: $cpf, DDD: $ddd, Numero: $numero)';
  }

  @override
  bool operator ==(covariant Telefone other) {
    if (identical(this, other)) return true;
    return 
      other.cpf == cpf &&
      other.ddd == ddd &&
      other.numero == numero;
  }

  @override
  int get hashCode {
    return cpf.hashCode ^
      ddd.hashCode ^
      numero.hashCode;
  }
}
