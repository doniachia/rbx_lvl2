local workspace = game:GetService('Workspace')
local base = workspace.Base
local gui = base:WaitForChild("BaseHealth")
local maxHealth = 100
local currentHealth = 100


--Actualiza el mensaje con los PV
local function updateHealth(damage)
	if damage and currentHealth > 0 then
		-- Guarda el valor mayor (positivo) de lo contrario es cero.
		currentHealth = math.max(currentHealth - damage, 0)
	end
	
	-- Actualiza el valor en el GUI
	local percent = currentHealth / maxHealth
	gui.Current.Size = UDim2.new(percent, 0, 0.5, 0)
	
	--
	if currentHealth == 0 then
		gui.TextLabel.Text = "Has sido VENCIDO"
	else
		gui.TextLabel.Text = "Base " .. currentHealth .. "/" .. maxHealth 
	end
end


updateHealth()
