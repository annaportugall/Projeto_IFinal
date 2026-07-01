extends Node

var conectado = false

func _process(delta):

	if conectado:
		return

	var dialog_node = get_tree().root.find_node(
		"DialogNode",
		true,
		false
	)

	if dialog_node:

		dialog_node.connect(
			"dialogic_signal",
			self,
			"_receber_sinal"
		)

		conectado = true

		print("CONECTADO AO DIALOGIC")


func _receber_sinal(valor):

	print("SINAL:", valor)

	match valor:

		"corrente_lian":

			Global.adicionar_pista(
				"Corrente de Prata:",
				"A corrente de Lian foi encontrada quebrada na floresta.",
				"Amara"
				
			)

		"pegadas":

			Global.adicionar_pista(
				"Pegadas Misteriosas",
				"Foram encontradas pegadas próximas ao rio.",
				"Aslan"
			)

		"carta_antiga":

			Global.adicionar_pista(
				"Carta Antiga",
				"Uma carta antiga foi encontrada dentro da biblioteca.",
				"Lian"
			)
		"buceta": 
			
			Global.adicionar_pista(
				"Bucetão",
				"Uma buceta molhadinha e cabeludona, bem pretona punk de franja",
				"Piro_Dotado"
			)	
			
