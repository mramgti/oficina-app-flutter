// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Veiculos {
  String? placa;
  String? marca;
  String? modelo;
  String? cor;
  String? ano;
  Veiculos({
    this.placa,
    this.marca,
    this.modelo,
    this.cor,
    this.ano,
  });


  Veiculos copyWith({
    String? placa,
    String? marca,
    String? modelo,
    String? cor,
    String? ano,
  }) {
    return Veiculos(
      placa: placa ?? this.placa,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      cor: cor ?? this.cor,
      ano: ano ?? this.ano,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Placa': placa,
      'Marca': marca,
      'modelo': modelo,
      'Cor': cor,
      'Ano': ano,
    };
  }

  factory Veiculos.fromMap(Map<String, dynamic> map) {
    return Veiculos(
      placa: map['Placa'] != null ? map['Placa'] as String : null,
      marca: map['Marca'] != null ? map['Marca'] as String : null,
      modelo: map['Modelo'] != null ? map['Modelo'] as String : null,
      cor: map['Cor'] != null ? map['Cor'] as String : null,
      ano: map['Ano'] != null ? map['Ano'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Veiculos.fromJson(String source) => Veiculos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Veiculos(Placa: $placa, Marca: $marca, Modelo: $modelo, Cor: $cor, Ano: $ano)';
  }

  @override
  bool operator ==(covariant Veiculos other) {
    if (identical(this, other)) return true;
  
    return 
      other.placa == placa &&
      other.marca == marca &&
      other.modelo == modelo &&
      other.cor == cor &&
      other.ano == ano;
  }

  @override
  int get hashCode {
    return placa.hashCode ^
      marca.hashCode ^
      modelo.hashCode ^
      cor.hashCode ^
      ano.hashCode;
  }
}
