class_name TaskMenu extends Node2D

# MARK: Signals
signal donePlanning()

# MARK: enums & constants
enum MenuType {MAIN, FOOD, WATER, FIRE, REPAIR}
	
# MARK: Exports

# MARK: Public vars

# MARK: Private vars
var _currentMenu: MenuType = MenuType.MAIN
var _hostsAvailables = 0
var _energy = 0

var _hunt = ""
var _harvest = ""
var _foodNeighbor = ""
var _eatHost = ""
var _creek = ""
var _lake = ""
var _fountain = ""
var _bushes = ""
var _tree = ""
var _logNeighbor = ""
var _snow = ""
var _traps = ""
var _pipes = ""
var _timderMill = ""
var _boat = ""

# MARK: Onready vars
@onready var titulo: Label = $VBoxContainer/tituloContainer/Panel2/Titulo
@onready var start_week_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/MainTaskMenu/StartWeekButton

@onready var main_task_menu: VBoxContainer = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/MainTaskMenu
@onready var food_menu: VBoxContainer = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FoodMenu
@onready var water_menu: VBoxContainer = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/WaterMenu
@onready var fire_logs_menu: VBoxContainer = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FireLogsMenu
@onready var repair_menu: VBoxContainer = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/RepairMenu

@onready var tareas: Label = $VBoxContainer/MainMenu2/TextMargins/Tareas

@onready var food: Label = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/Stats/Food
@onready var water: Label = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/Stats/Water
@onready var logs: Label = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/Stats/Logs
@onready var hosts: Label = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/Stats/Hosts

@onready var energyBar: Array[ColorRect] = [$VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect,$VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect2, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect3, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect4, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect5, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect6, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect7, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect8, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect9, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect10, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect11, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect12, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect13, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect14, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect15, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect16, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect17, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect18, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect19, $VBoxContainer/MainMenu/TextMargins/HBoxContainer/VBoxContainer/ColorRect20]

## FOOD
@onready var hunt_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FoodMenu/Hunt
@onready var harvest_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FoodMenu/Harvest
@onready var ask_neighbor_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FoodMenu/AskNeighbor
@onready var eat_host_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FoodMenu/EatHost
## WATER
@onready var creek_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/WaterMenu/creek
@onready var lake_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/WaterMenu/lake
@onready var fountain_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/WaterMenu/fountain
## FIRELOG
@onready var bushes_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FireLogsMenu/bushes
@onready var tree_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FireLogsMenu/tree
@onready var neighbor_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/FireLogsMenu/neighbor
## REPARATIONS
@onready var snow_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/RepairMenu/Snow
@onready var pipes_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/RepairMenu/Pipes
@onready var traps_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/RepairMenu/Traps
@onready var timber_mill_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/RepairMenu/timberMill
@onready var boat_button: Button = $VBoxContainer/MainMenu/TextMargins/HBoxContainer/RepairMenu/Boat
# MARK: Basic lifecycle

func _init() -> void:
	pass

func _enter_tree() -> void:
	pass

func _ready() -> void:
	
	titulo.text = ["Primera", "Segunda", "Tercera", "Cuarta", "Quinta", "Sexta", "Septima", "Octava", "Novena", "Decima"][GameManager.currentWeek] + " semana de invierno"
	_hostsAvailables = GameManager.hosts.size()
	pipes_button.disabled = GameManager.isPipeBroken
	traps_button.disabled = GameManager.isTrapBroken and _hostsAvailables >= 1
	timber_mill_button.disabled = GameManager.isTimbermillBroken and _hostsAvailables >= 2
	boat_button.disabled = GameManager.isBoatBroken and _hostsAvailables >= 3
	
	food.text = str(GameManager.foodReserve) + " comidas" if GameManager.foodReserve >= 0 else "BAJO MINIMOS"
	water.text = str(GameManager.waterReseve) + " agua" if GameManager.waterReseve >= 0 else "BAJO MINIMOS"
	logs.text = str(GameManager.logReseve) + " madera" if GameManager.logReseve >= 0 else "BAJO MINIMOS"
	hosts.text = str(GameManager.hosts.size()) + " invitados"
	
	_energy = 4 + _hostsAvailables*4
	setEnergy(_energy)

