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

		var bloco = VBoxContainer.new()
		bloco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		bloco.add_constant_override("separation", 8)

		var titulo = Label.new()
		titulo.add_font_override("font", fonte_diario)
		titulo.add_color_override("font_color", Color("#2a1b0d"))
		titulo.text = pista["titulo"].to_upper()
		titulo.align = Label.ALIGN_LEFT

		var descricao = Label.new()
		descricao.add_font_override("font", fonte_diario)
		descricao.add_color_override("font_color", Color("#2a1b0d"))
		descricao.autowrap = true
		descricao.align = Label.ALIGN_LEFT
		descricao.text = pista["descricao"]

		var investigador = Label.new()
		investigador.add_font_override("font", fonte_diario)
		investigador.add_color_override("font_color", Color("#2a1b0d"))
		investigador.align = Label.ALIGN_LEFT
		investigador.text = "Descoberto por: " + pista["personagem"]

		var separador = HSeparator.new()

		bloco.add_child(titulo)
		bloco.add_child(descricao)
		bloco.add_child(investigador)
		bloco.add_child(separador)

		$ScrollContainer/VBoxContainer.add_child(bloco)


func _input(event):

	if event.is_action_pressed("abrir_diario"):

		if visible:

			fechar_diario()

		else:

			abrir_diario()
