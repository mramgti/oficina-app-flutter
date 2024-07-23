import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/estoque_pecas.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class EstoquePecasRepository {
  late DatabaseProvider databaseProvider;

  EstoquePecasRepository(this.databaseProvider);

  Future<int> insert(EstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("EstoquePecas", entity.toMap());
    } catch (e) {
      print('Erro ao inserir EstoquePecas: $e');
      rethrow;
    }
  }

  Future<int> delete(EstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "EstoquePecas",
        where: "CodPeca = ?",
        whereArgs: [entity.codPeca],
      );
    } catch (e) {
      print('Erro ao deletar EstoquePecas: $e');
      rethrow;
    }
  }

  Future<int> update(EstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "EstoquePecas",
        entity.toMap(),
        where: "CodPeca = ?",
        whereArgs: [entity.codPeca],
      );
    } catch (e) {
      print('Erro ao atualizar EstoquePecas: $e');
      rethrow;
    }
  }

  Future<EstoquePecas?> findById(int codPeca) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "EstoquePecas",
        where: "CodPeca = ?",
        whereArgs: [codPeca],
      );

      if (result.isNotEmpty) {
        return EstoquePecas.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar EstoquePecas pelo CodPeca: $e');
      rethrow;
    }
  }

  Future<List<EstoquePecas>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("EstoquePecas");

      return result.map((item) => EstoquePecas.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os EstoquePecas: $e');
      rethrow;
    }
  }
}
