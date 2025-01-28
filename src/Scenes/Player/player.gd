extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()

func get_input():
	if Judgement.get_is_Ready() == false:
		return
	if Input.is_action_just_pressed("player_react"):
		var judgement = Judgement.get_Judgement()
		var score = Judgement.get_reaction_time()
		if score > 0:
			Score.increment_time(score)
		if judgement:
			return
		Score.increment_hit(1) #TODO Implement rest of hit logic
