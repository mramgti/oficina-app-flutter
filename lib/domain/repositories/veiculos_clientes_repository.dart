import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/veiculos_clientes.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class VeiculosClientesRepository {
  late DatabaseProvider databaseProvider;

  VeiculosClientesRepository(this.databaseProvider);

  Future<int> insert(VeiculosClientes entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Veiculos_Clientes", entity.toMap());
    } catch (e) {
      print('Erro ao inserir VeiculosClientes: $e');
      rethrow;
    }
  }

  Future<int> delete(VeiculosClientes entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Veiculos_Clientes",
        where: "CodVeiculo = ? AND CPFCliente = ?",
        whereArgs: [entity.codVeiculo, entity.cpfCliente],
      );
    } catch (e) {
      print('Erro ao deletar VeiculosClientes: $e');
      rethrow;
    }
  }

  Future<int> update(VeiculosClientes entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Veiculos_Clientes",
        entity.toMap(),
        where: "CodVeiculo = ? AND CPFCliente = ?",
        whereArgs: [entity.codVeiculo, entity.cpfCliente],
      );
    } catch (e) {
      print('Erro ao atualizar VeiculosClientes: $e');
      rethrow;
    }
  }

  Future<VeiculosClientes?> findById(int codVeiculo, String cpfCliente) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "Veiculos_Clientes",
        where: "CodVeiculo = ? AND CPFCliente = ?",
        whereArgs: [codVeiculo, cpfCliente],
      );

      if (result.isNotEmpty) {
        return VeiculosClientes.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar VeiculosClientes pelo CodVeiculo e CPFCliente: $e');
      rethrow;
    }
  }

  Future<List<VeiculosClientes>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("Veiculos_Clientes");

      return result.map((item) => VeiculosClientes.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os VeiculosClientes: $e');
      rethrow;
    }
  }
}
