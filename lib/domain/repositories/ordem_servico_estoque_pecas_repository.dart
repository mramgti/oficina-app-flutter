import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/ordem_servico_estoque_pecas.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class OrdemServicoEstoquePecasRepository {
  late DatabaseProvider databaseProvider;

  OrdemServicoEstoquePecasRepository(this.databaseProvider);

  Future<int> insert(OrdemServicoEstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("OrdemServico_EstoquePecas", entity.toMap());
    } catch (e) {
      print('Erro ao inserir OrdemServicoEstoquePecas: $e');
      rethrow;
    }
  }

  Future<int> delete(OrdemServicoEstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "OrdemServico_EstoquePecas",
        where: "CodOrdemServico = ? AND CodEstoquePecas = ?",
        whereArgs: [entity.codOrdemServico, entity.codEstoquePecas],
      );
    } catch (e) {
      print('Erro ao deletar OrdemServicoEstoquePecas: $e');
      rethrow;
    }
  }

  Future<int> update(OrdemServicoEstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "OrdemServico_EstoquePecas",
        entity.toMap(),
        where: "CodOrdemServico = ? AND CodEstoquePecas = ?",
        whereArgs: [entity.codOrdemServico, entity.codEstoquePecas],
      );
    } catch (e) {
      print('Erro ao atualizar OrdemServicoEstoquePecas: $e');
      rethrow;
    }
  }

  Future<OrdemServicoEstoquePecas?> findById(int codOrdemServico, int codEstoquePecas) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "OrdemServico_EstoquePecas",
        where: "CodOrdemServico = ? AND CodEstoquePecas = ?",
        whereArgs: [codOrdemServico, codEstoquePecas],
      );

      if (result.isNotEmpty) {
        return OrdemServicoEstoquePecas.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar OrdemServicoEstoquePecas pelo CodOrdemServico e CodEstoquePecas: $e');
      rethrow;
    }
  }

  Future<List<OrdemServicoEstoquePecas>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("OrdemServico_EstoquePecas");

      return result.map((item) => OrdemServicoEstoquePecas.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os OrdemServicoEstoquePecas: $e');
      rethrow;
    }
  }
}
