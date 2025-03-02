-- if you going to skid this silly script pls atleast don't sell it
if getgenv().Count == nil or getgenv().Count <= 0 then
    getgenv().Count = 1
end
Spawned = 0
repeat wait()
local Model = Instance.new("Model")
local Value1 = Instance.new("ObjectValue")
local Value2 = Instance.new("IntValue")
local Value3 = Instance.new("StringValue")
local Value4 = Instance.new("StringValue")
local Value5 = Instance.new("StringValue")
local Main = Instance.new("Part")
local ItemImage1 = Instance.new("Decal")
local ItemImage2 = Instance.new("Decal")
    
Model.Parent = game.Workspace:FindFirstChild("PlayerModels")
Model.Name = "NeonWireMagenta"

Value1.Parent = Model
Value1.Name = "Owner"
Value1.Value = game.Players.LocalPlayer

Value2.Parent = Value1
Value2.Name = "LastInteraction"
Value2.Value = math.random(1,10000)

Value3.Parent = Value1
Value3.Name = "OwnerString"
Value3.Value = game.Players.LocalPlayer.Name

Value4.Parent = Model
Value4.Name = "PurchasedBoxItemName"
Value4.Value = "NeonWireMagenta"

Value5.Parent = Model
Value5.Name = "Type"
Value5.Value = "Wire"

Main.Parent = Model
Main.Name = "Main"
Main.Color = Color3.fromRGB(255, 102, 204)
Main.Material = "Plastic"
Main.Size = Vector3.new(0.4, 1.4, 1.6)
Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
Main.TopSurface = "Smooth"
Main.BottomSurface = "Smooth"

ItemImage1.Parent = Main
ItemImage1.Name = "ItemImage"
ItemImage1.Face = "Right"
ItemImage1.Transparency = 0
ItemImage1.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=488176842"

ItemImage2.Parent = Main
ItemImage2.Name = "ItemImage"
ItemImage2.Face = "Left"
ItemImage2.Transparency = 0
ItemImage2.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=488176842"
Spawned = Spawned + 1
until Spawned == getgenv().Count
