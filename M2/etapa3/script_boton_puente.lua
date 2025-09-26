local puente = script.Parent.Parent.puente_invisible
local hitbox = script.Parent.Hitbox

local function aparecer_puente()
	puente.Transparency = 0
	puente.CanCollide = true
end

local function desaparecer_puente()
	puente.Transparency = 1
	puente.CanCollide = false
end

hitbox.Touched:Connect(aparecer_puente)
hitbox.TouchEnded:Connect(desaparecer_puente)

