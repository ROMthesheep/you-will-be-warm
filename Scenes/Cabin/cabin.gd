class_name Cabin extends Node2D

# MARK: Signals

# MARK: enums & constants
@onready var task_menu: TaskMenu = $TaskMenu
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# MARK: Exports

# MARK: Public vars

# MARK: Private vars

# MARK: Onready vars

# MARK: Basic lifecycle

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	task_menu.donePlanning.connect(_endScene)

# MARK: Built-in methods

func _input(event) -> void:
	pass

# MARK: Public methods

# MARK: Private methods
func _endScene():
	animation_player.play("fadeout")
# MARK: Internal classes


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"enterTree":
			print("Semana: " + str(GameManager.currentWeek))
			match GameManager.currentWeek:
				0:
					DialogManager.startDialog(Constants.DIALOG_POSITION,Constants.DIALOG[0]["lines"],Constants.DIALOG[0]["speaker"])
				1:
					DialogManager.startDialog(Constants.DIALOG_POSITION,Constants.DIALOG[1]["lines"],Constants.DIALOG[1]["speaker"])
				3:
					DialogManager.startDialog(Constants.DIALOG_POSITION,Constants.DIALOG[3]["lines"],Constants.DIALOG[3]["speaker"])
				6:
					DialogManager.startDialog(Constants.DIALOG_POSITION,Constants.DIALOG[6]["lines"],Constants.DIALOG[6]["speaker"])
				8:
					DialogManager.startDialog(Constants.DIALOG_POSITION,Constants.DIALOG[8]["lines"],Constants.DIALOG[8]["speaker"])
		"fadeout":
			GameManager.cabinEnded.emit()
			queue_free()
