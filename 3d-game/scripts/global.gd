extends Node

var keypad = false
var can_torch = false
var key = true
var coins = 0

@onready var music = AudioStreamPlayer.new()

func _ready():
	add_child(music)
	music.process_mode = Node.PROCESS_MODE_ALWAYS
	music.stream = preload("res://audio/dungeon bg music.mp3")
	music.stream.loop = true
	music.play()
