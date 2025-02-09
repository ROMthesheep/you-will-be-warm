class_name DialogBox extends NinePatchRect

# MARK: Signals
signal changeText(newText)
signal changeName(newName)
signal changeAll(newName, newText)
signal finishedDisplaying()

# MARK: enums & constants
const MAX_WIDTH = 500
# MARK: Exports
@export var npcName: String
@export var text: String
@onready var portraitImage: TextureRect = $TextureRect

# MARK: Public vars

# MARK: Private vars
var _letterIndex = 0
var _letterTime = 0.04
var _spaceTime = 0.06
var _punctuationTime = 0.08
# MARK: Onready vars

@onready var nombre: Label = $MarginContainer/VBoxContainer/Nombre
@onready var texto: Label = $MarginContainer/VBoxContainer/Texto
@onready var timer: Timer = $Timer
@onready var nextDialogIndicator: TextureRect = $TextureRect2
@onready var nextDialogIndicatorAnimationPlayer: AnimationPlayer = $TextureRect2/AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# MARK: Basic lifecycle

func _init() -> void:
	changeText.connect(_changeText)
	changeName.connect(_changeName)
	changeAll.connect(_changeAll)

func _enter_tree() -> void:
	pass

func _ready() -> void:
	pass

# MARK: Built-in methods

func _input(event) -> void:
	pass
	
func _on_timer_timeout() -> void:
	_displayLetter()
	
# MARK: Public methods
func displayText(speaker: String, textToDisplay: String, portrait: CompressedTexture2D):
	portraitImage.texture = portrait
	nombre.text = speaker
	nextDialogIndicator.visible = false
	text = textToDisplay
	
	texto.text = ""
	_displayLetter()

# MARK: Private 

func _changeText(newText: String):
	texto.text = newText
	
func _changeName(newName: String):
	nombre.text = newName
	
func _changeAll(newName: String, newText: String):
	texto.text = newText
	nombre.text = newName
	
func _displayLetter():
	texto.text += text[_letterIndex]
	_letterIndex += 1
	if _letterIndex >= text.length():
		finishedDisplaying.emit()
		nextDialogIndicator.visible = true
		nextDialogIndicatorAnimationPlayer.play("blink")
		return
	
	match text[_letterIndex]:
		"!",".",",","?","¡", "¿":
			timer.start(_punctuationTime)
		" ":
			timer.start(_spaceTime)
		_:
			audio_stream_player.pitch_scale = _getPitch()
			audio_stream_player.play()	
			timer.start(_letterTime)
	
func _getPitch() -> float:
	match nombre.text:
		"Francisco":
			return randf_range(0.3,1)
		"Jacinto":
			return randf_range(0.8,1.2)
		"Isabel":
			return randf_range(1.3,1.6)
		"Alberto":
			return randf_range(0.2,0.9)
		"Rodrigo":
			return randf_range(0.1,0.8)
		_:
			return randf_range(0.3,1)
	
# MARK: Internal classes
