local hitbox = script.Parent.Hitbox
local spawn = script.Parent.Parent.SpawnPoint
local activado = false

local function crearBloque()
	if activado == false then
		activado = true
		local bloque = Instance.new('Part')
		bloque.Parent = workspace
		bloque.Size = Vector3.new(5, 5, 5)
		bloque.Position = spawn.Position
	end
	
end

hitbox.Touched:Connect(crearBloque)
