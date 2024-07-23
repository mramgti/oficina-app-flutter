import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/fornecedor_estoque_pecas.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FornecedorEstoquePecasRepository {
  late DatabaseProvider databaseProvider;

  FornecedorEstoquePecasRepository(this.databaseProvider);

  Future<int> insert(FornecedorEstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Fornecedor_EstoquePecas", entity.toMap());
    } catch (e) {
      print('Erro ao inserir FornecedorEstoquePecas: $e');
      rethrow;
    }
  }

  Future<int> delete(FornecedorEstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Fornecedor_EstoquePecas",
        where: "CodFornecedor = ? AND CodEstoquePecas = ?",
        whereArgs: [entity.codFornecedor, entity.codEstoquePecas],
      );
    } catch (e) {
      print('Erro ao deletar FornecedorEstoquePecas: $e');
      rethrow;
    }
  }

  Future<int> update(FornecedorEstoquePecas entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Fornecedor_EstoquePecas",
        entity.toMap(),
        where: "CodFornecedor = ? AND CodEstoquePecas = ?",
        whereArgs: [entity.codFornecedor, entity.codEstoquePecas],
      );
    } catch (e) {
      print('Erro ao atualizar FornecedorEstoquePecas: $e');
      rethrow;
    }
  }

  Future<FornecedorEstoquePecas?> findById(int codFornecedor, int codEstoquePecas) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Fornecedor_EstoquePecas",
        where: "CodFornecedor = ? AND CodEstoquePecas = ?",
        whereArgs: [codFornecedor, codEstoquePecas],
      );

      if (result.isNotEmpty) {
        return FornecedorEstoquePecas.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar FornecedorEstoquePecas pelo CodFornecedor e CodEstoquePecas: $e');
      rethrow;
    }
  }

  Future<List<FornecedorEstoquePecas>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Fornecedor_EstoquePecas");

      return result.map((item) => FornecedorEstoquePecas.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os FornecedorEstoquePecas: $e');
      rethrow;
    }
  }
}
