import os
import psycopg2

# Function to get database connection
def get_database_connection():
    db_name = os.environ.get('DB_NAME', 'postgres')
    db_user = os.environ.get('DB_USER','postgres')
    db_password = os.environ.get('DB_PASS','postgres')
    db_host = os.environ.get('DB_HOST', 'localhost')
    db_port = os.environ.get('DB_PORT', '5432')
    
    try:
        connection = psycopg2.connect(
            dbname=db_name,
            user=db_user,
            password=db_password,
            host=db_host,
            port=db_port
        )
        return connection
    except psycopg2.Error as e:
        print(f"Error connecting to the database: {e}")
        return None

# Function to display main menu options
def display_main_menu():
    print()
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("Menu Principal:")
    print("1. Buscar no banco")
    print("2. Atualizar banco")
    print("3. Sair")
    main_choice = input("Selecione sua escolha (1/2/3): ")
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print()
    return main_choice
    
# Function to display query menu options
def display_query_menu():
    print()
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("     Menu de Busca:")
    print("     1. Buscar jogadores que vieram emprestados de um certo time")
    print("     2. Buscar jogadores que fizem gols em uma certa partida com certa data")
    print("     3. Buscar socio torcedores que assinam plano acima de um certo preço")
    print("     4. Buscar dados de um funcionario com certo nome")
    print("     5. Buscar dados do contrato e do jogador com certo nome")
    print("     6. Sair")
    query_choice = input("     Selecione sua escolha (1/2/3/4/5/6): ")
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print()
    return query_choice

# Function to display update menu options
def display_update_menu():
    print()
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("     Menu de atualização:")
    print("     1. Atualizar salario de funcionario com certo CPF")
    print("     2. Atualizar data do contrato de um jogador com certo CPF")
    print("     3. Saida")
    insert_choice = input("     Selecione sua escolha (1/2/3): ")
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print()
    return insert_choice


def query_1(connection):
    cod_time = input("Favor inserir codigo do time: ")
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT * FROM jogador WHERE CPF IN (SELECT CPF FROM poremprestimo WHERE codTime = %s)",
                (cod_time,)
            )
            result = cursor.fetchall()
            cursor.execute(
                "SELECT Nome FROM Time WHERE time.codigo = %s",
                (cod_time,)
            )
            time = cursor.fetchone()
            if(result):
                print("Jogadores que vieram emprestados do" , time[0].replace('Time ', ''), ":")
                for row in result:
                    cursor.execute(
                        "SELECT Nome FROM Funcionario WHERE CPF = %s",
                        (row[0],)
                    )
                    nome = cursor.fetchone()
                    print("Nome:", nome[0])
                    print("CPF:", row[0])

            else:
                print("Nenhum jogador veio emprestado do", time[0].replace('Time ' , ''))
    except:
        print("Erro ao tentar buscar jogadores emprestados deste time")

def query_2(connection):
    partida_data = input("Favor inserir data da partida no formato (YYYY-MM-DD): ")
    print("\n")
    try:
        ##Informar nome dos jogadores que fizeram gol em uma certa partida com certa data
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT * FROM FazGol WHERE DATA = %s",
                (partida_data,)
            )

            result = cursor.fetchall()
            if(result):
                print("Jogadores que fizeram gol na partida do dia", partida_data, ":\n")
                for row in result:
                    cursor.execute(
                        "SELECT Nome FROM Funcionario WHERE CPF = %s",
                        (row[0],)
                    )
                    nome = cursor.fetchone()
                    print("O jogador", nome[0], "fez gol na partida do dia", partida_data, "no minuto", row[2])
            else:
                print("Nenhum jogador fez gol nesta partida ou não existe partida com esta data")
    except (connection):
        print("Erro ao tentar buscar jogadores que fizeram gols nesta partida")

