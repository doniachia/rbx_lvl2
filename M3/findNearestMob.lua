local tower = script.Parent
local mobs = workspace.Mobs

local function FindNearestMob()
	-- Encuentra el enemigo más cercano en el mapa
	local maxdistance = 50
	local nearMob = nil
	
	-- Encontrar todos los enemigos en el mapa.
	for mobIndex = 1, #mobs:GetChildren() do
		-- Encontrar la distancia entre la torre y el enemigo de turno
		local mob = mobs:GetChildren()[mobIndex]
		local distance = (mob.HumanoidRootPart.Position - tower.Position).Magnitude
		
		--Compara la distancia
		if distance < maxdistance then
			nearMob = mob
			maxdistance = distance
		end
	end
	
	-- Devuelve el resultado
	return nearMob
end
