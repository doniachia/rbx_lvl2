local puerta = script.Parent.Parent.puerta
local hitbox = script.Parent.Hitbox
local boton = script.Parent.Button
local value1 = workspace.first
local value2 = workspace.second

local function abrir()
	if value1.Value == false then
		value2.Value = true
		puerta.CanCollide = false
		puerta.Transparency = 1
		boton.BrickColor = BrickColor.Green()
	end
	
end

local function cerrar()
	if value1.Value == false then
		value2.Value = false
		puerta.CanCollide = true
		puerta.Transparency = 0
		boton.BrickColor = BrickColor.Red()
	end
	
end

hitbox.Touched:Connect(abrir)
hitbox.TouchEnded:Connect(cerrar)
