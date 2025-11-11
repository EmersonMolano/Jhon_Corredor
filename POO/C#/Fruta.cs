using System;
using System.Text;

public class Fruta
{
    private string nombre;
    protected double peso;
    public bool madura;
    private string infoJSON;
    private byte[] codigoGenetico;

    public Fruta(string nombre, double peso, bool madura)
    {
        this.nombre = nombre;
        this.peso = peso;
        this.madura = madura;
        this.infoJSON = $"{{\"nombre\":\"{nombre}\",\"peso\":{peso}}}";
        this.codigoGenetico = Encoding.UTF8.GetBytes("FRUTA-" + nombre);
    }

    public void Comer()
    {
        Console.WriteLine("La fruta ha sido comida.");
    }

    public void AumentarPeso(double gramos)
    {
        peso += gramos;
    }

    public double ObtenerPeso()
    {
        return peso;
    }

    public string CompararPeso(double otro)
    {
        return peso > otro ? "Es más pesada." : "Es más liviana o igual.";
    }

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    public string MostrarInfo()
    {
        return $"Fruta: {nombre}, Peso: {peso}g, Madura: {madura}";
    }
}
