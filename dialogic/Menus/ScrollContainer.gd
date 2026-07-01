extends ScrollContainer

func _ready():
	var v = get_v_scrollbar()
	var h = get_h_scrollbar()

	v.modulate.a = 0
	h.modulate.a = 0

	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
