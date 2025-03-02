-- settings
local SNAKE_LENGTH = getgenv().Length
local SNAKE_SIZE = getgenv().Size
local SNAKE_WOBBLINESS = getgenv().Wobbliness
if getgenv().Length == nil or getgenv().Length <= 0 then
	getgenv().Length = 10
end
if getgenv().Size == nil or getgenv().Size <= 0 then
	getgenv().Size = 1
end
if getgenv().Wobbliness == nil or getgenv().Wobbliness <= 0 then
	getgenv().Wobbliness = 50
end
if getgenv().Explosion == nil then
    getgenv().Explosion = true
end
spawned = 0
readytoexplode = false
-- script
local Character = game:GetService("Players").LocalPlayer.Character
local Root: BasePart = Character:WaitForChild("HumanoidRootPart")

local PpAttachment = Instance.new("Attachment")
PpAttachment.Name = "PpAttachment"
PpAttachment.Position = Vector3.new(0, -1, -0.5)
PpAttachment.Orientation = Vector3.new(0, 90, 0)
PpAttachment.Parent = Root

local PpHolder = Instance.new("Folder")
PpHolder.Name = "PpHolder"
PpHolder.Parent = Character

local function CreateExplosion(position)
    local explosion = Instance.new("Explosion")
    explosion.Position = position
    explosion.BlastRadius = 1 
    explosion.BlastPressure = 0 
    explosion.Parent = workspace
end

local function OnSectionTouched(section, otherPart)
    if otherPart:IsDescendantOf(Character) or otherPart:IsDescendantOf(Character.PpHolder) or spawned ~= SNAKE_LENGTH or readytoexplode == false or getgenv().Explosion == false then
        return 
    end
    CreateExplosion(section.Position)
    local sillysound = Instance.new("Sound", section)
    sillysound.SoundId = "rbxassetid://6655708496"
    sillysound.EmitterSize = 10
    sillysound.Looped = false
    sillysound.Parent = section
    sillysound.Volume = 100
    sillysound:Play()
    wait(0.5)
    section:Destroy()
    sillysound:Stop()
end

local function MakeSnake(Length: number, Size: number, Wobbliness: number)
    PpHolder:ClearAllChildren()

    local LastSection
    local Sections = {}
    local PpRoot = Instance.new("Part")
    PpRoot.Transparency = 1
    PpRoot.CanCollide = false
    PpRoot.CanQuery = false
    PpRoot.CanTouch = false
    PpRoot.Massless = true
    PpRoot.Name = "NewPPRoot"
    PpRoot.Parent = Character

    local NewPpAttachment = Instance.new("Attachment")
    NewPpAttachment.Parent = PpRoot

    local AlignPp = Instance.new("AlignPosition")
    AlignPp.RigidityEnabled = true
    AlignPp.Attachment0 = NewPpAttachment
    AlignPp.Attachment1 = PpAttachment
    AlignPp.Parent = PpRoot

    local AlignPpRotation = Instance.new("AlignOrientation")
    AlignPpRotation.RigidityEnabled = true
    AlignPpRotation.Attachment0 = NewPpAttachment
    AlignPpRotation.Attachment1 = PpAttachment
    AlignPpRotation.Parent = PpRoot

    local MinimumIndex = math.ceil(1 / Size) * 1

    for i = 1, Length do
        local PpSection = Instance.new("Part")
        PpSection.Shape = Enum.PartType.Cylinder
        PpSection.CanCollide = i > MinimumIndex
        PpSection.Massless = true
        PpSection.Material = Enum.Material.SmoothPlastic
        PpSection.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0.0001, 0.0001)
        PpSection.CFrame = Root.CFrame
        PpSection.Size = Vector3.one * Size

		local CuteTexture1 = Instance.new("Decal")
		CuteTexture1.Parent = PpSection
		CuteTexture1.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
		CuteTexture1.Face = "Right"

		local CuteTexture2 = Instance.new("Decal")
		CuteTexture2.Parent = PpSection
		CuteTexture2.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
		CuteTexture2.Face = "Left"

		local CuteTexture3 = Instance.new("Decal")
		CuteTexture3.Parent = PpSection
		CuteTexture3.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
		CuteTexture3.Face = "Front"

		local CuteTexture4 = Instance.new("Decal")
		CuteTexture4.Parent = PpSection
		CuteTexture4.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
		CuteTexture4.Face = "Back"

		local CuteTexture5 = Instance.new("Decal")
		CuteTexture5.Parent = PpSection
		CuteTexture5.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
		CuteTexture5.Face = "Top"

		local CuteTexture6 = Instance.new("Decal")
		CuteTexture6.Parent = PpSection
		CuteTexture6.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
		CuteTexture6.Face = "Bottom"

        local BackAttachment = Instance.new("Attachment")
        BackAttachment.Position = Vector3.new(-Size / 2, 0, 0)
        BackAttachment.Parent = PpSection

        local FrontAttachment = Instance.new("Attachment")
        FrontAttachment.Position = Vector3.new(Size / 2, 0, 0)
        FrontAttachment.Name = "Important"
        FrontAttachment.Parent = PpSection

        local BallsConstraint = Instance.new("BallSocketConstraint")
        BallsConstraint.Attachment0 = LastSection and LastSection:FindFirstChild("Important") or NewPpAttachment
        BallsConstraint.Attachment1 = BackAttachment
        BallsConstraint.Parent = PpSection

        local AlignOrientation = Instance.new("AlignOrientation")
        AlignOrientation.Responsiveness = Wobbliness or 10
        AlignOrientation.Attachment0 = BackAttachment
        AlignOrientation.Attachment1 = LastSection and LastSection:FindFirstChild("Important") or NewPpAttachment
        AlignOrientation.Parent = PpSection

        local AlignPosition = Instance.new("AlignPosition")
        AlignPosition.Responsiveness = 10
        AlignPosition.Attachment0 = BackAttachment
        AlignPosition.Attachment1 = LastSection and LastSection:FindFirstChild("Important") or PpAttachment
        AlignPosition.Parent = PpSection
        PpSection.Touched:Connect(function(otherPart)
			if otherPart:IsDescendantOf(Character) or otherPart:IsDescendantOf(Character.PpHolder) then return end
            OnSectionTouched(PpSection, otherPart)
        end)

        PpSection.Parent = PpHolder
        LastSection = PpSection

        table.insert(Sections, PpSection)
        spawned = spawned + 1
    end

    for _, Section in pairs(Sections) do
        for _, OtherSection in pairs(Sections) do
            if Section == OtherSection then continue end

            local Constraint = Instance.new("NoCollisionConstraint")
            Constraint.Part0 = Section
            Constraint.Part1 = OtherSection
            Constraint.Parent = Section
        end
    end
