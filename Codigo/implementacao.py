import os
import psycopg2

# Function to get database connection
def get_database_connection():
    db_name = os.environ.get('DB_NAME', 'BDTime')
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
    print("Main Menu:")
    print("1. Query data")
    print("2. Update data")
    print("3. Exit")
    main_choice = input("Enter your choice (1/2/3): ")
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print()
    return main_choice
    
# Function to display query menu options
def display_query_menu():
    print()
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("     Query Menu:")
    print("     1. Query Jogadores que Vieram Emprestados de Um certo time")
    print("     2. Query Jogadores que fizem gols em uma certa Partida com certa Data")
    print("     3. Query Socio torcedores que assinam plano de um acima de um certo preço")
    print("     4. Query Dados Funcionario com certo nome")
    print("     5. Query Dados do Contrato e do Jogador com certo nome")
    print("     6. Exit")
    query_choice = input("     Enter your choice (1/2/3/4/5/6): ")
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print()
    return query_choice

# Function to display update menu options
def display_update_menu():
    print()
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("     update Menu:")
    print("     1. Update Funcionario com certo salario para outro salario")
    print("     2. Update Contrato de um Jogador para uma outra data")
    print("     3. Exit")
    insert_choice = input("     Enter your choice (1/2/3): ")
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print()
    return insert_choice


def query_1(connection):
    cod_time = input("Enter the code of the time: ")
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM Jogador WHERE CPF IN (SELECT CPF FROM poremprestimo WHERE codTime = %s)",
            (cod_time,)
        )
        result = cursor.fetchall()
        if(result):
            print("Jogadores que Vieram Emprestados de Um certo time:")
            for row in result:
                print(row)
        else:
            print("Nenhum jogador veio emprestado de um certo time")

def query_2(connection):
    partida_data = input("Enter the date of the partida (YYYY-MM-DD): ")
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM Jogador WHERE CPF IN (SELECT CPF FROM FazGol WHERE Data = %s)",
            (partida_data,)
        )
        result = cursor.fetchall()
        if(result):
            print("Jogadores que fizeram gols em uma certa Partida com certa Data:")
            for row in result:
                print(row)
        else:
            print("Nenhum jogador fez gol em uma certa Partida com certa Data")

def query_3(connection):
    price = input("Enter the price of the plano: ")
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM SocioTorcedor WHERE CPF IN (SELECT CPF FROM Paga WHERE Nome IN (SELECT Nome FROM Plano WHERE Valor >= %s))",
            (price,)
        )
        result = cursor.fetchall()
        if(result):
            print("Socio torcedores que assinam plano de um acima de um certo preço:")
            for row in result:
                print(row)
        else:
            print("Nenhum socio torcedor assina plano de um acima de um certo preço")
            
def query_4(connection):
    nome = input("Enter the name of a funcionario: ")
    with connection.cursor() as cursor:
        cursor.execute( "SELECT * FROM Funcionario WHERE Nome = %s ", (nome,) )
        result = cursor.fetchall()
        
        if(result):
            print("Dados Funcionario com nome: ", nome)
            for row in result:
                print(row)
        else:
            print("Nenhum funcionario com nome: ", nome)
            
def query_5(connection):
    jogador_name = input("Enter the name of the jogador: ")
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
            print(f"Contrato data for jogador with name '{jogador_name}':")
            for row in result:
                print("CPF:", row[0])
                print("numContrato:", row[1])
                print("DataFim:", row[2])
                print("DataInicio:", row[3])
                print()
        else:
            print(f"No contrato data found for jogador with name '{jogador_name}'")


            
def update_1(connection):
    cpf = input("Enter the CPF of the funcionario: ")
    new_salary = input("Enter the new salary: ")
    with connection.cursor() as cursor:
        cursor.execute(
            "UPDATE Funcionario SET Salario = %s WHERE CPF = %s",
            (new_salary, cpf)
        )
        connection.commit()
        print("Salary updated successfully!")

def update_2(connection):
    cpf = input("Enter the CPF of the jogador: ")
    new_contract_date = input("Enter the new contract date (YYYY-MM-DD): ")
    with connection.cursor() as cursor:
        cursor.execute(
            "UPDATE Contrato SET DataFim = %s WHERE CPF = %s",
            (new_contract_date, cpf)
        )
        connection.commit()
        print("Contract date updated successfully!")



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
                insert_choice = display_update_menu()
                if insert_choice == '1':
                    update_1(connection)
                elif insert_choice == '2':
                    update_2(connection)
                elif insert_choice == '3':
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
