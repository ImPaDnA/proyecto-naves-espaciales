extends CanvasLayer

@onready var fondo_pausa = $PausaRect
@onready var boton_reanudar = $PausaRect/VBoxContainer/Btn_Renaudar

func _ready():
	# Nos aseguramos de que el menú empiece oculto
	fondo_pausa.hide()

# Esta función escucha todo el tiempo tu teclado/mando
func _input(event):
	# ui_cancel es por defecto la tecla ESC o el botón START del mando
	if event.is_action_pressed("ui_cancel"):
		alternar_pausa()

# Creamos nuestra propia función para pausar y despausar
func alternar_pausa():
	# Revisamos cómo está el tiempo actualmente
	var esta_pausado = get_tree().paused
	
	# Invertimos el estado (si estaba pausado se despausa, y viceversa)
	get_tree().paused = not esta_pausado
	
	if get_tree().paused == true:
		fondo_pausa.show()
		boton_reanudar.call_deferred("grab_focus") # Magia para el mando/teclado
	else:
		fondo_pausa.hide()

# --- BOTONES ---
func _on_btn_renaudar_pressed() -> void:
	alternar_pausa()

func _on_btn_salir_pressed() -> void:
	# ¡VITAL! Antes de salir, debemos devolver el tiempo a la normalidad
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://Escenas/main_menu.tscn")
