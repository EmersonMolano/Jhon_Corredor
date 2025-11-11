package main

import (
	"encoding/json"
	"fmt"
)

type Videojuego struct {
	titulo        string
	precio        float64
	EnLinea       bool
	infoJSON      string
	claveLicencia []byte
}

func NuevoVideojuego(titulo string, precio float64, enLinea bool) Videojuego {
	return Videojuego{
		titulo:        titulo,
		precio:        precio,
		EnLinea:       enLinea,
		infoJSON:      fmt.Sprintf(`{"titulo":"%s","precio":%.2f}`, titulo, precio),
		claveLicencia: []byte("KEY-" + titulo),
	}
}

func (v Videojuego) IniciarJuego() {
	fmt.Println("Iniciando", v.titulo, "...")
}

func (v *Videojuego) CambiarPrecio(nuevo float64) {
	v.precio = nuevo
}

func (v Videojuego) ObtenerPrecio() float64 {
	return v.precio
}

func (v Videojuego) CompararPrecio(otro float64) string {
	if v.precio > otro {
		return "Este juego es más caro."
	}
	return "Este juego es más barato o igual."
}

func (v *Videojuego) GetTitulo() string {
	return v.titulo
}

func (v *Videojuego) SetTitulo(t string) {
	v.titulo = t
}

func (v Videojuego) MostrarInfo() string {
	return fmt.Sprintf("Juego: %s, Precio: %.2f, En línea: %t", v.titulo, v.precio, v.EnLinea)
}
