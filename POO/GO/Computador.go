package main

import (
	"encoding/json"
	"fmt"
)

// Estructura Computador (similar a clase)
type Computador struct {
	marca          string
	memoriaRAM     int
	Encendido      bool
	infoJSON       string
	datosSistema   []byte
}

// Constructor
func NuevoComputador(marca string, memoriaRAM int, encendido bool) Computador {
	return Computador{
		marca:        marca,
		memoriaRAM:   memoriaRAM,
		Encendido:    encendido,
		infoJSON:     fmt.Sprintf(`{"marca":"%s","ram":%d}`, marca, memoriaRAM),
		datosSistema: []byte("SO-" + marca),
	}
}

// Método SIN parámetros y SIN retorno
func (c *Computador) Encender() {
	c.Encendido = true
	fmt.Println("El computador se ha encendido.")
}

// Método CON parámetros y SIN retorno
func (c *Computador) ActualizarRAM(nuevaRAM int) {
	c.memoriaRAM = nuevaRAM
	fmt.Println("RAM actualizada a", nuevaRAM, "GB.")
}

// Método SIN parámetros y CON retorno
func (c Computador) ObtenerRAM() int {
	return c.memoriaRAM
}

// Método CON parámetros y CON retorno
func (c Computador) CompararMarca(otra string) string {
	if c.marca == otra {
		return "Es la misma marca."
	}
	return "Es una marca diferente."
}

// Get y Set
func (c *Computador) GetMarca() string {
	return c.marca
}

func (c *Computador) SetMarca(m string) {
	c.marca = m
}

// Abstracción
func (c Computador) MostrarInfo() string {
	return fmt.Sprintf("Computador: %s, RAM: %d GB, Encendido: %t", c.marca, c.memoriaRAM, c.Encendido)
}
