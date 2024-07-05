import 'package:flutter_oficina_app/data/database_provider.dart';
import 'package:flutter_oficina_app/domain/models/funcionarios.dart';
import 'package:flutter_oficina_app/domain/repositories/funcionarios_repository.dart';


void main() async{
  DatabaseProvider databaseProvider = DatabaseProvider();
  await databaseProvider.open();

  // Criando a instância do Repositório Estado
  FuncionariosRepository funcionariosRepository = FuncionariosRepository(databaseProvider);
  
  Funcionarios funcionarios = Funcionarios();
  funcionarios.nome = "João Bandeira";
  funcionarios.cpf = "12345678900";
  funcionarios.dataContratacao = "2001-07-20 00:00:00";
  funcionarios.dataDemissao = "2006-09-21 00:00:00";
  funcionarios.dataNascimento = "1984-02-19 00:00:00";
  funcionarios.cargo = "Gerente";

  funcionariosRepository.insert(funcionarios);


  // funcionarios = await funcionariosRepository.findById(1);
  // print(funcionarios);
  
}