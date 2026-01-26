local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()
	-- Comprobando si el jugador ha hecho clic en un objeto
	local target = mouse.Target
	if target then
		-- Crear un GUI
		local gui = Instance.new("ScreenGui")
		-- Mover la GUI dentro de nuestro jugador
		gui.Parent = player.PlayerGui
		-- Crear un TextLabel
		local textLabel = Instance.new("TextLabel")
		-- Mover TextLabel a Gui
		textLabel.Parent = gui
		-- Cambiar el tamaño del texto
		textLabel.TextSize = 30
		-- Establecer la posición en la que debe aparecer el texto
		textLabel.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
		-- Cambiar el texto de la GUI al nombre del objeto en el que se hizo clic
		textLabel.Text = target.Name
		-- Esperar 2 segundos
		wait(2)
		-- Eliminar la GUI
		gui:Destroy()
	end
end)
