local piso = script.Parent

local function mostrar_mensaje(hit)
	
	piso.CanTouch = false
	if hit.Parent:FindFirstChild('Winner') then
		local mensaje = Instance.new("Message")
		mensaje.Parent = workspace
		mensaje.Text = "Ganaste y tienes la estatuilla!"
		wait(3)
		mensaje:Destroy()
		
	else
		local mensaje = Instance.new("Message")
		mensaje.Parent = workspace
		mensaje.Text = "Ganaste pero no tienes la estatuilla!"
		wait(3)
		mensaje:Destroy()
	end
piso.CanTouch = true
end

piso.Touched:Connect(mostrar_mensaje)