def query_3(connection):
    price = input("Insira o valor minimo do plano: ")
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT * FROM SocioTorcedor WHERE CPF IN (SELECT CPF FROM Paga WHERE Nome IN (SELECT Nome FROM Plano WHERE Valor >= %s))",
                (price,)
            )
            result = cursor.fetchall()
            if(result):
                print("Socio torcedores que assinam plano de preco acima de RS", price, ":\n")
                for row in result:
                    print("Nome:", row[1])
                    print("CPF:", row[0])
                    print("Endereco:", row[5])
                    print("Telefone:", row[2])
                    print("Email:", row[4], "\n")
            else:
                print("Nenhum socio torcedor assina plano de um acima de um certo preço")
    except:
        print("Erro ao tentar buscar socio torcedores que assinam plano de um acima de um certo preço")
            
def query_4(connection):
    nome = input("Insira o nome do funcionario: ")
    try:
        with connection.cursor() as cursor:
            cursor.execute( "SELECT * FROM Funcionario WHERE Nome = %s ", (nome,) )
            result = cursor.fetchall()
            
            if(result):
                print("Dados Funcionario com nome: ", nome)
                for row in result:
                    print("Nome:", nome)
                    print("CPF:", row[0])
                    print("Data de Nascimento:", row[1])
                    print("salario:", row[3])
            else:
                print("Nenhum funcionario com nome: ", nome)
    except:
        print("Erro ao tentar buscar funcionario com nome: ", nome)
            
def query_5(connection):
    jogador_name = input("Insira o nome do jogador: ")
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "SELECT Contrato.*, Funcionario.Nome AS NomeFuncionario, Jogador.Assistencias, Jogador.FaltasFeitas, Jogador.FaltasSofridas, Jogador.Gols "
                "FROM Contrato "
                "JOIN Funcionario ON Contrato.CPF = Funcionario.CPF "
                "JOIN Jogador ON Contrato.CPF = Jogador.CPF "
                "WHERE Funcionario.Nome = %s",
                (jogador_name,)
            )
            result = cursor.fetchall()

            if result:
                print(f"Dados do jogador '{jogador_name}':")
                for row in result:
                    print("CPF:", row[0])
                    print("numContrato:", row[1])
                    print("DataFim:", row[2])
                    print("DataInicio:", row[3])
                    print()
            else:
                print(f"Sem informacoes encontradas para jogador '{jogador_name}'")
    except:
        print("Erro ao tentar buscar jogador com nome: ", jogador_name)


            
def update_1(connection):
    cpf = input("Insira o CPF do funcionario: ")
    new_salary = input("Insira o novo salario: ")
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "UPDATE Funcionario SET Salario = %s WHERE CPF = %s",
                (new_salary, cpf)
            )
            connection.commit()
            print("Salario atualizado com sucesso!")
    except:
        print("Erro ao tentar atualizar salario do funcionario")

def update_2(connection):
    cpf = input("Insira o cpf do jogador: ")
    new_contract_date = input("Favor inserir nova data do contrato no formato (YYYY-MM-DD): ")
    try:
        with connection.cursor() as cursor:
            cursor.execute(
                "UPDATE Contrato SET DataFim = %s WHERE CPF = %s",
                (new_contract_date, cpf)
            )
            connection.commit()
            print("Data do contrato atualizada com sucesso!")
    except:
        print("Erro ao tentar atualizar data do contrato do jogador")        
    

def main():
    connection = get_database_connection()
    if connection is None:
        return

    while True:
        main_choice = display_main_menu()

        if main_choice == '1':
            while True:
                query_choice = display_query_menu()
                if query_choice == '1':
                    query_1(connection)
                elif query_choice == '2':
                    query_2(connection)
                elif query_choice == '3':
                    query_3(connection)
                elif query_choice == '4':
                    query_4(connection)
                elif query_choice == '5':
                    query_5(connection)
                elif query_choice == '6':
                    break
                else:
                    print("Invalid choice. Please try again.")

        elif main_choice == '2':
            while True:
                update_choice = display_update_menu()
                if update_choice == '1':
                    update_1(connection)
                elif update_choice == '2':
                    update_2(connection)
                elif update_choice == '3':
                    break
                else:
                    print("Invalid choice. Please try again.")

        elif main_choice == '3':
            break
        
        else:
            print("Invalid choice. Please try again.")

    connection.close()

if __name__ == "__main__":
    main()
