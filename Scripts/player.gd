extends CharacterBody3D

const MAXSPEED = 30.0
const ACCELERATION = 50.0 # Aumentamos este valor porque ahora se multiplica por delta
const FRICTION = 40.0     # Opcional: para que se detenga con suavidad
var cooldown = 0
const COOLDOWN = 8

@onready var guns = [$Gun_R, $Gun_L]
@onready var main = get_tree().current_scene
# Usamos 'preload' en lugar de 'load' para mejorar el rendimiento
var Bullet = preload("res://Escenas/bullet.tscn")

func _physics_process(delta):
	# 1. Obtener el input de forma más limpia
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	var target_velocity = Vector3(input_dir.x, input_dir.y, 0) * MAXSPEED

	# 2. Aplicar aceleración suave usando la propiedad 'velocity' nativa
	# Usamos lerp o move_toward para que el cambio de velocidad sea constante
	velocity.x = move_toward(velocity.x, target_velocity.x, ACCELERATION * delta)
	velocity.y = move_toward(velocity.y, target_velocity.y, ACCELERATION * delta)

	# 3. Rotación estética (Banking)
	# Multiplicamos por un factor para que la inclinación sea proporcional a la velocidad actual
	rotation_degrees.z = velocity.x * -2.0
	rotation_degrees.x = velocity.y / 2.0
	rotation_degrees.y = -velocity.x / 2.0

	# 4. Mover la nave
	# En Godot 4, move_and_slide() no requiere parámetros, usa el 'velocity' del objeto
	move_and_slide()
	
	position.x = clamp(transform.origin.x, -15, 15)
	position.y = clamp(transform.origin.y, -10, 10)

	# Disparar
	if Input.is_action_just_pressed("ui_shoot") and cooldown <= 0:
		cooldown = COOLDOWN * delta
		$LaserSound.play() # Añadir el sonido de la bala.
		for gun in guns:
			# 1. En Godot 4 usamos instantiate() en lugar de instance()
			var bullet = Bullet.instantiate()
			# 1.5 Añadir la bala al arbol de la escena (el mundo)
			main.add_child(bullet)
			# 2. Asignamos la posición y rotación ANTES de añadirlo a la escena principal
			# MUY IMPORTANTE: Usamos 'global_transform' en lugar de 'transform'
			bullet.global_transform = gun.global_transform
			# 3. Calculamos la velocidad usando el eje Z global de la bala
			bullet.velocity = bullet.global_transform.basis.z * -600.0
			
	# COOLDOWN
	if cooldown > 0:
		cooldown -= delta  
