-- Script que crea una GUI en las monedas

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local function createCoinGui(coin, hp)
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

mouse.Button1Down:Connect(function()
	local target = mouse.Target		
	if target and target.Name == "Coin" then
		if not target:FindFirstChild("BillboardGui") then
			
			createCoinGui(target, 10)
			
		end	
	elseif target and target.Name == "Coin2" then
		if not target:FindFirstChild("BillboardGui") then
			
			createCoinGui(target, 100)
			
		end	
	elseif target and target.Name == "Coin3" then
		if not target:FindFirstChild("BillboardGui") then
			
			createCoinGui(target, 500)
			
		end
	end		
end)
