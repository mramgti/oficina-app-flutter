import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/clientes.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ClientesRepository {
  late DatabaseProvider databaseProvider;

  ClientesRepository(this.databaseProvider);

  Future<int> insert(Clientes entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Clientes", entity.toMap());
    } catch (e) {
      print('Erro ao inserir Clientes: $e');
      rethrow;
    }
  }

  Future<int> delete(Clientes entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Clientes",
        where: "CPF = ?",
        whereArgs: [entity.cpf],
      );
    } catch (e) {
      print('Erro ao deletar Clientes: $e');
      rethrow;
    }
  }

  Future<int> update(Clientes entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Clientes",
        entity.toMap(),
        where: "CPF = ?",
        whereArgs: [entity.cpf],
      );
    } catch (e) {
      print('Erro ao atualizar Clientes: $e');
      rethrow;
    }
  }

  Future<Clientes?> findById(String cpf) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Clientes",
        where: "CPF = ?",
        whereArgs: [cpf],
      );

      if (result.isNotEmpty) {
        return Clientes.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar Clientes pelo CPF: $e');
      rethrow;
    }
  }

  Future<List<Clientes>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Clientes");

      return result.map((item) => Clientes.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os Clientes: $e');
      rethrow;
    }
  }
}
