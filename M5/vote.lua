-- Falta comentarse
-- Script de votación
local firstMapButton = game.Workspace.VotePlatform.VoteFirstMap.VoteButton
local secondMapButton = game.Workspace.VotePlatform.VoteSecondMap.VoteButton
local firstMapText = firstMapButton.Parent.VoteCount.SurfaceGui.TextLabel
local secondMapText = secondMapButton.Parent.VoteCount.SurfaceGui.TextLabel
local countFirstMap = 0
local countSecondMap = 0
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RoundTimer = require(ReplicatedStorage:WaitForChild("ModuleScript"))
local storageVoteFirst = ReplicatedStorage:FindFirstChild("Map1")
local storageVoteSecond = ReplicatedStorage:FindFirstChild("Map2")

local function Vote(button, otherButton, storage, otherStorage, count, otherCount, text, otherText, hit)
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player and not button:FindFirstChild(player.Name) and not otherButton:FindFirstChild(player.Name) then
		local vote = Instance.new("StringValue")
		vote.Name = player.Name
		vote.Parent = button
		storage.Value = storage.Value + 1
		count = storage.Value
		text.Text = "count : " .. tostring(storage.Value)
	elseif player and not button:FindFirstChild(player.Name) and otherButton:FindFirstChild(player.Name) then
		local vote = Instance.new("StringValue")
		vote.Name = player.Name
		vote.Parent = button
		storage.Value = storage.Value + 1
		count = storage.Value
		text.Text = "count : " .. tostring(storage.Value)
		otherButton:FindFirstChild(player.Name):Destroy()
		otherStorage.Value = otherStorage.Value - 1
		otherCount = otherStorage.Value
		otherText.Text = "count : " .. tostring(otherStorage.Value)		
	end
end

firstMapButton.Touched:Connect(function(hit)
	if RoundTimer.VoteStart then
		Vote(firstMapButton, secondMapButton, storageVoteFirst, storageVoteSecond, countFirstMap, countSecondMap, firstMapText, secondMapText, hit)
	end	
end)

secondMapButton.Touched:Connect(function(hit)
	if RoundTimer.VoteStart then
		Vote(secondMapButton, firstMapButton, storageVoteSecond, storageVoteFirst, countSecondMap, countFirstMap, secondMapText, firstMapText, hit)
	end	
end)

game:GetService("RunService").Heartbeat:Connect(function()	
	if RoundTimer.VoteStart == false then
		firstMapText.Text = "count : 0"
		secondMapText.Text = "count : 0"
		storageVoteFirst.Value = 0
		storageVoteSecond.Value = 0		
		for _, intV in ipairs(firstMapButton:GetChildren()) do
			if intV:IsA("StringValue") then
				intV:Destroy()
			end
		end
		for _, intV in ipairs(secondMapButton:GetChildren()) do
			if intV:IsA("StringValue") then
				intV:Destroy()
			end			
		end		
	end
end)
