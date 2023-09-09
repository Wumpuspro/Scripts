if debug.info(1, "l") ~= 1 then
    print("Detected")
else
    print("Safe")
end

pcall(game.HttpGet, game, setmetatable({}, {
    __tostring = function()
        print("Kick Player")
        return ""
    end,
}))

local PandaAuth = loadstring(game:HttpGet('https://pandadevelopment.net/service_api/PandaBetaLib.lua'))() -- Panda Library
local service_name = "pandadevkit" -- Service Name
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KidichiHB/Panda/main/KeyUI", true))() -- UI Library
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() -- Notif Holder Library
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))() -- Notif Library

local function Notify(TitleNotify,DescriptionNotify,ImageNotify)
    Notification:Notify(
        {Title = TitleNotify, Description = DescriptionNotify},
        {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
        {Image = ImageNotify, ImageColor = Color3.fromRGB(255, 255, 255)}
    )
end

local keyforsubmit = ""


local main = Library:new({
    name = "Test"
})
local textbox = main:EnterKey(function(keyText)
    keyforsubmit = keyText
end)

local getKeyButton = main:GetKeyButton(function()
    Notify("Panda Script Hub","Please wait a few secounds for link to be generatd","rbxassetid://5179834402")
    setclipboard(PandaAuth:GetLink(service_name))
    print(PandaAuth:GetLink(service_name))
    textbox:SetText(PandaAuth:GetLink(service_name))
    Notify("Panda Script Hub","Copied to your clipboard, Paste it on your browser to begin getting the key","rbxassetid://5179834402")
end)

local getSubmitButton = main:SubmitKeyButton(function()
    Notify("Panda Script Hub","Commenicing Validation of Key","rbxassetid://5179834402")
    if PandaAuth:ValidateKey(service_name, keyforsubmit) then
        Notify("Panda Script Hub","Key Successfully Validated","rbxassetid://5179834402")
    else
        Notify("Panda Script Hub","Invalid Key..Please Try again","rbxassetid://5179834402")
    end
end)

local getDiscordButton = main:DiscordButton(function()
    setclipboard("discord.gg/w9x4GhfxrY")
    textbox:SetText("discord.gg/w9x4GhfxrY")
    Notify("Panda Script Hub","Discord Link set to Clipboard","rbxassetid://5179834402")
end)
