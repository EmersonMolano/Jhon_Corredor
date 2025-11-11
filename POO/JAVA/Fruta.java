public class Fruta {

    //Atributos (con modificadores de acceso y diferentes tipos de datos)
    private String nombre;         // texto
    protected double peso;         // numérico decimal
    public boolean madura;         // booleano
    private String infoJSON;       // texto (JSON simulado)
    private byte[] datosNutrientes; // tipo binario

    //Constructor
    public Fruta(String nombre, double peso, boolean madura) {
        this.nombre = nombre;
        this.peso = peso;
        this.madura = madura;
        this.infoJSON = String.format("{\"nombre\":\"%s\",\"peso\":%.2f}", nombre, peso);
        this.datosNutrientes = ("NUTRI-" + nombre).getBytes();
    }

    //Método SIN parámetros y SIN retorno
    public void madurar() {
        madura = true;
        System.out.println(nombre + " ha madurado completamente.");
    }

    //Método CON parámetros y SIN retorno
    public void cambiarPeso(double nuevoPeso) {
        peso = nuevoPeso;
        System.out.println("El peso de " + nombre + " ahora es de " + peso + " kg.");
    }

    //Método SIN parámetros y CON retorno
    public double obtenerPeso() {
        return peso;
    }

    //Método CON parámetros y CON retorno
    public String compararNombre(String otraFruta) {
        if (nombre.equalsIgnoreCase(otraFruta)) {
            return "Es la misma fruta.";
        } else {
            return "Es una fruta diferente.";
        }
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
        return "Fruta: " + nombre + ", Peso: " + peso + " kg, Madura: " + madura;
    }
}
