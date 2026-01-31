local Players = game:GetService("Players")

local buttons = workspace.Buttons
local gates = workspace.Gates

local stage2UnlockButton = buttons.Stage2UnlockButton
local finishUnlockButton = buttons.FinishUnlockButton

local stage2Gate = gates.Stage2Gate
local finishGate = gates.FinishGate

local unlockMap = {
  [stage2UnlockButton] = {
      gate = stage2Gate,
      timer = 8
  },
  [finishUnlockButton] = {
      gate = finishGate,
      timer = 4
  }
}

for _, button in ipairs(buttons:GetChildren()) do
  local debounce = false

  button.Touched:Connect(function(otherPart)
    if debounce == false then
      debounce = true

      local character = otherPart.Parent
      local humanoid = character:FindFirstChild("Humanoid")
      local player = Players:GetPlayerFromCharacter(character)
      if not humanoid or not player then 
        debounce = false
        return
      end
    
      local config = unlockMap[button]
      if config then
        local gate = config.gate
        local timer = config.timer

        gate.Transparency = 0.5
        gate.CanCollide = false

        for i = timer, 1, -1 do
          print(i)
          task.wait(1)
        end

        gate.Transparency = 0
        gate.CanCollide = true
      end

      task.wait(0.5)
      debounce = false
    end
  end)
end