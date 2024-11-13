extends Control

func _on_changer_de_scene_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Test/TestLevel.tscn")
	
func _on_jouer_pressed() -> void:
	print("Jouer")
	
func _on_quitter_pressed() -> void:
	get_tree().quit()
