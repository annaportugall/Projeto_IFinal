extends CanvasLayer

onready var menu_button = get_parent().get_node("Menus/MenuContainer/MenuButton")

var fonte_diario = DynamicFont.new()

func _ready():
	hide()

	fonte_diario.font_data = load("res://Artes/diario/font_diary/Seagram tfb.ttf")
	fonte_diario.size = 18

func abrir_diario():

	atualizar_diario()

	show()

	menu_button.hide()


func fechar_diario():

	hide()

	menu_button.show()


func atualizar_diario():

	for filho in $ScrollContainer/VBoxContainer.get_children():

		filho.queue_free()


	for pista in Global.pistas:

		var label = Label.new()
		
		label.add_font_override("font", fonte_diario)
		label.add_color_override("font_color", Color("#2a1b0d"))
		
		label.text = pista["titulo"] \
		+ "\n\n" \
		+ pista["descricao"] \
		+ "\n\nDescoberto por: " \
		+ pista["personagem"] \

		label.autowrap = true
		label.align = Label.ALIGN_LEFT
		label.valign = Label.VALIGN_TOP
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL

		$ScrollContainer/VBoxContainer.add_child(label)


func _input(event):

	if event.is_action_pressed("abrir_diario"):

		if visible:

			fechar_diario()

		else:

			abrir_diario()
