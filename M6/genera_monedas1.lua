ocal spawnPoint = workspace:WaitForChild("Spawn")
local replicatedStorage = game:GetService("ReplicatedStorage")
local coin = replicatedStorage:FindFirstChild("Coin")
local maxObjects = 70

function spawnObject()	
	local objectCount = 0
	objectCount = #spawnPoint:GetChildren()
	local objectsToSpawn = maxObjects - objectCount
	for i = 1, objectsToSpawn do
		local spawnPosition = spawnPoint.Position + Vector3.new(math.random(-70,70), 0, math.random(-70,70))
		local newCoin = coin:Clone()
		newCoin.Position = spawnPosition
		newCoin.Parent = spawnPoint
	end
end

while true do
	spawnObject()
	wait(5)
end
