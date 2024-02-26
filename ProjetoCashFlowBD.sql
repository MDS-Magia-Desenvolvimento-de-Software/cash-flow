CREATE DATABASE database_cashflow;

USE database_cashflow;

CREATE TABLE Usuario (
    cpf VARCHAR(14) PRIMARY KEY UNIQUE,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) UNIQUE NOT NULL,
    cargo ENUM('supervisor', 'funcionario') NOT NULL,
    setor VARCHAR(255)
);

CREATE TABLE Viagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    local_origem VARCHAR(255) NOT NULL,
    local_destino VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    orcamento DECIMAL(10, 2) NOT NULL,
    itinerario TEXT NOT NULL,
    status ENUM('em espera', 'em andamento', 'finalizado') NOT NULL,
    funcionario_cpf VARCHAR(14),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (funcionario_cpf) REFERENCES Usuario(cpf) ON DELETE CASCADE
);

CREATE TABLE Despesa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    categoria VARCHAR(255),
    valor DECIMAL(10, 2) NOT NULL CHECK (valor >= 0),
    data_hora DATETIME NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    nota_fiscal VARCHAR(255) NOT NULL,
    viagem_id INT,
    funcionario_cpf VARCHAR(14),
    FOREIGN KEY (viagem_id) REFERENCES Viagem(id) ON DELETE CASCADE,
    FOREIGN KEY (funcionario_cpf) REFERENCES Usuario(cpf) ON DELETE CASCADE
);

CREATE TABLE Usuario_Viagem (
    usuario_cpf VARCHAR(14),
    viagem_id INT,
    PRIMARY KEY (usuario_cpf, viagem_id),
    FOREIGN KEY (usuario_cpf) REFERENCES Usuario(cpf) ON DELETE CASCADE,
    FOREIGN KEY (viagem_id) REFERENCES Viagem(id) ON DELETE CASCADE
);
