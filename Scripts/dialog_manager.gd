extends Node
@onready var dialogBoxScene = preload("res://Scenes/Dialog/DialogBox.tscn")

signal characterEndedSpeaking()
signal endDialog()

var dialogLines: Array = []
var currentLineIndex = 0
var speaker: String = ""
var portraitPath = "res://Assets/Portraits/"

var dialogBox: DialogBox
var dialogBoxPosition: Vector2

var isDialogActive = false
var canAdvanceLine = false

func startDialog(pos: Vector2, lines: Array, speaker: String):
	if isDialogActive: return
	dialogLines = lines
	dialogBoxPosition = pos
	self.speaker = speaker
	_showDialogBox()
	isDialogActive = true
	
func _showDialogBox():
	canAdvanceLine = false
	dialogBox = dialogBoxScene.instantiate()
	dialogBox.finishedDisplaying.connect(_onTextBoxFinishedDisplaying)
	get_tree().root.add_child(dialogBox)
	dialogBox.global_position = dialogBoxPosition
	dialogBox.displayText(speaker, dialogLines[currentLineIndex],load(portraitPath + speaker + ".png"))
	
func _onTextBoxFinishedDisplaying():
	canAdvanceLine = true
	characterEndedSpeaking.emit()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton or event is InputEventKey:
		if isDialogActive and canAdvanceLine:
			dialogBox.queue_free()
			currentLineIndex += 1
			if currentLineIndex >= dialogLines.size():
				isDialogActive = false
				currentLineIndex = 0
				endDialog.emit()
				return
			_showDialogBox()
