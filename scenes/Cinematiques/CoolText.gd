extends Label


func display_text(text: String):
	for i in range(text.length()):
		self.text = text.substr(0, i+1)
		$Boup.pitch_scale = 1 + (randf() - 0.5)*0.2
		$Boup.play()
		if text[i] in ['!', '?', ';', ',', '.']:
			yield(get_tree().create_timer(0.5), "timeout")
		else:
			yield(get_tree().create_timer(0.1), "timeout")
