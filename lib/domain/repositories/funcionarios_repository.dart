import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/funcionarios.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FuncionariosRepository{

  late DatabaseProvider databaseProvider;

  FuncionariosRepository(this.databaseProvider);

  Future<int> insert(Funcionarios entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.insert("Funcionarios", entity.toMap());
  }

  Future<int>  delete(Funcionarios entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.delete("Funcionarios", 
                  where : "CPF = ?", 
                  whereArgs:  ["${entity.cpf}"]);
  }

  Future<int>  update(Funcionarios entity) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    return await dt.update("Funcionarios",
                    entity.toMap(), 
                    where : "CPF = ?", 
                  whereArgs:  ["${entity.cpf}"]);
  }

  Future<Funcionarios> findById(String cpf) async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    List<Map<String, Object?>> result = await dt.rawQuery("SELECT * FROM Funcionarios WHERE CPF = ${cpf}");
    //Se retornou resultados
    var funcionarios = Funcionarios();
    if (result.isNotEmpty){
        Map<String, Object?> item = result[0];
        funcionarios.cpf = item["CPF"] as String;
        funcionarios.nome = item["Nome"] as String;
        funcionarios.dataContratacao = item["DataContratacao"] as String;
        funcionarios.dataDemissao = item["DataDemissao"] as String;
        funcionarios.cargo = item["Cargo"] as String;
    }
    return funcionarios;
  }


  ///Busca todos os registros do banco de dados convertidos para
  ///um objeto do tipo List<Estado>.
  Future<List<Funcionarios>> findAll() async{
    await databaseProvider.open();
    Database dt = databaseProvider.database;
    List<Map<String, Object?>> result = await dt.rawQuery("SELECT * FROM Funcionarios");
    //Se retornou resultados
    List<Funcionarios> funcionariosResults = [];
    
    if (result.isNotEmpty){
        
        for (int i = 0; i < result.length; i++){

          Map<String, Object?> item = result[i];
          //Convertendo um Map para o objeto apropriado

          Funcionarios funcionarios = Funcionarios.fromMap(item);
          funcionariosResults.add(funcionarios);
        }
    }
    return funcionariosResults;
  }

}