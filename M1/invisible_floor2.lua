local boton = script.Parent
local segundoPiso = script.Parent.Parent:FindFirstChild('InvisibleFloor2')

local function aparecer(hit)
	local jugador = hit.Parent
	if jugador:FindFirstChild('Lolipop') then -- Asegurarse que Lolipop esté bien escrito
		segundoPiso.Transparency = 0
		segundoPiso.CanCollide = true
	end
end

boton.Touched:Connect(aparecer)
