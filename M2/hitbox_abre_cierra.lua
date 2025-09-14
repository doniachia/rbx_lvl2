local puerta = game.Workspace.etapa1.puerta
local hitbox = script.Parent.Hitbox
local boton = script.Parent.Parent:FindFirstChild("Button")

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