# MARK: Built-in methods

func _input(event) -> void:
	pass

# MARK: Public methods
func backButtonClicked():
	main_task_menu.visible = true
	food_menu.visible = false
	water_menu.visible = false
	fire_logs_menu.visible = false
	repair_menu.visible = false

func startWeek():
	GameManager.advanceWeek(not _hunt.is_empty(), not _harvest.is_empty(), not _foodNeighbor.is_empty(), not _eatHost.is_empty(), not _creek.is_empty(), not _lake.is_empty(), not _fountain.is_empty(), not _bushes.is_empty(), not _tree.is_empty(), not _logNeighbor.is_empty(), not _snow.is_empty(), not _pipes.is_empty(), not _traps.is_empty(), not _timderMill.is_empty(), not _boat.is_empty())
	donePlanning.emit()
	queue_free()

func clickOnhunt():
	if _hunt.is_empty():
		_hunt = "ir a cazar, "
		_energy -= 3
	else:
		_hunt = ""
		_energy += 3
	setEnergy(_energy)
	refreshTaskList()
	
func clickOnHarvest():
	if _harvest.is_empty():
		_harvest = "ir a buscar bayas y setas, "
		_energy -= 2
	else:
		_harvest = ""
		_energy += 2
	setEnergy(_energy)
	refreshTaskList()

func clickOnFoodNeighbor():
	if _foodNeighbor.is_empty():
		_foodNeighbor = "ir a pedirle comida a Juan, "
		_energy -= 1
	else:
		_foodNeighbor = ""
		_energy += 1
	setEnergy(_energy)
	refreshTaskList()

func clickOnEatHost():
	if _eatHost.is_empty():
		_eatHost = "comerse a uno de tus invitados, "
		_energy -= 1
	else:
		_eatHost = ""
		_energy += 1
	setEnergy(_energy)
	refreshTaskList()

func clickOnCreek():
	if _creek.is_empty():
		_creek = "ir al riachuelo, "
		_energy -= 2
	else:
		_creek = ""
		_energy += 2
	setEnergy(_energy)
	refreshTaskList()

func clickOnLake():
	if _lake.is_empty():
		_lake = "ir al lago, "
		_energy -= 3
	else:
		_lake = ""
		_energy += 3
	setEnergy(_energy)
	refreshTaskList()

func clickOnFountain():
	if _fountain.is_empty():
		_fountain = "ir a la fuente, "
		_energy -= 1
	else:
		_fountain = ""
		_energy += 1
	setEnergy(_energy)
	refreshTaskList()

func clickOnBushes():
	if _bushes.is_empty():
		_bushes = "recojer hojarasca, "
		_energy -= 3
	else:
		_bushes = ""
		_energy += 3
	setEnergy(_energy)
	refreshTaskList()

func clickOnTree():
	if _tree.is_empty():
		_tree = "talar un arbol, "
		_energy -= 4
	else:
		_tree = ""
		_energy += 4
	setEnergy(_energy)
	refreshTaskList()

func clickOnLogNeighbor():
	if _logNeighbor.is_empty():
		_logNeighbor = "pedirle madera a Ana, "
		_energy -= 1
	else:
		_logNeighbor = ""
		_energy += 1
	setEnergy(_energy)
	refreshTaskList()

func clickOnSnow():
	if _snow.is_empty():
		_snow = "despejar la nieve de la entrada, "
		_energy -= 1
	else:
		_snow = ""
		_energy += 1
	setEnergy(_energy)
	refreshTaskList()

