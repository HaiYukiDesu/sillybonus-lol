repeat wait(1)
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("Underwater"):FireServer(unpack(args))
until game.Players.LocalPlayer.Character.Humanoid.Health == 0
game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder"):WaitForChild("PlayAgain"):FireServer()
