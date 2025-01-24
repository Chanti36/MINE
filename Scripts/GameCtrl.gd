#https://www.reddit.com/r/godot/comments/yyr4be/how_can_i_split_a_big_png_file_to_individual/

extends Control

var b_playing := false

var intro_text:Array[String] = ["Hola, no hay tiempo", "Desactiva la bomba"]
@onready var buttonicon = preload("res://Misc/Logo.PNG")
func _ready():
	pass # Replace with function body.


func _process(delta):
	if !b_playing:
		return

func _on_timer_timeup():
	#GAME OVER
	$GameOver.DoGameOver()


func _on_start_menu_startgame():
	b_playing = true
	$Timer.StartTimer()
	$TextCtrl.StartTextDisplay(intro_text)


func _BombInput(event):
	if !b_playing:
		return
	
	#$BOMB.set_texture_normal()
	$BOMB.icon = buttonicon

	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			print("Left!")
		if event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			print("Right!")
