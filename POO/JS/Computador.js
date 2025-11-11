class Computador {
    #marca;          // texto
    #infoJSON;       // JSON simulado
    #datosSistema;   // binario simulado

    constructor(marca, memoriaRAM, encendido) {
        this.#marca = marca;
        this.memoriaRAM = memoriaRAM; // numérico
        this.encendido = encendido;   // booleano
        this.#infoJSON = `{"marca":"${marca}","ram":${memoriaRAM}}`;
        this.#datosSistema = new TextEncoder().encode("SO-" + marca);
    }

    // Método sin parámetros y sin retorno
    encender() {
        this.encendido = true;
        console.log("El computador se ha encendido.");
    }

    // Método con parámetros y sin retorno
    actualizarRAM(nuevaRAM) {
        this.memoriaRAM = nuevaRAM;
        console.log(`La RAM ha sido actualizada a ${nuevaRAM} GB.`);
    }

    // Método sin parámetros y con retorno
    obtenerRAM() {
        return this.memoriaRAM;
    }

    // Método con parámetros y con retorno
    compararMarca(otraMarca) {
        return this.#marca === otraMarca
            ? "Es la misma marca."
            : "Es una marca diferente.";
    }

    // Encapsulación
    get marca() {
        return this.#marca;
    }

    set marca(valor) {
        this.#marca = valor;
    }

    // Función (abstracción)
    mostrarInfo() {
        return `Computador: ${this.#marca}, RAM: ${this.memoriaRAM} GB, Encendido: ${this.encendido}`;
    }
}
