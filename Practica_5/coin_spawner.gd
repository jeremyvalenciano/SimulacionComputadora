extends Node2D

@export var coin_scene: PackedScene
@export var initial_coins: int = 15
@export var spawn_area: Rect2 = Rect2(100, 100, 800, 400)

# 1. Primero define la función que manejará la señal
func _on_coin_collected(amount: int):
	get_tree().call_group("score_handler", "add_score", amount)
	print("Puntos añadidos:", amount)

func _ready():
	if coin_scene == null:
		push_error("¡No hay escena de moneda asignada!")
		return
	
	spawn_coins()

func spawn_coins():
	for i in range(initial_coins):
		var coin = coin_scene.instantiate()
		add_child(coin)
		
		coin.position = Vector2(
			randf_range(spawn_area.position.x, spawn_area.end.x),
			randf_range(spawn_area.position.y, spawn_area.end.y)
		)
		
		# 2. Ahora conecta la señal correctamente
		if coin.has_signal("collected"):
			coin.collected.connect(_on_coin_collected)
		else:
			push_error("La moneda no tiene señal 'collected'")
