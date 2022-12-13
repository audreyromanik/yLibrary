from flask import Blueprint, request, jsonify, make_response
import json
from src import db

users_blueprint = Blueprint('users_blueprint', __name__)

@users_blueprint.route('/users', methods=['GET'])
def get_users():
    cursor = db.get_db().cursor()
    query = 'SELECT acct_num as value, username as label FROM users'
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

