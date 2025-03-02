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
 __          __        _____  _   _    _______  _    _  ______      _____  _    _         _______ 
 \ \        / /       |_   _|| \ | |  |__   __|| |  | ||  ____|    / ____|| |  | |    /\ |__   __|
  \ \  /\  / / ___      | |  |  \| |     | |   | |__| || |__      | |     | |__| |   /  \   | |   
   \ \/  \/ / / __|     | |  | . ` |     | |   |  __  ||  __|     | |     |  __  |  / /\ \  | |   
    \  /\  /  \__ \    _| |_ | |\  |     | |   | |  | || |____    | |____ | |  | | / ____ \ | |   
     \/  \/   |___/   |_____||_| \_|     |_|   |_|  |_||______|    \_____||_|  |_|/_/    \_\|_|                                                                                                            

]]

--0 upvalue haxxing
local function newclosure(func)
    local new = loadstring("return lolhax_v3_never_release_fr(...)")
    setfenv(new, setmetatable({lolhax_v3_never_release_fr = func},  {__index = getfenv(new)}))

    return new
end

local real_hookfunction = hookfunction
local function hookfunction(func, hook)
    if iscclosure(func) and islclosure(hook) then 
        hook = newcclosure(hook)
    elseif islclosure(func) and iscclosure(hook) then 
        hook = newlclosure(hook)
    end
    if debug.getinfo(hook).nups > debug.getinfo(func).nups then
        if iscclosure(hook) then
            hook = newcclosure(hook)
        else
            hook = newlclosure(hook)
        end
    end
    return real_hookfunction(func, hook)
end

local Loadtime = tick()

local Repository = 'https://raw.githubusercontent.com/geoduude/Linorialib/main/'

local Library = loadstring(game:HttpGet(Repository .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(Repository .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(Repository .. 'addons/SaveManager.lua'))()

--[[
local ErrorMessageOut
ErrorMessageOut = game:GetService("LogService").MessageOut:Connect(function(Message, Type)

    if Type == Enum.MessageType.MessageError then
        ErrorMessageOut:Disconnect()

        setclipboard(tostring(Message))
        Library:Notify(" Lolhax has errored while loading and will now unload. The error has been copied to clipboard", 2)

        task.delay(3, function()
            Library:Unload()
        end)
    end

end)
]]
if identifyexecutor() == "Solara 3.0" then
    Library:Notify(" stop ", 2.5)

    task.wait(3)
    Library:Unload()
    return  
end

local LocalPlayer = game.Players.LocalPlayer

-- UI vvv

local Window = Library:CreateWindow({ Title = " [ hugebonus.xyz ] Skidhax v3 | "..LocalPlayer.Name, Center = true, AutoShow = true, TabPadding = 3, MenuFadeTime = 0.2, ShowCustomCursor = true })
local Tabs = { General = Window:AddTab("General"), Exploit = Window:AddTab("Exploits"), ESP = Window:AddTab("ESP"), Visuals = Window:AddTab("Visuals"), Misc = Window:AddTab("Miscellaneous"), ['UI Settings'] = Window:AddTab('Config')}

local GeneralAutomation = Tabs.General:AddLeftGroupbox("Automation")
GeneralAutomation:AddToggle("GA_AutoInteract", { Text = "Automatic Interact", Default = false}):AddKeyPicker("GA_AutoInteract_Key", {Mode = "Hold",Default = "R", Text = "Auto Interact", SyncToggleState = false})
GeneralAutomation:AddSlider("GA_AutoInteract_Range", { Text = "Range Multiplier", Default = 1, Min = 1, Max = 2, Rounding = 1, Compact = false, HideMax = false})
GeneralAutomation:AddDivider()
GeneralAutomation:AddToggle("GA_AutoHide", { Text = "Automatic Hide", Default = false, Tooltip = "Will automatically predict entities and hide in the nearest available spot when enabled."})
GeneralAutomation:AddToggle("GA_AutoHide_VisCheck", { Text = "Prediction Visible Check", Default = false, })
GeneralAutomation:AddSlider("GA_AutoHide_PredictionTime", { Text = "Prediction Time", Default = 0.5, Min = 0.1, Max = 1.5, Rounding = 2, Compact = true, Suffix = 's'})
GeneralAutomation:AddSlider("GA_Autohide_PredictionDistanceMultiplier", { Text = "Distance Multiplier", Default = 1, Min = 0.8, Max = 1.5, Rounding = 1, Compact = true, Suffix = 'x'})
GeneralAutomation:AddDivider()
GeneralAutomation:AddToggle("GA_MinecartInteract", { Text = "Minecart Interact Spam", Default = false, Tooltip = "Automatically spam interact with nearby minecarts when key is active."}):AddKeyPicker("GA_MinecartInteract_Key", {Mode = "Hold", Default = "H", Text = "Minecart Interact Spam", SyncToggleState = false})
GeneralAutomation:AddToggle("GA_AnchorAutoSolve", { Text = "Anchor Automatic Solve", Default = false, Tooltip = "Automaticaly solves any anchor when close enough, if it's the designated one."})
GeneralAutomation:AddDivider()
GeneralAutomation:AddToggle("GA_AutoPadLockSolve", { Text = "Automatic Library Padlock", Default = false, Tooltip = "Automatically unlocks padlock with the code when near enough to the set distance."})
GeneralAutomation:AddSlider("GA_AutoPadLockSolve_Distance", { Text = "Automatic Padlock Distance", Default = 25, Min = 10, Max = 50, Rounding = 0, Compact = false, HideMax = false, Tooltip = "Minimum distance for auto padlock solver to input the correct code."})

local GeneralNotifying = Tabs.General:AddRightGroupbox("Notifying")
GeneralNotifying:AddToggle("GN_Enabled", { Text = "Enabled", Default = false, Tooltip = "Master switch for notifications."})
GeneralNotifying:AddToggle("GN_NotificationSound", { Text = "Play Sound", Default = false, Tooltip = "Plays sound to draw better attention when notifying."})
GeneralNotifying:AddSlider("GN_NotificationSound_Volume", { Text = "Sound Volume", Default = 2, Min = 1, Max = 10, Rounding = 1, Compact = false, HideMax = false})
GeneralNotifying:AddDivider()
GeneralNotifying:AddToggle("GN_PadlockCode", { Text = "Library Padlock Code", Default = false, Tooltip = "Will notify upon padlock code being confirmed."})
GeneralNotifying:AddToggle("GN_EntityNotify", { Text = "Entity Notifying", Default = false, Tooltip = "Will notify upon a selected entity spawning."})
GeneralNotifying:AddDropdown("GN_EntityList", { Values = { 'Rush', 'Blitz', 'Ambush', 'Eyes', 'Lookman', 'Halt', 'Screech', 'Gloombat Swarm', 'A-60', 'A-120'  },Default = 0, Multi = true, Text = "Entity List", Tooltip = "Entity whitelist to notify for."})
GeneralNotifying:AddDivider()
GeneralNotifying:AddDropdown("GN_NotificationAlignment", { Values = { "Left", "Center", "Right" }, Default = 2, Text = "Horizontal Alignment"})
GeneralNotifying:AddSlider("GN_NotificationOffset_X", { Text = "X Offset", Default = 0, Min = -1, Max = 1, Rounding = 2, Compact = true})
GeneralNotifying:AddSlider("GN_NotificationOffset_Y", { Text = "Y Offset", Default = 0, Min = -1, Max = 1, Rounding = 2, Compact = true})
GeneralNotifying:AddButton("Test Notify", function()
    --Notify("This is a test notification.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 5)
end)

local ExploitSelf = Tabs.Exploit:AddLeftGroupbox("Self")
ExploitSelf:AddToggle("ES_AlwaysJump", { Text = "Always Enable Jumping", Default = false, Tooltip = "Enables jumping at all times."})
ExploitSelf:AddDivider()
ExploitSelf:AddToggle("Es_AntiGloombat", { Text = "Anti-Gloombat Egg", Default = false, Tooltip = "Disallows touching on any Gloombat egg hitbox."})
ExploitSelf:AddToggle("Es_AntiGiggle", { Text = "Anti-Giggle", Default = false, Tooltip = "Disallows touching on the entity 'Giggle' hitbox."})
ExploitSelf:AddToggle("Es_AntiSnare", { Text = "Anti-Snare", Default = false, Tooltip = "Disallows touching on the entity 'Snare'."})
ExploitSelf:AddToggle("Es_AntiDupe", { Text = "Anti-Dupe", Default = false, Tooltip = "Disallows toching on any entity 'Dupe' fake doors."})
ExploitSelf:AddToggle("Es_AntiEyes", { Text = "Anti-Eyes", Default = false, Tooltip = "Forces your character too look down from the entity 'Eyes'."})
ExploitSelf:AddToggle("Es_AntiLookman", { Text = "Anti-Lookman", Default = false, Tooltip = "Forces your character to look down from the entity 'Lookman'."})
ExploitSelf:AddDivider()
ExploitSelf:AddToggle("Es_AntiChanedlier", { Text = "Anti-Chanedlier", Default = false, Tooltip = "Disallows touching on any fallen chandeliers during the seek chase."})
ExploitSelf:AddToggle("Es_AntiSeekArms", { Text = "Anti-Seek Arms", Default = false, Tooltip = "Disallows touching on any seek arms during the seek chase."})

local ExploitBypass = Tabs.Exploit:AddRightGroupbox("Bypass")
ExploitBypass:AddToggle("EB_CrouchSpoof", { Text = "Crouch Spoof", Default = false, Tooltip = "Spoofs crouching, or in other words the game will think you're crouching. Useful for figure rooms."})
ExploitBypass:AddToggle("EB_SpeedBypass", { Text = "Speed Bypass", Default = false, Tooltip = "Attempts to mitigate the speed anticheat."})
ExploitBypass:AddToggle("EB_Noclip", { Text = "Anti-Cheat Manipulation", Default = false, Tooltip = "Will teleport you to the opposite direction your facing to manipulate the anticheat into rubberbanding you the other way."}):AddKeyPicker("EB_Noclip_Key", {Mode = "Hold", Default = "T", Text = "Anti-Cheat Manipulate", SyncToggleState = false})

local ExploitRemovals = Tabs.Exploit:AddRightGroupbox("Removals")
ExploitRemovals:AddToggle("ER_RemoveSeek", { Text = "Remove Seek Chase", Default = false, Tooltip = "Completely disables the entity 'Seek'."})
ExploitRemovals:AddToggle("ER_NoScreech", { Text = "No Screech", Default = false, Tooltip = "Completely disables the entity 'Screech'."})
ExploitRemovals:AddToggle("ER_NoA90", { Text = "No A-90", Default = false, Tooltip = "Completely disables the entity 'A-90'."})
ExploitRemovals:AddToggle("ER_NoShade", { Text = "No Halt", Default = false, Tooltip = "Completely disables the entity 'Halt'."})

local VisualsView = Tabs.Visuals:AddLeftGroupbox("View")
VisualsView:AddSlider("VV_FieldOfView", { Text = "Field Of View", Default = 0, Min = 0, Max = 120, Rounding = 0, Compact = true, Tooltip = "Changes camera field of view."})
VisualsView:AddToggle("VV_NoCamShake", { Text = "No Camera Shake", Default = false, Tooltip = "Removes any camera shaking that will occue from entities or other things."})
VisualsView:AddToggle("VV_NoLookBob", { Text = "No Look Bobbing", Default = false, Tooltip = "Removes any look bobbing that will occur when walking."})
VisualsView:AddDivider()
VisualsView:AddToggle("VV_Thirdperson", { Text = "Thirdperson", Default = false, Tooltip = "Changes camera visibility to view your local character from the third person."}):AddKeyPicker("VV_Thirdperson_Key", {Mode = "Toggle", Default = "V", Text = "Thirdperson", SyncToggleState = false})
VisualsView:AddToggle("VV_ThirdpersonCamCollide", { Text = "Wall Detect", Default = false, Tooltip = "Makes the camera position on a detected wall if there are any, for the sake of visibility."})
VisualsView:AddSlider("VV_ThirdpersonDistance", { Text = "Distance", Default = 10, Min = 5, Max = 30, Rounding = 0, Compact = true, Tooltip = "Camera distance for thirdperson."})
VisualsView:AddSlider("VV_ThirdpersonOffset", { Text = "Offset", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true, Tooltip = "Camera left/right offset for thirdperson."})
VisualsView:AddSlider("VV_ThirdpersonOffsetUp", { Text = "Vertical Offset", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true, Tooltip = "Camera up/down offset for thirdperson."})
VisualsView:AddDivider()
VisualsView:AddToggle("VV_ViewModelOffset", { Text = "Viewmodel Offset", Default = false, Tooltip = "Modifier for character viewmodel when holding tools."})
VisualsView:AddSlider("VV_ViewModelOffset_X", { Text = "X", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true})
VisualsView:AddSlider("VV_ViewModelOffset_Y", { Text = "Y", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true})
VisualsView:AddSlider("VV_ViewModelOffset_Z", { Text = "Z", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true})

local VisualsWorld = Tabs.Visuals:AddRightGroupbox("World")
VisualsWorld:AddToggle("VW_Ambience", { Text = "Ambience", Default = false, Tooltip = "Change color of the map."}):AddColorPicker("Ambience_Color", { Default = Color3.new(1, 1, 1), Title = 'Ambience Color'})
VisualsWorld:AddToggle("VW_NoFog", { Text = "Remove Fog", Default = false, Tooltip = "Removes any look bobbing that will occur when walking."})
VisualsWorld:AddDivider()
VisualsWorld:AddToggle("VW_RushNodes", { Text = "Show Rush Nodes", Default = false, Tooltip = "Shows the path Rush and Ambush will take when moving."})

local VisualsRemovals = Tabs.Visuals:AddRightGroupbox("Removals")
VisualsRemovals:AddToggle("VR_NoHidingVignette", { Text = "No Hiding Vignette", Default = false, Tooltip = "Removes screen vignette when hiding."})
VisualsRemovals:AddToggle("VR_NoHaltEffects", { Text = "No Halt Effects", Default = false, Tooltip = "Removes flashing effects during halt room."})
VisualsRemovals:AddToggle("VR_NoReviveCutscene", { Text = "No Revive Cutscene", Default = false, Tooltip = "Removes the heart cutscene when reviving."})
VisualsRemovals:AddDivider()
VisualsRemovals:AddToggle("VR_TimothyJumpscare", { Text = "Remove Timothy Jumpscare", Default = false, Tooltip = "Removes the jumpscare you get upon timothy spawning, so you'll only be damaged."})
VisualsRemovals:AddToggle("VR_NpGlitchJumpscare", { Text = "Remove Glitch Jumpscare", Default = false, Tooltip = "Removes the client sided glitch jumpscare"})
VisualsRemovals:AddToggle("VR_NoVoidEffect", { Text = "Remove Void Jumpscare", Default = false, Tooltip = "Removes the client sided void effect."})
VisualsRemovals:AddToggle("VR_NoSeekEffects", { Text = "Remove Seek Room Effects", Default = false, Tooltip = "Removes the client sided seek eyes and texture effects during the teasing and chase."})

local MiscMovement = Tabs.Misc:AddLeftGroupbox("Movement")
MiscMovement:AddToggle("MM_Walkspeed", { Text = "Enable Speed Modifier", Default = false, Tooltip = "Sets player speed according to value set."})
MiscMovement:AddSlider("MM_Walkspeed_S", { Text = "Walkspeed Amount", Default = 20, Min = 10, Max = 50, Rounding = 0, Compact = true, Tooltip = "Controls the player walkspeed amount."})
MiscMovement:AddSlider("MM_Walkspeed_Boost", { Text = "Ladder Speed Boost", Default = 0, Min = 0, Max = 50, Rounding = 0, Compact = true, Tooltip = "Speed boost for climbing up ladders. High values may become unstable."})
MiscMovement:AddDivider()
MiscMovement:AddToggle("MM_NoAcceleration", { Text = "No Acceleration", Default = false, Tooltip = "Removes acceleration while moving or switching direction."})

local MiscAudio = Tabs.Misc:AddRightGroupbox("Audio")
MiscAudio:AddToggle("MA_SilentJammin", { Text = "Silent Jammin Modifier", Default = false, Tooltip = "Removes the jeffs shop jammin modifier music."})
MiscAudio:AddDivider()
MiscAudio:AddToggle("MA_InteractSound", { Text = "No Interacting Sound", Default = false, Tooltip = "Removes sound when interacting with a prompt."})
MiscAudio:AddToggle("MA_NoRandomAmbience", { Text = "No Random Ambience", Default = false, Tooltip = "Removes any random noise ambience that may occur."})
MiscAudio:AddToggle("MA_SilentGloombat", { Text = "Silent Gloombats", Default = false, Tooltip = "Makes any gloombat flying and roaring silent, due to it potentially triggering or heavily bothering some people."})








local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'RightShift', NoUI = true, Text = 'Menu Bind' })
MenuGroup:AddDivider()
MenuGroup:AddToggle("KeybindMenuOpen", { Default = false, Text = "Show Keybinds", Callback = function(value) Library.KeybindFrame.Visible = value end})
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('skidhax')
SaveManager:SetFolder('skidhax/doors')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
local DebugGroup = Tabs['UI Settings']:AddRightGroupbox('Debug')
DebugGroup:AddToggle("Debug_Mode", { Text = "Enable Debug Mode", Default = false})
