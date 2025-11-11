using System;
using System.Text;

public class Universidad
{
    private string nombre;
    protected int estudiantes;
    public bool publica;
    private string infoJSON;
    private byte[] codigoAcreditacion;

    public Universidad(string nombre, int estudiantes, bool publica)
    {
        this.nombre = nombre;
        this.estudiantes = estudiantes;
        this.publica = publica;
        this.infoJSON = $"{{\"nombre\":\"{nombre}\",\"estudiantes\":{estudiantes}}}";
        this.codigoAcreditacion = Encoding.UTF8.GetBytes("COD-" + nombre);
    }

    public void AbrirPuertas()
    {
        Console.WriteLine("La universidad ha abierto sus puertas.");
    }

    public void MatricularEstudiantes(int nuevos)
    {
        estudiantes += nuevos;
    }

    public int ObtenerCantidad()
    {
        return estudiantes;
    }

    public string EvaluarRanking(int posicion)
    {
        return posicion <= 10 ? "Universidad destacada." : "Universidad promedio.";
    }

    public string Nombre
    {
        get { return nombre; }
        set { nombre = value; }
    }

    public string MostrarInfo()
    {
        return $"Universidad: {nombre}, Estudiantes: {estudiantes}, Pública: {publica}";
    }
}
