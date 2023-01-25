extends AudioStreamPlayer

const TITLE = "res://assets/soundtrack/Main soundtrack.mp3"
const EPIC = "res://assets/soundtrack/Idontknowaudio.mp3"
const BOSS = "res://assets/soundtrack/Excitement audio.mp3"
const CREDITS = "res://assets/soundtrack/Menu audio.mp3"


func play_music(music: String):
	self.stream = load(music)
	play()
