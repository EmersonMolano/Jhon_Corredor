package main

import (
	"encoding/json"
	"fmt"
)

type Robot struct {
	modelo        string
	energia       int
	Activo        bool
	infoJSON      string
	memoriaInterna []byte
}

func NuevoRobot(modelo string, energia int, activo bool) Robot {
	return Robot{
		modelo:         modelo,
		energia:        energia,
		Activo:         activo,
		infoJSON:       fmt.Sprintf(`{"modelo":"%s","energia":%d}`, modelo, energia),
		memoriaInterna: []byte("MEM-" + modelo),
	}
}

func (r *Robot) Activar() {
	r.Activo = true
	fmt.Println("El robot ha sido activado.")
}

func (r *Robot) Recargar(cantidad int) {
	r.energia += cantidad
}

func (r Robot) ObtenerEnergia() int {
	return r.energia
}

func (r Robot) CompararEnergia(otra int) string {
	if r.energia > otra {
		return "Tiene más energía."
	}
	return "Tiene menos energía."
}

func (r *Robot) GetModelo() string {
	return r.modelo
}

func (r *Robot) SetModelo(m string) {
	r.modelo = m
}

func (r Robot) MostrarInfo() string {
	return fmt.Sprintf("Robot: %s, Energía: %d, Activo: %t", r.modelo, r.energia, r.Activo)
}
