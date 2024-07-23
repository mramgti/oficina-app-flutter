import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/ordem_servico_veiculos.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class OrdemServicoVeiculosRepository {
  late DatabaseProvider databaseProvider;

  OrdemServicoVeiculosRepository(this.databaseProvider);

  Future<int> insert(OrdemServicoVeiculos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("OrdemServico_Veiculos", entity.toMap());
    } catch (e) {
      print('Erro ao inserir OrdemServicoVeiculos: $e');
      rethrow;
    }
  }

  Future<int> delete(OrdemServicoVeiculos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "OrdemServico_Veiculos",
        where: "CodOrdemServico = ? AND CodVeiculo = ?",
        whereArgs: [entity.codOrdemServico, entity.codVeiculo],
      );
    } catch (e) {
      print('Erro ao deletar OrdemServicoVeiculos: $e');
      rethrow;
    }
  }

  Future<int> update(OrdemServicoVeiculos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "OrdemServico_Veiculos",
        entity.toMap(),
        where: "CodOrdemServico = ? AND CodVeiculo = ?",
        whereArgs: [entity.codOrdemServico, entity.codVeiculo],
      );
    } catch (e) {
      print('Erro ao atualizar OrdemServicoVeiculos: $e');
      rethrow;
    }
  }

  Future<OrdemServicoVeiculos?> findById(int codOrdemServico, int codVeiculo) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "OrdemServico_Veiculos",
        where: "CodOrdemServico = ? AND CodVeiculo = ?",
        whereArgs: [codOrdemServico, codVeiculo],
      );

      if (result.isNotEmpty) {
        return OrdemServicoVeiculos.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar OrdemServicoVeiculos pelo CodOrdemServico e CodVeiculo: $e');
      rethrow;
    }
  }

  Future<List<OrdemServicoVeiculos>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("OrdemServico_Veiculos");

      return result.map((item) => OrdemServicoVeiculos.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os OrdemServicoVeiculos: $e');
      rethrow;
    }
  }
}
