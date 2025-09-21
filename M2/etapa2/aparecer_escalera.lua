local parte1 = script.Parent.Parent.Part1
local parte2 = script.Parent.Parent.Part2
local parte3 = script.Parent.Parent.Part3
local hitbox = script.Parent.Hitbox

local function aparecer()
	parte1.Transparency = 0
	parte1.CanCollide = true
	parte2.Transparency = 0
	parte2.CanCollide = true
	parte3.Transparency = 0
	parte3.CanCollide = true
end

local function desaparecer()
	parte1.Transparency = 1
	parte1.CanCollide = false
	parte2.Transparency = 1
	parte2.CanCollide = false
	parte3.Transparency = 1
	parte3.CanCollide = false
end

hitbox.Touched:Connect(aparecer)
hitbox.TouchEnded:Connect(desaparecer)
