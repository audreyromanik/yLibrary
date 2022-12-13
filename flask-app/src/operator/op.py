from flask import Blueprint, request, jsonify, make_response
import json
from src import db

op_blueprint = Blueprint('op_blueprint', __name__)

@op_blueprint.route('/operator', methods=['GET'])
def get_op():
    cursor = db.get_db().cursor()
    query = 'SELECT op_id as value, op_name as label FROM operator'
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@op_blueprint.route('/activity', methods=['GET'])
def get_activity():
    cursor = db.get_db().cursor()
    query = 'SELECT download.acct_num, download.isbn, date_down, date_up, date_edit FROM download JOIN upload_edit ON download.isbn = upload_edit.isbn ORDER BY date_edit DESC'
    cursor.execute(query)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response



