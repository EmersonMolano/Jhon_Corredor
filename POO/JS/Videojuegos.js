class Videojuego {
    #titulo;
    #infoJSON;
    #datosGuardados;

    constructor(titulo, nivel, enLinea) {
        this.#titulo = titulo;     // texto
        this.nivel = nivel;        // numérico
        this.enLinea = enLinea;    // booleano
        this.#infoJSON = `{"titulo":"${titulo}","nivel":${nivel}}`;
        this.#datosGuardados = new TextEncoder().encode("SAVE-" + titulo);
    }

    // Método sin parámetros y sin retorno
    iniciarJuego() {
        console.log(`Iniciando el videojuego: ${this.#titulo}`);
    }

    // Método con parámetros y sin retorno
    subirNivel(incremento) {
        this.nivel += incremento;
        console.log(`Nivel aumentado a ${this.nivel}`);
    }

    // Método sin parámetros y con retorno
    obtenerNivel() {
        return this.nivel;
    }

    // Método con parámetros y con retorno
    compararTitulo(otroTitulo) {
        return this.#titulo === otroTitulo
            ? "Es el mismo videojuego."
            : "Es un videojuego diferente.";
    }

    // Encapsulación
    get titulo() {
        return this.#titulo;
    }

    set titulo(valor) {
        this.#titulo = valor;
    }

    // Función (abstracción)
    mostrarInfo() {
        return `Videojuego: ${this.#titulo}, Nivel: ${this.nivel}, En línea: ${this.enLinea}`;
    }
}
const game = new Videojuego("Halo", "Acción", 9.5);
game.mostrarJuego();
game.cambiarGenero("Aventura");
console.log(game.compararJuego("Call of Duty"));