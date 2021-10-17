extends AudioStreamPlayer

export(Array, AudioStream) var resources

func play_immediately():
	self.stop()
	self.set_stream(get_random_resource())
	self.play()

func play_next():
	if self.playing:
		yield(self, "finished")
	play_immediately()

func get_random_resource():
	return resources[randi() % resources.size()]
