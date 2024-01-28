extends CanvasLayer

func _ready():
	change_time()
	
func change_time():
	$Timer/ProgressBar.max_value = Globals.max_value
	$Timer/ProgressBar.value = Globals.all_time
	$Timer/Label.text = "%.2fs" % [Globals.all_time]
	$Bafs/MaxValue.text = "Max time - " + str(Globals.max_value) + "s"
	$Bafs/HitValue.text = "Time for kill - " + str(Globals.hit_value) + "s"

func _process(_delta):
	$Space/Label.text = str(abs(int($"../Player".position.y/10))) + "m"

func _on_level_change_timer():
	change_time()
