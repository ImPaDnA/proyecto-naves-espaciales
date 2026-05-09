extends AudioStreamPlayer

func _ready():
	# Conectar la señal finished a la función play
	finished.connect(_on_finished)
	play()

func _on_finished():
	play() # Reinicia el sonido al terminar
