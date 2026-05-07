extends Node3D

# Cargamos la escena del enemigo (asegúrate de que la ruta sea la correcta)
var enemy_scene = preload("res://Escenas/enemy.tscn")

func _on_timer_timeout():
	# 1. Crear una instancia del enemigo
	# En Godot 4 se usa .instantiate() en lugar de .instance()
	var enemy = enemy_scene.instantiate()
	
	# 2. Definir una posición aleatoria para que no salgan todos en el mismo lugar
	# Ajustamos X entre -10 y 10, y mantenemos Z al fondo
	enemy.position = Vector3(randf_range(-10, 10), 0, -50)
	
	# 3. Añadir el enemigo al árbol de la escena actual
	add_child(enemy)
