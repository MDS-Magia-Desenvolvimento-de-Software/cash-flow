CREATE SCHEMA cash_flow ;

  
CREATE TABLE Usuario (
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    setor VARCHAR(100)
);

  
  
CREATE TABLE Viagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    local_origem VARCHAR(100) NOT NULL,
    local_destino VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    orcamento DECIMAL NOT NULL,
    itinerario TEXT NOT NULL,
    status bool NOT NULL,
    funcionarios VARCHAR(100) NOT NULL,
    despesas DECIMAL NOT NULL
);


CREATE TABLE Despesa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    categoria VARCHAR(100),
    valor DECIMAL NOT NULL,
    data_hora DATETIME NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    nota_fiscal VARCHAR(255) NOT NULL,
    planejada BOOLEAN NOT NULL,
    status bool NOT NULL,
    viagem_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    FOREIGN KEY (viagem_id) REFERENCES Viagem(id),
    FOREIGN KEY (funcionario_id) REFERENCES Viagem(id)
);



