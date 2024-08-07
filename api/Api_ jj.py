from flask import Flask, request, jsonify
import jwt
import datetime
from flask_mysqldb import MySQL
from flask_cors import CORS, cross_origin

# Inicialización
app = Flask(__name__)
CORS(app)

# Configuración de la conexión MySQL
app.config['MYSQL_HOST'] = 'localhost' 
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'parcial'
mysql = MySQL(app)

# Configuración de la clave secreta para Flask
app.secret_key = "mysecretkey"

# Ruta para consultar el número total de registros en 'formulario'
@cross_origin()
@app.route('/numero_registrados', methods=['GET'])
def numero_registrados():
    try:
        cur = mysql.connection.cursor()
        cur.execute('SELECT COUNT(*) as total FROM formulario')
        rv = cur.fetchone()
        cur.close()
        return jsonify({"total": rv[0]})
    except Exception as e:
        print(e)
        return jsonify({"informacion": str(e)})

# Ruta para consultar todos los registros en 'formulario'
@cross_origin()
@app.route('/registrados', methods=['GET'])
def registrados():
    try:
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM formulario')
        rv = cur.fetchall()
        cur.close()
        payload = []
        for result in rv:
            content = {
                'nombres': result[0], 'documento': result[1], 'genero': result[2],
                'correo': result[3], 'motivo': result[4], 'sede_id': result[5],
                'numero': result[6], 'externo_id': result[7], 'estado': result[8], 'fecha_registro': result[9]
            }
            payload.append(content)
        return jsonify(payload)
    except Exception as e:
        print(e)
        return jsonify({"informacion": str(e)})

# Ruta para agregar un nuevo registro en 'formulario'
@app.route('/agregar_usuario', methods=['POST'])
def agregar_usuario():
    try:
        data = request.json
        nombres = data.get('nombres', '').lower()
        documento = data.get('documento', '')
        genero = data.get('genero', '')
        correo = data.get('correo', '')
        numero = data.get('numero', '')
        motivo = data.get('motivo', '')
        sede_id = data.get('sede_id', '')
        fecha = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        # Validación de campos obligatorios
        if not all([nombres, documento, genero, correo, numero, motivo, sede_id]):
            return jsonify({"informacion": "Todos los campos son obligatorios"}), 400

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO externo () VALUES ()")
        externo_id = cur.lastrowid

        cur.execute("INSERT INTO formulario (nombres, documento, genero, correo, motivo, sede_id, numero, externo_id, fecha_registro) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (nombres, documento, genero, correo, motivo, sede_id, numero, externo_id, fecha))
        mysql.connection.commit()
        cur.close()

        return jsonify({"informacion": "Registro exitoso"}), 200
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"informacion": "Error al registrar usuario", "error": str(e)}), 500

@cross_origin()
@app.route('/login', methods=['POST'])
def login():
    try:
        data = request.json
        nombre = data['nombre'].lower()
        cedula = data['cedula']

        cur = mysql.connection.cursor()
        cur.execute("SELECT rol, nombre FROM usuario WHERE nombre = %s AND cedula = %s", (nombre, cedula))
        user = cur.fetchone()
        
        if user:
            # Generar JWT
            token = jwt.encode({
                'nombre': user[1],
                'rol': user[0],
                'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=15)
            }, app.secret_key, algorithm='HS256')

            cur.close()
            return jsonify({"token": token}), 200
        else:
            # Verificación en 'formulario'
            cur.execute("SELECT nombres, documento FROM formulario WHERE nombres = %s AND documento = %s", (nombre, cedula))
            form_user = cur.fetchone()
            if form_user:
                token = jwt.encode({
                    'nombre': form_user[0],
                    'rol': 'externo',
                    'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=10)
                }, app.secret_key, algorithm='HS256')
                
                cur.close()
                return jsonify({"token": token}), 200
            else:
                cur.close()
                return jsonify({"error": "Credenciales inválidas"}), 401
    except Exception as e:
        return jsonify({"error": str(e)}), 500

def obtener_sede_id(cedula):
    cur = mysql.connection.cursor()
    cur.execute("SELECT sede_id FROM asignacion_usuario_sede WHERE cedula = %s", (cedula,))
    sede_id = cur.fetchone()
    cur.close()
    return sede_id[0] if sede_id else None

# Ruta para eliminar un registro basado en externo_id
@cross_origin()
@app.route('/delete/<externo_id>', methods=['DELETE'])
def delete_usuario(externo_id):
    try:
        cur = mysql.connection.cursor()
        cur.execute('DELETE FROM formulario WHERE externo_id = %s', (externo_id,))
        mysql.connection.commit()
        cur.execute('DELETE FROM externo WHERE id = %s', (externo_id,))
        mysql.connection.commit()
        cur.close()
        return jsonify({"informacion": "Registro eliminado"})
    except Exception as e:
        print(e)
        return jsonify({"informacion": str(e)}), 500

@app.route('/update_estado/<externo_id>', methods=['PUT'])
def update_estado(externo_id):
    try:
        cur = mysql.connection.cursor()
        query = "UPDATE formulario SET estado = 'finalizado' WHERE externo_id = %s"
        cur.execute(query, (externo_id,))
        mysql.connection.commit()
        cur.close()
        return jsonify({"success": True})
    except Exception as e:
        print(e)
        return jsonify({"success": False, "informacion": str(e)})


if __name__ == "__main__":
    app.run(port=5000, debug=True)
