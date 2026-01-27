-- Para hacer la prueba con una pieza cuyo nombre debe ser "Test"
local maxHp
local part = workspace:WaitForChild("Test") -- Variable temporal


local function createCoinGui(coin, hp)
  	maxHp = hp
	-- Se crea y configura un BillboardGui con código
	local billboardGui = Instance.new("BillboardGui")
	billboardGui.ExtentsOffset = Vector3.new(0,2,0)
	billboardGui.MaxDistance = 60
	billboardGui.Parent = coin
	billboardGui.Size = UDim2.new(0, 150, 0, 20)
	billboardGui.AlwaysOnTop = true

	-- Se crea y configura un "Frame" dentro del anterior BillboardGui<
	local healthBarBackground = Instance.new("Frame")
	healthBarBackground.Parent = billboardGui
	healthBarBackground.BackgroundColor3 = Color3.new(1, 0.917647, 0)
	healthBarBackground.Transparency = 0.7
	healthBarBackground.Size = UDim2.new(1, 0, 1, 0)

	-- Se crea otro "Frame", dentro de "healthBackground" (copiar)
	local healthBar = Instance.new("Frame")
	healthBar.Parent = healthBarBackground
	healthBar.BackgroundColor3 = Color3.new(0, 1, 0)
	healthBar.Size = UDim2.new(1, 0, 1, 0) 

	-- Se Crea un "TextLabel" dentro de "billboardGui" (copiar)
	local textLabel = Instance.new("TextLabel")
	textLabel.Parent = billboardGui
	textLabel.Font = "Creepster"
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.Text = hp .. " / " .. hp
	textLabel.BackgroundTransparency = 1
	textLabel.TextScaled = true
end

createCoinGui(part, 100)
