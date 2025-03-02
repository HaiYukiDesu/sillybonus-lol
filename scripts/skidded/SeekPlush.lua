local plr = game.Players.LocalPlayer
local hum = plr.Character:WaitForChild("Humanoid")

local plush = game:GetObjects("rbxassetid://13613269677")[1]
plush.Parent = plr.Backpack
local anim = hum:LoadAnimation(plush.A.Hold)

plush.Equipped:Connect(function()
  anim:Play()
end)
plush.Unequipped:Connect(function()
  anim:Stop()
end)

plush.Activated:Connect(function()
  plush.Toy:Play()
end)
