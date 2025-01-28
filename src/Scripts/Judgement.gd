extends Node

var is_early: bool
var is_late: bool
var is_ready:bool

var timer_window: Timer
var timer_react_begin: int
var timer_react_end: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_early = true
	is_late = true
	is_ready = false
	timer_window = Timer.new()
	timer_window.autostart = false
	timer_react_begin = 0
	timer_react_end = 0
	timer_window.one_shot = true
	timer_window.connect("timeout", on_timer_timeout, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Set the timer that controls the window time for reaction
func set_window(time: float):
	timer_window.wait_time = time
	timer_react_begin = -1
	timer_react_end = -1
	is_early = true
	is_late = false

#Start the timer for reaction
func start_window():
	timer_window.start()
	is_early = false
	timer_react_begin = Time.get_ticks_msec()

#End the timer for reaction
func on_timer_timeout():
	is_late = true
	
func get_is_Early():
	return is_early

func get_is_Late():
	return is_late

func get_is_Ready():
	return is_ready
	
func set_is_Ready(ready: bool):
	is_ready = ready

#Get how fast the player reacted
func get_reaction_time():
	if timer_react_begin == -1 or timer_react_end == -1:
		return -1
	return timer_react_end - timer_react_begin

#Get if the player's attack was successful
func get_judgment():
	timer_react_end = Time.get_ticks_msec()
	return is_early == false && is_late == false
