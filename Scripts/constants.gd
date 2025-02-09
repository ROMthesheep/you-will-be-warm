extends Node

const DIALOG_POSITION = Vector2(310,360)
const DAYSBYWEEK1: Array[String] = ["21 de Diciembre", "22 de Diciembre", "23 de Diciembre", "24 de Diciembre", "25 de Diciembre", "26 de Diciembre", "27 de Diciembre", "28 de Diciembre"]
const DAYSBYWEEK2: Array[String] = ["29 de Diciembre", "30 de Diciembre", "31 de Diciembre", "1 de Enero", "2 de Enero", "3 de Enero", "4 de Enero", "5 de Enero"]
const DAYSBYWEEK3: Array[String] = ["6 de Enero", "7 de Enero", "8 de Enero", "9 de Enero", "10 de Enero", "11 de Enero", "12 de Enero", "13 de Enero"]
const DAYSBYWEEK4: Array[String] = ["14 de Enero", "15 de Enero", "16 de Enero", "17 de Enero", "18 de Enero", "19 de Enero", "20 de Enero", "21 de Enero"]
const DAYSBYWEEK5: Array[String] = ["22 de Enero", "23 de Enero", "24 de Enero", "25 de Enero", "26 de Enero", "27 de Enero", "28 de Enero", "29 de Enero"]
const DAYSBYWEEK6: Array[String] = ["30 de Enero", "31 de Enero", "1 de Febrero", "2 de Febrero", "3 de Febrero", "4 de Febrero", "5 de Febrero", "6 de Febrero"]
const DAYSBYWEEK7: Array[String] = ["7 de Febrero", "8 de Febrero", "9 de Febrero", "10 de Febrero", "11 de Febrero", "12 de Febrero", "13 de Febrero", "14 de Febrero"]
const DAYSBYWEEK8: Array[String] = ["15 de Febrero", "16 de Febrero", "17 de Febrero", "18 de Febrero", "19 de Febrero", "20 de Febrero", "21 de Febrero", "22 de Febrero"]
const DAYSBYWEEK9: Array[String] = ["23 de Febrero", "24 de Febrero", "25 de Febrero", "26 de Febrero", "27 de Febrero", "28 de Febrero", "29 de Febrero", "1 de Marzo"]

const DAYSBYWEEK = [DAYSBYWEEK1, DAYSBYWEEK2, DAYSBYWEEK3, DAYSBYWEEK4, DAYSBYWEEK5, DAYSBYWEEK6, DAYSBYWEEK7, DAYSBYWEEK8, DAYSBYWEEK9]

const DIALOG = {
	0: {
		"speaker" : "Francisco",
		"lines" : [
			"Que frío hace, este invierno esta entrando con bastante fuerza",
			"Cada dia llegan menos carros hasta aquí",
			"La nieve se esta poniendo cada vez peor"
		]
	},
	1: {
		"speaker" : "Francisco",
		"lines" : [
			"Hay que ver, ojalá supiera si salir a cazar fuera bien, hay días que salgo y sólo me llevo a casa algo que no llega ni a postre",
			"Pero bueno, no por quejarme voy a solucionar nada, sólo tengo que no desesperar, un día cazaré una pieza gigante y se me quitara la tonteria"
		]
	},
	3: {
		"speaker" : "Francisco",
		"lines": [
			"Siempre dejo las reparaciones para cuando ya es demasiado tarde, si pudiera arreglar todo la vida sería mucho mas fácil, pero para ello necesito tiempo y manos trabajando en ello",
			"Pero estaría tan bien tener trampas cazando por tí o cañerias que no derrocharan agua..."
		]
	},
	6: {
		"speaker" : "Francisco",
		"lines": [
			"Ya empieza a cambiar el clima, el río esta creciendo, se esta descongelando el glaciar",
			"Hay mejores piezas en el bosque, la vida vuelve con el calor."
		]
	},
	8: {
		"speaker" : "Francisco",
		"lines": [
			"Los días son cada vez mas amables, ya se oyen más pajaros. Dentro de nada llegaran los días soleados."
		]
	}
}
