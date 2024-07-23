import 'dart:convert';

class Fornecedor {
  int? codFornecedor;
  String? nome;
  String? contato;
  String? endereco;

  Fornecedor({
    this.codFornecedor,
    this.nome,
    this.contato,
    this.endereco,
  });

  Fornecedor copyWith({
    int? codFornecedor,
    String? nome,
    String? contato,
    String? endereco,
  }) {
    return Fornecedor(
      codFornecedor: codFornecedor ?? this.codFornecedor,
      nome: nome ?? this.nome,
      contato: contato ?? this.contato,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CodFornecedor': codFornecedor,
      'Nome': nome,
      'Contato': contato,
      'Endereco': endereco,
    };
  }

  factory Fornecedor.fromMap(Map<String, dynamic> map) {
    return Fornecedor(
      codFornecedor: map['CodFornecedor'] != null ? map['CodFornecedor'] as int : null,
      nome: map['Nome'] != null ? map['Nome'] as String : null,
      contato: map['Contato'] != null ? map['Contato'] as String : null,
      endereco: map['Endereco'] != null ? map['Endereco'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fornecedor.fromJson(String source) => Fornecedor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fornecedor(CodFornecedor: $codFornecedor, Nome: $nome, Contato: $contato, Endereco: $endereco)';
  }

  @override
  bool operator ==(covariant Fornecedor other) {
    if (identical(this, other)) return true;
    return 
      other.codFornecedor == codFornecedor &&
      other.nome == nome &&
      other.contato == contato &&
      other.endereco == endereco;
  }

  @override
  int get hashCode {
    return codFornecedor.hashCode ^
      nome.hashCode ^
      contato.hashCode ^
      endereco.hashCode;
  }
}
