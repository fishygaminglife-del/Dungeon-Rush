extends CanvasLayer

var counting = false
var timing = false
var puzzle_time = 0.0

func _process(delta):
	if timing:
		puzzle_time += delta
		$TimerLabel.text = str(snapped(puzzle_time, 0.1))

func start_puzzle():
	$TimerLabel.text = "0.0"
	puzzle_time = 0.0
	get_tree().paused = true
	$CountDownLabel.visible = true
	$"Tick sound".play()
	$TimerLabel.visible = true
	counting = true
	$CountDownLabel.text = "3"
	$CountDownLabel.modulate = Color(1.0, 0.0, 0.0, 1.0)
	await get_tree().create_timer(1.0).timeout
	$CountDownLabel.text = "2"
	$CountDownLabel.modulate = Color(0.965, 0.42, 0.11, 1.0)
	await get_tree().create_timer(1.0).timeout
	$CountDownLabel.text = "1"
	$CountDownLabel.modulate = Color(0.0, 0.58, 0.0, 1.0)
	await get_tree().create_timer(1.0).timeout
	$"Tick sound".stop()
	$CountDownLabel.modulate = Color(1.0, 1.0, 1.0, 1.0)
	$CountDownLabel.text = "Go!"
	timing = true
	await get_tree().create_timer(0.3).timeout
	get_tree().get_root().get_node("Node3D/ProtoController").can_move = true
	get_tree().paused = false
	$CountDownLabel.visible = false

func stop_puzzle():
	timing = false
	calculate_coins()
	await get_tree().create_timer(1).timeout
	$TimerLabel.visible = false

func calculate_coins():
	var coins = 0
	if puzzle_time < 15:
		coins = 5
	elif puzzle_time < 30:
		coins = 3
	elif puzzle_time < 60:
		coins = 2
	else:
		coins = 1
	Global.coins += coins
	print("Coins earned: ", coins)
