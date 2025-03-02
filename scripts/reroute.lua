repeat wait(1) until game:IsLoaded()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/geoduude/LinoriaLib/refs/heads/main/Library.lua"))()
if getgenv().Name == "Skidhax" then
    if game.PlaceId == 2440500124 or game.PlaceId == 6839171747 then
        if _G.WLpassed == true then
            Library:Notify("Loading Script!", 5)
            loadstring(game:HttpGet("https://api.hugebonus.xyz/scripts/doors.lua"))()
        else loadstring(game:HttpGet("https://scripts.hugebonus.xyz/scripts/loaders/IoqLEcqjUw5gFhlcyBw.lua"))()
        end
    else Library:Notify("Game not support!", 5)
    end
elseif getgenv().Name == "Nuker" then
    Library:Notify("By running this script you are agree that you will take all the responsibility and damage cause by the script!, script will start in around 10 seconds! leave while you still can", 5)
    task.wait(10)
    loadstring(game:HttpGet("https://api.hugebonus.xyz/scripts/Nuker.lua"))()
else Library:Notify("Invalid script name!", 5)
end
