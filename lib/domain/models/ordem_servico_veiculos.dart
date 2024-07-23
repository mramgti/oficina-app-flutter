import 'dart:convert';

class OrdemServicoVeiculos {
  int? codOrdemServico;
  int? codVeiculo;

  OrdemServicoVeiculos({
    this.codOrdemServico,
    this.codVeiculo,
  });

  OrdemServicoVeiculos copyWith({
    int? codOrdemServico,
    int? codVeiculo,
  }) {
    return OrdemServicoVeiculos(
      codOrdemServico: codOrdemServico ?? this.codOrdemServico,
      codVeiculo: codVeiculo ?? this.codVeiculo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodOrdemServico': codOrdemServico,
      'CodVeiculo': codVeiculo,
    };
  }

  factory OrdemServicoVeiculos.fromMap(Map<String, dynamic> map) {
    return OrdemServicoVeiculos(
      codOrdemServico: map['CodOrdemServico'] != null ? map['CodOrdemServico'] as int : null,
      codVeiculo: map['CodVeiculo'] != null ? map['CodVeiculo'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemServicoVeiculos.fromJson(String source) => OrdemServicoVeiculos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdemServicoVeiculos(CodOrdemServico: $codOrdemServico, CodVeiculo: $codVeiculo)';
  }

  @override
  bool operator ==(covariant OrdemServicoVeiculos other) {
    if (identical(this, other)) return true;
    return 
      other.codOrdemServico == codOrdemServico &&
      other.codVeiculo == codVeiculo;
  }

  @override
  int get hashCode {
    return codOrdemServico.hashCode ^
      codVeiculo.hashCode;
  }
}
