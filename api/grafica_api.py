from flask import Flask, jsonify
import mysql.connector
from flask_cors import CORS  # Importa CORS

app = Flask(__name__)
CORS(app)  # Habilita CORS para toda la aplicación

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'parcial'   
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/entidades-personas', methods=['GET'])
def get_entidades_personas():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT entidad, personas FROM entidad_personas")
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(results)

@app.route('/usuarios-tipo', methods=['GET'])
def get_usuarios_tipo():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("""
        SELECT 'docente' AS tipo, COUNT(*) AS cantidad FROM docente
        UNION
        SELECT 'estudiante' AS tipo, COUNT(*) AS cantidad FROM estudiante
    """)
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(results)

@app.route('/permisos-sede', methods=['GET'])
def get_permisos_sede():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("""
        SELECT sede_id, COUNT(*) AS cantidad 
        FROM permiso 
        GROUP BY sede_id
    """)
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(results)

@app.route('/formularios-motivo', methods=['GET'])
def get_formularios_motivo():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("""
        SELECT motivo, COUNT(*) AS cantidad 
        FROM formulario 
        GROUP BY motivo
    """)
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(results)

@app.route('/genero-asistencia', methods=['GET'])
def get_genero_asistencia():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("""
        SELECT genero, COUNT(*) AS cantidad 
        FROM formulario 
        GROUP BY genero
    """)
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True, port=5000)
