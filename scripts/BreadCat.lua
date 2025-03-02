--[[
                      ████                 █████
                  ████████████          ███████████
                ███████      ██        ███    ██████
               █████                             ████
              ████                                 ███
              ██      ░░░░░░░░░░░░░░░░░░░░░░░░      ██
             ██   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░   ██
               ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
             ░░░▒▒▒░░▒░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░░░░
           ░▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░░
         ▒▒░░░░░░░░░░░░░░ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░░
        ▒▒░░░░░░░░░░░░░░░░░░░▒░░░░░░▒░░░░░░░▓██▒░░░░░░░░▒░░░
       ▒░░░░░░░░░░▒███████▒░░░▒░░░░▒░░░░░███████▓▓░░░░░░░▒░░░
     ▒▒░▒░░░░░░░░███████▓▓▓▓░░▒░░░░░░░░▓███████▓▓▓█░░░░░░▒░░░░
     ▒░▒▒░░░░░░░▓████████▓▓█░░▒░░░░░░░░████████████░░░░░░▒░░░░
    ▒░▒▒▒░░░░░░░▓███████████░░▒░░░░░░░░▒██████████░░░░░░░▒░░░░░
   ▒▒░▒▒▒░░░░░░░░██████████░░░▒░░░░▒░░░░░███████▒░░░░░░░▒▒░░░░░
   ▒▒▒▒▒▒▒░░░░░░░░░██████░░░░▒▒░░░░▒▒░░░░░░░░░░░░░░░░░░▒▒░░░░░░
   ▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░▒▒░░░░░░▒▒░░░░░░░░░░░░░░░░▒▒░░░░░░░
   ▒▒▒▒▒▒▒▒▒▓░░░░░░░░░░░░░▒▒░░░░░░░░░░▒▒▒░░░░░░░░░░▒▒▒░░░░░░░░▒
   ▒▒░▒▒▒▒▒▒▒▒▒▓▒▒▒▒▒▒▒▓▒▒▒░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▓█▓░░░░░░░░▒
   ░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒░░░░▒░░░░░░░░░░░█▓███░░░░░▒▒▒
    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒▒▒▒░░░▒██▒▒░░░░░░▒▒
    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▒██▓▒▒▒░▒░░░░▒▒▒
     ▒▒▒▒▒▒▒▒▒▒▒██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓██▓▒▒▒▒▒▒▒░░░░▒▒▒
      ▒▒▒▒▒▒▒▒▒▒▒▒▒▓███▓▓▒▒▒▒▒▒▒▒▒▒▒▒▓████▒▒▒▒▒▒▒▒▒░▒▒▒░░▒▒▒
       ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓███████████▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒▒▒
        ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
          ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
           ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
              ▒▒▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
                 ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
                    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
                           ▒▒▒▒▒▒▒▒▒▒▒
]]
if game.Players.LocalPlayer.Character:FindFirstChild("Bread Cat") then
	game.Players.LocalPlayer.Character:FindFirstChild("Bread Cat"):Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character
local primaryPart = game:GetObjects("rbxassetid://136112599900572")[1]
primaryPart.Parent = character
primaryPart.CatPart.CanCollide = false
primaryPart.CatPart.Anchored = true
primaryPart.CatPart.CFrame = character.HumanoidRootPart.CFrame
local targetCFrame = primaryPart.CatPart.CFrame

while true do
	if character and character.PrimaryPart and character:FindFirstChild("HumanoidRootPart") then
		local targetPosition = character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
		local rotation = CFrame.Angles(0, math.rad(-80), 0)

		targetCFrame = targetPosition * rotation

		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.Out
		)
		local tween = TweenService:Create(primaryPart.CatPart, tweenInfo, {CFrame = targetCFrame})
		tween:Play()
	end
	wait(0.1)
end
