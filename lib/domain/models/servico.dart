import 'dart:convert';

class Servico {
  int? codServico;
  String? descricao;
  double? preco;

  Servico({
    this.codServico,
    this.descricao,
    this.preco,
  });

  Servico copyWith({
    int? codServico,
    String? descricao,
    double? preco,
  }) {
    return Servico(
      codServico: codServico ?? this.codServico,
      descricao: descricao ?? this.descricao,
      preco: preco ?? this.preco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodServico': codServico,
      'Descricao': descricao,
      'Preco': preco,
    };
  }

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      codServico: map['CodServico'] != null ? map['CodServico'] as int : null,
      descricao: map['Descricao'] != null ? map['Descricao'] as String : null,
      preco: map['Preco'] != null ? map['Preco'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Servico.fromJson(String source) => Servico.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Servico(CodServico: $codServico, Descricao: $descricao, Preco: $preco)';
  }

  @override
  bool operator ==(covariant Servico other) {
    if (identical(this, other)) return true;
    return 
      other.codServico == codServico &&
      other.descricao == descricao &&
      other.preco == preco;
  }

  @override
  int get hashCode {
    return codServico.hashCode ^
      descricao.hashCode ^
      preco.hashCode;
  }
}
