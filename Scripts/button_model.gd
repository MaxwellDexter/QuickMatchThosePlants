extends MeshInstance

func _ready():
	get_tree().get_root().get_node("Game/Level Manager").connect("score_changed", self, "score_changed")

func score_changed(score):
	$PushNoise.play()
	$ButtonAnimation.play("Button")
