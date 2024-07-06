import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/veiculos.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class VeiculosRepository{

  late DatabaseProvider databaseProvider;

  VeiculosRepository(this.databaseProvider);

  Future<int> insert(Veiculos entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.insert("Veiculos", entity.toMap());
  }

  Future<int>  delete(Veiculos entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.delete("Veiculos", 
                  where : "Placa = ?", 
                  whereArgs:  ["${entity.placa}"]);
  }

  Future<int>  update(Veiculos entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.update("Veiculos",
                    entity.toMap(), 
                    where : "Placa = ?", 
                  whereArgs:  ["${entity.placa}"]);
  }

  Future<Veiculos> findById(String placa) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    List<Map<String, Object?>> result = await dt.rawQuery("SELECT * FROM Veiculos WHERE CPF = ${placa}");
    //Se retornou resultados
    var veiculos = Veiculos();
    if (result.isNotEmpty){
        Map<String, Object?> item = result[0];
        veiculos.placa = item["Placa"] as String;
        veiculos.marca = item["Marca"] as String;
        veiculos.modelo = item["Modelo"] as String;
        veiculos.cor = item["Cor"] as String;
        veiculos.ano = item["Ano"] as String;
    }
    return veiculos;
  }


  ///Busca todos os registros do banco de dados convertidos para
  ///um objeto do tipo List<Estado>.
  Future<List<Veiculos>> findAll() async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    List<Map<String, Object?>> result = await dt.rawQuery("SELECT * FROM Veiculos");
    //Se retornou resultados
    List<Veiculos> veiculosResults = [];
    
    if (result.isNotEmpty){
        
        for (int i = 0; i < result.length; i++){

          Map<String, Object?> item = result[i];
          //Convertendo um Map para o objeto apropriado

          Veiculos veiculos = Veiculos.fromMap(item);
          veiculosResults.add(veiculos);
        }
    }
    return veiculosResults;
  }

}