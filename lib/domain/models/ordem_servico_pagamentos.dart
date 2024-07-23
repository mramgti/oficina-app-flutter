import 'dart:convert';

class OrdemServicoPagamentos {
  int? codOrdemServico;
  int? codTipoPagamento;
  double? valorPago;

  OrdemServicoPagamentos({
    this.codOrdemServico,
    this.codTipoPagamento,
    this.valorPago,
  });

  OrdemServicoPagamentos copyWith({
    int? codOrdemServico,
    int? codTipoPagamento,
    double? valorPago,
  }) {
    return OrdemServicoPagamentos(
      codOrdemServico: codOrdemServico ?? this.codOrdemServico,
      codTipoPagamento: codTipoPagamento ?? this.codTipoPagamento,
      valorPago: valorPago ?? this.valorPago,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodOrdemServico': codOrdemServico,
      'CodTipoPagamento': codTipoPagamento,
      'ValorPago': valorPago,
    };
  }

  factory OrdemServicoPagamentos.fromMap(Map<String, dynamic> map) {
    return OrdemServicoPagamentos(
      codOrdemServico: map['CodOrdemServico'] != null ? map['CodOrdemServico'] as int : null,
      codTipoPagamento: map['CodTipoPagamento'] != null ? map['CodTipoPagamento'] as int : null,
      valorPago: map['ValorPago'] != null ? map['ValorPago'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemServicoPagamentos.fromJson(String source) => OrdemServicoPagamentos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdemServicoPagamentos(CodOrdemServico: $codOrdemServico, CodTipoPagamento: $codTipoPagamento, ValorPago: $valorPago)';
  }

  @override
  bool operator ==(covariant OrdemServicoPagamentos other) {
    if (identical(this, other)) return true;
    return 
      other.codOrdemServico == codOrdemServico &&
      other.codTipoPagamento == codTipoPagamento &&
      other.valorPago == valorPago;
  }

  @override
  int get hashCode {
    return codOrdemServico.hashCode ^
      codTipoPagamento.hashCode ^
      valorPago.hashCode;
  }
}
