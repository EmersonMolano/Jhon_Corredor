public class Computador {

    //Atributos (con modificadores de acceso y diferentes tipos de datos)
    private String marca;          // texto
    protected int memoriaRAM;      // numérico entero
    public boolean encendido;      // booleano
    private String infoJSON;       // texto (JSON simulado)
    private byte[] datosSistema;   // tipo binario

    //Constructor
    public Computador(String marca, int memoriaRAM, boolean encendido) {
        this.marca = marca;
        this.memoriaRAM = memoriaRAM;
        this.encendido = encendido;
        this.infoJSON = String.format("{\"marca\":\"%s\",\"ram\":%d}", marca, memoriaRAM);
        this.datosSistema = ("SO-" + marca).getBytes();
    }

    //Método SIN parámetros y SIN retorno
    public void encender() {
        encendido = true;
        System.out.println("El computador se ha encendido.");
    }

    //Método CON parámetros y SIN retorno
    public void actualizarRAM(int nuevaRAM) {
        memoriaRAM = nuevaRAM;
        System.out.println("La RAM ha sido actualizada a " + nuevaRAM + " GB.");
    }

    //Método SIN parámetros y CON retorno
    public int obtenerRAM() {
        return memoriaRAM;
    }

    //Método CON parámetros y CON retorno
    public String compararMarca(String otraMarca) {
        if (marca.equals(otraMarca)) {
            return "Es la misma marca.";
        } else {
            return "Es una marca diferente.";
        }
    }

    //Encapsulación (get y set)
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    //Función (abstracción)
    public String mostrarInfo() {
        return "Computador: " + marca + ", RAM: " + memoriaRAM + " GB, Encendido: " + encendido;
    }
}
