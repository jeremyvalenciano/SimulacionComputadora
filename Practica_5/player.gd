extends CharacterBody2D

@export var speed := 300
var screen_size: Vector2
signal coin_collected(value: int)  # Añade esta señal

func _ready():
	add_to_group("player")
	screen_size = get_viewport_rect().size
	print("Grupos del jugador: ", get_groups())

func move_left():
	velocity.x = -speed

func move_right():
	velocity.x = speed

func move_up():
	velocity.y = -speed

func move_down():
	velocity.y = speed

func stop_horizontal():
	velocity.x = 0

func stop_vertical():
	velocity.y = 0

func _physics_process(delta):
	move_and_slide()
	
	# Limita la posición a los bordes de la pantalla
	global_position = global_position.clamp(
		Vector2(20, 20),  # Margen de 20 píxeles
		Vector2(screen_size.x - 20, screen_size.y - 20)
	)
