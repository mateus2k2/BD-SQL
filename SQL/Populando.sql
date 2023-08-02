-- Inserção de alguns funcionários
INSERT INTO Funcionario (CPF, DataNasc, Nome, Salario)
VALUES ('111.111.111-11', '1990-05-15', 'João da Silva', 5000.00),
       ('222.222.222-22', '1985-10-20', 'Maria Souza', 4500.00),
       ('444.444.444-44', '1995-02-28', 'Pedro Alves', 4800.00),
       ('555.555.555-55', '1988-04-20', 'Gabriel Almeida', 1500.00),
       ('666.666.666-66', '1991-06-12', 'Lucas Pereira', 2750.00),
       ('777.777.777-77', '1992-02-10', 'Gustavo Fernandes', 4800.00),
       ('888.888.888-88', '1990-05-30', 'Rafael Souza', 1450.00),
       ('999.999.999-99', '1991-10-31', 'Leonardo Rodrigues', 1450.00),
       ('596.136.570-02', '1977-08-04', 'Juliana Martins', 3200.00),
       ('505.818.210-68', '1989-12-17', 'Marcelo Ferreira', 9350.00),
       ('564.502.640-39', '1995-06-23', 'André Pereira', 8700.00),
       ('134.644.470-65', '1998-03-12', 'Ricardo Fernandes', 1450.00),
       ('002.408.890-02', '1985-09-28', 'Eduardo Gonçalves', 3200.00),
       ('102.279.040-44', '1993-04-15', 'Camila Lima', 4600.00),
       ('877.610.080-43', '1991-05-12', 'Natália Costa', 6200.00),
       ('883.600.480-61', '1989-05-10', 'Larissa Santos', 7400.00),
       ('655.670.770-84', '1989-06-12', 'Isabella Costa', 8150.00),
       ('472.336.560-53', '1992-05-10', 'Camila Lima', 9750.00),
       ('161.632.250-07', '1991-04-18', 'Gabriela Fernandes', 9300.00),
       ('620.227.270-88', '1989-05-20', 'Isabela Oliveira', 4150.00);

-- Inserção de alguns jogadores
INSERT INTO Jogador (CPF, Assistencias, FaltasFeitas, FaltasSofridas, Gols)
VALUES ('111.111.111-11', 10, 5, 8, 3),
       ('222.222.222-22', 5, 10, 4, 3),
       ('444.444.444-44', 20, 2, 10, 12),
       ('555.555.555-55', 8, 6, 5, 1),     
       ('564.502.640-39', 2, 10, 12, 12),
       ('134.644.470-65', 5, 1, 10, 11),
       ('002.408.890-02', 3, 20, 20, 4),
       ('102.279.040-44', 5, 10, 4, 6),
       ('877.610.080-43', 10, 20, 16, 12),
       ('883.600.480-61', 6, 9, 9, 6),
       ('655.670.770-84', 10, 10, 10, 12),
       ('472.336.560-53', 3, 3, 3, 5),
       ('161.632.250-07', 1, 1, 1, 1),
       ('620.227.270-88', 5, 5, 5, 5);

-- Inserção de dados de base
INSERT INTO DaBase (CPF, Categoria)
VALUES ('444.444.444-44', 'Sub-17'),
       ('555.555.555-55', 'Sub-20');

-- Inserção de alguns times
INSERT INTO Time (Codigo, Nome)
VALUES (1, 'Time Botafogo'),
       (2, 'Time Flamengo'),
       (3, 'Time Palmeiras'),
       (4, 'Time Grêmio'),
       (5, 'Time Fluminense'),
       (6, 'Time Bragantino'),
       (7, 'Time Cruzeiro'),
       (8, 'Time Santos'),
       (9, 'Time Corinthians'),
       (10, 'Time America');

-- Inserção de alguns estádios
INSERT INTO Estadio (Nome, endereco, Capacidade)
VALUES ('Mineirão', 'Rua dos Esportes, 123', 50000),
       ('Maracanã', 'Avenida dos Jogos, 789', 70000),
       ('Morumbi', 'Praça Tiradentes, 156', 60000),
       ('Itaquerão', 'Pampulha, 23', 65000);

