local enable = true 
local enableTransparencyChange = false
local newTransparency = 0.5           
local partsToModify = {"Head"} 

local function modifyParts()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            local head = player.Character:FindFirstChild("Head")
            if head and head:IsA("BasePart") then
                if enable then
                    head.Color = Color3.new(1, 1, 1)
                end
                
                if enableTransparencyChange then
                    head.Transparency = newTransparency
                end
            end
        end
    end
end

modifyParts()

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        modifyParts()
    end)
end)

game:GetService("RunService").Heartbeat:Connect(modifyParts)
