local boton = script.Parent
local tercerPiso = script.Parent.Parent:FindFirstChild('InvisibleFloor3')


local function abrir(hit)
	boton.CanTouch = false
	local jugador = hit.Parent
	--Revisar si tiene el sombrero
	if jugador:FindFirstChild('Hat') then
		tercerPiso.Transparency = 0
		tercerPiso.CanCollide = true
    -- No se activa más el CanTouch, no hace falta!
	else
		local mensaje = Instance.new("Message")
		mensaje.Parent = workspace
		mensaje.Text = 'Tienes que encontrar primero un Sombrero!'
		wait(2)
		mensaje:Destroy()
		boton.CanTouch = true --Solo se activa si no se tiene el sombrero
	end
	
end

boton.Touched:Connect(abrir)
