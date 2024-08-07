function verificar() {
    var nombre = document.getElementById("txtusuario").value.toLowerCase();
    var cedula = document.getElementById("txtdocumento").value;

    fetch('http://localhost:5000/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ nombre: nombre, cedula: cedula })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Response data:', data);
        if (data.token) {
            localStorage.setItem('jwtToken', data.token);

            // Decodificar el token JWT
            try {
                var decodedToken = jwt_decode(data.token);
                var rol = decodedToken.rol;

                // Redirigir según el rol
                if (rol === 'admin') {
                    window.location.href = 'admin.html';  // Redirigir a admin.html para rol admin
                } else {
                    window.location.href = 'bienvenida.html';  // Redirigir a bienvenida.html para otros roles
                }
            } catch (error) {
                console.error('Error decoding token:', error);
                alert('Hubo un error al procesar el token.');
                localStorage.removeItem('jwtToken');
                window.location.href = 'inicio_sesion.html';
            }

        } else {
            alert(data.error);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un error al intentar iniciar sesión.');
    });
}
