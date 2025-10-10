-- Va en el SeverScriptService
-- Añade a todo jugador que se conecte al grupo "Player"
-- Evita que se choque con los enemigos.

local Players = game:GetService("Players")
local physic = game:GetService("PhysicsService")

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        for i, object in ipairs(character:GetDescendants()) do
            if object:IsA("BasePart") then
	                physic:SetPartCollisionGroup(object, "Player")
            end
        end
    end)
end)
