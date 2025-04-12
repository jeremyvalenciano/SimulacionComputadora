extends CanvasLayer

@onready var left_button: TextureButton = $Izquierda
@onready var right_button: TextureButton = $Derecha
@onready var up_button: TextureButton = $Arriba
@onready var down_button: TextureButton = $Abajo

# Variables para rastrear el estado de los botones
var left_pressed := false
var right_pressed := false
var up_pressed := false
var down_pressed := false

@export var player: CharacterBody2D  # Asigna esto desde el editor

func _ready():
	player = get_node("/root/Main/Player")
	
	# Conectar señales de los botones
	left_button.button_down.connect(_on_left_button_down)
	left_button.button_up.connect(_on_left_button_up)
	
	right_button.button_down.connect(_on_right_button_down)
	right_button.button_up.connect(_on_right_button_up)
	
	up_button.button_down.connect(_on_up_button_down)
	up_button.button_up.connect(_on_up_button_up)
	
	down_button.button_down.connect(_on_down_button_down)
	down_button.button_up.connect(_on_down_button_up)

# --- Funciones para movimiento horizontal ---
func _on_left_button_down():
	left_pressed = true
	if player:
		player.move_left()

func _on_left_button_up():
	left_pressed = false
	if player and not right_pressed:
		player.stop_horizontal()

func _on_right_button_down():
	right_pressed = true
	if player:
		player.move_right()

func _on_right_button_up():
	right_pressed = false
	if player and not left_pressed:
		player.stop_horizontal()

# --- Funciones para movimiento vertical ---
func _on_up_button_down():
	up_pressed = true
	if player:
		player.move_up()

func _on_up_button_up():
	up_pressed = false
	if player and not down_pressed:
		player.stop_vertical()

func _on_down_button_down():
	down_pressed = true
	if player:
		player.move_down()

func _on_down_button_up():
	down_pressed = false
	if player and not up_pressed:
		player.stop_vertical()

func _process(delta):
	if player:
		# Movimiento horizontal
		if left_pressed:
			player.move_left()
		elif right_pressed:
			player.move_right()
		
		# Movimiento vertical
		if up_pressed:
			player.move_up()
		elif down_pressed:
			player.move_down()