-- Inserção de algumas partidas
INSERT INTO Partida (Data, codTimeAdv, Sofridos, Feitos, NomeCamp, Publico, PublicoAdv, NomeEstadio, EnderecoEstadio)
VALUES ('2023-08-01', 2, 0, 1, 'Libertadores', 30000, 20000, 'Mineirão', 'Rua dos Esportes, 123'),
       ('2023-09-15', 1, 1, 2, 'Brasileirão', 15000, 15000, 'Itaquerão', 'Pampulha, 23'),
       ('2023-06-01', 3, 2, 3, 'Estadual', 30000, 30000, 'Morumbi', 'Praça Tiradentes, 156'),
       ('2023-05-15', 4, 0, 2, 'Brasileirão', 15000, 15000, 'Maracanã', 'Avenida dos Jogos, 789'),
       ('2023-04-01', 5, 1, 1, 'Copa Do Brasil', 20000, 20000, 'Mineirão', 'Rua dos Esportes, 123'),
       ('2023-03-15', 6, 0, 2, 'Estadual', 15000, 25000, 'Itaquerão', 'Pampulha, 23'),
       ('2023-02-01', 7, 2, 1, 'Libertadores', 25000, 20000, 'Morumbi', 'Praça Tiradentes, 156'),
       ('2023-01-15', 8, 3, 4, 'Brasileirão', 15000, 35000, 'Itaquerão', 'Pampulha, 23'),
       ('2023-10-01', 9, 0, 0, 'Estadual', 30000, 20000, 'Mineirão', 'Rua dos Esportes, 123'),
       ('2023-11-15', 10, 4, 2, 'Brasileirão', 15000, 25000, 'Maracanã', 'Avenida dos Jogos, 789'),
       ('2023-12-01', 8, 0, 2, 'Libertadores', 10000, 20000, 'Mineirão', 'Rua dos Esportes, 123'),
       ('2023-09-30', 9, 2, 1, 'Brasileirão', 25000, 25000, 'Maracanã', 'Avenida dos Jogos, 789'),
       ('2023-08-20', 7, 1, 3, 'Copa Do Brasil', 20000, 20000, 'Morumbi', 'Praça Tiradentes, 156'),
       ('2023-05-10', 6, 3, 1, 'Estadual', 15000, 20000, 'Maracanã', 'Avenida dos Jogos, 789');

-- Inserção de algumas especialidades de técnico
INSERT INTO EspecialidadeTecnico (Tipo)
VALUES ('Ofensivo'),
       ('Defensivo'),
       ('Equilibrado');

-- Inserção de algumas especialidades de médico
INSERT INTO EspecialidadeMedico (Tipo)
VALUES ('Ortopedista'),
       ('Cardiologista'),
       ('Fisioterapeuta');

-- Inserção de alguns técnicos
INSERT INTO Tecnico (CPF, Vitorias, derrotas, especialidade)
VALUES ('888.888.888-88', 15, 5, 'Ofensivo'),
       ('999.999.999-99', 10, 8, 'Defensivo'),
       ('596.136.570-02', 20, 9, 'Equilibrado');
      
-- Inserção de alguns médicos
INSERT INTO Medico (CPF, CRM, especialidade)
VALUES ('666.666.666-66', '12345', 'Ortopedista'),
       ('777.777.777-77', '54321', 'Cardiologista'),
       ('505.818.210-68', '67890', 'Fisioterapeuta');

-- Inserção de alguns contratos
INSERT INTO Contrato (CPF, numContrato, DataFim, DataInicio)
VALUES ('111.111.111-11', 1, '2023-12-31', '2023-01-01'),
       ('444.444.444-44', 2, '2024-11-27', '2022-01-06'),
       ('620.227.270-88', 3, '2024-10-24', '2020-07-11'),
       ('222.222.222-22', 4, '2024-09-21', '2022-06-01'),
       ('161.632.250-07', 5, '2023-08-18','2021-06-21'),
       ('555.555.555-55', 6, '2024-07-15', '2021-05-10'),
       ('666.666.666-66', 7, '2025-06-12', '2020-04-05'),
       ('777.777.777-77', 8, '2025-05-09', '2020-03-09'),
       ('888.888.888-88', 9, '2024-04-06', '2018-02-08'),
       ('999.999.999-99', 10, '2025-03-03', '2019-07-04'),
       ('596.136.570-02', 11, '2024-02-01', '2019-08-12'),
       ('505.818.210-68', 12, '2026-01-04', '2022-09-15'),
       ('564.502.640-39', 13, '2025-02-07', '2023-10-027'),
       ('134.644.470-65', 14, '2024-03-10', '2021-11-23'),
       ('002.408.890-02', 15, '2025-04-13', '2020-12-22'),
       ('102.279.040-44', 16, '2025-05-16', '2019-01-11'),
       ('877.610.080-43', 17, '2024-06-19', '2018-02-10'),
       ('883.600.480-61', 18, '2025-07-22', '2017-03-07'),
       ('655.670.770-84', 19, '2026-08-25', '2022-04-06'),
       ('472.336.560-53', 20, '2025-09-28', '2023-05-02');
       
