import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/ordem_servico_servico.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class OrdemServicoServicoRepository {
  late DatabaseProvider databaseProvider;

  OrdemServicoServicoRepository(this.databaseProvider);

  Future<int> insert(OrdemServicoServico entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("OrdemServico_Servico", entity.toMap());
    } catch (e) {
      print('Erro ao inserir OrdemServicoServico: $e');
      rethrow;
    }
  }

  Future<int> delete(OrdemServicoServico entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "OrdemServico_Servico",
        where: "CodOrdemServico = ? AND CodServico = ?",
        whereArgs: [entity.codOrdemServico, entity.codServico],
      );
    } catch (e) {
      print('Erro ao deletar OrdemServicoServico: $e');
      rethrow;
    }
  }

  Future<int> update(OrdemServicoServico entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "OrdemServico_Servico",
        entity.toMap(),
        where: "CodOrdemServico = ? AND CodServico = ?",
        whereArgs: [entity.codOrdemServico, entity.codServico],
      );
    } catch (e) {
      print('Erro ao atualizar OrdemServicoServico: $e');
      rethrow;
    }
  }

  Future<OrdemServicoServico?> findById(int codOrdemServico, int codServico) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "OrdemServico_Servico",
        where: "CodOrdemServico = ? AND CodServico = ?",
        whereArgs: [codOrdemServico, codServico],
      );

      if (result.isNotEmpty) {
        return OrdemServicoServico.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar OrdemServicoServico pelo CodOrdemServico e CodServico: $e');
      rethrow;
    }
  }

  Future<List<OrdemServicoServico>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("OrdemServico_Servico");

      return result.map((item) => OrdemServicoServico.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os OrdemServicoServicos: $e');
      rethrow;
    }
  }
}
