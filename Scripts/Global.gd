extends Node

#Esta señal avisará a todos cuando la puntuación cambie.
signal puntuacion_actualizada(puntos_nuevos)

#Esta es la variable que guarda los puntos
var puntos: int = 0
# Efecto CRT
var crt_visible: bool = true

#Esta función sirve para sumar puntos desde cualquier lugar
func sumar_puntos(cantidad):
	puntos += cantidad
	#Activos al resto del juego que la puntuación cambió
	puntuacion_actualizada.emit(puntos)
	print("¡Puntos Globales Actualizados a: ", puntos)

#Detecta si el crt esta activo o no
