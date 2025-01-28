extends Node
@onready var debugText:RichTextLabel = $RichTextLabel
@onready var enemyTest:Enemy = $Enemy
@onready var player:Node2D = $PlayerScene
@onready var InitiationTimer:Timer = $InitiationTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InitiationTimer.wait_time = 5.0
	Score.reset()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	debugText.text = "Score: %d\nTimes Hit: %d" % [Score.get_totalTime(), Score.get_timesHit()]
	pass


func _on_initiation_timer_timeout() -> void:
	enemyTest.beginChallenge("R1_C1")
	Judgement.set_is_Ready(true)
	pass # Replace with function body.
