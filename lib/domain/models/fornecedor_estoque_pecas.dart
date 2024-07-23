import 'dart:convert';

class FornecedorEstoquePecas {
  int? codFornecedor;
  int? codEstoquePecas;
  int? quantidade;

  FornecedorEstoquePecas({
    this.codFornecedor,
    this.codEstoquePecas,
    this.quantidade,
  });

  FornecedorEstoquePecas copyWith({
    int? codFornecedor,
    int? codEstoquePecas,
    int? quantidade,
  }) {
    return FornecedorEstoquePecas(
      codFornecedor: codFornecedor ?? this.codFornecedor,
      codEstoquePecas: codEstoquePecas ?? this.codEstoquePecas,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodFornecedor': codFornecedor,
      'CodEstoquePecas': codEstoquePecas,
      'Quantidade': quantidade,
    };
  }

  factory FornecedorEstoquePecas.fromMap(Map<String, dynamic> map) {
    return FornecedorEstoquePecas(
      codFornecedor: map['CodFornecedor'] != null ? map['CodFornecedor'] as int : null,
      codEstoquePecas: map['CodEstoquePecas'] != null ? map['CodEstoquePecas'] as int : null,
      quantidade: map['Quantidade'] != null ? map['Quantidade'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FornecedorEstoquePecas.fromJson(String source) => FornecedorEstoquePecas.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FornecedorEstoquePecas(CodFornecedor: $codFornecedor, CodEstoquePecas: $codEstoquePecas, Quantidade: $quantidade)';
  }

  @override
  bool operator ==(covariant FornecedorEstoquePecas other) {
    if (identical(this, other)) return true;
    return 
      other.codFornecedor == codFornecedor &&
      other.codEstoquePecas == codEstoquePecas &&
      other.quantidade == quantidade;
  }

  @override
  int get hashCode {
    return codFornecedor.hashCode ^
      codEstoquePecas.hashCode ^
      quantidade.hashCode;
  }
}
