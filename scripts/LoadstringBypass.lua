repeat 
    task.wait()
until game:IsLoaded()
wait(2) 
local CutsceneExclude = {
    "FigureHotelChase",
    "Elevator1",
    "MinesFinale",
    "FigureHotelEnd",
    "Figure",
    "FigureEnd"
}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gameData = ReplicatedStorage:WaitForChild("GameData")
local floor = gameData:WaitForChild("Floor")
local isMines = floor.Value == "Mines"
local isRooms = floor.Value == "Rooms"
local isHotel = floor.Value == "Hotel"
local isBackdoor = floor.Value == "Backdoor"
local isFools = floor.Value == "Fools"
local Players = game.Players
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local playerScripts = localPlayer.PlayerScripts
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local mainUI = playerGui:WaitForChild("MainUI")
local mainGame = mainUI:WaitForChild("Initiator"):WaitForChild("Main_Game")
local floorReplicated = if not isFools then ReplicatedStorage:WaitForChild("FloorReplicated") else nil
task.wait(1)
game:GetService("ReplicatedStorage").RemotesFolder:FindFirstChild("PreRunShop"):Destroy()
game:GetService("ReplicatedStorage").ClientModules.EntityModules:FindFirstChild("Void"):Destroy()
if game:IsLoaded() then
    if workspace.CurrentRooms["0"]:FindFirstChild("StarterElevator") then
    workspace.CurrentRooms["0"].StarterElevator:WaitForChild("Doors_Outside"):Destroy()
    workspace.CurrentRooms["0"].StarterElevator:WaitForChild("Doors_Inside"):Destroy()
    workspace.CurrentRooms["0"].StarterElevator:WaitForChild("DoorHitbox"):Destroy()
    workspace.CurrentRooms["0"].StarterElevator:FindFirstChild("Doors_Outside"):Destroy()
    end
end
if mainGame then
    local cutscenes = mainGame:FindFirstChild("Cutscenes", true)
    if cutscenes then
        for _, cutscene in pairs(cutscenes:GetChildren()) do
            if table.find(CutsceneExclude, cutscene.Name) then continue end

            local defaultName = cutscene.Name:gsub("_", "")
            cutscene.Name = value and "_" .. defaultName or defaultName
        end
    end
end

if floorReplicated then
    for _, cutscene in pairs(floorReplicated:GetChildren()) do
        if not cutscene:IsA("ModuleScript") or table.find(CutsceneExclude, cutscene.Name) then continue end

        local defaultName = cutscene.Name:gsub("_", "")
        cutscene.Name = value and "_" .. defaultName or defaultName
    end
end


while true do
    currentroom = tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)
    for _, v in pairs(workspace.CurrentRooms[currentroom]:GetDescendants()) do
        if v.Name == "Wardrobe" or v.Name == "Locker_Large" or v.Name == "Bed" then
            if v:FindFirstChild("HidePrompt") then
                v.HidePrompt:Destroy()
                end
        end
    end
    task.wait(1)
end
print("AntiCheat Bypass Loaded!")
