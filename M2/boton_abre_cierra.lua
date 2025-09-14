local puerta = script.Parent.Parent.puerta
local hitbox = script.Parent.Hitbox
local boton = script.Parent.Button

local function abrir()
	puerta.CanCollide = false
	puerta.Transparency = 1
	boton.BrickColor = BrickColor.Green()
end

local function cerrar()
	puerta.CanCollide = true
	puerta.Transparency = 0
	boton.BrickColor = BrickColor.Red()
end

hitbox.Touched:Connect(abrir)
hitbox.TouchEnded:Connect(cerrar)
