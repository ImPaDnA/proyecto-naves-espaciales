extends CharacterBody3D

# Opcional: Puedes definir la rapidez de la bala
var speed: float = 50.0

#cargamos la nueva escena de sonido en memoria
var ExplosionFX = preload("res://Escenas/explosion_sound.tscn")
var ExplosionVisualFX = preload("res://Escenas/explosion_visual.tscn")

func _ready():
	# Le damos a la propiedad 'velocity' integrada una dirección y rapidez inicial.
	velocity = transform.basis.z * -speed

func _physics_process(_delta):
	# move_and_slide() se llama sin nada dentro de los paréntesis
	move_and_slide()

# Señal de la bala
func _on_area_3d_body_entered(body: Node3D) -> void:
	# Esto imprimirá en la consola (abajo en el editor) el nombre de lo que sea que toque
	print("La bala acaba de chocar con: ", body.name)
	
	if body.is_in_group("Enemies"):
		#Creamos el sonido en el mundo principal.
		var fx = ExplosionFX.instantiate()
		get_tree().current_scene.add_child(fx)
		
		# efecto visual explosion
		var vfx = ExplosionVisualFX.instantiate()
		# 1. PRIMERO le damos la posición del enemigo usando 'position'
		vfx.position = body.global_position
		get_tree().current_scene.add_child(vfx)
		
		# mover la explosion visual a donde estaba el enemigo
		vfx.global_position = body.global_position
		
		#Le decimos al cerebro global que sume 10 puntos.
		Global.sumar_puntos(10)
		
		# destruimos el enemigo y la bala
		print("¡Es un enemigo! Borrando ambos...")
		body.queue_free()
		queue_free()
