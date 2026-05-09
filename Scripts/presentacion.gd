extends Control

# Buscamos nuestro texto en la escena
@onready var texto_logo = $ColorRect/Label

func _ready():
	# 1. Modulate controla el color y la transparencia (RGBA). 
	# La 'a' es el canal Alpha (transparencia). 0.0 es invisible, 1.0 es opaco.
	# Hacemos que empiece 100% invisible.
	texto_logo.modulate.a = 0.0
	
	# 2. Creamos un TWEEN. Un Tween es un "Interpolador": le dices 
	# "cambia el valor de esta variable desde A hasta B en X segundos", y él hace la matemática.
	var tween = create_tween()
	
	# 3. Encadenamos las instrucciones del Tween (se ejecutan en orden):
	
	# Instrucción A: Cambia la transparencia (modulate:a) del texto a 1.0 (visible) en 1.5 segundos.
	tween.tween_property(texto_logo, "modulate:a", 1.0, 1.5)
	
	# Instrucción B: Haz una pausa de 2.0 segundos para que el jugador lea el texto.
	tween.tween_interval(2.0)
	
	# Instrucción C: Cambia la transparencia de vuelta a 0.0 (invisible) en 1.5 segundos.
	tween.tween_property(texto_logo, "modulate:a", 0.0, 1.5)
	
	# Instrucción D: Cuando termines todo lo anterior, ejecuta una función llamada 'ir_al_menu'.
	tween.tween_callback(ir_al_menu)

func ir_al_menu():
	# Esta línea destruye la escena actual y carga la nueva escena en la memoria RAM.
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")
