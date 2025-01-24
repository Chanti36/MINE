extends Control

var b_gameoverMenu := false

func DoGameOver():
	visible = true
	$AnimationPlayer.play("GameOver")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "GameOver":
		b_gameoverMenu = true

func _on_button_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT && b_gameoverMenu:
			print("Left!")
			get_tree().reload_current_scene()



#func _on_button_gui_input(event):
	#if event is InputEventMouseButton:
		#if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#print("Left!")
		#if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			#print("Right!")
