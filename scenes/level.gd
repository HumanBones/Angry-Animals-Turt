extends Node2D

const ANIMAL = preload("res://scenes/Animal/animal.tscn")
@onready var animal_start = $AnimalStart

func _ready():
	spawn_animal()
	SignalManager.on_animal_died.connect(spawn_animal)


func spawn_animal() ->void:
	var animal_instance = ANIMAL.instantiate() as Node2D
	animal_instance.position = animal_start.position
	add_child(animal_instance)
