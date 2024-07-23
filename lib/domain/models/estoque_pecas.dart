import 'dart:convert';

class EstoquePecas {
  int? codPeca;
  String? descricao;
  int? quantidade;
  double? preco;

  EstoquePecas({
    this.codPeca,
    this.descricao,
    this.quantidade,
    this.preco,
  });

  EstoquePecas copyWith({
    int? codPeca,
    String? descricao,
    int? quantidade,
    double? preco,
  }) {
    return EstoquePecas(
      codPeca: codPeca ?? this.codPeca,
      descricao: descricao ?? this.descricao,
      quantidade: quantidade ?? this.quantidade,
      preco: preco ?? this.preco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodPeca': codPeca,
      'Descricao': descricao,
      'Quantidade': quantidade,
      'Preco': preco,
    };
  }

  factory EstoquePecas.fromMap(Map<String, dynamic> map) {
    return EstoquePecas(
      codPeca: map['CodPeca'] != null ? map['CodPeca'] as int : null,
      descricao: map['Descricao'] != null ? map['Descricao'] as String : null,
      quantidade: map['Quantidade'] != null ? map['Quantidade'] as int : null,
      preco: map['Preco'] != null ? map['Preco'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EstoquePecas.fromJson(String source) => EstoquePecas.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EstoquePecas(CodPeca: $codPeca, Descricao: $descricao, Quantidade: $quantidade, Preco: $preco)';
  }

  @override
  bool operator ==(covariant EstoquePecas other) {
    if (identical(this, other)) return true;
    return 
      other.codPeca == codPeca &&
      other.descricao == descricao &&
      other.quantidade == quantidade &&
      other.preco == preco;
  }

  @override
  int get hashCode {
    return codPeca.hashCode ^
      descricao.hashCode ^
      quantidade.hashCode ^
      preco.hashCode;
  }
}
