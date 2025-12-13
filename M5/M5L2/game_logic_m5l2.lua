-- Incluyo una función que muestra un mensaje de la etapa del juego

local partsGame = workspace.LevelParts:GetChildren()
local partsLobby = workspace.TeleportsLobby:GetChildren()
local teleportPointsGame = {}
local teleportPointsLobby = {}
local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local RoundTimer = require(ReplicatedStorage:WaitForChild("ModuleScript")) 

local DataStoreService = game:GetService("DataStoreService")
local winsDataStore = DataStoreService:GetDataStore("PlayerWins")



-- Mostrar un mensaje 
local function mensaje(texto)
	local mensaje = Instance.new("Message")
	mensaje.Parent = workspace
	mensaje.Text = texto
	wait(3)
	mensaje:Destroy()
end



for _, part in pairs(partsGame) do
	local position = part.Position + Vector3.new(0,2,0)
	table.insert(teleportPointsGame, position)
end


for _, part in pairs(partsLobby) do
	local position = part.Position + Vector3.new(0,2,0)
	table.insert(teleportPointsLobby, position)
end


local function getRandomTeleportPoint(spawns)
	local randomIndex = math.random(1, #spawns)
	return spawns[randomIndex]
end

local function teleportPlayerToRandomPoint(player, spawns)
	local character = player.Character
	if character then
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then

			humanoidRootPart.CFrame = CFrame.new(getRandomTeleportPoint(spawns))
		end
	end
end

while true do		
	RoundTimer.WaitPlayersTime = true 
	mensaje("Esperando jugadores...")
	
	while #Players:GetPlayers() < 2 do	
		wait()
	end
	RoundTimer.WaitPlayersTime = false

	RoundTimer.VoteStart = true
	mensaje("Iniciando la votación del mapa.")
	wait(RoundTimer.VoteTime)
	RoundTimer.VoteStart = false
	mensaje("Votación finalizada")
	
	wait(RoundTimer.RestTime) 
	mensaje("Rest time")
	
	for _, player in pairs(game.Players:GetPlayers()) do
		player:SetAttribute("Tag", "Match")
		teleportPlayerToRandomPoint(player, teleportPointsGame)
	end
	
	mensaje("Prepárate para iniciar.")
	wait(RoundTimer.PreparationTime)
	
	mensaje("Comienza el juego!")
	RoundTimer.GameTime = true	


	while wait() do		
		local playersWithTag = {}		
		for _, player in pairs(Players:GetPlayers()) do			
			local tagAttribute = player:GetAttribute("Tag", "Match")
			if tagAttribute then
				table.insert(playersWithTag, player)
			end
		end

		if #playersWithTag == 1 then			
			RoundTimer.GameTime = false	
			mensaje("El juego terminó!")
			break
		end
	end	

	for _, player in pairs(game.Players:GetPlayers()) do
		if player:GetAttribute("Tag", "Match") then
			local leaderstats = player:WaitForChild("leaderstats")
			local wins = leaderstats:FindFirstChild("Wins")
			wins.Value = wins.Value + 1
			winsDataStore:SetAsync(player.UserId, wins.Value)
			player:SetAttribute("Tag", nil)
			teleportPlayerToRandomPoint(player, teleportPointsLobby)
		end		
	end

	mensaje("Winner time")
	wait(RoundTimer.WinnerTime)
end


