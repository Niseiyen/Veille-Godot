extends Node

@onready var label: Label = $"../Label"

var point: int = 0 

func addPoint(value):
	point += value
	label.text = str(point)
