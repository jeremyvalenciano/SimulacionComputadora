extends CharacterBody2D

@export var speed: float = 150
@export var detection_radius: float = 300
var player: CharacterBody2D = null

func _physics_process(delta):
	# Buscar al jugador si no lo hemos encontrado aún
	if player == null:
		detect_player()
		return
	
	# Si tenemos al jugador, movernos hacia él
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

func detect_player():
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		var closest_player = players[0]
		if global_position.distance_to(closest_player.global_position) <= detection_radius:
			player = closest_player
