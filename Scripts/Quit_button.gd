extends Button

func _pressed():
	if OS.get_name() == "HTML5":
		var js_script = "window.close();"
		JavaScriptBridge.eval(js_script)
	else:
		get_tree().quit()
