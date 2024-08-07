function registro() {
  const v_nombres = document.getElementById('nombres').value.toLowerCase();
  const v_documento = document.getElementById('documento').value;
  const v_correo = document.getElementById('correo').value;
  const v_numero = document.getElementById('numero').value;
  const v_motivo = document.getElementById('motivo').value;
  const v_sede = document.getElementById('sede').value;
  const masculinoRadio = document.getElementById("masculino");
  const femeninoRadio = document.getElementById("femenino");

  let v_genero = "";
  if (masculinoRadio.checked) {
    v_genero = "Masculino";
  } else if (femeninoRadio.checked) {
    v_genero = "Femenino";
  }

  // Validación de campos obligatorios
  if (!v_nombres) {
    alert("El campo 'Nombre' es obligatorio.");
    return;
  }
  if (!v_documento) {
    alert("El campo 'Documento' es obligatorio.");
    return;
  }
  if (!v_correo) {
    alert("El campo 'Correo' es obligatorio.");
    return;
  }
  if (!v_numero) {
    alert("El campo 'Número' es obligatorio.");
    return;
  }
  if (!v_motivo) {
    alert("El campo 'Motivo' es obligatorio.");
    return;
  }
  if (!v_sede) {
    alert("El campo 'Sede' es obligatorio.");
    return;
  }
  if (!v_genero) {
    alert("El campo 'Género' es obligatorio.");
    return;
  }

  fetch('http://127.0.0.1:5000/agregar_usuario', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      nombres: v_nombres,
      documento: v_documento,
      genero: v_genero,
      correo: v_correo,
      numero: v_numero,
      motivo: v_motivo,
      sede_id: v_sede
    })
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Error al agregar usuario');
    }
    return response.json();
  })
  .then(data => {
    alert("Usuario agregado");
  })
  .catch(err => {
    console.log('Error: ', err);
    alert('Error al agregar usuario');
  });
}
