from faker import Faker
from datetime import datetime, timedelta

fake = Faker()
s_date = datetime(2023, 1, 1, 0, 0, 0)
e_date = datetime(2023, 6, 30, 23, 59, 59)

# Génération des données aléatoires pour 100 utilisateurs
users = []
for _ in range(100):
    user_data = {
        "firstname": fake.first_name(),
        "lastname": fake.last_name(),
        "email": fake.email(),
        "username":fake.user_name(),
        "password":fake.password(),
        "created_at":fake.date_time_between(start_date=s_date, end_date=e_date).strftime("%Y-%m-%d %H:%M:%S")
    }
    users.append(user_data)

# Génération des données aléatoires pour 85 emails
email_verifications = []
for user_id in range(1, 86):
    verification_data = {
        "user_id": user_id,
        "verified_at":fake.date_time_between(start_date=s_date, end_date=e_date).strftime('%Y-%m-%d %H:%M:%S')         
    }
    email_verifications.append(verification_data)
        
# Génération des données aléatoires pour 1000 sessions
sessions = []
for user_id in range(1, 101):
    # 10 utilisateurs par session
    for _ in range(10):
        session_data = {
            "user_id": user_id,
            "connected_at" : fake.date_time_between(start_date=s_date, end_date=e_date).strftime('%Y-%m-%d %H:%M:%S'), 
        }
        sessions.append(session_data) 


# Requêtes d'insertion
with open("part_1_2.sql", "w") as file:
    # On écrit nos requêtespour l'insertion des utilisateurs
    for user_data in users:
        file.write(f"INSERT INTO user_table (firstname, lastname, email, username, password, created_at) VALUES "
                   f"('{user_data['firstname']}', '{user_data['lastname']}', '{user_data['email']}', "
                   f"'{user_data['username']}', '{user_data['password']}', '{user_data['created_at']}');\n")

    for verification_data in email_verifications:
        file.write(f"INSERT INTO user_email_verification (user_id, verified_at) VALUES "
                   f"({verification_data['user_id']}, '{verification_data['verified_at']}');\n")
        
    for session_data in sessions:
        file.write(f"INSERT INTO session_table (user_id, connected_at) VALUES "
                   f"({session_data['user_id']}, '{session_data['connected_at']}');\n")