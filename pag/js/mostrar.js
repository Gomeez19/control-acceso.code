let tabla;

function consultar_total() {
    axios({
        method: 'GET',
        url: 'http://127.0.0.1:5000/registrados',
    }).then(function (response) {
        // Inicializar DataTable
        if ($.fn.dataTable.isDataTable('#tablausuarios')) {
            tabla.clear();
            tabla.rows.add(response.data);
            tabla.draw();
        } else {
            tabla = $('#tablausuarios').DataTable({
                data: response.data,
                columns: [
                    { data: 'nombres' },
                    { data: 'documento' },
                    { data: 'genero' },
                    { data: 'correo' },
                    { data: 'motivo' },
                    { data: 'sede_id' },
                    { data: 'numero' },
                    { data: 'externo_id' },
                    { data: 'estado' },
                    { data: 'fecha_registro' },
                    {
                        data: 'externo_id',
                        render: function (data, type, row) {
                            return `
                                <a class="btn btn-danger mx-2" onClick="onDelete(this, ${data})">Delete</a>
                                <a class="btn btn-success mx-2" onClick="update_estado(this, ${data})">Cambiar estado</a>
                            `;
                        }
                    }
                ]
            });
        }
    }).catch(err => console.log('Error: ', err));
}

function update_estado(element, externo_id) {
    axios({
        method: 'PUT',
        url: `http://127.0.0.1:5000/update_estado/${externo_id}`,
    }).then(function (response) {
        if (response.data.success) {
            alert('Estado actualizado a "finalizado" exitosamente');
            consultar_total(); // Recargar la tabla de usuarios
        } else {
            alert('Error al actualizar el estado: ' + response.data.informacion);
        }
    }).catch(err => console.log('Error: ', err));
}

window.onDelete = async function (td, externo_id) {
    const selectedRow = td.parentElement.parentElement;

    try {
        const response = await fetch(`http://localhost:5000/delete/${externo_id}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        });
        const result = await response.json();
        if (response.ok) {
            alert(result.informacion);
            tabla.row(selectedRow.rowIndex).remove().draw();
        } else {
            alert(`Error: ${result.informacion}`);
        }
    } catch (error) {
        console.error('Error al eliminar el registro:', error);
        alert('Error al eliminar el registro');
    }
}

// Inicializar DataTable cuando la página esté lista
$(document).ready(function() {
    consultar_total();
});
