# app.py

from flask import Flask
import mysql.connector


app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello, World!"
    # cnx = mysql.connector.connect(user="adminuser", password="M0Nday123!?***!", host="activity-planner-dev.mysql.database.azure.com", port=3306, database="devtest", ssl_ca="CA.crt.pem", ssl_disabled=False)
    # query = ("SELECT * FROM persons")
    # cursor = cnx.cursor(query)

    # for (first_name, last_name in cursor:
    # print("{}, {}".format(
    #     last_name, first_name))


# if __name__ == '__main__':
#    app.run(debug = True)