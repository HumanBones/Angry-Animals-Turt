extends Control

const MAIN_MENU = preload("res://scenes/main_menu/main_menu.tscn")


@onready var level_label = $MarginContainer/VB/LevelLabel
@onready var attampts_label = $MarginContainer/VB/AttamptsLabel
@onready var vb_2 = $MarginContainer/VB2
@onready var game_sound = $GameSound


func _ready():
	level_label.text = "Level %s" % ScoreManager.get_level_selected()
	update_attempts(0)
	SignalManager.on_score_updated.connect(update_attempts)
	SignalManager.on_level_completed.connect(on_level_complete)

func _process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_packed(MAIN_MENU)
	
	
	
func update_attempts(attempts: int) ->void:
	attampts_label.text = "Attempts %s" % attempts

func on_level_complete()->void:
	vb_2.show()
	game_sound.play()
