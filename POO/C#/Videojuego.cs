using System;
using System.Text;

public class Videojuego
{
    private string titulo;
    protected double precio;
    public bool enLinea;
    private string infoJSON;
    private byte[] claveLicencia;

    public Videojuego(string titulo, double precio, bool enLinea)
    {
        this.titulo = titulo;
        this.precio = precio;
        this.enLinea = enLinea;
        this.infoJSON = $"{{\"titulo\":\"{titulo}\",\"precio\":{precio}}}";
        this.claveLicencia = Encoding.UTF8.GetBytes("KEY-" + titulo);
    }

    public void IniciarJuego()
    {
        Console.WriteLine($"Iniciando {titulo}...");
    }

    public void CambiarPrecio(double nuevoPrecio)
    {
        precio = nuevoPrecio;
    }

    public double ObtenerPrecio()
    {
        return precio;
    }

    public string CompararPrecio(double otro)
    {
        return precio > otro ? "Este juego es más caro." : "Este juego es más barato o igual.";
    }

    public string Titulo
    {
        get { return titulo; }
        set { titulo = value; }
    }

    public string MostrarInfo()
    {
        return $"Juego: {titulo}, Precio: ${precio}, En línea: {enLinea}";
    }
}
