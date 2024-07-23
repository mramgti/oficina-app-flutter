import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/veiculos.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class VeiculosRepository {
  late DatabaseProvider databaseProvider;

  VeiculosRepository(this.databaseProvider);

  Future<int> insert(Veiculos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Veiculos", entity.toMap());
    } catch (e) {
      // Log ou trata o erro
      print('Erro ao inserir Veículos: $e');
      rethrow; // Relança a exceção para tratamento posterior, se necessário
    }
  }

  Future<int> delete(Veiculos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Veiculos",
        where: "Placa = ?",
        whereArgs: [entity.placa],
      );
    } catch (e) {
      // Log ou trata o erro
      print('Erro ao deletar Veículos: $e');
      rethrow; // Relança a exceção para tratamento posterior, se necessário
    }
  }

  Future<int> update(Veiculos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Veiculos",
        entity.toMap(),
        where: "Placa = ?",
        whereArgs: [entity.placa],
      );
    } catch (e) {
      // Log ou trata o erro
      print('Erro ao atualizar Veículos: $e');
      rethrow; // Relança a exceção para tratamento posterior, se necessário
    }
  }

  Future<Veiculos?> findById(String placa) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Veiculos",
        where: "Placa = ?",
        whereArgs: [placa],
      );

      if (result.isNotEmpty) {
        return Veiculos.fromMap(result.first);
      }
      return null; // Retorna null se nenhum resultado for encontrado
    } catch (e) {
      // Log ou trata o erro
      print('Erro ao buscar Veículos pelo placa: $e');
      rethrow; // Relança a exceção para tratamento posterior, se necessário
    }
  }

  Future<List<Veiculos>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Veiculos");

      return result.map((item) => Veiculos.fromMap(item)).toList();
    } catch (e) {
      // Log ou trata o erro
      print('Erro ao buscar todos os Veículos: $e');
      rethrow; // Relança a exceção para tratamento posterior, se necessário
    }
  }
}
