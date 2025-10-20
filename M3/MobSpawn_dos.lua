local ServerStorage = game:GetService("ServerStorage")
local Mobs = workspace.Mobs


local function mobSpawn()
	local newMob = ServerStorage.Mobs:FindFirstChild('Noob'):Clone()
	newMob.Parent = workspace.Mobs
	newMob.HumanoidRootPart.CFrame = workspace.Start.CFrame
	wait(1) --Necesario para dar espacios entre oleadas
end

mobSpawn()

for wave=1, 3 do
	if wave==1 then
		mobSpawn()
	elseif wave==2 then
		mobSpawn()
		mobSpawn()
	elseif wave==3 then
		mobSpawn()
		mobSpawn()
		mobSpawn()
	end
	
	repeat
		wait(1)
	until
	#Mobs:GetChildren() == 0
end
