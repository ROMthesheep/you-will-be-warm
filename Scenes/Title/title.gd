class_name Title extends Node2D

# MARK: Signals

# MARK: enums & constants

# MARK: Exports

# MARK: Public vars

# MARK: Private vars
var _isTransitioning = false
# MARK: Onready vars

# MARK: Basic lifecycle

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	pass

# MARK: Built-in methods

func _input(event) -> void:
	if (event is InputEventMouseButton or event is InputEventKey) and not _isTransitioning:
		_isTransitioning = true
		$animationController.play("FadeOut")
		$Audio/Knock.play()

# MARK: Public methods

# MARK: Private methods

# MARK: Internal classes


func _on_animation_player_2_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"FadeOut":
			get_tree().root.add_child(preload("res://Scenes/Intro/intro.tscn").instantiate())
			queue_free()
