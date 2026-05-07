extends AudioStreamPlayer

func _ready():
	# 1. Empieza a sonar en cuanto nace
	play()
	
	# 2. Cuando el sonido termine, la escena se borra a sí misma para liberar memoria
	finished.connect(queue_free)
