--Game Logic
local partsGame = workspace.LevelParts:GetChildren()
local partsLobby = workspace.TeleportsLobby:GetChildren()
local teleportPointsGame = {}
local teleportPointsLobby = {}
local Players = game:GetService("Players")

-- M4L3 mod
-- Nuevas variables para acceder al LocalScript
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local RoundTimer = require(ReplicatedStorage:WaitForChild("ModuleScript")) 

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
	RoundTimer.WaitPlayersTime = true  -- M4L3 mod
	while #Players:GetPlayers() < 2 do	-- M4L3 mod
		wait()
	end
	RoundTimer.WaitPlayersTime = false -- M4L3 mod
	wait(RoundTimer.RestTime) -- M4L3 mod
	
	for _, player in pairs(game.Players:GetPlayers()) do
		player:SetAttribute("Tag", "Match")
		teleportPlayerToRandomPoint(player, teleportPointsGame)
	end
	wait(RoundTimer.PreparationTime)	-- M4L3 mod	
	RoundTimer.GameTime = true	-- M4L3 mod
	
	-- M4L3 mod
  -- Bucle nuevo
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
			break
		end
	end	
	
	for _, player in pairs(game.Players:GetPlayers()) do
		if player:GetAttribute("Tag", "Match") then
			player:SetAttribute("Tag", nil)
			teleportPlayerToRandomPoint(player, teleportPointsLobby)
		end		
	end
	
	wait(RoundTimer.WinnerTime) -- M4L3 mod
end
