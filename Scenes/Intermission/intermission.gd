class_name Intermission extends Node2D

# MARK: Signals

# MARK: enums & constants

# MARK: Exports

# MARK: Public vars
var days: Array[String] = []
var week

# MARK: Private vars
var _currentDay
var _numberOfDialogs = 0
var _currentDialog = 0
var _currentEvent

# MARK: Onready vars
@onready var label: Label = $CanvasLayer/MarginContainer/VBoxContainer/Label
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# MARK: Basic lifecycle

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	week = GameManager.currentWeek
	DialogManager.endDialog.connect(_finDialogo)

# MARK: Built-in methods

func _input(event) -> void:
	pass

# MARK: Public methods

# MARK: Private methods

# MARK: Internal classes

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"fadein":
			timer.start()
			_currentDay = 0

func _on_timer_timeout() -> void:
	if _currentDay == days.size(): 
		GameManager.intermissionEnded.emit()
		timer.stop()
		queue_free()
		return
	label.text = days[_currentDay]
	_currentDay += 1
	audio_stream_player.play()
	var probEvento = randi() % 100 * week * 0.3 * Events.eventMultiplicator
	print("Probalidad de evento: " + str(probEvento))
	if  probEvento > 80:
		Events.eventMultiplicator = 0.5
		playEvent()
	else:
		Events.eventMultiplicator *= 1.3
		timer.start()

func playEvent():
	if Events.availableEvents.is_empty():
		timer.start()
		return
	var selectedEvent = Events.availableEvents.pick_random()
	Events.availableEvents.remove_at(Events.availableEvents.find(selectedEvent))
	_currentEvent = Events.EVENTS[selectedEvent]
	_numberOfDialogs = _currentEvent.size()
	Events.resolveEvent.emit(selectedEvent)
	print("Evento!")
	print("Evento numero: " + str(selectedEvent))
	print("Eventos restantes: " + str(Events.availableEvents))
	DialogManager.startDialog(Constants.DIALOG_POSITION,_currentEvent[_currentDialog]["lines"], _currentEvent[_currentDialog]["speaker"])

func _finDialogo():
	_numberOfDialogs -=1
	_currentDialog +=1
	if _numberOfDialogs <= 0:
		_numberOfDialogs = 0
		_currentDialog = 0
		timer.start()
	else:
		DialogManager.startDialog(Constants.DIALOG_POSITION,_currentEvent[_currentDialog]["lines"], _currentEvent[_currentDialog]["speaker"])