-- Inserção de algumas temporadas
INSERT INTO Temporada (ano, Empates, Derrotas, Vitorias, Sofridos, Feitos)
VALUES ('2023', 42, 47, 29, 100, 80),
       ('2022', 33, 45, 38, 80, 90),
       ('2021', 30, 42, 35, 87, 93),
       ('2020', 25, 29, 27, 110, 120),
       ('2019', 56, 29, 27, 90, 90),
       ('2018', 93, 58, 45, 105, 110);

-- Inserção de alguns campeonatos
INSERT INTO Campeonato (nome, Empates, Derrotas, Vitorias, Posicao, Sofridos, Feitos, AnoTemp)
VALUES ('Brasileirão', 15, 10, 3, 15, 10, 40, '2023'),
       ('Libertadores', 10, 12, 8, 3, 30, 20, '2023'),
       ('Copa Do Brasil', 12, 8, 8, 7, 30, 10, '2023'),
       ('Estadual', 5, 17, 10, 9, 30, 10, '2023'),
       ('Brasileirão', 10, 15, 10, 4, 20, 30, '2022'),
       ('Libertadores', 12, 18, 12, 10, 22, 20, '2022'),
       ('Copa Do Brasil', 7, 6, 10, 8, 15, 23, '2022'),
       ('Estadual', 6, 6, 6, 3, 23, 17, '2022'),
       ('Brasileirão', 10, 8, 10, 1, 20, 20, '2021'),
       ('Libertadores', 5, 10, 8, 2, 15, 30, '2021'),
       ('Copa Do Brasil', 5, 15, 8, 8, 22, 21, '2021'),
       ('Estadual', 10, 9, 9, 3, 22, 21, '2021'),
       ('Brasileirão', 8, 5, 3, 18, 20, 40, '2020'),
       ('Libertadores', 5, 8, 8, 5, 30, 20, '2020'),
       ('Copa Do Brasil', 6, 8, 8, 1, 30, 35, '2020'),
       ('Estadual', 6, 8, 8, 2, 30, 25, '2020'),
       ('Brasileirão', 20, 5, 1, 1, 20, 25, '2019'),
       ('Libertadores', 12, 8, 8, 5, 20, 15, '2019'),
       ('Copa Do Brasil', 12, 8, 8, 13, 25, 24, '2019'),
       ('Estadual', 12, 8, 8, 10, 25, 26, '2019'),
       ('Brasileirão', 25, 15, 15, 2, 27, 17, '2018'),
       ('Libertadores', 23, 16, 7, 7, 33, 40, '2018'),
       ('Copa Do Brasil', 16, 15, 10, 6, 25, 23, '2018'),
       ('Estadual', 29, 12, 13, 5, 30, 30, '2018');

-- Inserção de alguns sócios-torcedores
INSERT INTO SocioTorcedor (CPF, Nome, Celular, Nascimento, Email, Endereco)
VALUES ('837.836.670-70', 'Carlos Oliveira', '(11) 99999-1111', '1992-08-20', 'carlos@example.com', 'Rua das Torcidas, 45'),
       ('425.691.180-44', 'Ana Rodrigues', '(22) 98888-2222', '1988-05-10', 'ana@example.com', 'Avenida dos Gritos, 2'),
       ('941.433.820-91', 'Romulo Junior', '(32) 93333-2222', '1985-03-15', 'romulo@example.com', 'Praça da Liberdade, 1'),
       ('813.784.310-81', 'Ederson Junior', '(12) 92222-1111', '1979-11-02', 'ederson@example.com', 'Alameda das Palmeiras, 122'),
       ('368.857.300-50', 'Mateus Felipe', '(11) 91234-5678', '2000-09-10', 'mateus@example.com', 'Travessa dos Passarinhos, 131'),
       ('829.671.190-75', 'Guilherme Salim', '(21) 99999-1234', '1998-05-30', 'guilherme@example.com', 'Estrada das Montanhas, 643'),
       ('260.494.770-60', 'Pedro Python', '(31) 98888-5678', '1982-12-25', 'pedro@example.com', 'Viela das Estrelas, 252'),
       ('954.279.610-20', 'Arthur Bermond', '(41) 97777-4444', '1995-07-08', 'bermond@example.com', 'Rodovia das Maravilhas, 166'),
       ('472.844.150-45', 'Arthur Negrão', '(51) 96666-9999', '1976-04-18', 'negrão@example.com', 'Largo das Fontes, 142'),
       ('308.334.040-08', 'Guilherme Salim', '(62) 95555-2222', '2002-10-05', 'salim@example.com', 'Beco das Artes, 60'),
       ('186.862.250-98', 'Lucas Ferreira', '(71) 94444-8888', '1989-01-12', 'lucas@example.com', 'Avenida dos Sonhos, 46'),
       ('518.462.970-01', 'Mauro Paulino', '(81) 93333-5555', '1973-06-28', 'mauro@example.com', 'Rua das Flores, 36'),
       ('868.509.060-11', 'Marcella Silveira', '(92) 92222-7777', '2003-10-03', 'marcella@example.com', 'Viela dos Segredos, 24'),
       ('528.157.760-30', 'Tarciane Cardoso', '(99) 91111-6666', '1986-04-11', 'tarciane@example.com', 'Largo das Lembranças, 12');

