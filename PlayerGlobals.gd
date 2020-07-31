extends Node


var Number_of_players = 2
const ROUND_TIME = 30
var Players = []
var Chars = []
var timer = Timer.new()
var round_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_one_shot(false)
	timer.set_timer_process_mode(0)
	timer.set_wait_time(ROUND_TIME)
	timer.connect("timeout", self, "check_round")
	add_child(timer)	
	randomize()# Replace with function body.

func createCharArray():
	Chars =[]
	Chars.append(preload("res://Characters/Character1/Character1.tscn").instance())
	Chars.append(preload("res://Characters/Character/Character.tscn").instance())
	Chars.append(preload("res://Characters/Character2/Character2.tscn").instance())
	Chars.append(preload("res://Characters/Character3/Character3.tscn").instance())


func createPlayers():
	
	for i in Players:
		i.queue_free()
	Players = []
	for i in Number_of_players:
		var player = Player.new()
		player.Name = "ṔPlayer	 " + str(i)
		player.shortName = "ṔP" + str(i)
		Players.append(player)
	

func spawnPlayers():
	for i in get_tree().get_nodes_in_group("Jugador"):
		i.queue_free()
	var spawn_points = get_tree().get_nodes_in_group("Player spawn")
	var length = spawn_points.size()
	var a = []
	for j in range(length):
		a.append(j)  
	for i in PlayerGlobals.Number_of_players:
		var random = randi()%a.size()
		#print(random)
		var spawn_p = spawn_points[a[random]].get_global_position()
		var character = Players[i].Character
		character.id = i
		character.global_position = spawn_p
		add_child(character)
		a.remove(random)
		#Spawn player on point
		
func check_round():
	round_over = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
