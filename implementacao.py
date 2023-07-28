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
    print("Main Menu:")
    print("1. Query data")
    print("2. Update data")
    print("3. Exit")

# Function to display query menu options
def display_query_menu():
    print("Query Menu:")
    print("1. Query Jogadores que Vieram Emprestados de Um certo time")
    print("2. Query Jogadores que fizem gols em uma certa Partida com certa Data")
    print("3. Query Socio torcedores que assinam plano de um acima de um certo preço")
    print("4. Exit")

# Function to display insert menu options
def display_insert_menu():
    print("Insert Menu:")
    print("1. Update Funcionario com certo salario para outro salario")
    print("2. Update Contrato de um Jogador para uma outra data")
    print("3. Exit")



def query_1(connection):
    cod_time = input("Enter the code of the time: ")
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM Jogador WHERE CPF IN (SELECT CPF FROM poremprestimo WHERE codTime = %s)",
            (cod_time,)
        )
        result = cursor.fetchall()
        print("Jogadores que Vieram Emprestados de Um certo time:")
        for row in result:
            print(row)

def query_2(connection):
    partida_data = input("Enter the date of the partida (YYYY-MM-DD): ")
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM Jogador WHERE CPF IN (SELECT CPF FROM FazGol WHERE Data = %s)",
            (partida_data,)
        )
        result = cursor.fetchall()
        print("Jogadores que fizeram gols em uma certa Partida com certa Data:")
        for row in result:
            print(row)

def query_3(connection):
    price = input("Enter the price of the plano: ")
    with connection.cursor() as cursor:
        cursor.execute(
            "SELECT * FROM SocioTorcedor WHERE CPF IN (SELECT CPF FROM Paga WHERE Nome IN (SELECT Nome FROM Plano WHERE Valor >= %s))",
            (price,)
        )
        result = cursor.fetchall()
        print("Socio torcedores que assinam plano de um acima de um certo preço:")
        for row in result:
            print(row)

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
        display_main_menu()
        main_choice = input("Enter your choice (1/2/3): ")

        if main_choice == '1':
            while True:
                display_query_menu()
                query_choice = input("Enter your choice (1/2/3/4): ")
                if query_choice == '1':
                    query_1(connection)
                elif query_choice == '2':
                    query_2(connection)
                elif query_choice == '3':
                    query_3(connection)
                elif query_choice == '4':
                    break
                else:
                    print("Invalid choice. Please try again.")

        elif main_choice == '2':
            while True:
                display_insert_menu()
                insert_choice = input("Enter your choice (1/2/3): ")
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
