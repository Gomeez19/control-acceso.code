const fetchData = async function(url) {
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        const data = await response.json();
        console.log('Datos obtenidos:', data); // Verifica los datos obtenidos
        return data;
    } catch (error) {
        console.error('Error fetching data:', error);
    }
};

const createChart = async function(chartId, url, chartType, label, valueKey, labelKey, isVertical = false) {
    const datos = await fetchData(url);
    if (!datos) return;

    // Verifica la estructura de los datos
    console.log(`Datos para ${chartId}:`, datos);

    const categorias = datos.map(d => d[labelKey] || 'Sin etiqueta');
    const valores = datos.map(d => d[valueKey] !== undefined ? d[valueKey] : 0);

    const ctx = document.getElementById(chartId).getContext('2d');
    new Chart(ctx, {
        type: chartType,
        data: {
            labels: categorias,
            datasets: [{
                label: label,
                data: valores,
                borderWidth: 1,
                backgroundColor: chartType === 'pie' || chartType === 'doughnut' ? 
                    ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)'] : 
                    'rgba(75, 192, 192, 0.2)',
                borderColor: chartType === 'pie' || chartType === 'doughnut' ? 
                    ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'] : 
                    'rgba(75, 192, 192, 1)',
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: isVertical ? {
                x: {
                    ticks: {
                        autoSkip: false,
                        maxRotation: 45,
                        minRotation: 45,
                        font: {
                            size: 9 // Tamaño de fuente para las etiquetas del eje x
                        }
                    }
                },
                y: {
                    ticks: {
                        font: {
                            size: 10 // Tamaño de fuente para las etiquetas del eje y
                        }
                    }
                }
            } : undefined,
            plugins: {
                legend: {
                    labels: {
                        font: {
                            size: 12 // Tamaño de fuente para las etiquetas de la leyenda
                        }
                    }
                }
            }
        }
    });
};

// Llama a las funciones para cada gráfico
const renderCharts = async function() {
    await createChart('entidadesPersonasChart', 'http://127.0.0.1:5000/entidades-personas', 'bar', 'Número de Personas por Entidad', 'personas', 'entidad', true);
    await createChart('usuariosTipoChart', 'http://127.0.0.1:5000/usuarios-tipo', 'pie', 'Número de Usuarios por Tipo', 'cantidad', 'tipo');
    await createChart('permisosSedeChart', 'http://127.0.0.1:5000/permisos-sede', 'bar', 'Número de Permisos por Sede', 'cantidad', 'sede_id', true);
    await createChart('formulariosMotivoChart', 'http://127.0.0.1:5000/formularios-motivo', 'doughnut', 'Número de Formularios por Motivo', 'cantidad', 'motivo');
    await createChart('generoAsistenciaChart', 'http://127.0.0.1:5000/genero-asistencia', 'pie', 'Asistencia por Género', 'cantidad', 'genero');
};

document.addEventListener('DOMContentLoaded', renderCharts);
