import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/tipo_pagamento.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TipoPagamentoRepository {
  late DatabaseProvider databaseProvider;

  TipoPagamentoRepository(this.databaseProvider);

  Future<int> insert(TipoPagamento entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.insert("TipoPagamento", entity.toMap());
    } catch (e) {
      print('Erro ao inserir TipoPagamento: $e');
      rethrow;
    }
  }

  Future<int> delete(TipoPagamento entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.delete(
        "TipoPagamento",
        where: "CodTipoPagamento = ?",
        whereArgs: [entity.codTipoPagamento],
      );
    } catch (e) {
      print('Erro ao deletar TipoPagamento: $e');
      rethrow;
    }
  }

  Future<int> update(TipoPagamento entity) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      return await dt.update(
        "TipoPagamento",
        entity.toMap(),
        where: "CodTipoPagamento = ?",
        whereArgs: [entity.codTipoPagamento],
      );
    } catch (e) {
      print('Erro ao atualizar TipoPagamento: $e');
      rethrow;
    }
  }

  Future<TipoPagamento?> findById(int codTipoPagamento) async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query(
        "TipoPagamento",
        where: "CodTipoPagamento = ?",
        whereArgs: [codTipoPagamento],
      );

      if (result.isNotEmpty) {
        return TipoPagamento.fromMap(result.first);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar TipoPagamento pelo CodTipoPagamento: $e');
      rethrow;
    }
  }

  Future<List<TipoPagamento>> findAll() async {
    try {
      await databaseProvider.open();
      Database dt = databaseProvider.database;
      List<Map<String, Object?>> result = await dt.query("TipoPagamento");

      return result.map((item) => TipoPagamento.fromMap(item)).toList();
    } catch (e) {
      print('Erro ao buscar todos os TipoPagamentos: $e');
      rethrow;
    }
  }
}
