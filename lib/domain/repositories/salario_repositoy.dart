import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/salario.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SalarioRepository {
  late DatabaseProvider databaseProvider;

  SalarioRepository(this.databaseProvider);

  Future<int> insert(Salario entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Salario", entity.toMap());
    } catch (e) {
      print('Erro ao inserir Salário: $e');
      rethrow;
    }
  }

  Future<int> delete(Salario entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Salario",
        where: "CodSalario = ?",
        whereArgs: [entity.codSalario],
      );
    } catch (e) {
      print('Erro ao deletar Salário: $e');
      rethrow;
    }
  }

  Future<int> update(Salario entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Salario",
        entity.toMap(),
        where: "CodSalario = ?",
        whereArgs: [entity.codSalario],
      );
    } catch (e) {
      print('Erro ao atualizar Salário: $e');
      rethrow;
    }
  }

  Future<Salario?> findById(int codSalario) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Salario",
        where: "CodSalario = ?",
        whereArgs: [codSalario],
      );

      if (result.isNotEmpty) {
        return Salario.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar Salário pelo CodSalario: $e');
      rethrow;
    }
  }

  Future<List<Salario>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Salario");

      return result.map((item) => Salario.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os Salários: $e');
      rethrow;
    }
  }
}
