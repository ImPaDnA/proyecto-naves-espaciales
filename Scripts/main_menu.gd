extends Node3D # O Control, dependiendo de tu nodo raíz

# 1. Traemos las referencias de nuestras cajas usando la técnica de arrastrar el nodo
@onready var contenedor_principal = $CanvasLayer/InterfazMenu/MenuPrincipal
@onready var contenedor_opciones = $CanvasLayer/InterfazMenu/MenuOpciones
# Traemos el rectángulo del CRT para poder apagarlo

# Traemos los botones clave para darles el "Foco" del teclado
@onready var boton_jugar = $CanvasLayer/InterfazMenu/MenuPrincipal/Btn_Jugar
@onready var boton_volver = $CanvasLayer/InterfazMenu/MenuOpciones/Btn_Atras

func _ready() -> void:
	# Apenas carga el juego, le damos el foco al botón jugar
	# Esto permite que desde el segundo 1 puedas presionar 'Enter' o la 'X' del mando
	# Usamos call_deferred para asegurar que el menú esté cargado antes de dar foco
	boton_jugar.call_deferred("grab_focus")

# NAVEGACIÓN 
	
# Esta función se ejecuta al hacer clic en SALIR
func _on_boton_salir_pressed() -> void:
	# Le ordenamos al "Árbol" del juego que se cierre por completo
	get_tree().quit()
	
# Esta función se ejecuta cuando haces clic en INICIAR MISION
func _on_btn_jugar_pressed() -> void:
	# Cambiamos la escena actual por tu nivel principal donde están las naves
	get_tree().change_scene_to_file("res://Escenas/level1.tscn")

#Salir del juego al presionarse.
func _on_btn_salir_pressed() -> void:
	get_tree().quit()

# 2. Le damos el foco al botón de Atrás (o al de CRT) para que el teclado siga funcionando en este nuevo menú
	boton_volver.grab_focus()
#Regresar al menu principal
func _on_btn_atras_pressed() -> void:
	contenedor_opciones.hide()
	contenedor_principal.show()
	# Diferimos el foco para cuando el contenedor principal regrese
	boton_jugar.call_deferred("grab_focus")

func _on_check_crt_toggled(toggled_on: bool) -> void:
	CrtGlobal.visible = toggled_on

# Esta función se ejecuta al hacer clic en OPCIONES
func _on_btn_opciones_pressed() -> void:
		# Como aún no tenemos menú de opciones, solso imprimimos un mensaje en la consola
	print("El menú de opciones está en construcción...")
	contenedor_principal.hide()
	contenedor_opciones.show()
	# Diferimos el foco para cuando el contenedor de opciones ya sea visible
	boton_volver.call_deferred("grab_focus")
