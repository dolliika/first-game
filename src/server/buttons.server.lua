local Players = game:GetService("Players")

local buttonsFolder = workspace.Buttons
local gatesFolder = workspace.Gates

local buttons = buttonsFolder:GetChildren()

local stage2UnlockButton = buttonsFolder.Stage2UnlockButton
local finishUnlockButton = buttonsFolder.FinishUnlockButton

local stage2Gate = gatesFolder.Stage2Gate
local finishGate = gatesFolder.FinishGate

for _, button in ipairs(buttons) do
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