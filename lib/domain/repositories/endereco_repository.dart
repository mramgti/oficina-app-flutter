import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/endereco.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class EnderecoRepository {
  late DatabaseProvider databaseProvider;

  EnderecoRepository(this.databaseProvider);

  Future<int> insert(Endereco entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Endereco", entity.toMap());
    } catch (e) {
      print('Erro ao inserir Endereco: $e');
      rethrow;
    }
  }

  Future<int> delete(Endereco entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Endereco",
        where: "CodEndereco = ?",
        whereArgs: [entity.codEndereco],
      );
    } catch (e) {
      print('Erro ao deletar Endereco: $e');
      rethrow;
    }
  }

  Future<int> update(Endereco entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Endereco",
        entity.toMap(),
        where: "CodEndereco = ?",
        whereArgs: [entity.codEndereco],
      );
    } catch (e) {
      print('Erro ao atualizar Endereco: $e');
      rethrow;
    }
  }

  Future<Endereco?> findById(int codEndereco) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Endereco",
        where: "CodEndereco = ?",
        whereArgs: [codEndereco],
      );

      if (result.isNotEmpty) {
        return Endereco.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar Endereco pelo CodEndereco: $e');
      rethrow;
    }
  }

  Future<List<Endereco>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Endereco");

      return result.map((item) => Endereco.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os Endereços: $e');
      rethrow;
    }
  }
}
