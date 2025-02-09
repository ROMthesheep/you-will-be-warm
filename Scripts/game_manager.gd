extends Node

signal titleEnded()
signal cabinEnded()
signal intermissionEnded()

const CABIN = preload("res://Scenes/Cabin/Cabin.tscn")
const INTERMISSION = preload("res://Scenes/Intermission/intermission.tscn")
const END = preload("res://Scenes/end/end.tscn")
const GAME_OVER = preload("res://Scenes/GameOver/game_over.tscn")

var currentWeek: int = -1
var gameover = false

var foodReserve: int = randi_range(6, 8)
var waterReseve: int = randi_range(5, 7)
var logReseve: int = randi_range(6, 10)
var hosts: Array[String] = []

var isPipeBroken = true
var isTrapBroken = true
var isTimbermillBroken = true
var isBoatBroken = true

func _ready() -> void:
	titleEnded.connect(loadCabin)
	cabinEnded.connect(startIntermission)
	intermissionEnded.connect(loadCabin)
	
func loadCabin():
	if (foodReserve <= 0 or waterReseve <= 0 or logReseve <= 0) and not gameover:
		_GameOver()
		return
		
	foodReserve -= 3 + 1 * hosts.size()
	waterReseve -= 2 + 1 * hosts.size() - int(not isPipeBroken)
	logReseve -= 2 + 2 * hosts.size()
	
	currentWeek += 1
	get_tree().root.add_child(CABIN.instantiate())
	
func advanceWeek(isHunting: bool, isHarvesting: bool, isAskingfood: bool, isEatingHost: bool, isCreek: bool, isLake: bool, isFountain: bool, isBushes: bool, isTree: bool, isLogNeighbor: bool, isSnow: bool, isPipes: bool, isTraps: bool, isTimberMill: bool, isBoat: bool):
	isPipeBroken = not isPipes and isPipeBroken
	isTrapBroken = not isTraps and isTrapBroken
	isTimbermillBroken = not isTimberMill and isTimbermillBroken
	isBoatBroken = not isBoat and isBoatBroken
	
	foodReserve += int(int(isHunting)*randf_range(3,7) + int(isHarvesting)*randf_range(1,3) + int(isAskingfood) + int(isEatingHost)*8 + int(not isTrapBroken) * 2 + int(not isBoatBroken) * 4)
	waterReseve += int(int(isCreek)*3 + int(isLake)*2 + int(isFountain))
	logReseve += int(int(isBushes)*4 + int(isTree)*randf_range(5,8) + int(isLogNeighbor)*2 + int(not isTimbermillBroken)*3)
	
func startIntermission():
	if gameover:
		return
	if currentWeek >= 7:
		_endScreen()
		return
	var intermission = INTERMISSION.instantiate()
	intermission.days = Constants.DAYSBYWEEK[currentWeek]
	intermission.week = currentWeek
	get_tree().root.add_child(intermission)

func _endScreen():
	get_tree().root.add_child(END.instantiate())

func _GameOver():
	gameover = true
	get_tree().root.add_child(GAME_OVER.instantiate())
