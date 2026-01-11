local partsLobby = workspace.TeleportsLobby:GetChildren()
local teleportPointsGame = {}
local teleportPointsLobby = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local RoundTimer = require(ReplicatedStorage:WaitForChild("ModuleScript")) 
local DataStoreService = game:GetService("DataStoreService")
local winsDataStore = DataStoreService:GetDataStore("PlayerWins")
local map1Votes = ReplicatedStorage:FindFirstChild("Map1")
local map2Votes = ReplicatedStorage:FindFirstChild("Map2")
local ServerStorage = game:GetService("ServerStorage")
local map1storage = ServerStorage:WaitForChild("Map1")
local map2storage = ServerStorage:WaitForChild("Map2")
local winner = ReplicatedStorage:WaitForChild("Winner")
local winnerSpawn = workspace.WinnerSpawn
local RemoteEvent = ReplicatedStorage:WaitForChild("SyncTimerEvent")

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

local function CloneWinner(name)
	local character = game.Players[name].Character 	
	character.Archivable = true
	clone = character:Clone()		
	local humanoidRootPart = clone:FindFirstChild("HumanoidRootPart")
	humanoidRootPart.CFrame = CFrame.new(winnerSpawn.Position + Vector3.new(0,2,0)) 
	clone.Parent = game.Workspace
	clone:ScaleTo(8)
	
	local humanoid = clone:FindFirstChild("Humanoid")	
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://15122972413"
	local animationTrack = humanoid:LoadAnimation(animation)
	animationTrack:Play()
	
end

local function giveBadge(player, badgeId)
	local badgeService = game:GetService("BadgeService")	
	badgeService:AwardBadge(player.UserId, badgeId)	
end

game.Players.PlayerAdded:Connect(function(player)
	wait(2)	
	giveBadge(player, 1819708654098575)
end)

while true do	
	while #Players:GetPlayers() < 2 do			
		RemoteEvent:FireAllClients(0, "Esperando jugadores")		
		wait()
	end
	RoundTimer.VoteStart = true
	
	RemoteEvent:FireAllClients(RoundTimer.VoteTime, "¡Votación del mapa! : ")
	
	wait(RoundTimer.VoteTime)
	RoundTimer.VoteStart = false
	
	local randomChoice = math.random(1, 2)

	if map1Votes.Value > map2Votes.Value then
		parts = map1storage:GetChildren()
	elseif map2Votes.Value > map1Votes.Value then
		parts = map2storage:GetChildren()		
	else		
		if randomChoice == 1 then
			parts = map1storage:GetChildren()
		else
			parts = map2storage:GetChildren()
		end		
	end	
	for _, part in pairs(parts) do
		local newPart = part:Clone()
		newPart.Parent = game.Workspace.LevelParts
	end
	
	local partsGame = workspace.LevelParts:GetChildren()	
	for _, part in pairs(partsGame) do
		local position = part.Position + Vector3.new(0,2,0)
		table.insert(teleportPointsGame, position)
	end
	
	RemoteEvent:FireAllClients(RoundTimer.RestTime, "¡Hora del descanso! : ")
	
	wait(RoundTimer.RestTime) 
	
	for _, player in pairs(game.Players:GetPlayers()) do
		player:SetAttribute("Tag", "Match")
		teleportPlayerToRandomPoint(player, teleportPointsGame)
	end
	
	RemoteEvent:FireAllClients(RoundTimer.PreparationTime, "Prepárate para el juego: ")
	
	wait(RoundTimer.PreparationTime)
	
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
			winner.Value = playersWithTag[1].Name			
			RoundTimer.GameTime = false	
			break
			
		elseif #playersWithTag < 1 then 
			winner.Value = ""
			RoundTimer.GameTime = false
			break
		end
	end	
	
	for _, player in pairs(game.Players:GetPlayers()) do
		if player:GetAttribute("Tag", "Match") then
			local leaderstats = player:WaitForChild("leaderstats")
			local wins = leaderstats:FindFirstChild("Wins")
			wins.Value = wins.Value + 1
			winsDataStore:SetAsync(player.UserId, wins.Value)
			
			if wins.Value == 1 then
				giveBadge(player, 2793856076992121)-- cambia por tu ID!!!
			elseif wins.Value == 10 then
				giveBadge(player, 431938131400996)-- cambia por tu ID!!!
			elseif wins.Value == 50 then	
				giveBadge(player, 1232231192481994)-- cambia por tu ID!!!
			end
			
			player:SetAttribute("Tag", nil)
			teleportPlayerToRandomPoint(player, teleportPointsLobby)
		end		
	end
	
	if winner.Value ~= "" then
		CloneWinner(winner.Value)	
		
		RemoteEvent:FireAllClients(0, "El ganador es: " .. winner.Value)
	else
		RemoteEvent:FireAllClients(0, "¡No hay ganador!")
		
	end
		
	for _, part in pairs(partsGame) do
		part:Destroy()
	end
	
	wait(RoundTimer.WinnerTime)
	
	if winner.Value ~= "" then
		clone:Destroy()
	end
end
