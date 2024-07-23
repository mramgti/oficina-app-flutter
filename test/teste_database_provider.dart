import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/funcionarios.dart';
import 'package:flutter_oficina_app/domain/repositories/funcionarios_repository.dart';
import 'package:flutter_oficina_app/domain/models/veiculos.dart';
import 'package:flutter_oficina_app/domain/repositories/veiculos_repository.dart';

void main() async {
  // Inicializa o provedor de banco de dados
  DatabaseProvider databaseProvider = DatabaseProvider();
  await databaseProvider.open();

  // Cria a instância do repositório Funcionários
  FuncionariosRepository funcionariosRepository = FuncionariosRepository(databaseProvider);

  // Cria a instância do repositório Veículos
  VeiculosRepository veiculosRepository = VeiculosRepository(databaseProvider);

  // Inserir Funcionário
  Funcionarios funcionario = Funcionarios(
    cpf: "12345678900",
    nome: "João Bandeira",
    dataContratacao: "2001-07-20",
    dataDemissao: "2006-09-21",
    dataNascimento: "1984-02-19",
    cargo: "Gerente"
  );
  await funcionariosRepository.update(funcionario);
  print("Funcionário inserido: $funcionario");

  // Inserir Veículo
  Veiculos veiculo = Veiculos(
    placa: "OGH 8765",
    marca: "GM-Chevrolet",
    modelo: "Onix 14 MPFI LTZ 8v",
    cor: "branco",
    ano: 2014
  );
  await veiculosRepository.update(veiculo);
  print("Veículo inserido: $veiculo");

  // Testar Find By ID para Funcionário
  Funcionarios? foundFuncionario = await funcionariosRepository.findById("12345678900");
  print("Funcionário encontrado: $foundFuncionario");

  // Testar Find All para Funcionários
  List<Funcionarios> allFuncionarios = await funcionariosRepository.findAll();
  print("Todos os funcionários: $allFuncionarios");

  // Atualizar Funcionário
  funcionario.nome = "João Atualizado";
  await funcionariosRepository.update(funcionario);
  print("Funcionário atualizado: $funcionario");

  // Atualizar Veículo
  veiculo.marca = "GM-Chevrolet Atualizado";
  await veiculosRepository.update(veiculo);
  print("Veículo atualizado: $veiculo");

  // Testar Find By ID para Veículo
  Veiculos? foundVeiculo = await veiculosRepository.findById("OGH 8765");
  print("Veículo encontrado: $foundVeiculo");

  // Testar Find All para Veículos
  List<Veiculos> allVeiculos = await veiculosRepository.findAll();
  print("Todos os veículos: $allVeiculos");

  // Excluir Funcionário
  await funcionariosRepository.delete(funcionario);
  print("Funcionário excluído: $funcionario");

  // Excluir Veículo
  await veiculosRepository.delete(veiculo);
  print("Veículo excluído: $veiculo");

  // Fechar o banco de dados
  await databaseProvider.database.close();
}
