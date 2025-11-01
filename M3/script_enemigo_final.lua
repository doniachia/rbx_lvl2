local enemigo = script.Parent
local waypoints = game.Workspace.WayPoints:GetChildren()
-- Variables para uso del evento
local ServerStorage = game:GetService('ServerStorage')
local event = ServerStorage:WaitForChild('BaseUpdate')

table.sort(waypoints, function(a, b)
	return tonumber(a.Name) < tonumber(b.Name)
end)

for waypoint = 1, #waypoints do
	enemigo.Humanoid:MoveTo(waypoints[waypoint].Position)
	enemigo.Humanoid.MoveToFinished:Wait()
	enemigo.Humanoid.Died:Connect(function()
		wait(1)
		enemigo:Destroy()
	end)
end

enemigo:Destroy()
-- 
event:Fire(20)
