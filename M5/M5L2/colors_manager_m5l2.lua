local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoundTimer = require(ReplicatedStorage:WaitForChild("ModuleScript"))

-- Mostrar un mensaje 
local function mensaje(texto)
	local mensaje = Instance.new("Message")
	mensaje.Parent = workspace
	mensaje.Text = texto
	wait(3)
	mensaje:Destroy()
end


local colors = {
	BrickColor.new("Bright red"),
	BrickColor.new("Bright violet"),
	BrickColor.new("Bright green"),
	BrickColor.new("Bright blue"),
	BrickColor.new("Really black"),
	BrickColor.new("White"),
	BrickColor.new("Bright yellow"),
	BrickColor.new("Bright pink"),
}

local usedColors = {}

-- El script que cambia los colores de los bloques.
local function setRandomColor(part)
	local availableColors = {}
	for _, color in ipairs(colors) do
		if not usedColors[color.Number] then
			table.insert(availableColors, color)
		end
	end	
	if #availableColors == 0 then
		usedColors = {}
		availableColors = colors
	end
	local randomIndex = math.random(1, #availableColors)	
	local randomColor = availableColors[randomIndex]
	part.BrickColor = randomColor
	usedColors[randomColor.Number] = true
end



local function changeColors()
	-- Función principal para la mecánica de colores.
	
	while true do
		wait()
		while RoundTimer.GameTime == true do
			-- Escoge el color ganador
			local roundColor = colors[math.random(1, #colors)] 
			mensaje("Corre a la pieza de color".. tostring(roundColor))
			print("Corre a la pieza de color: " .. tostring(roundColor))
			
			-- Da colores a los cuadros
			local parts = workspace.LevelParts:GetChildren() 
			for _, part in pairs(parts) do			
				setRandomColor(part)			
			end
			
			-- Tiempo para buscar el color
			wait(RoundTimer.RoundTime)
			
			--Desaparece los bloques de color no ganador
			for _, part in pairs(parts) do
				if part.BrickColor ~= roundColor then
					part.Transparency = 1
					part.CanCollide = false
				end
			end
			
			wait(RoundTimer.RoundTime)
			
			-- Aparece nuévamente los cuadros.
			for _, part in pairs(parts) do
				part.Transparency = 0	
				part.CanCollide = true
			end
			
			
		end
		
		
	end
end

changeColors()
