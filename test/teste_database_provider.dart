import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/funcionarios.dart';
import 'package:flutter_oficina_app/domain/repositories/funcionarios_repository.dart';
import 'package:flutter_oficina_app/domain/models/veiculos.dart';
import 'package:flutter_oficina_app/domain/repositories/veiculos_repository.dart';


void main() async{
  DatabaseProvider databaseProvider = DatabaseProvider();
  await databaseProvider.open();

  // Criando a instância do Repositório Funcionários
  FuncionariosRepository funcionariosRepository = FuncionariosRepository(databaseProvider);
  
  Funcionarios funcionarios = Funcionarios();
  funcionarios.nome = "João Bandeira";
  funcionarios.cpf = "12345678900";
  funcionarios.dataContratacao = "2001-07-20 00:00:00";
  funcionarios.dataDemissao = "2006-09-21 00:00:00";
  funcionarios.dataNascimento = "1984-02-19 00:00:00";
  funcionarios.cargo = "Gerente";

  funcionariosRepository.insert(funcionarios);


  // Criando a instância do Repositório Veículos
  VeiculosRepository veiculosRepository = VeiculosRepository(databaseProvider);
  
  Veiculos veiculos = Veiculos();
  veiculos.placa = "OGH 8765";
  veiculos.marca = "GM-Chevrolet";
  veiculos.modelo = "Onix 14 MPFI LTZ 8v";
  veiculos.cor = "branco";
  veiculos.ano = "2014";

  veiculosRepository.insert(veiculos);


  // funcionarios = await funcionariosRepository.findById(1);
  // print(funcionarios);
  
}