extends CanvasLayer

onready var menu_button = get_parent().get_node("Menus/MenuContainer/MenuButton")

func _ready():
	hide()


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

		label.text = pista["titulo"] \
		+ "\n\n" \
		+ pista["descricao"] \
		+ "\n\nDescoberto por: " \
		+ pista["personagem"] \
		+ "\n\n---------------------------\n"

		label.autowrap = true

		$ScrollContainer/VBoxContainer.add_child(label)


func _input(event):

	if event.is_action_pressed("abrir_diario"):

		if visible:

			fechar_diario()

		else:

			abrir_diario()
