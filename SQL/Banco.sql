-- Tabela Funcionario
CREATE TABLE Funcionario (
    CPF VARCHAR(14) PRIMARY KEY,
    DataNasc DATE,
    Nome VARCHAR(100),
    Salario DECIMAL(10, 2)
);

-- Tabela Jogador
CREATE TABLE Jogador (
    CPF VARCHAR(14) PRIMARY KEY,
    Assistencias INT,
    FaltasFeitas INT,
    FaltasSofridas INT,
    Gols INT,
    FOREIGN KEY (CPF) REFERENCES Funcionario(CPF)
);

-- Tabela DaBase
CREATE TABLE DaBase (
    CPF VARCHAR(14) PRIMARY KEY,
    Categoria VARCHAR(50),
    FOREIGN KEY (CPF) REFERENCES Jogador(CPF)
);

-- Tabela Time
CREATE TABLE Time (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Tabela EspecialidadeTecnico
CREATE TABLE EspecialidadeTecnico (
    Tipo VARCHAR(100) PRIMARY KEY
);

-- Tabela EspecialidadeMedico
CREATE TABLE EspecialidadeMedico (
    Tipo VARCHAR(100) PRIMARY KEY
);

-- Tabela Emprestado
CREATE TABLE Emprestado (
    CPF VARCHAR(14) PRIMARY KEY,
    Porcentagem DECIMAL(5, 2) CHECK (Porcentagem >= 0 AND Porcentagem <= 100), 
    codTime INT,
    Data DATE,
    FOREIGN KEY (CPF) REFERENCES Jogador(CPF),
    FOREIGN KEY (codTime) REFERENCES Time(Codigo)
);

-- Tabela PorEmprestimo
CREATE TABLE PorEmprestimo (
    CPF VARCHAR(14) PRIMARY KEY,
    Porcentagem DECIMAL(5, 2) CHECK (Porcentagem >= 0 AND Porcentagem <= 100), 
    codTime INT,
    Data DATE,
    FOREIGN KEY (CPF) REFERENCES Jogador(CPF),
    FOREIGN KEY (codTime) REFERENCES Time(Codigo)
);


-- Tabela Medico
CREATE TABLE Medico (
    CPF VARCHAR(14) PRIMARY KEY,
    CRM VARCHAR(20),
    especialidade VARCHAR(100),
    FOREIGN KEY (especialidade) REFERENCES EspecialidadeMedico(Tipo),
    FOREIGN KEY (CPF) REFERENCES Funcionario(CPF)
);

-- Tabela Tecnico
CREATE TABLE Tecnico (
    CPF VARCHAR(14) PRIMARY KEY,
    Vitorias INT,
    derrotas INT,
    especialidade VARCHAR(100),
    FOREIGN KEY (especialidade) REFERENCES EspecialidadeTecnico(Tipo),
    FOREIGN KEY (CPF) REFERENCES Funcionario(CPF)
);

-- Tabela Contrato
CREATE TABLE Contrato (
    CPF VARCHAR(14),
    numContrato INT PRIMARY KEY,
    DataFim DATE,
    DataInicio DATE,
    FOREIGN KEY (CPF) REFERENCES Funcionario(CPF)
);


-- Tabela Temporada
CREATE TABLE Temporada (
    ano VARCHAR(4) PRIMARY KEY,
    Empates INT,
    Derrotas INT,
    Vitorias INT,
    Feitos INT,
    Sofridos INT
);

-- Tabela Campeonato
CREATE TABLE Campeonato (
    nome VARCHAR(100),
    Vitorias INT,
    Derrotas INT,
    Empates INT,
    Posicao INT,
    Sofridos INT,
    Feitos INT,
    AnoTemp VARCHAR(4),
    FOREIGN KEY (AnoTemp) REFERENCES Temporada(ano),
    PRIMARY KEY (nome, AnoTemp)
);


-- Tabela Estadio
CREATE TABLE Estadio (
    Nome VARCHAR(100),
    endereco VARCHAR(200),
    PRIMARY KEY (Nome, endereco), 
    Capacidade INT
);

-- Tabela Partida
CREATE TABLE Partida (
    Data DATE PRIMARY KEY,
    codTimeAdv INT,
    Sofridos INT,
    Feitos INT,
    NomeCamp VARCHAR(100),
    AnoTemporada VARCHAR(4),
    Publico INT,
    PublicoAdv INT,
    NomeEstadio VARCHAR(100),
    EnderecoEstadio VARCHAR(200),
    FOREIGN KEY (NomeCamp, AnoTemporada) REFERENCES Campeonato(Nome, AnoTemp),
    FOREIGN KEY (NomeEstadio, EnderecoEstadio) REFERENCES Estadio(Nome, endereco),
    FOREIGN KEY (codTimeAdv) REFERENCES Time(Codigo)
);

-- Tabela SocioTorcedor
CREATE TABLE SocioTorcedor (
    CPF VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100),
    Celular VARCHAR(15),
    Nascimento DATE,
    Email VARCHAR(100),
    Endereco VARCHAR(200)
);

-- Tabela Plano
CREATE TABLE Plano (
    Nome VARCHAR(100) PRIMARY KEY,
    Valor DECIMAL(10, 2)
);

-- Tabela Patrocinador
CREATE TABLE Patrocinador (
    CNPJ VARCHAR(18) PRIMARY KEY,
    Marca VARCHAR(100),
    MontanteInvestido DECIMAL(10, 2)
);

-- Tabela Joga
CREATE TABLE Joga (
    CPF VARCHAR(14),
    Data DATE,
    Posicao VARCHAR(100),
    PRIMARY KEY (CPF, Data),
    FOREIGN KEY (Data) REFERENCES Partida(Data),
    FOREIGN KEY (CPF) REFERENCES Jogador(CPF)
);

-- Tabela FazGol
CREATE TABLE FazGol (
    CPF VARCHAR(14),
    Data DATE,
    Minuto INT,
    PRIMARY KEY (CPF, Data),
    FOREIGN KEY (Data) REFERENCES Partida(Data),
    FOREIGN KEY (CPF) REFERENCES Jogador(CPF)
);

-- Tabela Vencido
CREATE TABLE Vencido (
    NomeCampeonato VARCHAR(100),
    AnoTemporada VARCHAR(4),
    PRIMARY KEY (NomeCampeonato, AnoTemporada),
    FOREIGN KEY (NomeCampeonato, AnoTemporada) REFERENCES Campeonato(nome, AnoTemp)
);

-- Tabela Assistem
CREATE TABLE Assistem (
    Data DATE,
    CPF VARCHAR(14),
    PRIMARY KEY (Data, CPF),
    FOREIGN KEY (Data) REFERENCES Partida(Data),
    FOREIGN KEY (CPF) REFERENCES SocioTorcedor(CPF)
);

-- Tabela Patrocina
CREATE TABLE Patrocina (
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    CNPJ VARCHAR(18),
    PRIMARY KEY (Nome),
    FOREIGN KEY (Nome, Endereco) REFERENCES Estadio(Nome, endereco),
    FOREIGN KEY (CNPJ) REFERENCES Patrocinador(CNPJ)
);

-- Tabela Paga
CREATE TABLE Paga (
    Nome VARCHAR(100),
    CPF VARCHAR(14),
    DataInicio DATE,
    DataFim DATE,
    PRIMARY KEY (CPF, Nome),
    FOREIGN KEY (CPF) REFERENCES SocioTorcedor(CPF),
    FOREIGN KEY (Nome) REFERENCES Plano(Nome)
);
