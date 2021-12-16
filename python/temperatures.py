import mysql.connector
from mysql.connector import errorcode
# a function that takes connection and query and return everything in the list
def select(conn,query):
    cursor = conn.cursor()
    cursor.execute(query)
    results = []
    for row in cursor.fetchall():
        results.append(row)
    cursor.close()
    return results
   # a function that takes connection and query and commits the query 
def execute(conn,query):  # update, delete, and insert
    cursor = conn.cursor()
    cursor.execute(query)
    conn.commit()
    # a function that prints the resulttothe screen
def show(rows):
    for row in rows:
        print(row)
# trying to establish connection to the database
try:
    conn = mysql.connector.connect(
        user="root",
        password="",
        host="localhost",
        database="globaltemp")
except mysql.connector.Error as err:
    print("Cannot connect.")
    exit()
# storing query in variable
rows = select(conn,"select * from city c join state s join temperature t where c.Temperature_id=t.id & s.Temperature_id=t.id ")
# function call
show(rows)
print("Now insert a record")
# function call
execute(conn,"insert into city values (null,'NYC','Usa',14.8,122.6,1)")
# function call
rows = select(conn,"select * from city")
# function call
show(rows)