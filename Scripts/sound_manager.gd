extends Node

@onready var music = AudioStreamPlayer.new()
@onready var sfx = AudioStreamPlayer.new()

func _ready() -> void:
	_addMusic()
	_addSFX()
	
func _addMusic() -> void:
	music.name = "Musica"
	music.stream = load("res://Assets/Music/musica.mp3")
	music.autoplay = true
	music.pitch_scale = 0.75
	music.volume_db = 10
	add_child(music)

func _addSFX() -> void:
	sfx.name = "sfx"
	sfx.stream = load("res://Assets/SFX/Falling_Snow_Sound_Effect_Royalty_Free_Sound_Effects.mp3")
	sfx.autoplay = true
	sfx.pitch_scale = 0.65
	sfx.volume_db = -12
	add_child(sfx)
