local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wumpuspro/Alpha-hub-updated/main/lib"))()

local RS
local LeftLeg
local RightLeg
local LeftFoot
local RightFoot
local Distance = 0
local DistanceTackle = 0
local DistanceReach = 0
local DistancePass = 0
local DistanceWalk = 0
local DistanceSide = 0
local DistanceJump = 0
local SaveDelay = 0
local Heartbeat
local HumanoidDied
local TouchedBallLoop
local RunStepped2
local RunStepBall
local AddBallA
local TouchedGKBallBox

local Player = game.Players.LocalPlayer
local RootPart = Player.Character.HumanoidRootPart

local UI = GUI:CreateWindow("Zen Hub", "https://discord.gg/m4EjaHF67T")

local Main = UI:addPage("GoalKeeper", 1, true, 6)
local Main2 = UI:addPage("Striker", 1, true, 6)
local Main3 = UI:addPage("Stats", 1, true, 6)
local Main4 = UI:addPage("Mics", 1, true, 6)
local Main5 = UI:addPage("Player", 1, true, 6)
local Main6 = UI:addPage("Kicks", 1, true, 6)
local Main7 = UI:addPage("Other", 1, true, 6)

Main:addLabel("This is a Label", "Lol this funny")

Main:addButton("This is a button", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Clicked",
        Text = "Lo",
    })
end)

Main:addToggle("This is a Toggle", function(value)
    print(value)
    if value == false then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Toggle",
            Text = "false",
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Toggle",
            Text = "true",
        })
    end
end)

Main:addSlider("This is a Slider", 16, 100, function(value)
    print(value)
end)

Main:addTextBox("This is a TextBox", "Um", function(value)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Wrote",
        Text = value,
    })
end)

Main:addDropdown("This is a Dropdown", { "Um", "Yep", "Lop", "GG" }, 1, function(value)
    game.StarterGui:SetCore("SendNotification", {
        Title = "Selected :",
        Text = value,
    })
end)

Main4:addLabel("Allow Save Everywhere", "Allows You Save On The Field")

Main4:addToggle("Allow Save Everywhere", "Allows You Save On The Field", function(arg)
if arg then
for i,v in pairs(game.Workspace.Main4:GetChildren()) do
    if v.Name == "Fix" then
       v.CanTouch = false
    end
end
    else
        for i,v in pairs(game.Workspace.Main4:GetChildren()) do
    if v.Name == "Fix" then
       v.CanTouch = true
    end
end
end
end)

Main4:addToggle("Auto Save [Touched Method]", "Auto Save The Ball [Touched Method]", function(arg)
if arg then
TouchedGKBallBox = game.Workspace.TPSSystem.TPS.Touched:Connect(function(HRP)
    if HRP == game.Players.LocalPlayer.Character.HumanoidRootPart then
        for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    AnimationId = "304581045"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)




