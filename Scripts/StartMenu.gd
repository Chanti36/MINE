extends Control

var b_onMainMenu := true

# Called when the node enters the scene tree for the first time.
func _ready():
	$BG.visible =  true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed && b_onMainMenu:
				b_onMainMenu = false
				$AnimationPlayer.play("MenuIntro")

func _on_animation_player_animation_finished(anim_name):
	if (anim_name == "MenuIntro"):
		visible = false
		STARTGAME.emit()

signal STARTGAME

#func _input(event):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#if event.pressed:
				#print("Left button was clicked at ", event.position)
			#else:
				#print("Left button was released")
		#if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			#print("Wheel down")
