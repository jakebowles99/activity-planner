# app.py
#https://webdamn.com/create-restful-api-using-python-mysql/
from flask import Flask
from flaskext.mysql import MySQL
import pymysql
from flask import jsonify
from flask import flash, request

app = Flask(__name__)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'adminuser'
app.config['MYSQL_DATABASE_PASSWORD'] = 'M0Nday123!?***!'
app.config['MYSQL_DATABASE_DB'] = 'devtest'
app.config['MYSQL_DATABASE_HOST'] = 'activity-planner-dev.mysql.database.azure.com'
mysql.init_app(app)

@app.route("/")
def hello_world():
    
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("SELECT * FROM persons")
    empRow = cursor.fetchone()
    respone = jsonify(empRow)
    respone.status_code = 200
    return respone

# if __name__ == '__main__':
#    app.run(debug = True)