func clickOnPipes():
	if _pipes.is_empty():
		_pipes = "arreglar las cañerias, "
		_energy -= 5
	else:
		_pipes = ""
		_energy += 5
	setEnergy(_energy)
	refreshTaskList()

func clickOnTraps():
	if _traps.is_empty():
		_traps = "arreglar las trampas, "
		_energy -= 5
	else:
		_traps = ""
		_energy += 5
	setEnergy(_energy)
	refreshTaskList()

func clickOnTimderMill():
	if _timderMill.is_empty():
		_timderMill = "arreglar el aserradero, "
		_energy -= 7
	else:
		_timderMill = ""
		_energy += 7
	setEnergy(_energy)
	refreshTaskList()

func clickOnBoat():
	if _boat.is_empty():
		_boat = "arreglar el barco, "
		_energy -= 10
	else:
		_boat = ""
		_energy += 10
	setEnergy(_energy)
	refreshTaskList()

func refreshTaskList():
	var result = _hunt + _harvest + _foodNeighbor + _eatHost + _creek + _lake + _fountain + _bushes + _tree + _logNeighbor + _snow + _traps + _pipes + _timderMill + _boat
	if result.is_empty():
		tareas.text = ""
	else:
		tareas.text = result[0].to_upper() + result.erase(result.length() - 2, 1).substr(1,-1)
	
# MARK: Private methods

func _showFoodMenu():
	main_task_menu.visible = false
	food_menu.visible = true
	water_menu.visible = false
	fire_logs_menu.visible = false
	repair_menu.visible = false
	
func _showWaterMenu():
	main_task_menu.visible = false
	food_menu.visible = false
	water_menu.visible = true
	fire_logs_menu.visible = false
	repair_menu.visible = false
	
func _showFireLogsMenu():
	main_task_menu.visible = false
	food_menu.visible = false
	water_menu.visible = false
	fire_logs_menu.visible = true
	repair_menu.visible = false
	
func _showRepairMenu():
	main_task_menu.visible = false
	food_menu.visible = false
	water_menu.visible = false
	fire_logs_menu.visible = false
	repair_menu.visible = true

func setEnergy(newEnergy):
	for i in range(energyBar.size()):
		if energyBar[i]:
			energyBar[i].visible = i < newEnergy
	configButtons()

func configButtons():
	hunt_button.disabled = not (_energy >= 3 or not _hunt.is_empty())
	harvest_button.disabled = not (_energy >= 2 or not _harvest.is_empty())
	ask_neighbor_button.disabled = not (_energy >= 1 or not _foodNeighbor.is_empty())
	eat_host_button.disabled = not (_hostsAvailables >= 1)
	
	creek_button.disabled = not (_energy >= 2 or not _creek.is_empty())
	lake_button.disabled = not (_energy >= 3 or not _lake.is_empty())
	fountain_button.disabled = not (_energy >= 1 or not _fountain.is_empty())
	
	bushes_button.disabled = not (_energy >= 3 or not _bushes.is_empty())
	tree_button.disabled = not (_energy >= 4 or not _tree.is_empty())
	neighbor_button.disabled = not (_energy >= 1 or not _logNeighbor.is_empty())
	
	snow_button.disabled = not (_energy >= 1 or not _snow.is_empty())
	boat_button.disabled = not (_energy >= 10 or not _boat.is_empty())
	
	pipes_button.disabled = (not (_energy >= 5 or not _pipes.is_empty())) or (not (GameManager.isPipeBroken and GameManager.hosts.size() >= 1))
	traps_button.disabled = (not (_energy >= 5 or not _traps.is_empty())) or  (not (GameManager.isTrapBroken and GameManager.hosts.size() >= 2))
	timber_mill_button.disabled = (not (_energy >= 7 or not _timderMill.is_empty())) or (not (GameManager.isTimbermillBroken and GameManager.hosts.size() >= 2))
	
	start_week_button.disabled = _energy < 0
	
# MARK: Internal classes
