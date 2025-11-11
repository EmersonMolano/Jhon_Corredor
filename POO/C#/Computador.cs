using System;
using System.Text;

public class Computador
{
    //Atributos (con modificadores de acceso y diferentes tipos de datos)
    private string marca;           // texto
    protected int memoriaRAM;       // numérico entero
    public bool encendido;          // booleano
    private string infoJSON;        // texto (JSON simulado)
    private byte[] datosSistema;    // tipo binario

    //Constructor
    public Computador(string marca, int memoriaRAM, bool encendido)
    {
        this.marca = marca;
        this.memoriaRAM = memoriaRAM;
        this.encendido = encendido;
        this.infoJSON = $"{{\"marca\":\"{marca}\",\"ram\":{memoriaRAM}}}";
        this.datosSistema = Encoding.UTF8.GetBytes("SO-" + marca);
    }

    //Método SIN parámetros y SIN retorno
    public void Encender()
    {
        encendido = true;
        Console.WriteLine("El computador se ha encendido.");
    }

    //Método CON parámetros y SIN retorno
    public void ActualizarRAM(int nuevaRAM)
    {
        memoriaRAM = nuevaRAM;
        Console.WriteLine($"La RAM ha sido actualizada a {nuevaRAM} GB.");
    }

    //Método SIN parámetros y CON retorno
    public int ObtenerRAM()
    {
        return memoriaRAM;
    }

    //Método CON parámetros y CON retorno
    public string CompararMarca(string otraMarca)
    {
        return (marca == otraMarca) ? "Es la misma marca." : "Es una marca diferente.";
    }

    //Encapsulación (get y set)
    public string Marca
    {
        get { return marca; }
        set { marca = value; }
    }

    //Función (abstracción)
    public string MostrarInfo()
    {
        return $"Computador: {marca}, RAM: {memoriaRAM} GB, Encendido: {encendido}";
    }
}
