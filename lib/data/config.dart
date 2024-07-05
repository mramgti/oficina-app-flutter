class Config{
  static const String sql = '''
      -- TABLE OrdemServico
      CREATE TABLE IF NOT EXISTS OrdemServico (
          CodOrdemServico INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          DataEntregaVeiculo DATE,
          HoraEntregaVeiculo TIME,
          DataInicioServico DATE,
          HoraInicioServico TIME,
          DataFimServico DATE,
          HoraFimServico TIME,
          Quilometragem INTEGER,
          Status VARCHAR(45)
      );

      -- TABLE Clientes
      CREATE TABLE IF NOT EXISTS Clientes (
          CPF CHAR(11) PRIMARY KEY NOT NULL,
          Nome VARCHAR(80) NOT NULL,
          Email VARCHAR(45),
          DataNascimento DATE,
          DataCadastro DATE,
          CodOrdemServico INTEGER,
          FOREIGN KEY (CodOrdemServico) REFERENCES OrdemServico(CodOrdemServico) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE Veiculos
      CREATE TABLE IF NOT EXISTS Veiculos (
          Placa CHAR(7) PRIMARY KEY NOT NULL,
          Marca VARCHAR(45),
          Modelo VARCHAR(45),
          Cor VARCHAR(45),
          Ano YEAR
      );

      -- TABLE Funcionarios
      CREATE TABLE IF NOT EXISTS Funcionarios (
          CPF CHAR(11) PRIMARY KEY NOT NULL,
          Nome VARCHAR(80) NOT NULL,
          DataContratacao DATE NOT NULL,
          DataDemissao DATE,
          DataNascimento DATE,
          Cargo VARCHAR(45)
      );

      -- TABLE Salario
      CREATE TABLE IF NOT EXISTS Salario (
          CodSalario INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          Salario DECIMAL(8,2),
          DataAtribuicao DATE,
          CPF CHAR(11),
          FOREIGN KEY (CPF) REFERENCES Funcionarios(CPF) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE EstoquePecas
      CREATE TABLE IF NOT EXISTS EstoquePecas (
          CodPeca INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          Nome VARCHAR(80),
          PrecoCompra DECIMAL(8,2),
          PrecoVenda DECIMAL(8,2),
          Quantidade INTEGER
      );

      -- TABLE Fornecedor
      CREATE TABLE IF NOT EXISTS Fornecedor (
          CNPJ CHAR(14) PRIMARY KEY NOT NULL,
          Nome VARCHAR(80) NOT NULL,
          DataCadastro DATE
      );

      -- TABLE Endereco
      CREATE TABLE IF NOT EXISTS Endereco (
          CodEndereco INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          Rua VARCHAR(100),
          Numero VARCHAR(45),
          Complemento VARCHAR(45),
          Bairro VARCHAR(45),
          Cidade VARCHAR(45),
          Estado CHAR(2),
          CEP CHAR(8),
          PontoReferencia VARCHAR(45),
          CPF CHAR(11),
          CNPJ CHAR(14),
          FOREIGN KEY (CPF) REFERENCES Clientes(CPF) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE Telefone
      CREATE TABLE IF NOT EXISTS Telefone (
          CodTelefone INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          DDD CHAR(2),
          Telefone CHAR(9),
          CPF CHAR(11),
          CNPJ CHAR(14),
          FOREIGN KEY (CPF) REFERENCES Clientes(CPF) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE Servico
      CREATE TABLE IF NOT EXISTS Servico (
          CodServico INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          Descricao VARCHAR(100),
          ValorServico DECIMAL(8,2)
      );

      -- TABLE TipoPagamento
      CREATE TABLE IF NOT EXISTS TipoPagamento (
          CodTipoPagamento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          Descricao VARCHAR(45)
      );

      -- TABLE Veiculos_Clientes
      CREATE TABLE IF NOT EXISTS Veiculos_Clientes (
          Placa CHAR(7),
          CPF CHAR(11),
          FOREIGN KEY (Placa) REFERENCES Veiculos(Placa) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CPF) REFERENCES Clientes(CPF) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE OrdemServico_Veiculos
      CREATE TABLE IF NOT EXISTS OrdemServico_Veiculos (
          Placa CHAR(7),
          CodOrdemServico INTEGER,
          FOREIGN KEY (Placa) REFERENCES Veiculos(Placa) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CodOrdemServico) REFERENCES OrdemServico(CodOrdemServico) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE OrdemServico_Servico
      CREATE TABLE IF NOT EXISTS OrdemServico_Servico (
          CodOrdemServico INTEGER,
          CodServico INTEGER,
          CPF CHAR(11),
          FOREIGN KEY (CodOrdemServico) REFERENCES OrdemServico(CodOrdemServico) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CodServico) REFERENCES Servico(CodServico) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CPF) REFERENCES Funcionarios(CPF) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE OrdemServico_Pagamentos
      CREATE TABLE IF NOT EXISTS OrdemServico_Pagamentos (
          CodOrdemServico INTEGER,
          CodTipoPagamento INTEGER,
          NumParcelas INTEGER,
          ValorPago DECIMAL(8,2),
          FOREIGN KEY (CodOrdemServico) REFERENCES OrdemServico(CodOrdemServico) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CodTipoPagamento) REFERENCES TipoPagamento(CodTipoPagamento) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE OrdemServico_EstoquePecas
      CREATE TABLE IF NOT EXISTS OrdemServico_EstoquePecas (
          CodOrdemServico INTEGER,
          CodPeca INTEGER,
          CPF CHAR(11),
          ValorPeca DECIMAL(8,2),
          QuantPeca INTEGER,
          FOREIGN KEY (CodOrdemServico) REFERENCES OrdemServico(CodOrdemServico) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CodPeca) REFERENCES EstoquePecas(CodPeca) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CPF) REFERENCES Funcionarios(CPF) ON DELETE RESTRICT ON UPDATE CASCADE
      );

      -- TABLE Fornecedor_EstoquePecas
      CREATE TABLE IF NOT EXISTS Fornecedor_EstoquePecas (
          CNPJ CHAR(14),
          CodPeca INTEGER,
          FOREIGN KEY (CNPJ) REFERENCES Fornecedor(CNPJ) ON DELETE RESTRICT ON UPDATE CASCADE,
          FOREIGN KEY (CodPeca) REFERENCES EstoquePecas(CodPeca) ON DELETE RESTRICT ON UPDATE CASCADE
      );
  ''';
}
