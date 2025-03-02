local plr = game.Players.LocalPlayer
local hum = plr.Character:WaitForChild("Humanoid")
local plush = game:GetObjects("rbxassetid://73541125013585")[1]
plush.Parent = plr.Backpack
local anim = hum:LoadAnimation(plush.A.Hold)
local sound = plush.Pizza
plush.Equipped:Connect(function()
  anim:Play()
  sound:Play()
end)
plush.Unequipped:Connect(function()
  anim:Stop()
end)
