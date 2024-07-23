import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/ordem_servico_pagamentos.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class OrdemServicoPagamentosRepository {
  late DatabaseProvider databaseProvider;

  OrdemServicoPagamentosRepository(this.databaseProvider);

  Future<int> insert(OrdemServicoPagamentos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("OrdemServico_Pagamentos", entity.toMap());
    } catch (e) {
      print('Erro ao inserir OrdemServicoPagamentos: $e');
      rethrow;
    }
  }

  Future<int> delete(OrdemServicoPagamentos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "OrdemServico_Pagamentos",
        where: "CodOrdemServico = ? AND CodTipoPagamento = ?",
        whereArgs: [entity.codOrdemServico, entity.codTipoPagamento],
      );
    } catch (e) {
      print('Erro ao deletar OrdemServicoPagamentos: $e');
      rethrow;
    }
  }

  Future<int> update(OrdemServicoPagamentos entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "OrdemServico_Pagamentos",
        entity.toMap(),
        where: "CodOrdemServico = ? AND CodTipoPagamento = ?",
        whereArgs: [entity.codOrdemServico, entity.codTipoPagamento],
      );
    } catch (e) {
      print('Erro ao atualizar OrdemServicoPagamentos: $e');
      rethrow;
    }
  }

  Future<OrdemServicoPagamentos?> findById(int codOrdemServico, int codTipoPagamento) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "OrdemServico_Pagamentos",
        where: "CodOrdemServico = ? AND CodTipoPagamento = ?",
        whereArgs: [codOrdemServico, codTipoPagamento],
      );

      if (result.isNotEmpty) {
        return OrdemServicoPagamentos.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar OrdemServicoPagamentos pelo CodOrdemServico e CodTipoPagamento: $e');
      rethrow;
    }
  }

  Future<List<OrdemServicoPagamentos>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("OrdemServico_Pagamentos");

      return result.map((item) => OrdemServicoPagamentos.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os OrdemServicoPagamentos: $e');
      rethrow;
    }
  }
}
