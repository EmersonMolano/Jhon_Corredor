public class Universidad {

    //Atributos (con modificadores de acceso y diferentes tipos de datos)
    private String nombre;             // texto
    protected int numEstudiantes;      // numérico entero
    public boolean acreditada;         // booleano
    private String infoJSON;           // texto (JSON simulado)
    private byte[] codigoInterno;      // tipo binario

    //Constructor
    public Universidad(String nombre, int numEstudiantes, boolean acreditada) {
        this.nombre = nombre;
        this.numEstudiantes = numEstudiantes;
        this.acreditada = acreditada;
        this.infoJSON = String.format("{\"nombre\":\"%s\",\"estudiantes\":%d}", nombre, numEstudiantes);
        this.codigoInterno = ("UNI-" + nombre).getBytes();
    }

    //Método SIN parámetros y SIN retorno
    public void abrirInscripciones() {
        System.out.println("La universidad " + nombre + " ha abierto inscripciones.");
    }

    //Método CON parámetros y SIN retorno
    public void aumentarEstudiantes(int nuevos) {
        numEstudiantes += nuevos;
        System.out.println("Se han inscrito " + nuevos + " nuevos estudiantes.");
    }

    //Método SIN parámetros y CON retorno
    public int obtenerNumEstudiantes() {
        return numEstudiantes;
    }

    //Método CON parámetros y CON retorno
    public String compararUniversidad(String otra) {
        return (nombre.equalsIgnoreCase(otra))
                ? "Es la misma universidad."
                : "Es una universidad diferente.";
    }

    //Encapsulación (get y set)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    //Función (abstracción)
    public String mostrarInfo() {
        return "Universidad: " + nombre + ", Estudiantes: " + numEstudiantes + ", Acreditada: " + acreditada;
    }
}
