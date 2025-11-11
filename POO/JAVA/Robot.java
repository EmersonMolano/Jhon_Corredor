public class Robot {

    //Atributos (con modificadores de acceso y diferentes tipos de datos)
    private String modelo;          // texto
    protected int bateria;          // numérico entero
    public boolean activo;          // booleano
    private String infoJSON;        // texto (JSON simulado)
    private byte[] datosSistema;    // tipo binario

    //Constructor
    public Robot(String modelo, int bateria, boolean activo) {
        this.modelo = modelo;
        this.bateria = bateria;
        this.activo = activo;
        this.infoJSON = String.format("{\"modelo\":\"%s\",\"bateria\":%d}", modelo, bateria);
        this.datosSistema = ("DATA-" + modelo).getBytes();
    }

    //Método SIN parámetros y SIN retorno
    public void activar() {
        activo = true;
        System.out.println("El robot " + modelo + " ha sido activado.");
    }

    //Método CON parámetros y SIN retorno
    public void recargarBateria(int nuevaCarga) {
        bateria = nuevaCarga;
        System.out.println("La batería ha sido recargada a " + bateria + "%.");
    }

    //Método SIN parámetros y CON retorno
    public int obtenerBateria() {
        return bateria;
    }

    //Método CON parámetros y CON retorno
    public String compararModelo(String otroModelo) {
        if (modelo.equalsIgnoreCase(otroModelo)) {
            return "Es el mismo modelo.";
        } else {
            return "Es un modelo diferente.";
        }
    }

    //Encapsulación (get y set)
    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    //Función (abstracción)
    public String mostrarInfo() {
        return "Robot: " + modelo + ", Batería: " + bateria + "%, Activo: " + activo;
    }
}
