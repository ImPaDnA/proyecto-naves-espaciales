extends CanvasLayer

#Necesitamos una referencia al Label que creamos
@onready var marcador_label = $MarcadorPuntos

func _ready():
	#1 cuando el juego empieza, actualizamos el texto a cero por si acaso
	_actualizar_texto_marcador(Global.puntos)
	
	#2 CONECTAMOS con el Cerebro Global:
	# "Global, cuando emitas 'puntuacion_actualizada', llámame a mí (self) a la función
	# '_actualizar_texto_marcador'"
	Global.puntuacion_actualizada.connect(_actualizar_texto_marcador)

# Esta es la función que cambia el texto en pantalla
func _actualizar_texto_marcador(puntos_nuevos):
	marcador_label.text = "Puntos: " + str(puntos_nuevos)
	print("HUD actualizado visualmente.")
