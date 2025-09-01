local portal = script.Parent.Parent.Parent:FindFirstChild('Teleport_A')

local function Teleport(hit)
	local columna = hit.Parent:FindFirstChild('HumanoidRootPart')
	columna.CFrame = CFrame.new(portal.Teleport.Position)
end

script.Parent.Touched:Connect(Teleport)
