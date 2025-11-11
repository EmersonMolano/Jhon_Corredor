class Universidad {
    #nombre;
    #infoJSON;
    #codigoInterno;

    constructor(nombre, estudiantes, acreditada) {
        this.#nombre = nombre;          // texto
        this.estudiantes = estudiantes; // numérico
        this.acreditada = acreditada;   // booleano
        this.#infoJSON = `{"nombre":"${nombre}","estudiantes":${estudiantes}}`;
        this.#codigoInterno = new TextEncoder().encode("UNI-" + nombre);
    }

    // Método sin parámetros y sin retorno
    abrirInscripciones() {
        console.log(`La universidad ${this.#nombre} ha abierto inscripciones.`);
    }

    // Método con parámetros y sin retorno
    aumentarEstudiantes(nuevos) {
        this.estudiantes += nuevos;
        console.log(`Se han inscrito ${nuevos} nuevos estudiantes.`);
    }

    // Método sin parámetros y con retorno
    obtenerEstudiantes() {
        return this.estudiantes;
    }

    // Método con parámetros y con retorno
    compararUniversidad(otra) {
        return this.#nombre === otra
            ? "Es la misma universidad."
            : "Es una universidad diferente.";
    }

    // Encapsulación
    get nombre() {
        return this.#nombre;
    }

    set nombre(valor) {
        this.#nombre = valor;
    }

    // Función (abstracción)
    mostrarInfo() {
        return `Universidad: ${this.#nombre}, Estudiantes: ${this.estudiantes}, Acreditada: ${this.acreditada}`;
    }
}
