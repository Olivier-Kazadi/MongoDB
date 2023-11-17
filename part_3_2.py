import psycopg2
import time

# A remplacer par les valeurs adéquates
host = "localhost"
database = "app_auth"
user = "your_user"
password = "your_password"

# Connexion à la base de données
conn = psycopg2.connect (
    host=host,
    database = database,
    user = user,
    password = password
)

# Création d'un curseur
cur = conn.cursor()

# Liste des usernames pour lesquels vous souhaitez mesurer le temps d'execution
usernames = ["username1", "username2", "username3"]

# Mesure du temps d'execution pour chaque username
for username in usernames:
    start_time = time.time()
    
    # Requete SELECT avec un filtre WHERE sur username
    cur.execute(f"SELECT * FROM user_for_comparison WHERE username = '{username}'")
    
    end_time = time.time()
    execution_time = end_time - start_time
    
    print(f"Username: {username}, Temps d'execution: {execution_time} secondes")
    
# Fermeture du curseur et de la connexion
cur.close()
conn.close()