-- Inserção de alguns planos para sócios-torcedores
INSERT INTO Plano (Nome, Valor)
VALUES ('Plano Básico', 50.00),
       ('Plano Premium', 200.00),
       ('Plano Prata', 70.00),
       ('Plano Ouro', 100.00),
       ('Plano Bronze', 30.00);


-- Inserção de alguns patrocinadores
INSERT INTO Patrocinador (CNPJ, Marca, MontanteInvestido)
VALUES ('11.111.111/0001-11', 'Nike', 500000.00),
       ('22.222.222/0001-22', 'Adidas', 300000.00),
       ('33.333.333/0001-33', 'Umbro', 200000.00),
       ('44.444.444/0001-44', 'Dell', 400000.00);

-- Inserção de jogadores que jogaram em partidas
INSERT INTO Joga (CPF, Data, Posicao)
VALUES ('111.111.111-11', '2023-08-01', 'Atacante'),
       ('444.444.444-44', '2023-09-15', 'Zagueiro'),
       ('222.222.222-22', '2023-06-01', 'Volante'),
       ('555.555.555-55', '2023-05-15', 'Atacante'),
       ('564.502.640-39', '2023-04-01', 'Volante'),
       ('134.644.470-65', '2023-03-15', 'Atacante'),
       ('002.408.890-02', '2023-01-15', 'Zagueiro'),
       ('102.279.040-44', '2023-11-15', 'Volante'),
       ('877.610.080-43', '2023-10-01', 'Atacante'),
       ('883.600.480-61', '2023-10-01', 'Zagueiro'),
       ('655.670.770-84', '2023-09-30', 'Volante'),
       ('472.336.560-53', '2023-05-10', 'Zagueiro'),
       ('620.227.270-88', '2023-08-20', 'Atacante');
       
-- Inserção de mais gols em partidas
INSERT INTO FazGol (CPF, Data, Minuto)
VALUES ('111.111.111-11', '2023-10-01', 60),
       ('444.444.444-44', '2023-09-30', 70),
       ('134.644.470-65', '2023-06-01', 20),
       ('620.227.270-88', '2023-04-01', 50);

-- Inserção de campeonatos vencidos por temporadas
INSERT INTO Vencido (NomeCampeonato, AnoTemporada)
VALUES ('Brasileirão', '2021'),
       ('Brasileirão', '2019'),
       ('Copa Do Brasil', '2019');


-- Inserção de sócios-torcedores que assistiram a partidas
INSERT INTO Assistem (Data, CPF)
VALUES ('2023-10-01', '837.836.670-70'),
       ('2023-08-20', '425.691.180-44'),
       ('2023-01-15', '368.857.300-50');

-- Inserção de estádios que são patrocinados por patrocinadores
INSERT INTO Patrocina (Nome, Endereco, CNPJ)
VALUES ('Mineirão', 'Rua dos Esportes, 123', '11.111.111/0001-11'),
       ('Maracanã', 'Avenida dos Jogos, 789', '22.222.222/0001-22');

-- Inserção de pagamentos de sócios-torcedores
INSERT INTO Paga (Nome, CPF, DataInicio, DataFim)
VALUES ('Plano Básico', '837.836.670-70', '2023-01-01', '2023-12-31'),
       ('Plano Premium', '425.691.180-44', '2023-01-01', '2023-12-31');

-- Inserção de jogadores emprestados a outros times
INSERT INTO Emprestado (CPF, Porcentagem, codTime, Data)
VALUES ('555.555.555-55', 50.00, 3, '2023-07-01'),
       ('444.444.444-44', 30.00, 4, '2023-07-15');

-- Inserção de jogadores emprestados por outros times
INSERT INTO PorEmprestimo (CPF, Porcentagem, codTime, Data)
VALUES ('111.111.111-11', 20.00, 5, '2023-07-01'),
       ('444.444.444-44', 15.00, 6, '2023-07-15');      
      