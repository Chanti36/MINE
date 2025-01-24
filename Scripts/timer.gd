extends Control

var f_gameTime := 120.0
var b_playing := false


func _init():
	pass


func StartTimer():
	b_playing = true

func _process(delta):
	if !b_playing:
		return
	f_gameTime -= delta
	
	$Front.scale = Vector2(f_gameTime/120, 1)
	if (int(f_gameTime) % 60) < 10:
		$Label.text = ("0" + str(int(f_gameTime / 60)) + ":0" + str(int(f_gameTime) % 60))
	else:
		$Label.text = ("0" + str(int(f_gameTime / 60)) + ":" + str(int(f_gameTime) % 60))

	if f_gameTime <= 0:
		TIMEUP.emit()
		b_playing = false
		$Front.scale = Vector2(0, 1)
		$Label.text = ("00:00")

signal TIMEUP()
