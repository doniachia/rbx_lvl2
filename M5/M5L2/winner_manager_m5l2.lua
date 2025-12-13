local DataStoreService = game:GetService("DataStoreService")
local winsDataStore = DataStoreService:GetDataStore("PlayerWins")


local function loadPlayerWins(player)
	local success, wins = pcall(function()
		return winsDataStore:GetAsync(player.UserId)
	end)

	if success then
		local folder = Instance.new("Folder", player)
		folder.Name = "leaderstats"
		local wins = Instance.new("IntValue", folder)
		wins.Name = "Wins"
		wins.Value = wins or 0
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	loadPlayerWins(plr)
end)
