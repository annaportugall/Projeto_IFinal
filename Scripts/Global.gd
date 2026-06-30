extends Node

var pistas = []


func adicionar_pista(titulo, descricao, personagem):

	for pista in pistas:

		if pista["titulo"] == titulo:
			return

	pistas.append({
		"titulo": titulo,
		"descricao": descricao,
		"personagem": personagem
	})
	
func test_diario():

	print("Teste Dialogic")

	adicionar_pista(
		"Pista Teste",
		"Essa pista veio do Dialogic",
		"Sistema"
	)

func _ready():
	print("Global Carregado")
