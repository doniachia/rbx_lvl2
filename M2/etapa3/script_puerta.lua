-- Este código hace que la puerta se active y poder ser cruzada 
-- durante 10 segundos.

local hitbox = script.Parent.Hitbox
local puerta = script.Parent.Parent.TimeDoor
local gui = puerta.BillboardGui
local texto_gui = gui.TextLabel
local cuenta = 10
local activado = false

local function abrir()
	if activado == false then
		activado = true
		--Abrir la puerta
		gui.Enabled = true --Activar el BillboardGui
		puerta.Transparency = 1
		puerta.CanCollide = false
		--Activar el timer con un bucle
		repeat
			texto_gui.Text = cuenta
			wait(1) -- Para simular un segundo pasado.
			cuenta -= 1
		until
		cuenta == 0 -- Doble igual porque es comparación
		
		-- Cerrar la puerta luego de la cuenta regresiva
		puerta.Transparency = 0
		puerta.CanCollide = true
		cuenta = 10
		activado = false
	end
end

hitbox.Touched:Connect(abrir)
