-- Script que mueve el enemigo a través de los waypoints creados.
-- Importante: La carpeta que guarda los wp's debe llamarse "WayPoints" literal

local enemigo = script.Parent
local waypoints = game.Workspace.WayPoints:GetChildren()

table.sort(waypoints, function(a, b)
	return tonumber(a.Name) < tonumber(b.Name)
end)

for waypoint = 1, #waypoints do
	enemigo.Humanoid:MoveTo(waypoints[waypoint].Position)
	enemigo.Humanoid.MoveToFinished:Wait()
end
