local ServerStorage = game:GetService("ServerStorage")
local Mobs = workspace.Mobs


local function mobSpawn()
	local newMob = ServerStorage.Mobs:FindFirstChild('Noob'):Clone() --Clonando el enemigo
	newMob.Parent = workspace.Mobs --Moviéndolo a la carpeta Mobs
	newMob.HumanoidRootPart.CFrame = workspace.Start.CFrame -- Moviendo el enemigo al punto de aparición
end

mobSpawn()
