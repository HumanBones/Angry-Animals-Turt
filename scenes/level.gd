extends Node2D

const MAIN_MENU = preload("res://scenes/main_menu/main_menu.tscn")
const ANIMAL = preload("res://scenes/Animal/animal.tscn")
@onready var animal_start = $AnimalStart

func _ready():
	spawn_animal()
	SignalManager.on_animal_died.connect(spawn_animal)


func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_packed(MAIN_MENU)

func spawn_animal() ->void:
	var animal_instance = ANIMAL.instantiate() as Node2D
	animal_instance.position = animal_start.position
	add_child(animal_instance)
