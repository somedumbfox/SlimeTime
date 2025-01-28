extends Node

var timesHit:int = 0
var totalTime:float = 0.0
const MAX_TIME = 5000


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func reset():
	timesHit = 0
	totalTime = 0.0

func increment_hit(num:int):
	timesHit += num

func increment_time(num:float):
	totalTime += MAX_TIME - num

func get_totalTime() -> float:
	return totalTime

func get_timesHit():
	return timesHit
