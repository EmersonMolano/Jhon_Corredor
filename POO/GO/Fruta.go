package main

import (
	"encoding/json"
	"fmt"
)

type Fruta struct {
	nombre        string
	peso          float64
	Madura        bool
	infoJSON      string
	codigoGenetico []byte
}

func NuevaFruta(nombre string, peso float64, madura bool) Fruta {
	return Fruta{
		nombre:         nombre,
		peso:           peso,
		Madura:         madura,
		infoJSON:       fmt.Sprintf(`{"nombre":"%s","peso":%.2f}`, nombre, peso),
		codigoGenetico: []byte("FRUTA-" + nombre),
	}
}

func (f Fruta) Comer() {
	fmt.Println("La fruta ha sido comida.")
}

func (f *Fruta) AumentarPeso(gramos float64) {
	f.peso += gramos
}

func (f Fruta) ObtenerPeso() float64 {
	return f.peso
}

func (f Fruta) CompararPeso(otro float64) string {
	if f.peso > otro {
		return "Es más pesada."
	}
	return "Es más liviana o igual."
}

func (f *Fruta) GetNombre() string {
	return f.nombre
}

func (f *Fruta) SetNombre(n string) {
	f.nombre = n
}

func (f Fruta) MostrarInfo() string {
	return fmt.Sprintf("Fruta: %s, Peso: %.2f g, Madura: %t", f.nombre, f.peso, f.Madura)
}
