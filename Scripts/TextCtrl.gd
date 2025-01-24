extends Control

var i_charI   := 0
var i_phraseI := 0

var f_charDelay   := 0.1
var f_phraseDelay := 2.0
var f_charTimer   := 0.0
var f_phraseTimer := 0.0

var b_onDialogue := false
var b_keyPressed := false
var b_skipped    := false

var s_text:Array[String]

@onready var Text = $Label


func StartTextDisplay(text):
	s_text = text
	b_onDialogue = true
	$Label.text = ""
	i_charI   = 0
	i_phraseI = 0
	f_charTimer   = 0.0
	f_phraseTimer = 0.0


func _process(delta):
	if !b_onDialogue:
		return
	ProcessText(delta)

func _input(event):
	if !b_onDialogue:
		return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("presesd")
				b_skipped = true

func ProcessText(delta):
	f_charTimer +=delta
	
	#CHARS
	if (i_charI < s_text[i_phraseI].length()):
		if !b_skipped:
			f_charTimer += delta
			if f_charTimer > f_charDelay :
				$Label.text += s_text[i_phraseI][i_charI]
				f_charTimer = 0
				i_charI+=1
			return
		else:
			$Label.text = s_text[i_phraseI]
			i_charI = s_text[i_phraseI].length()
			b_skipped = false
	
	#FRASES
	if b_skipped:
		f_phraseTimer = f_phraseDelay
		b_skipped = false
	
	f_phraseTimer += delta
	if f_phraseTimer > f_phraseDelay:
		$Label.text = ""
		#SI HAY MAS FRASES
		if i_phraseI < s_text.size() - 1:
			f_phraseTimer = 0
			i_charI = 0
			i_phraseI += 1
		else:
			b_onDialogue = false
