# app.py
#https://webdamn.com/create-restful-api-using-python-mysql/
from flask import Flask
from flaskext.mysql import MySQL
import pymysql
from flask import jsonify
from flask import flash, request
from flask_cors import CORS, cross_origin
import os

app = Flask(__name__)
CORS(app)

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'adminuser'
app.config['MYSQL_DATABASE_PASSWORD'] = os.getenv("MYSQL_ROOT_PASSWORD")
app.config['MYSQL_DATABASE_DB'] = 'devtest'
app.config['MYSQL_DATABASE_HOST'] = 'activity-planner-dev.mysql.database.azure.com'
mysql.init_app(app)

#127.0.0.1:5000/id?id=1
@app.route('/data', methods=['GET'])
def getData():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("SELECT * FROM persons")
    empRow = cursor.fetchall()
    respone = jsonify(empRow)
    respone.status_code = 200
    return respone

#127.0.0.1:5000/data with content-type
@app.route('/id', methods=['POST'])
def getId():
    request_data = request.get_json()
    id = request_data['id']
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute("SELECT * FROM persons WHERE PersonID =%s",id)
    empRow = cursor.fetchone()
    respone = jsonify(empRow)
    respone.status_code = 200
    return respone

@app.route('/add', methods=['POST'])
def addData():
    try:
        request_data = request.get_json()
        address = request_data['address']
        city = request_data['city']
        firstname = request_data['firstname']
        lastname = request_data['lastname']

        sqlQuery = ("INSERT INTO persons (Address, City, FirstName, LastName) \
        VALUES (%s, %s, %s, %s)")
        bindData = (address, city, firstname, lastname)

        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.execute(sqlQuery,bindData)
        conn.commit()

        respone = jsonify('Employee updated successfully!')
        respone.status_code = 200
        return respone
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close() 