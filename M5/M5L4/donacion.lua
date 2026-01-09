
local button = script.Parent
local MPS = game:GetService("MarketplaceService")
local id = 0000000000 


function donate(player)	
	MPS:PromptProductPurchase(player, id)	
	MPS.ProcessReceipt = function(receiptInfo)		
		if receiptInfo.ProductId == id then 			
			local playerGui = player:WaitForChild("PlayerGui")
			local screenGui = playerGui:FindFirstChild("ScreenGui")
			local thankYouLabel = screenGui:FindFirstChild("ThankYou")
			thankYouLabel.Visible = true
			wait(5)
			thankYouLabel.Visible = false			
		end
	end	
end

button.MouseClick:Connect(donate)
