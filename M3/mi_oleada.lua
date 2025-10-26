local ServerStorage = game:GetService('ServerStorage')
local Mobs = workspace.Mobs

local function mobSpawn(name, quantity, speed)
	for i=1, quantity do
		local newMob = ServerStorage.Mobs:FindFirstChild(name):Clone()
		newMob.Parent = workspace.Mobs
		newMob.HumanoidRootPart.CFrame = workspace.Start.CFrame
		
		local humanoid = newMob:FindFirstChild('Humanoid')
		humanoid.WalkSpeed = speed
		wait(0.2)
	end
end


for wave=1, 3 do
	if wave==1 then
		mobSpawn("Noob", 2, 30)
	elseif wave==2 then
		mobSpawn("Teddy", 4, 20)
		mobSpawn("Robot", 1, 35)
	elseif wave==3 then
		mobSpawn("Noob", 5, 20)
		mobSpawn("Teddy", 4, 35)
		mobSpawn("Robot", 3, 40)
	end

	repeat
		wait(1)
	until
	#Mobs:GetChildren() == 0
end
