using System;
using System.Text;

public class Robot
{
    private string modelo;
    protected int energia;
    public bool activo;
    private string infoJSON;
    private byte[] memoriaInterna;

    public Robot(string modelo, int energia, bool activo)
    {
        this.modelo = modelo;
        this.energia = energia;
        this.activo = activo;
        this.infoJSON = $"{{\"modelo\":\"{modelo}\",\"energia\":{energia}}}";
        this.memoriaInterna = Encoding.UTF8.GetBytes("MEM-" + modelo);
    }

    public void Activar()
    {
        activo = true;
        Console.WriteLine("El robot ha sido activado.");
    }

    public void Recargar(int cantidad)
    {
        energia += cantidad;
    }

    public int ObtenerEnergia()
    {
        return energia;
    }

    public string CompararEnergia(int otra)
    {
        return energia > otra ? "Tiene más energía." : "Tiene menos energía.";
    }

    public string Modelo
    {
        get { return modelo; }
        set { modelo = value; }
    }

    public string MostrarInfo()
    {
        return $"Robot: {modelo}, Energía: {energia}, Activo: {activo}";
    }
}
