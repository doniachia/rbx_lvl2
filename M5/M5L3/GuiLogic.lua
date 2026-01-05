local timerLabel = script.Parent.TextLabel
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:WaitForChild("SyncTimerEvent")

local function changeText(timerValue, text)
	if timerValue > 0 then
		while timerValue > 0 do	
			timerLabel.Text = text .. tostring(timerValue)
			wait(1)
			timerValue = timerValue - 1
		end
	else
		timerLabel.Text = text
	end		
end

RemoteEvent.OnClientEvent:Connect(function(timerValue, text)
	changeText(timerValue, text)
end)
