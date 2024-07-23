import 'dart:convert';

class OrdemServicoEstoquePecas {
  int? codOrdemServico;
  int? codEstoquePecas;
  int? quantidade;

  OrdemServicoEstoquePecas({
    this.codOrdemServico,
    this.codEstoquePecas,
    this.quantidade,
  });

  OrdemServicoEstoquePecas copyWith({
    int? codOrdemServico,
    int? codEstoquePecas,
    int? quantidade,
  }) {
    return OrdemServicoEstoquePecas(
      codOrdemServico: codOrdemServico ?? this.codOrdemServico,
      codEstoquePecas: codEstoquePecas ?? this.codEstoquePecas,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodOrdemServico': codOrdemServico,
      'CodEstoquePecas': codEstoquePecas,
      'Quantidade': quantidade,
    };
  }

  factory OrdemServicoEstoquePecas.fromMap(Map<String, dynamic> map) {
    return OrdemServicoEstoquePecas(
      codOrdemServico: map['CodOrdemServico'] != null ? map['CodOrdemServico'] as int : null,
      codEstoquePecas: map['CodEstoquePecas'] != null ? map['CodEstoquePecas'] as int : null,
      quantidade: map['Quantidade'] != null ? map['Quantidade'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemServicoEstoquePecas.fromJson(String source) => OrdemServicoEstoquePecas.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdemServicoEstoquePecas(CodOrdemServico: $codOrdemServico, CodEstoquePecas: $codEstoquePecas, Quantidade: $quantidade)';
  }

  @override
  bool operator ==(covariant OrdemServicoEstoquePecas other) {
    if (identical(this, other)) return true;
    return 
      other.codOrdemServico == codOrdemServico &&
      other.codEstoquePecas == codEstoquePecas &&
      other.quantidade == quantidade;
  }

  @override
  int get hashCode {
    return codOrdemServico.hashCode ^
      codEstoquePecas.hashCode ^
      quantidade.hashCode;
  }
}
