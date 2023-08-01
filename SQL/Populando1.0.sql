-- Inserção de alguns funcionários
INSERT INTO Funcionario (CPF, DataNasc, Nome, Salario)
VALUES ('111.111.111-11', '1990-05-15', 'João da Silva', 5000.00),
       ('222.222.222-22', '1985-10-20', 'Maria Souza', 4500.00),
       ('444.444.444-44', '1995-02-28', 'Pedro Alves', 4800.00),
       ('555.555.555-55', '1995-02-28', 'Pedro Alves', 4800.00),
       ('666.666.666-66', '1995-02-28', 'Pedro Alves', 4800.00),
       ('777.777.777-77', '1995-02-28', 'Pedro Alves', 4800.00),
       ('888.888.888-88', '1995-02-28', 'Pedro Alves', 4800.00),
       ('999.999.999-99', '1995-02-28', 'Pedro Alves', 4800.00);
       

-- Inserção de alguns jogadores
INSERT INTO Jogador (CPF, Assistencias, FaltasFeitas, FaltasSofridas, Gols)
VALUES ('111.111.111-11', 10, 5, 8, 3),
       ('444.444.444-44', 20, 2, 10, 12),
       ('555.555.555-55', 8, 6, 5, 1);

-- Inserção de dados de base
INSERT INTO DaBase (CPF, Categoria)
VALUES ('444.444.444-44', 'Sub-17'),
       ('555.555.555-55', 'Sub-20');

-- Inserção de alguns times
INSERT INTO Time (Codigo, Nome)
VALUES (1, 'Time A'),
       (2, 'Time B'),
       (3, 'Time B'),
       (4, 'Time B'),
       (5, 'Time B'),
       (6, 'Time B');

-- Inserção de algumas especialidades de técnico
INSERT INTO EspecialidadeTecnico (Tipo)
VALUES ('Ofensivo'),
       ('Defensivo');

-- Inserção de algumas especialidades de médico
INSERT INTO EspecialidadeMedico (Tipo)
VALUES ('Ortopedista'),
       ('Cardiologista');

-- Inserção de alguns médicos
INSERT INTO Medico (CPF, CRM, especialidade)
VALUES ('666.666.666-66', '12345', 'Ortopedista'),
       ('777.777.777-77', '54321', 'Cardiologista');

-- Inserção de alguns técnicos
INSERT INTO Tecnico (CPF, Vitorias, derrotas, especialidade)
VALUES ('888.888.888-88', 15, 5, 'Ofensivo'),
       ('999.999.999-99', 10, 8, 'Defensivo');

-- Inserção de alguns contratos
INSERT INTO Contrato (CPF, numContrato, DataFim, DataInicio)
VALUES ('111.111.111-11', 1, '2023-12-31', '2023-01-01'),
       ('444.444.444-44', 2, '2023-12-31', '2023-01-01');

-- Inserção de algumas temporadas
INSERT INTO Temporada (ano, Empates, Derrotas, Vitorias, Feitos, Sofridos)
VALUES ('2023', 5, 8, 15, 40, 30),
       ('2022', 3, 10, 10, 25, 35);

-- Inserção de alguns campeonatos
INSERT INTO Campeonato (nome, Vitorias, Derrotas, Empates, Posicao, Sofridos, Feitos, AnoTemp)
VALUES ('Campeonato A', 20, 5, 3, 1, 20, 70, '2023'),
       ('Campeonato B', 12, 8, 8, 3, 30, 55, '2023');

-- Inserção de alguns estádios
INSERT INTO Estadio (Nome, endereco, Capacidade)
VALUES ('Estádio Principal', 'Rua dos Esportes, 123', 50000),
       ('Estádio Secundário', 'Avenida dos Jogos, 789', 30000);

-- Inserção de algumas partidas
INSERT INTO Partida (Data, codTimeAdv, Sofridos, Feitos, NomeCamp, Publico, PublicoAdv, NomeEstadio)
VALUES ('2023-07-01', 2, 1, 2, 'Campeonato A', 40000, 20000, 'Estádio Principal'),
       ('2023-07-15', 1, 2, 2, 'Campeonato A', 35000, 35000, 'Estádio Secundário');

-- Inserção de alguns sócios-torcedores
INSERT INTO SocioTorcedor (CPF, Nome, Celular, Nascimento, Email, Endereco)
VALUES ('111.111.111-11', 'Carlos Oliveira', '(11) 99999-1111', '1992-08-20', 'carlos@example.com', 'Rua das Torcidas, 456'),
       ('222.222.222-22', 'Ana Rodrigues', '(22) 98888-2222', '1988-05-10', 'ana@example.com', 'Avenida dos Gritos, 789');

-- Inserção de alguns planos para sócios-torcedores
INSERT INTO Plano (Nome, Valor)
VALUES ('Plano Básico', 50.00),
       ('Plano Premium', 100.00);

-- Inserção de alguns patrocinadores
INSERT INTO Patrocinador (CNPJ, Marca, MontanteInvestido)
VALUES ('11.111.111/0001-11', 'Marca X', 500000.00),
       ('22.222.222/0001-22', 'Marca Y', 300000.00);

-- Inserção de jogadores que jogaram em partidas
INSERT INTO Joga (CPF, Data, Posicao)
VALUES ('111.111.111-11', '2023-07-01', 'Atacante'),
       ('444.444.444-44', '2023-07-01', 'Zagueiro');
       
-- Inserção de mais gols em partidas
INSERT INTO FazGol (CPF, Data, Minuto)
VALUES ('111.111.111-11', '2023-07-01', 60),
       ('444.444.444-44', '2023-07-01', 70),
       ('111.111.111-11', '2023-07-15', 20),
       ('555.555.555-55', '2023-07-15', 50);

-- Inserção de campeonatos vencidos por temporadas
INSERT INTO Vencido (NomeCampeonato, AnoTemporada)
VALUES ('Campeonato A', '2023'),
       ('Campeonato B', '2022');

-- Inserção de sócios-torcedores que assistiram a partidas
INSERT INTO Assistem (Data, CPF)
VALUES ('2023-07-01', '111.111.111-11'),
       ('2023-07-01', '222.222.222-22'),
       ('2023-07-15', '111.111.111-11');

-- Inserção de estádios que são patrocinados por patrocinadores
INSERT INTO Patrocina (Nome, CNPJ)
VALUES ('Estádio Principal', '11.111.111/0001-11'),
       ('Estádio Secundário', '22.222.222/0001-22');

-- Inserção de pagamentos de sócios-torcedores
INSERT INTO Paga (Nome, CPF, DataInicio, DataFim)
VALUES ('Plano Básico', '111.111.111-11', '2023-01-01', '2023-12-31'),
       ('Plano Premium', '222.222.222-22', '2023-01-01', '2023-12-31');

-- Inserção de jogadores emprestados a outros times
INSERT INTO Emprestado (CPF, Porcentagem, codTime, Data)
VALUES ('555.555.555-55', 50.00, 3, '2023-07-01'),
       ('444.444.444-44', 30.00, 4, '2023-07-15');

-- Inserção de jogadores emprestados por outros times
INSERT INTO PorEmprestimo (CPF, Porcentagem, codTime, Data)
VALUES ('111.111.111-11', 20.00, 5, '2023-07-01'),
       ('444.444.444-44', 15.00, 6, '2023-07-15');      
      
