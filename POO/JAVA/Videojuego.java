public class Videojuego {

    //Atributos (con modificadores de acceso y diferentes tipos de datos)
    private String titulo;            // texto
    protected int nivel;              // numérico entero
    public boolean enLinea;           // booleano
    private String infoJSON;          // texto (JSON simulado)
    private byte[] datosGuardados;    // tipo binario

    //Constructor
    public Videojuego(String titulo, int nivel, boolean enLinea) {
        this.titulo = titulo;
        this.nivel = nivel;
        this.enLinea = enLinea;
        this.infoJSON = String.format("{\"titulo\":\"%s\",\"nivel\":%d}", titulo, nivel);
        this.datosGuardados = ("SAVE-" + titulo).getBytes();
    }

    //Método SIN parámetros y SIN retorno
    public void iniciarJuego() {
        System.out.println("Iniciando el videojuego: " + titulo);
    }

    //Método CON parámetros y SIN retorno
    public void subirNivel(int incremento) {
        nivel += incremento;
        System.out.println("Nivel aumentado a: " + nivel);
    }

    //Método SIN parámetros y CON retorno
    public int obtenerNivel() {
        return nivel;
    }

    //Método CON parámetros y CON retorno
    public String compararTitulo(String otroTitulo) {
        return (titulo.equalsIgnoreCase(otroTitulo))
                ? "Es el mismo videojuego."
                : "Es un videojuego diferente.";
    }

    //Encapsulación (get y set)
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    //Función (abstracción)
    public String mostrarInfo() {
        return "Videojuego: " + titulo + ", Nivel: " + nivel + ", En línea: " + enLinea;
    }
}
