import 'dart:convert';

class Salario {
  int? codSalario;
  double? salario;
  String? dataAtribuicao;
  String? cpf;

  Salario({
    this.codSalario,
    this.salario,
    this.dataAtribuicao,
    this.cpf,
  });

  Salario copyWith({
    int? codSalario,
    double? salario,
    String? dataAtribuicao,
    String? cpf,
  }) {
    return Salario(
      codSalario: codSalario ?? this.codSalario,
      salario: salario ?? this.salario,
      dataAtribuicao: dataAtribuicao ?? this.dataAtribuicao,
      cpf: cpf ?? this.cpf,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodSalario': codSalario,
      'Salario': salario,
      'DataAtribuicao': dataAtribuicao,
      'CPF': cpf,
    };
  }

  factory Salario.fromMap(Map<String, dynamic> map) {
    return Salario(
      codSalario: map['CodSalario'] != null ? map['CodSalario'] as int : null,
      salario: map['Salario'] != null ? map['Salario'] as double : null,
      dataAtribuicao: map['DataAtribuicao'] != null ? map['DataAtribuicao'] as String : null,
      cpf: map['CPF'] != null ? map['CPF'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Salario.fromJson(String source) => Salario.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Salario(CodSalario: $codSalario, Salario: $salario, DataAtribuicao: $dataAtribuicao, CPF: $cpf)';
  }

  @override
  bool operator ==(covariant Salario other) {
    if (identical(this, other)) return true;
    return 
      other.codSalario == codSalario &&
      other.salario == salario &&
      other.dataAtribuicao == dataAtribuicao &&
      other.cpf == cpf;
  }

  @override
  int get hashCode {
    return codSalario.hashCode ^
      salario.hashCode ^
      dataAtribuicao.hashCode ^
      cpf.hashCode;
  }
}
