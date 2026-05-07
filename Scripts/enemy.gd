extends CharacterBody3D

# Definimos la velocidad de forma aleatoria al aparecer
# Usamos @onready para que se calcule justo cuando el enemigo entra a la escena
@onready var spd: float = randf_range(20.0, 50.0)

func _physics_process(_delta):
	# En Godot 4, asignamos la velocidad directamente a la propiedad velocity
	# Vector3(X, Y, Z) -> Queremos que se mueva hacia adelante en el eje Z
	velocity = Vector3(0, 0, spd)
	
	# Ejecutamos el movimiento físico
	move_and_slide()
	
	# Si el enemigo pasa la cámara o cierta distancia, lo borramos para liberar memoria
	if global_position.z > 10.0:
		queue_free()
