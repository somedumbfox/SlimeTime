extends Node2D
class_name Enemy

@onready var animationPlayer:AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_window(time: float):
	Judgement.set_window(time)

func start_window():
	Judgement.start_window()

func beginChallenge(name:String):
	if animationPlayer.has_animation(name):
		animationPlayer.play(name)
