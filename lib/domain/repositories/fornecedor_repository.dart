import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/fornecedor.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FornecedorRepository {
  late DatabaseProvider databaseProvider;

  FornecedorRepository(this.databaseProvider);

  Future<int> insert(Fornecedor entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Fornecedor", entity.toMap());
    } catch (e) {
      print('Erro ao inserir Fornecedor: $e');
      rethrow;
    }
  }

  Future<int> delete(Fornecedor entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Fornecedor",
        where: "CodFornecedor = ?",
        whereArgs: [entity.codFornecedor],
      );
    } catch (e) {
      print('Erro ao deletar Fornecedor: $e');
      rethrow;
    }
  }

  Future<int> update(Fornecedor entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Fornecedor",
        entity.toMap(),
        where: "CodFornecedor = ?",
        whereArgs: [entity.codFornecedor],
      );
    } catch (e) {
      print('Erro ao atualizar Fornecedor: $e');
      rethrow;
    }
  }

  Future<Fornecedor?> findById(int codFornecedor) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Fornecedor",
        where: "CodFornecedor = ?",
        whereArgs: [codFornecedor],
      );

      if (result.isNotEmpty) {
        return Fornecedor.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar Fornecedor pelo CodFornecedor: $e');
      rethrow;
    }
  }

  Future<List<Fornecedor>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Fornecedor");

      return result.map((item) => Fornecedor.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os Fornecedores: $e');
      rethrow;
    }
  }
}
