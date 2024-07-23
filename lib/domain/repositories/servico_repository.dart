import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/servico.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ServicoRepository {
  late DatabaseProvider databaseProvider;

  ServicoRepository(this.databaseProvider);

  Future<int> insert(Servico entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Servico", entity.toMap());
    } catch (e) {
      print('Erro ao inserir Servico: $e');
      rethrow;
    }
  }

  Future<int> delete(Servico entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Servico",
        where: "CodServico = ?",
        whereArgs: [entity.codServico],
      );
    } catch (e) {
      print('Erro ao deletar Servico: $e');
      rethrow;
    }
  }

  Future<int> update(Servico entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Servico",
        entity.toMap(),
        where: "CodServico = ?",
        whereArgs: [entity.codServico],
      );
    } catch (e) {
      print('Erro ao atualizar Servico: $e');
      rethrow;
    }
  }

  Future<Servico?> findById(int codServico) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Servico",
        where: "CodServico = ?",
        whereArgs: [codServico],
      );

      if (result.isNotEmpty) {
        return Servico.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar Servico pelo CodServico: $e');
      rethrow;
    }
  }

  Future<List<Servico>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Servico");

      return result.map((item) => Servico.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os Servicos: $e');
      rethrow;
    }
  }
}
