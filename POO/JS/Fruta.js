class Fruta {
    #nombre;
    #infoJSON;
    #codigoBinario;

    constructor(nombre, cantidad, madura) {
        this.#nombre = nombre;       // texto
        this.cantidad = cantidad;    // numérico
        this.madura = madura;        // booleano
        this.#infoJSON = `{"nombre":"${nombre}","cantidad":${cantidad}}`;
        this.#codigoBinario = new TextEncoder().encode("FRUTA-" + nombre);
    }

    // Método sin parámetros y sin retorno
    mostrarFruta() {
        console.log(`Fruta: ${this.#nombre}, cantidad: ${this.cantidad}`);
    }

    // Método con parámetros y sin retorno
    aumentarCantidad(extra) {
        this.cantidad += extra;
        console.log(`Cantidad actual: ${this.cantidad}`);
    }

    // Método sin parámetros y con retorno
    obtenerCantidad() {
        return this.cantidad;
    }

    // Método con parámetros y con retorno
    compararNombre(otroNombre) {
        return this.#nombre === otroNombre
            ? "Es la misma fruta."
            : "Es una fruta diferente.";
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
        return `Fruta: ${this.#nombre}, Cantidad: ${this.cantidad}, Madura: ${this.madura}`;
    }
}
