extends RichTextLabel



func _ready():
	set_text("DEATHS: " + str(global.deaths))
	
func _process(delta):
	if Input.is_key_pressed(32):
		get_tree().change_scene("World1.tscn")