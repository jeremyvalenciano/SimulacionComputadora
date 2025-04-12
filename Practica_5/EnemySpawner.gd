extends Node2D

@export var enemy_scene: PackedScene
@export var max_enemies: int = 10
@export var spawn_rate: float = 2.0
@export var spawn_radius: float = 500.0

var spawn_timer: float = 0.0
var current_enemies: int = 0

func _ready():
	# Configura el timer para el primer spawn
	spawn_timer = spawn_rate

func _process(delta):
	if current_enemies >= max_enemies:
		return
	
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_enemy()
		spawn_timer = spawn_rate

func spawn_enemy():
	if enemy_scene == null:
		push_error("No hay escena de enemigo asignada en el spawner")
		return
	
	var enemy = enemy_scene.instantiate()
	get_parent().add_child(enemy)  # Añade al nivel, no al spawner
	
	# Posición aleatoria en un círculo alrededor del jugador
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var angle = randf_range(0, 2 * PI)
		var offset = Vector2(cos(angle), sin(angle)) * spawn_radius
		enemy.global_position = player.global_position + offset
		current_enemies += 1
	
	# Conectar señal para saber cuando el enemigo muere
	if enemy.has_signal("enemy_died"):
		enemy.enemy_died.connect(_on_enemy_died)

func _on_enemy_died():
	current_enemies -= 1
