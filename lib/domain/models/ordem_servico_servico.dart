import 'dart:convert';

class OrdemServicoServico {
  int? codOrdemServico;
  int? codServico;

  OrdemServicoServico({
    this.codOrdemServico,
    this.codServico,
  });

  OrdemServicoServico copyWith({
    int? codOrdemServico,
    int? codServico,
  }) {
    return OrdemServicoServico(
      codOrdemServico: codOrdemServico ?? this.codOrdemServico,
      codServico: codServico ?? this.codServico,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodOrdemServico': codOrdemServico,
      'CodServico': codServico,
    };
  }

  factory OrdemServicoServico.fromMap(Map<String, dynamic> map) {
    return OrdemServicoServico(
      codOrdemServico: map['CodOrdemServico'] != null ? map['CodOrdemServico'] as int : null,
      codServico: map['CodServico'] != null ? map['CodServico'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdemServicoServico.fromJson(String source) => OrdemServicoServico.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrdemServicoServico(CodOrdemServico: $codOrdemServico, CodServico: $codServico)';
  }

  @override
  bool operator ==(covariant OrdemServicoServico other) {
    if (identical(this, other)) return true;
    return 
      other.codOrdemServico == codOrdemServico &&
      other.codServico == codServico;
  }

  @override
  int get hashCode {
    return codOrdemServico.hashCode ^
      codServico.hashCode;
  }
}
