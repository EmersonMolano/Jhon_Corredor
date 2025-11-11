package main

import (
	"encoding/json"
	"fmt"
)

type Universidad struct {
	nombre            string
	estudiantes       int
	Publica           bool
	infoJSON          string
	codigoAcreditacion []byte
}

func NuevaUniversidad(nombre string, estudiantes int, publica bool) Universidad {
	return Universidad{
		nombre:             nombre,
		estudiantes:        estudiantes,
		Publica:            publica,
		infoJSON:           fmt.Sprintf(`{"nombre":"%s","estudiantes":%d}`, nombre, estudiantes),
		codigoAcreditacion: []byte("COD-" + nombre),
	}
}

func (u Universidad) AbrirPuertas() {
	fmt.Println("La universidad ha abierto sus puertas.")
}

func (u *Universidad) MatricularEstudiantes(nuevos int) {
	u.estudiantes += nuevos
}

func (u Universidad) ObtenerCantidad() int {
	return u.estudiantes
}

func (u Universidad) EvaluarRanking(posicion int) string {
	if posicion <= 10 {
		return "Universidad destacada."
	}
	return "Universidad promedio."
}

func (u *Universidad) GetNombre() string {
	return u.nombre
}

func (u *Universidad) SetNombre(n string) {
	u.nombre = n
}

func (u Universidad) MostrarInfo() string {
	return fmt.Sprintf("Universidad: %s, Estudiantes: %d, Pública: %t", u.nombre, u.estudiantes, u.Publica)
}
