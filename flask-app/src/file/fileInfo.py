from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

fileInfo_blueprint = Blueprint('fileInfo_blueprint', __name__)


@fileInfo_blueprint.route('/fileTitle/<name>', methods=['GET'])
def get_searched_file_title(name):
    cursor = db.get_db().cursor()
    sql = 'SELECT title, first_name, last_name, isbn, image, lang, descriptions, text_type FROM file_info WHERE title LIKE %s'
    args = ['%' + name + '%']
    cursor.execute(sql, args)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@fileInfo_blueprint.route('/rating/<num>', methods=['GET'])
def get_searched_file_rating(num):
    cursor = db.get_db().cursor()
    sql = 'SELECT rating FROM rate where isbn = %s'
    arg = num
    cursor.execute(sql, arg)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@fileInfo_blueprint.route('/genre/<num>', methods=['GET'])
def get_genre(num):
    cursor = db.get_db().cursor()
    sql = 'SELECT genre_name FROM genre where isbn = %s'
    arg = num
    cursor.execute(sql, arg)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@fileInfo_blueprint.route('/addRating', methods=['POST'])
def add_searched_file_rating():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    rating = request.form['rating']
    isbn = request.form['isbn']
    acct_num = request.form['acct_num']
    query = f'INSERT INTO rate(isbn ,acct_num, rating) VALUES(\"{isbn}\", \"{acct_num}\", \"{rating}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

@fileInfo_blueprint.route('/addDownload', methods=['POST'])
def add_download():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    isbn = request.form['isbn']
    acct_num = request.form['acct_num']
    query = f'INSERT INTO download(isbn ,acct_num, date_down) VALUES(\"{isbn}\", \"{acct_num}\", CURRENT_DATE)'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

@fileInfo_blueprint.route('/editImage/<num>', methods=['POST'])
def edit_file_image(num):
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    image = request.form['image']
    query = f'UPDATE file_info SET image = \"{image}\" WHERE isbn = %s'
    cursor.execute(query, num)
    db.get_db().commit()
    return "Success!"

@fileInfo_blueprint.route('/editDescription/<num>', methods=['POST'])
def edit_file(num):
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    descriptions = request.form['descriptions']
    query = f'UPDATE file_info SET descriptions = \"{descriptions}\" WHERE isbn = %s'
    arg = num
    cursor.execute(query, arg)
    db.get_db().commit()
    return "Success!"

@fileInfo_blueprint.route('/editDate/<num>', methods=['POST'])
def edit_file_date(num):
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    acct_num = request.form['acct_num']
    query2 = f'UPDATE upload_edit SET acct_num = \"{acct_num}\" WHERE isbn = %s'
    arg = num
    cursor.execute(query2, arg)
    db.get_db().commit()
    return "Success!"

@fileInfo_blueprint.route('/file_type/<num>', methods=['GET'])
def get_file_type(num):
    cursor = db.get_db().cursor()
    sql = 'SELECT fileType FROM file_type where isbn = %s'
    arg = num
    cursor.execute(sql, arg)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response