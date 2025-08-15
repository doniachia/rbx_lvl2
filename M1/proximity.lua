local proximity = script.Parent

local function onClick()
	local newPart = Instance.new("Part")
	newPart.Size = Vector3.new(5, 5, 20)
	newPart.Position = proximity.Parent.Position + Vector3.new(0, 0, 5)
	newPart.Anchored = true
	newPart.Parent = workspace
end

proximity.Triggered:Connect(onClick)