end
local player = game.Players.LocalPlayer
local character = player.Character

local rootPart = character:WaitForChild("HumanoidRootPart")
local leftLeg = character:WaitForChild("LeftUpperLeg")
local rightLeg = character:WaitForChild("RightUpperLeg")

local balls = Instance.new("Part")
balls.Parent = character
balls.Name = "balls"
balls.Shape = Enum.PartType.Ball
balls.Size = Vector3.one * Size
balls.Anchored = false
balls.CanCollide = false

balls.CFrame = leftLeg.CFrame * CFrame.new(1,0.1,-0.5)

local weld = Instance.new("WeldConstraint")
weld.Part0 = rootPart
weld.Part1 = balls
weld.Parent = balls


local CuteTexturea = Instance.new("Decal")
CuteTexturea.Parent = balls
CuteTexturea.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexturea.Face = "Right"

local CuteTextureb = Instance.new("Decal")
CuteTextureb.Parent = balls
CuteTextureb.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTextureb.Face = "Left"

local CuteTexturec = Instance.new("Decal")
CuteTexturec.Parent = balls
CuteTexturec.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexturec.Face = "Front"

local CuteTextured = Instance.new("Decal")
CuteTextured.Parent = balls
CuteTextured.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTextured.Face = "Back"

local CuteTexturee = Instance.new("Decal")
CuteTexturee.Parent = balls
CuteTexturee.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexturee.Face = "Top"

local CuteTexturef = Instance.new("Decal")
CuteTexturef.Parent = balls
CuteTexturef.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexturef.Face = "Bottom"




local balls2 = Instance.new("Part")
balls2.Parent = character
balls2.Name = "balls2"
balls2.Shape = Enum.PartType.Ball
balls2.Size = Vector3.one * Size
balls2.Anchored = false
balls2.CanCollide = false

balls2.CFrame = rightLeg.CFrame * CFrame.new(-1,0.1,-0.5)

local weld2 = Instance.new("WeldConstraint")
weld2.Part0 = rootPart
weld2.Part1 = balls2
weld2.Parent = balls2

local CuteTexture7 = Instance.new("Decal")
CuteTexture7.Parent = balls2
CuteTexture7.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexture7.Face = "Right"

local CuteTexture8 = Instance.new("Decal")
CuteTexture8.Parent = balls2
CuteTexture8.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexture8.Face = "Left"

local CuteTexture9 = Instance.new("Decal")
CuteTexture9.Parent = balls2
CuteTexture9.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexture9.Face = "Front"

local CuteTexture10 = Instance.new("Decal")
CuteTexture10.Parent = balls2
CuteTexture10.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexture10.Face = "Back"

local CuteTexture11 = Instance.new("Decal")
CuteTexture11.Parent = balls2
CuteTexture11.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexture11.Face = "Top"

local CuteTexture12 = Instance.new("Decal")
CuteTexture12.Parent = balls2
CuteTexture12.Texture = "http://www.roblox.com/Game/Tools/ThumbnailAsset.ashx?fmt=png&wd=420&ht=420&aid=6155864898"
CuteTexture12.Face = 'Bottom'

balls.Touched:Connect(function(otherPart)
    if otherPart:IsDescendantOf(Character) or otherPart:IsDescendantOf(Character.PpHolder) then return end
    OnSectionTouched(balls, otherPart)
end)

balls2.Touched:Connect(function(otherPart)
    if otherPart:IsDescendantOf(Character) or otherPart:IsDescendantOf(Character.PpHolder) then return end
    OnSectionTouched(balls2, otherPart)
end)

MakeSnake(SNAKE_LENGTH, SNAKE_SIZE, SNAKE_WOBBLINESS)
task.wait(1)
readytoexplode = true
