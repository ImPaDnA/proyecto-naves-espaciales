extends Node3D

func _ready():
	# 1. Obtenemos el nodo de partículas
	var particles = $CPUParticles3D
	# 2. Le ordenamos que empiece a emitir por si acaso
	particles.emitting = true
	
	# 3. Creamos un temporizador que dure el tiempo de vida de las partículas
	# Cuando el tiempo acabe, se llamará automáticamente a queue_free()
	get_tree().create_timer(particles.lifetime).timeout.connect(queue_free)
	
