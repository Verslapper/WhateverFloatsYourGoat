extends Node

var score
var solution
var fxPlayer

func _ready():
	score = 0
	solution = "ASS N TITTIES"
	$HUD/BoardLabel.set_text("___ _ _______")
	fxPlayer = AudioStreamPlayer.new()
	self.add_child(fxPlayer)

func _on_AreaBlock_hit(letter):
	var prev = $HUD/BoardLabel.text
	var progress = $HUD/BoardLabel.text
	
	var i = 0
	for chr in solution:
		if (chr == letter):
			progress[i] = letter
		i += 1
			
	$HUD/BoardLabel.set_text(progress)
	
	if (prev == progress):
		score += 1 #whiffed it, nice guess chump!
		fxPlayer.stream = load("res://assets/plup.wav")
	else:
		fxPlayer.stream = load("res://assets/ding.wav")
		
	fxPlayer.play()
		
	if (progress == solution):
		you_win()
		
func you_win():
	var rank = "F"
	if (score < 3):
		rank = "S"
	elif (score < 6):
		rank = "A"
	elif (score < 10):
		rank = "B"
	elif (score < 13):
		rank = "C"
	elif (score < 17):
		rank = "D"
	elif (score < 20):
		rank = "E"
		
	$HUD/BoardLabel.set_text(solution + "! Score: " + str(score) + " Rank: " + rank)
	# Separate player so the effects can overlay the tuneskis
	var streamPlayer = AudioStreamPlayer.new()
	self.add_child(streamPlayer)
	streamPlayer.stream = load("res://assets/winA.ogg")
	streamPlayer.play()
