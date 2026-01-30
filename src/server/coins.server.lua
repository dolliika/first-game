local Players = game:GetService("Players")

local coins = workspace.Coins:GetChildren()

for _, coin in ipairs(coins) do
  coin:SetAttribute("Collected", false)

  coin.Touched:Connect(function(otherPart)
    if coin:GetAttribute("Collected") then return end

    local character = otherPart.Parent
    local humanoid = character:FindFirstChild("Humanoid")
    local player = Players:GetPlayerFromCharacter(character)
    if not humanoid or not player then return end
    
    local coinsStat = player:WaitForChild("leaderstats"):WaitForChild("Coins")
    coinsStat.Value += math.random(1, 5)

    coin:SetAttribute("Collected", true)
    coin.Transparency = 0.8
    coin.CanTouch = false
  end)
end