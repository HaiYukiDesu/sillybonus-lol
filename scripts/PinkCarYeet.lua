if getgenv().Speed == nil or getgenv().Speed <= 0 then
    getgenv().Speed = 200
end
if getgenv().BlastRadius == nil or getgenv().BlastRadius <= 0 then
    getgenv().BlastRadius = 20
end
local mouse = game.Players.LocalPlayer:GetMouse()
local PinkCar = game:GetObjects("rbxassetid://90902866599999")[1]
PinkCar.Parent = game.Players.LocalPlayer.Backpack
PinkCar.Activated:Connect(function()
    local spawnedCar = game:GetObjects("rbxassetid://121337551605745")[1]
    spawnedCar.Parent = game.Workspace
    spawnedCar.PinkCar.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
    spawnedCar.PinkCar.CanCollide = true
    local antiGravity = Instance.new("BodyGyro")
    antiGravity.MaxTorque = Vector3.new(0, 0, 0)
    antiGravity.CFrame = spawnedCar.PinkCar.CFrame
    antiGravity.Parent = spawnedCar.PinkCar
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(1000000, 1000000, 1000000)
    bodyVelocity.Parent = spawnedCar.PinkCar
    local direction = (mouse.Hit.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).unit
    bodyVelocity.Velocity = direction * getgenv().Speed
    task.wait(0.5)
    spawnedCar.PinkCar.Touched:Connect(function(hit)
        if hit:IsDescendantOf(game.Players.LocalPlayer.Character) then return end
        local explosion = Instance.new("Explosion")
        explosion.Position = spawnedCar.PinkCar.Position
        explosion.BlastRadius = getgenv().BlastRadius
        explosion.BlastPressure = 50000
        explosion.DestroyJointRadiusPercent = 25
        explosion.Parent = game.Workspace
        explosion.Hit:Connect(function(part)
            part:BreakJoints()
        end)
        spawnedCar:Destroy()
    end)
    game.Debris:AddItem(bodyVelocity, 10)
    game.Debris:AddItem(antiGravity, 10)
end)
