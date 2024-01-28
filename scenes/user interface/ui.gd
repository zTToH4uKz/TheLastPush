extends CanvasLayer

func _ready():
	change_time()
	
func change_time():
	$Timer/ProgressBar.value = Globals.all_time
	print($Timer/ProgressBar.value)

func _on_level_change_timer():
	change_time()
