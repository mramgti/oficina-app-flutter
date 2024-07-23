import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/telefone.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TelefoneRepository {
  late DatabaseProvider databaseProvider;

  TelefoneRepository(this.databaseProvider);

  Future<int> insert(Telefone entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Telefone", entity.toMap());
    } catch (e) {
      print('Erro ao inserir Telefone: $e');
      rethrow;
    }
  }

  Future<int> delete(Telefone entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Telefone",
        where: "CPF = ? AND DDD = ? AND Numero = ?",
        whereArgs: [entity.cpf, entity.ddd, entity.numero],
      );
    } catch (e) {
      print('Erro ao deletar Telefone: $e');
      rethrow;
    }
  }

  Future<int> update(Telefone entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Telefone",
        entity.toMap(),
        where: "CPF = ? AND DDD = ? AND Numero = ?",
        whereArgs: [entity.cpf, entity.ddd, entity.numero],
      );
    } catch (e) {
      print('Erro ao atualizar Telefone: $e');
      rethrow;
    }
  }

  Future<Telefone?> findById(String cpf, String ddd, String numero) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Telefone",
        where: "CPF = ? AND DDD = ? AND Numero = ?",
        whereArgs: [cpf, ddd, numero],
      );

      if (result.isNotEmpty) {
        return Telefone.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar Telefone pelo CPF, DDD e Numero: $e');
      rethrow;
    }
  }

  Future<List<Telefone>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Telefone");

      return result.map((item) => Telefone.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os Telefones: $e');
      rethrow;
    }
  }
}
