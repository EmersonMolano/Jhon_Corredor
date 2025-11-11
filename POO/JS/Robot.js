class Robot {
    #modelo;
    #infoJSON;
    #datosSistema;

    constructor(modelo, bateria, activo) {
        this.#modelo = modelo;     // texto
        this.bateria = bateria;    // numérico
        this.activo = activo;      // booleano
        this.#infoJSON = `{"modelo":"${modelo}","bateria":${bateria}}`;
        this.#datosSistema = new TextEncoder().encode("DATA-" + modelo);
    }

    // Método sin parámetros y sin retorno
    activar() {
        this.activo = true;
        console.log(`El robot ${this.#modelo} ha sido activado.`);
    }

    // Método con parámetros y sin retorno
    recargarBateria(nuevaCarga) {
        this.bateria = nuevaCarga;
        console.log(`Batería recargada a ${nuevaCarga}%.`);
    }

    // Método sin parámetros y con retorno
    obtenerBateria() {
        return this.bateria;
    }

    // Método con parámetros y con retorno
    compararModelo(otroModelo) {
        return this.#modelo === otroModelo
            ? "Es el mismo modelo."
            : "Es un modelo diferente.";
    }

    // Encapsulación
    get modelo() {
        return this.#modelo;
    }

    set modelo(valor) {
        this.#modelo = valor;
    }

    // Función (abstracción)
    mostrarInfo() {
        return `Robot: ${this.#modelo}, Batería: ${this.bateria}%, Activo: ${this.activo}`;
    }
}
