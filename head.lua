local enable = true 
local enableTransparencyChange = false
local newTransparency = 0.5           
local partsToModify = {"Head", ""} 

local function modifyParts()
    for _, model in ipairs(workspace:GetChildren()) do
        if model:IsA("Model") then
            for _, partName in ipairs(partsToModify) do
                local part = model:FindFirstChild(partName)
                if part and part:IsA("BasePart") then
                    if enable then
                        part.Color = Color3.new(1, 1, 1)
                    end
                    
                    if enableTransparencyChange then
                        part.Transparency = newTransparency
                    end
                    
                    local originalCFrame = part.CFrame
                    part.CFrame = originalCFrame
                end
            end
        end
    end
end

modifyParts()

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        modifyParts(character)
    end)
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
