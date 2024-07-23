import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/funcionarios.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FuncionariosRepository {
  late DatabaseProvider databaseProvider;

  FuncionariosRepository(this.databaseProvider);

  Future<int> insert(Funcionarios entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("Funcionarios", entity.toMap());
    } catch (e) {
      // Log do erro
      print('Erro ao inserir funcionário: $e');
      // Retornar um valor padrão ou lançar uma exceção personalizada
      throw Exception('Não foi possível inserir o funcionário.');
    }
  }

  Future<int> delete(Funcionarios entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "Funcionarios",
        where: "CPF = ?",
        whereArgs: [entity.cpf],
      );
    } catch (e) {
      // Log do erro
      print('Erro ao deletar funcionário: $e');
      // Retornar um valor padrão ou lançar uma exceção personalizada
      throw Exception('Não foi possível deletar o funcionário.');
    }
  }

  Future<int> update(Funcionarios entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "Funcionarios",
        entity.toMap(),
        where: "CPF = ?",
        whereArgs: [entity.cpf],
      );
    } catch (e) {
      // Log do erro
      print('Erro ao atualizar funcionário: $e');
      // Retornar um valor padrão ou lançar uma exceção personalizada
      throw Exception('Não foi possível atualizar o funcionário.');
    }
  }

  Future<Funcionarios> findById(String cpf) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.rawQuery(
        "SELECT * FROM Funcionarios WHERE CPF = ?",
        [cpf],
      );

      if (result.isNotEmpty) {
        return Funcionarios.fromMap(result[0]);
      } else {
        // Retornar uma instância padrão ou lançar uma exceção personalizada
        return Funcionarios(); // ou throw Exception('Funcionário não encontrado.');
      }
    } catch (e) {
      // Log do erro
      print('Erro ao buscar funcionário por CPF: $e');
      // Retornar uma instância padrão ou lançar uma exceção personalizada
      throw Exception('Não foi possível buscar o funcionário.');
    }
  }

  Future<List<Funcionarios>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result =
          await dt.rawQuery("SELECT * FROM Funcionarios");

      return result.map((item) => Funcionarios.fromMap(item)).toList();
    } catch (e) {
      // Log do erro
      print('Erro ao buscar todos os funcionários: $e');
      // Retornar uma lista vazia ou lançar uma exceção personalizada
      throw Exception('Não foi possível buscar os funcionários.');
    }
  }
}
