document.addEventListener('DOMContentLoaded', (event) => {
    var token = localStorage.getItem('jwtToken');

    if (!token) {
        window.location.href = 'inicio_sesion.html';
        return;
    }

    try {
        // Decodificar el JWT
        var decodedToken = jwt_decode(token);
        var nombre = decodedToken.nombre;
        var rol = decodedToken.rol;

        var mensajeBienvenida = '';

        // Construir el mensaje de bienvenida según el rol
        if (rol === 'docente') {
            mensajeBienvenida = `${nombre} ha ingresado al campus de la IUB como docente.`;
        } else if (rol === 'estudiante') {
            mensajeBienvenida = `${nombre} ha ingresado al campus de la IUB como estudiante.`;
        } else if (rol === 'externo') {
            mensajeBienvenida = `${nombre} ha ingresado al campus de la IUB como externo.`;
        }

        // Mostrar el mensaje de bienvenida
        document.getElementById('mensajeBienvenida').textContent = mensajeBienvenida;

        // Establecer un temporizador para cerrar sesión después de 15 segundos
        setTimeout(() => {
            localStorage.removeItem('jwtToken');
            window.location.href = 'inicio_sesion.html';
        }, 15000);

    } catch (error) {
        console.error('Token decode error:', error);
        window.location.href = 'inicio_sesion.html';
    }
});

// Función para cerrar sesión
function cerrarSesion() {
    // Eliminar el token de localStorage
    localStorage.removeItem('jwtToken');
    // Redirigir al inicio de sesión
    window.location.href = 'inicio_sesion.html';
}
