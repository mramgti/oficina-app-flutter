import 'dart:convert';

class TipoPagamento {
  int? codTipoPagamento;
  String? descricao;

  TipoPagamento({
    this.codTipoPagamento,
    this.descricao,
  });

  TipoPagamento copyWith({
    int? codTipoPagamento,
    String? descricao,
  }) {
    return TipoPagamento(
      codTipoPagamento: codTipoPagamento ?? this.codTipoPagamento,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodTipoPagamento': codTipoPagamento,
      'Descricao': descricao,
    };
  }

  factory TipoPagamento.fromMap(Map<String, dynamic> map) {
    return TipoPagamento(
      codTipoPagamento: map['CodTipoPagamento'] != null ? map['CodTipoPagamento'] as int : null,
      descricao: map['Descricao'] != null ? map['Descricao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoPagamento.fromJson(String source) => TipoPagamento.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TipoPagamento(CodTipoPagamento: $codTipoPagamento, Descricao: $descricao)';
  }

  @override
  bool operator ==(covariant TipoPagamento other) {
    if (identical(this, other)) return true;
    return 
      other.codTipoPagamento == codTipoPagamento &&
      other.descricao == descricao;
  }

  @override
  int get hashCode {
    return codTipoPagamento.hashCode ^
      descricao.hashCode;
  }
}
