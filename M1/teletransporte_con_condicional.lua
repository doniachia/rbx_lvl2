local portal = script.Parent.Parent.Parent:FindFirstChild('Teleport_A')

local function Teleport(hit)
	if hit.Parent:FindFirstChild('Key') then
		local columna = hit.Parent:FindFirstChild('HumanoidRootPart')
		columna.CFrame = CFrame.new(portal.Teleport.Position)
	end
		
end

script.Parent.Touched:Connect(Teleport)
