local mt = getrawmetatable(game)
local ncallsa = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(...)
		local args = {...}
		if not checkcaller() and getnamecallmethod() == "Kick" then
			return nil
		end
		return ncallsa(...)
	end)
	setreadonly(mt, true)
--//
	
--// ANTI-BAN
	local mmt = getrawmetatable(game)

local oldnamecall = mmt.__namecall

setreadonly(mmt, false)

mmt.__namecall = newcclosure(function(self, ...)
   local method = tostring(getnamecallmethod())
   local Args = {...}
   if not checkcaller() and method == "FireServer" and tostring(self) == "Banned" then
       return nil
   end
   
   return oldnamecall(self, ...)
end)

setreadonly(mmt, true)
	
	local gmt = getrawmetatable(game);
setreadonly(gmt, false);
local old_index = gmt.__index;
gmt.__index = function(a, b)
    if tostring(a) == "BannedA" or tostring(a) == "BannedB" or tostring(a) == "BannedC" or tostring(a) == "BannedD" then
        if tostring(b) == "Value" then
            return false;
        end
    end
    return old_index(a, b);
end

local bgmt = getrawmetatable(game);
setreadonly(bgmt, false);
local bold_index = bgmt.__index;
bgmt.__index = function(a, b)
    if tostring(a) == "BCount" then
        if tostring(b) == "Value" then
            return 0;
        end
    end
    return bold_index(a, b);
end

for i,BN in pairs(game:GetService("Workspace").FE.Settings:GetChildren()) do
    if BN.Name == "BName" then
    BN:Destroy()
end
end
--//

--// ANTI-WALKSPEED AND ANTI-JUMPPOWER
for i,b in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if b.Name == " " then
    b:Destroy()
end
end

for i,lc2 in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if lc2:IsA("LocalScript") and string.match(lc2.Name, "1") or string.match(lc2.Name, "2") or string.match(lc2.Name, "3") or string.match(lc2.Name, "4") or string.match(lc2.Name, "5") or string.match(lc2.Name, "6") or string.match(lc2.Name, "7") or string.match(lc2.Name, "8") or string.match(lc2.Name, "9") then
       lc2:Destroy()
    end
end

for i,lc in pairs(game.Players.LocalPlayer.PlayerGui.Start:GetChildren()) do
    if lc:IsA("LocalScript") and string.match(lc.Name, "1") or string.match(lc.Name, "2") or string.match(lc.Name, "3") or string.match(lc.Name, "4") or string.match(lc.Name, "5") or string.match(lc.Name, "6") or string.match(lc.Name, "7") or string.match(lc.Name, "8") or string.match(lc.Name, "9") then
       lc:Destroy()
    end
end

for i,c in pairs(game.Players.LocalPlayer.PlayerGui.Start:GetChildren()) do
    if c.Name == "CheckPlayerW" then
    c:Destroy()
end
end

for i,z in pairs(game.StarterGui.Start:GetChildren()) do
    if z.Name == "CheckPlayerW" then
    z:Destroy()
end
end

for _, v in pairs(game.StarterPlayer.StarterCharacterScripts:GetDescendants()) do
if v.Name == " " then
v:Destroy()
end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
wait(0.5)
for i,char in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if char.Name == " " then
       char:Destroy()
    end
    end
end)
--//

--// ANTI-LAG (REMOVES LAG FROM GUI)
for i,nolag in pairs(game.StarterGui.Start:GetChildren()) do
if nolag.Name == "Gradient" then
nolag:Destroy()
end
end
for i,nolaglp in pairs(game.Players.LocalPlayer.PlayerGui.Start:GetChildren()) do
if nolaglp.Name == "Gradient" then
nolaglp:Destroy()
end
end
--//

--// FUNCTIONS, VARIABLES AND SCRIPTS //--
function GetPlayer(String)
	local Foundplr = {}
	local strl = String:lower()
	if strl == "all" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			table.insert(Foundplr,v)
		end
	elseif strl == "others" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name ~= game.Players.LocalPlayer.Name then
				table.insert(Foundplr,v)
			end
		end
	elseif strl == "me" then
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Name == game.Players.LocalPlayer.Name then
				table.insert(Foundplr,v)
			end
		end
	else
		for i,v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.DisplayName:lower():sub(1, #String) == String:lower() or v.Name:lower():sub(1, #String) == String:lower() then
				table.insert(Foundplr,v)
			end
		end
	end
	return Foundplr
end

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

local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/cypherdh/VanisUILIB/main/.gitignore'))()

local Window = library:CreateWindow("TPS: Street Soccer", "Version: 1.48", 10044538000)

local Tab = Window:CreateTab("Scripts")

local GKPage = Tab:CreateFrame("Goalkeeper")
local SPage = Tab:CreateFrame("Striker")
local MPage = Tab:CreateFrame("Miscellaneous")
local LPPage = Tab:CreateFrame("LocalPlayer")
local PPage = Tab:CreateFrame("Players")
local KPage = Tab:CreateFrame("Kicks")
local PWRPage = Tab:CreateFrame("Powers")
local BPage = Tab:CreateFrame("Ball")
local MRPage = Tab:CreateFrame("Mobile Reach")
local TPPage = Tab:CreateFrame("Teleports")
local CPage = Tab:CreateFrame("Celebrations")
local VPage = Tab:CreateFrame("Visuals")
local CRPage = Tab:CreateFrame("Credits")

GKPage:CreateLabel("Miscellaneous")

GKPage:CreateToggle("Allow Save Everywhere", "Allows You Save On The Field", function(arg)
if arg then
for i,v in pairs(game.Workspace.GKSystem:GetChildren()) do
    if v.Name == "Fix" then
       v.CanTouch = false
    end
end
    else
        for i,v in pairs(game.Workspace.GKSystem:GetChildren()) do
    if v.Name == "Fix" then
       v.CanTouch = true
    end
end
end
end)

GKPage:CreateToggle("Auto Save [Touched Method]", "Auto Save The Ball [Touched Method]", function(arg)
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

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["Right Leg"]
local Event = game:GetService("Workspace").FE.Actions.SaveRL
Event:FireServer(A_1, A_2)

local Events2 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events2:FireServer()
else
AnimationId = "3008336125"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["HumanoidRootPart"]
local Event = game:GetService("Workspace").FE.Actions.SaveT
Event:FireServer(A_1, A_2)

local Events3 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events3:FireServer()
end
end
end
end
end)
    else
TouchedGKBallBox:Disconnect()
end
end)

GKPage:CreateToggle("Auto Save [RemoteEvent Method]", "Auto Save The Ball [RemoteEvent Method]", function(arg)
if arg then
_G.GKS = true
    while _G.GKS do
    wait()
       for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= Distance then
    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    AnimationId = "304581045"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["Right Leg"]
local Event = game:GetService("Workspace").FE.Actions.SaveRL
Event:FireServer(A_1, A_2)

local Events2 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events2:FireServer()
else
AnimationId = "3008336125"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
wait(SaveDelay)

local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game.Players.LocalPlayer.Character["HumanoidRootPart"]
local Event = game:GetService("Workspace").FE.Actions.SaveT
Event:FireServer(A_1, A_2)

local Events3 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events3:FireServer()
end
end
end
end
end
    else
if _G.GKS == true then
_G.GKS = false
else
_G.GKS = true
end
end
end)

GKPage:CreateToggle("Auto Jump", "Auto Jump For The Ball", function(arg)
if arg then
_G.JUMP = true
    while _G.JUMP do
    wait()
    
for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    local a = Vector3.new(0, v.Position.Y, 0)
    local b = Vector3.new(0, game.Players.LocalPlayer.Character.Head.Position.Y, 0)
    if (a - b).Magnitude >= 5 then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= DistanceJump then
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
end
end
end
end
    else
if _G.JUMP == true then
_G.JUMP = false
else
_G.JUMP = true
end
end
end)

GKPage:CreateToggle("Auto Walk Sideways [WalkToPoint Method]", "Auto Walk Sideways In Net When The Ball Is Near", function(arg)
if arg then
_G.SIDEW = true
    while _G.SIDEW do
    wait(0.8)
       for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= DistanceSide then
    if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(9.488, 13.3, -126.9)
    wait(0.8)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(-9.697, 13.3, -126.49)
    else
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(-8.878, 13.3, 129.295)
    wait(0.8)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(9.07, 13.3, 129.73)
end
end
end
end
end
    else
if _G.SIDEW == true then
_G.SIDEW = false
else
_G.SIDEW = true
end
end
end)

GKPage:CreateToggle("Auto Walk Sideways [MoveTo Method]", "Auto Walk Sideways In Net When The Ball Is Near", function(arg)
if arg then
_G.SIDEM = true
    while _G.SIDEM do
    wait(0.8)
       if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceSide then
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(game.Workspace.TPSSystem.TPS.Position.X, 0, 0))
wait(0.8)
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-game.Workspace.TPSSystem.TPS.Position.X, 0, 0))
end
end
    else
if _G.SIDEM == true then
_G.SIDEM = false
else
_G.SIDEM = true
end
end
end)

local PartRedTouched
local PartBlueTouched

GKPage:CreateToggle("Auto Look At The Ball", "Auto Look At The Ball When In The Box. Switched Teams = Untoggle", function(arg)
if arg then
local PartB = game:GetService("Workspace").GKSystem.Fix2
local PartR = game:GetService("Workspace").GKSystem.Fix1

if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
PartBlueTouched = PartB.Touched:Connect(function()
    local touching = PartB:GetTouchingParts()
	for i=1,#touching do
		if touching[i] == game.Players.LocalPlayer.Character.HumanoidRootPart then
			repeat wait()
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude > 6 then
			game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position,game.Workspace.TPSSystem.TPS.Position)
end

			until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= 4.5
end
end
end)
else
PartRedTouched = PartR.Touched:Connect(function()
    local touching = PartR:GetTouchingParts()
	for i=1,#touching do
		if touching[i] == game.Players.LocalPlayer.Character.HumanoidRootPart then
			repeat wait()
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude > 6 then
			game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position,game.Workspace.TPSSystem.TPS.Position)
end

			until (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= 4.5
end
end
end)
end
    else
    PartRedTouched:Disconnect()
    PartBlueTouched:Disconnect()
    wait(1)
    game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = false
end
end)

GKPage:CreateToggle("Auto Return", "Auto Return To Team Goal When You Died.", function(arg)
if arg then
HumanoidDied = game.Players.LocalPlayer.CharacterAdded:Connect(function()
       wait(0.5)
          if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
          game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(-2.114, 13.3, -118.341)
    else
          game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(0.512, 13.3, 122.121)
       end
    end)
    else
    HumanoidDied:Disconnect()
end
end)

GKPage:CreateLabel("Configurations")

GKPage:CreateBox("Auto Save Delay", 10044538000, function(arg)
SaveDelay = tonumber(arg)
end)

GKPage:CreateSlider("Auto Save Distance", 0, 10,function(arg)
   Distance = arg
end)

GKPage:CreateSlider("Auto Jump Distance", 0, 50,function(arg)
   DistanceJump = arg
end)

GKPage:CreateSlider("Auto Walk Sideways Distance", 0, 300,function(arg)
   DistanceSide = arg
end)

SPage:CreateLabel("Miscellaneous")

SPage:CreateToggle("Auto Goal [Autofarm]", "Auto Goal [Autofarn]. Use At Your Own Risk", function(arg)
if arg then
_G.AUTOFARM = true
while _G.AUTOFARM do
wait()
local HRPRotation = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Rotation
local GoalPST = game.Workspace.TPSSystem.TPS.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = HRPRotation + GoalPST.Position
    local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.Head
local Event = game:GetService("Workspace").FE.Actions.Tackle
Event:FireServer(A_1, A_2)

local Events2 = game:GetService("Workspace").FE.Kick.RemoteEvent2
Events2:FireServer()
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),game.Workspace.BlueGoal.Part.Position)
end
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),game.Workspace.RedGoal.Part.Position)
end
end
    else
_G.AUTOFARM = false
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lines.Line12.CFrame
game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = false
end
end)

SPage:CreateToggle("Allow Kick GK Box", "Allows You Shoot From Goalkeeper's Goal Box", function(arg)
if arg then
game:GetService("Workspace").GKSystem.Fix1.CanTouch = false
        game:GetService("Workspace").GKSystem.Fix2.CanTouch = false
    else
        game:GetService("Workspace").GKSystem.Fix1.CanTouch = true
        game:GetService("Workspace").GKSystem.Fix2.CanTouch = true
end
end)

SPage:CreateToggle("Auto Shoot", "Auto Shoot The Ball When You Are Near", function(arg)
if arg then
_G.MOD = true
    while _G.MOD do
    wait()
    for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 6 then
       local ModuleKick = require(game:GetService("Players").LocalPlayer.Backpack.Module)
ModuleKick.Kick()
ModuleKick.Kick2()
end
end
end
end
    else
    _G.MOD = false
end
end)

SPage:CreateToggle("Auto Tackle", "Auto Tackle The Ball. Recommended 'Face At The Ball'", function(arg)
if arg then
_G.MODT = true
    while _G.MODT do
    wait()
    for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 6 then
       local ModuleKick = require(game:GetService("Players").LocalPlayer.Backpack.Module)
ModuleKick.Tackle()
end
end
end
end
    else
    _G.MODT = false
end
end)

SPage:CreateToggle("Auto Defence [BUGGY]", "Auto Defending Your Team Goal", function(arg)
if arg then
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(0.6464786529541016, 13.299994468688965, 92.49656677246094)
else
game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(0.11751431971788406, 13.299994468688965, -91.30338287353516)
end
_G.AUTODEFENCE = true
while _G.AUTODEFENCE do
wait()
    if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
        if (game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part2.Position).Magnitude <= 125 then
        game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),game.Workspace.RedGoal.Part.Position)
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace.TPSSystem.TPS.Position)
for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 6 then
       local ModuleKick = require(game:GetService("Players").LocalPlayer.Backpack.Module)
ModuleKick.Tackle()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.Head
local Event = game:GetService("Workspace").FE.Actions.Tackle
Event:FireServer(A_1, A_2)
end
end
end
end
end
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
        if (game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part1.Position).Magnitude <= 125 then
        game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),game.Workspace.BlueGoal.Part.Position)
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace.TPSSystem.TPS.Position)
for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 6 then
       local ModuleKick = require(game:GetService("Players").LocalPlayer.Backpack.Module)
ModuleKick.Tackle()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.Head
local Event = game:GetService("Workspace").FE.Actions.Tackle
Event:FireServer(A_1, A_2)
end
end
end
end
end
end
    else
        _G.AUTODEFENCE = false
        wait(1)
        game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = false
end
end)

SPage:CreateToggle("Auto Power", "Auto Changes Power Of The Kick By Distance. Just Click To Shoot", function(arg)
if arg then
_G.AUTOPOWER = true
while _G.AUTOPOWER do
wait()
    if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
        if (game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part1.Position).Magnitude <= 90 then
        game.Players.LocalPlayer.Backpack.Speed.Value = 65
        game.Players.LocalPlayer.Backpack.Angle.Value = Vector3.new(4000000, 1000, 4000000)
        elseif (game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part1.Position).Magnitude > 99 then
        game.Players.LocalPlayer.Backpack.Speed.Value = 65
        game.Players.LocalPlayer.Backpack.Angle.Value = Vector3.new(4000000, 1100, 4000000)
    end
end
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
        if (game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part2.Position).Magnitude <= 99 then
        game.Players.LocalPlayer.Backpack.Speed.Value = 65
        game.Players.LocalPlayer.Backpack.Angle.Value = Vector3.new(4000000, 1000, 4000000)
        elseif (game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part2.Position).Magnitude > 100 then
        game.Players.LocalPlayer.Backpack.Speed.Value = 65
        game.Players.LocalPlayer.Backpack.Angle.Value = Vector3.new(4000000, 1100, 4000000)
    end
end
end
    else
        _G.AUTOPOWER = false
end
end)

SPage:CreateToggle("Auto Aim Goal [BodyGyro]", "Locks/Faces At Opponent's Goal. Don't Use ShiftLock", function(arg)
if arg then
local Offset = CFrame.new(4, 0, 0)

local BGyro = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
BGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
BGyro.P = 99999
BGyro.D = 500
    _G.GOAL = true
    while _G.GOAL do
    wait()
       if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
local BLUE = game.Workspace.BlueGoal.Part
local Direction = ((BLUE.CFrame * Offset).p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * Vector3.new(1, 0, 1)
BGyro.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Direction)
else
local RED = game.Workspace.RedGoal.Part
local Direction = ((RED.CFrame * Offset).p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * Vector3.new(1, 0, 1)
BGyro.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Direction)
end
end
    else
    _G.GOAL = false
    for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
    if v.Name == "BodyGyro" then
    v:Destroy()
    end
    end
end
end)

SPage:CreateToggle("Auto Aim Goal [lookAt]", "Locks/Faces At Opponent's Goal. [lookAt Method]", function(arg)
if arg then
_G.LookAt = true
while _G.LookAt do
wait()
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright red") then
game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),game.Workspace.BlueGoal.Part.Position)
end
if game.Players.LocalPlayer.TeamColor == BrickColor.new("Bright blue") then
game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),game.Workspace.RedGoal.Part.Position)
end
end
    else
    _G.LookAt = false
    wait(0.5)
    game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = false
end
end)

SPage:CreateToggle("Auto Aim Pass Teammate [BodyGyro]", "Locks/Faces At Your Teammate. Don't Use ShiftLock", function(arg)
if arg then
local Offset = CFrame.new(4, 0, 0)
    
    local BGyro = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
BGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
BGyro.P = 99999
BGyro.D = 500

_G.PLR = true
while _G.PLR do
wait()
for i,v in pairs(game.Players:GetPlayers()) do
                  if v.Name ~= game.Players.LocalPlayer.Character.Name and  (v.Character.Head.CFrame.p - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p).Magnitude < DistancePass and Player.TeamColor == v.TeamColor then
                  local Direction = ((v.Character.Head.CFrame * Offset).p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * Vector3.new(1, 0, 1)
BGyro.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Direction)
end
end
end
    else
    _G.PLR = false
    for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
    if v.Name == "BodyGyro" then
    v:Destroy()
    end
    end
end
end)

SPage:CreateToggle("Auto Aim Pass Teammate [lookAt]", "Locks/Faces At Your Teammate. [lookAt Method]", function(arg)
if arg then
_G.LookAAA = true
while _G.LookAAA do
wait()
for i,v in pairs(game.Players:GetPlayers()) do
                  if v.Name ~= game.Players.LocalPlayer.Character.Name and  (v.Character.Head.CFrame.p - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p).Magnitude < DistancePass and Player.TeamColor == v.TeamColor then
game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = true
game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 45, 0),v.Character.HumanoidRootPart.Position)
end
end
end
    else
    _G.LookAAA = false
    wait(0.5)
    game.Players.LocalPlayer.PlayerGui.LockScript.SetLock.Value = false
end
end)

SPage:CreateLabel("Configurations")

SPage:CreateSlider("Auto Aim Pass Teammate Distance", 0, 275,function(arg)
   DistancePass = arg
end)

MPage:CreateLabel("Functions")

MPage:CreateToggle("Face At The Ball", "Locks/Faces At The Ball", function(arg)
if arg then
local Offset = CFrame.new(4, 0, 0)

local BGyro = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
BGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
BGyro.P = 99999
BGyro.D = 500

_G.FACE = true
while _G.FACE do
wait()
local Ball = game.Workspace.TPSSystem.TPS
if Ball then
local Direction = ((Ball.CFrame * Offset).p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * Vector3.new(1, 0, 1)
BGyro.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Direction)
end
end
    else
    _G.FACE = false
    for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
    if v.Name == "BodyGyro" then
    v:Destroy()
    end
    end
end
end)

MPage:CreateToggle("Unlock Celebrations Tab", "Unlocking/Locking Celebrations Tab", function(arg)
if arg then
game:GetService("Workspace").Celebrate1.Value = true
game:GetService("Workspace").Celebrate2.Value = true
    else
    game:GetService("Workspace").Celebrate1.Value = false
    game:GetService("Workspace").Celebrate2.Value = false
end
end)

MPage:CreateToggle("Meter Indicator", "Shows Meters Of The Ball From The Goal. Also The GUI Is Draggable", function(arg)
if arg then
local MeterIndicator = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Blue = Instance.new("TextLabel")
local Red = Instance.new("TextLabel")
local BMeters = Instance.new("TextLabel")
local RMeters = Instance.new("TextLabel")

MeterIndicator.Name = "MeterIndicator"
MeterIndicator.Parent = game.CoreGui
MeterIndicator.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = MeterIndicator
Main.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.412142843, 0, 0.882352948, 0)
Main.Size = UDim2.new(0, 242, 0, 60)
Main.Active = true
Main.Draggable = true

Blue.Name = "Blue"
Blue.Parent = Main
Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blue.BackgroundTransparency = 1.000
Blue.BorderSizePixel = 0
Blue.Size = UDim2.new(0, 120, 0, 13)
Blue.Font = Enum.Font.FredokaOne
Blue.Text = "Blue Team"
Blue.TextColor3 = Color3.fromRGB(0, 85, 255)
Blue.TextScaled = true
Blue.TextSize = 14.000
Blue.TextWrapped = true

Red.Name = "Red"
Red.Parent = Main
Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Red.BackgroundTransparency = 1.000
Red.BorderSizePixel = 0
Red.Position = UDim2.new(0.533057868, 0, 0, 0)
Red.Size = UDim2.new(0, 113, 0, 13)
Red.Font = Enum.Font.FredokaOne
Red.Text = "Red Team"
Red.TextColor3 = Color3.fromRGB(255, 0, 0)
Red.TextScaled = true
Red.TextSize = 14.000
Red.TextWrapped = true

BMeters.Name = "BMeters"
BMeters.Parent = Main
BMeters.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BMeters.BackgroundTransparency = 1.000
BMeters.BorderSizePixel = 0
BMeters.Position = UDim2.new(0, 0, 0.566666663, 0)
BMeters.Size = UDim2.new(0, 120, 0, 13)
BMeters.Font = Enum.Font.FredokaOne
BMeters.Text = "From 26 Meters"
BMeters.TextColor3 = Color3.fromRGB(255, 255, 255)
BMeters.TextScaled = true
BMeters.TextSize = 14.000
BMeters.TextWrapped = true

RMeters.Name = "RMeters"
RMeters.Parent = Main
RMeters.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RMeters.BackgroundTransparency = 1.000
RMeters.BorderSizePixel = 0
RMeters.Position = UDim2.new(0.533057868, 0, 0.566666663, 0)
RMeters.Size = UDim2.new(0, 113, 0, 13)
RMeters.Font = Enum.Font.FredokaOne
RMeters.Text = "From 26 Meters"
RMeters.TextColor3 = Color3.fromRGB(255, 255, 255)
RMeters.TextScaled = true
RMeters.TextSize = 14.000
RMeters.TextWrapped = true
	local Player = game.Players.LocalPlayer
	Heartbeat = game:GetService("RunService").Heartbeat
	local function HeartbeatUPD()

     RMeters.Text = "From " .. math.floor((game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part1.Position).Magnitude / 10) .. " Meters"
     BMeters.Text = "From " .. math.floor((game.Workspace.TPSSystem.TPS.Position - game.Workspace.TPSSystem.Part2.Position).Magnitude / 10) .. " Meters"
     end
    Heartbeat:Connect(HeartbeatUPD)
    else
    game.CoreGui.MeterIndicator:Destroy()
    Heartbeat:Disconnect()
end
end)

MPage:CreateToggle("Ball Information", "Shows Information About The Ball (Curved, Trail, etc)", function(arg)
if arg then
local BallInformationGUI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Context = Instance.new("TextLabel")
local Curving = Instance.new("TextLabel")
local Flaming = Instance.new("TextLabel")
local Trail = Instance.new("TextLabel")
local TextureID = Instance.new("ImageLabel")
local BallTexture = Instance.new("TextLabel")

BallInformationGUI.Name = "BallInformationGUI"
BallInformationGUI.Parent = game.CoreGui
BallInformationGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = BallInformationGUI
Main.BackgroundColor3 = Color3.fromRGB(77, 77, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.29072684, 0, 0.29411763, 0)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Active = true
Main.Draggable = true

Context.Name = "Context"
Context.Parent = Main
Context.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Context.BackgroundTransparency = 1.000
Context.BorderColor3 = Color3.fromRGB(27, 42, 53)
Context.BorderSizePixel = 0
Context.Size = UDim2.new(0, 500, 0, 50)
Context.Font = Enum.Font.Roboto
Context.Text = "The Ball Information"
Context.TextColor3 = Color3.fromRGB(255, 255, 255)
Context.TextScaled = true
Context.TextSize = 14.000
Context.TextWrapped = true

Curving.Name = "Curving"
Curving.Parent = Main
Curving.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Curving.BackgroundTransparency = 1.000
Curving.BorderColor3 = Color3.fromRGB(27, 42, 53)
Curving.BorderSizePixel = 0
Curving.Position = UDim2.new(0.0719999969, 0, 0.208571419, 0)
Curving.Size = UDim2.new(0, 195, 0, 50)
Curving.Font = Enum.Font.Roboto
Curving.Text = "Curve: No"
Curving.TextColor3 = Color3.fromRGB(255, 0, 0)
Curving.TextScaled = true
Curving.TextSize = 14.000
Curving.TextWrapped = true

Flaming.Name = "Flaming"
Flaming.Parent = Main
Flaming.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Flaming.BackgroundTransparency = 1.000
Flaming.BorderColor3 = Color3.fromRGB(27, 42, 53)
Flaming.BorderSizePixel = 0
Flaming.Position = UDim2.new(0.537, 0, 0.209000006, 0)
Flaming.Size = UDim2.new(0, 195, 0, 50)
Flaming.Font = Enum.Font.Roboto
Flaming.Text = "Flame Power Shot: No"
Flaming.TextColor3 = Color3.fromRGB(255, 0, 0)
Flaming.TextScaled = true
Flaming.TextSize = 14.000
Flaming.TextWrapped = true

Trail.Name = "Trail"
Trail.Parent = Main
Trail.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Trail.BackgroundTransparency = 1.000
Trail.BorderColor3 = Color3.fromRGB(27, 42, 53)
Trail.BorderSizePixel = 0
Trail.Position = UDim2.new(0.305000007, 0, 0.374714315, 0)
Trail.Size = UDim2.new(0, 195, 0, 50)
Trail.Font = Enum.Font.Roboto
Trail.Text = "Trail: Disabled"
Trail.TextColor3 = Color3.fromRGB(255, 0, 0)
Trail.TextScaled = true
Trail.TextSize = 14.000
Trail.TextWrapped = true

TextureID.Name = "TextureID"
TextureID.Parent = Main
TextureID.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextureID.Position = UDim2.new(0.400000006, 0, 0.694285691, 0)
TextureID.Size = UDim2.new(0, 100, 0, 100)

BallTexture.Name = "BallTexture"
BallTexture.Parent = Main
BallTexture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BallTexture.BackgroundTransparency = 1.000
BallTexture.BorderColor3 = Color3.fromRGB(27, 42, 53)
BallTexture.BorderSizePixel = 0
BallTexture.Position = UDim2.new(0.305000007, 0, 0.551857233, 0)
BallTexture.Size = UDim2.new(0, 195, 0, 40)
BallTexture.Font = Enum.Font.Roboto
BallTexture.Text = "Texture/Decals:"
BallTexture.TextColor3 = Color3.fromRGB(255, 255, 255)
BallTexture.TextScaled = true
BallTexture.TextSize = 14.000
BallTexture.TextWrapped = true

RunStepBall = game:GetService("RunService").Stepped:Connect(function()
                for i, ang in pairs(game.Workspace.TPSSystem.TPS:GetChildren()) do
                if ang.Name == "AngularVelocity" then
                Curving.Text = "Curve: Yes"
                Curving.TextColor3 = Color3.fromRGB(0, 255, 0)
                elseif not ang:FindFirstChild("AngularVelocity") then
                Curving.Text = "Curve: No"
                Curving.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                end
                for i, power in pairs(game.Workspace.TPSSystem.TPS:GetChildren()) do
                if power.Name == "Fire" or power.Name == "FireB" then
                if power.Enabled == true then
                Flaming.Text = "Flame Power Shot: Yes"
                Flaming.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                Flaming.Text = "Flame Power Shot: No"
                Flaming.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                end
                end
                for i, trail in pairs(game.Workspace.TPSSystem.TPS:GetChildren()) do
                if trail.Name == "Trail" then
                if trail.Enabled == true then
                Trail.Text = "Trail: Enabled"
                Trail.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                Trail.Text = "Trail: Disabled"
                Trail.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
                end
                end
                TextureID.Image = game.Workspace.TPSSystem.TPS.Decal1.Texture
        end)
    else
        game.CoreGui.BallInformationGUI:Destroy()
        RunStepBall:Disconnect()
end
end)

MPage:CreateButton("Crash The Ball [Stay Close To The Ball]", "Crashing And Teleporting The Ball To Void. Very Overpowered Function", function()
   local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 70
local A_4 = Vector3.new(4000000, -math.huge, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end)

MPage:CreateButton("Remove BillboardGui", "Removes Username, Level, Red/Blue Circle Above Your Head", function()
   for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
       if v:IsA("BillboardGui") then
           v:Destroy()
       end
   end
end)

MPage:CreateButton("Remove Map", "Removes Map For Less Lag", function()
   for i,v in pairs(game.Workspace:GetChildren()) do
       if v.Name == "Map" then
           v:Destroy()
       end
   end
end)

MPage:CreateButton("Secret BadgeAwarder", "Gives You Secret Badge", function()
   for i,v in pairs(game.Workspace:GetChildren()) do
       if v.Name == "BadgeAwarder" then
               v.Platform.CanCollide = false
               v.Platform.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
               v.Platform.Transparency = 1
               v.Platform.Decal.Transparency = 1
               wait(2)
               v.Platform.CanCollide = true
               v.Platform.Transparency = 0
               v.Platform.Decal.Transparency = 0
               v.Platform.CFrame = CFrame.new(-2, -0, 363, 1, 0, 0, 0, 1, 0, 0, 0, 1)
       end
   end
end)

MPage:CreateLabel("Scripts")

MPage:CreateToggle("Chat Log Spy", "Spying And Showing Hidden & Private Messages. It's Gray Color", function(arg)
if arg then
EnabledChatLogger = true
SpyOnMyself = true
IsPublic = false
IsPublicItalics = false
ChatMessageProperties = {
	Color = Color3.fromRGB(162,163,165); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local SayMessageRequest = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local OnMessageDoneFiltering = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local InstanceNUM = (_G.ChatLogger or 0) + 1
_G.ChatLogger = InstanceNUM

local function onChatted(plr, msg)
	if _G.ChatLogger == InstanceNUM then
		if plr == Player then
			EnabledChatLogger = not EnabledChatLogger
		elseif EnabledChatLogger and SpyOnMyself == true or plr ~= Player then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local HiddenMSG = true
			local Connection = OnMessageDoneFiltering.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId == plr.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and IsPublic == false)) then
					HiddenMSG = false
				end
			end)
			wait(0.2)
			Connection:Disconnect()
			if HiddenMSG and EnabledChatLogger then
				if IsPublic then
					SayMessageRequest:FireServer((IsPublicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					ChatMessageProperties.Text = " [".. plr.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage", ChatMessageProperties)
				end
			end
		end
	end
end

for _,getplayers in ipairs(Players:GetPlayers()) do
	getplayers.Chatted:Connect(function(msg) 
	onChatted(getplayers, msg) 
	end)
end
Players.PlayerAdded:Connect(function(plradded)
	plradded.Chatted:Connect(function(msg) 
	onChatted(plradded, msg) 
	end)
end)
wait(3)
local ChatFrame = Player.PlayerGui.Chat.Frame
ChatFrame.ChatChannelParentFrame.Visible = true
ChatFrame.ChatBarParentFrame.Position = ChatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), ChatFrame.ChatChannelParentFrame.Size.Y)
    else
    EnabledChatLogger = false
end
end)

MPage:CreateButton("Infinite Yield Admin", "Executes The Admin Script. Use For Trolling", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

LPPage:CreateLabel("Miscellaneous")

local FireHeartbeat

LPPage:CreateToggle("Invisible [Fire Power Method]", "You Will Be Invisible When Someone Kills You With Fire", function(arg)
if arg then
FireHeartbeat = game:GetService("RunService").Heartbeat:Connect(function()
for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name then
        for i,b in pairs(v.Character.HumanoidRootPart:GetDescendants()) do
            if b.Name == "Fire" or b.Name == "HitScript" then
                b:Destroy()
            end
        end
end
end
end)
    else
    FireHeartbeat:Disconnect()
end
end)

LPPage:CreateButton("Invisible [R15]", "You Will Be Invisible. Dribbling & Kicking Are FE", function()
    --// REMOVE BILLBOARDGUI NAME, LEVEL AND INFORMATION --\\

for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
       if v:IsA("BillboardGui") then
           v:Destroy()
       end
   end
   
--// VARIABLES, SERVICES --\\

local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
local LT = game.Players.LocalPlayer.Character.LowerTorso
local OldCF = HRP.CFrame

--// SCRIPTING --\\
if game.Players.LocalPlayer.Character.PrimaryPart ~= HRP then
    game.Players.LocalPlayer.Character.PrimaryPart = HRP
end


local NewRootMotor6D = LT:FindFirstChild("Root"):Clone()
HRP.Parent = game.Workspace
game.Players.LocalPlayer.Character.PrimaryPart = HRP
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(OldCF.X, 9e9, OldCF.Z))
HRP.Parent = game.Players.LocalPlayer.Character
wait(0.45)
NewRootMotor6D.Parent = HRP
HRP.CFrame = OldCF
end)

LPPage:CreateButton("Fake Join Group", "Unlocks Black Trail For The Ball", function()
    local mt = getrawmetatable(game);
local nc = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod();
    if Method == 'IsInGroup' then
        return 5334925
    end
    return nc(self, ...)
end)
end)

LPPage:CreateButton("Rejoin The Server", "Rejoining To Same Server", function()
    local plr = game.Players.LocalPlayer

game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end)

LPPage:CreateButton("Reset The Character", "Resetting Your Character", function()
    game.Players.LocalPlayer.Character:BreakJoints()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

LPPage:CreateLabel("Humanoid Properties")

LPPage:CreateSlider("WalkSpeed", 0, 1000,function(arg)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = arg
end)

LPPage:CreateSlider("JumpPower", 0, 500,function(arg)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = arg
end)

LPPage:CreateSlider("HipHeight", 0, 15,function(arg)
   game.Players.LocalPlayer.Character.Humanoid.HipHeight = arg
end)

LPPage:CreateButton("Default WalkSpeed", "Set Custom WalkSpeed To Default (22)", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 22
end)

LPPage:CreateButton("Default JumpPower", "Set Custom JumpPower To Default (50)", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

LPPage:CreateButton("Default HipHeight", "Set Custom HipHeight To Default (0)", function()
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
end)

LPPage:CreateLabel("Teams")

LPPage:CreateToggle("Fake Switch The Blue Team", "Shows A Blue Circle Above Your Head", function(arg)
if arg then
_G.FB = true
    while _G.FB do
    wait()
    game.Workspace.FE.PlayerTeam.RemoteEventB:FireServer()  
    end
    else
    _G.FB = false
end
end)

LPPage:CreateToggle("Fake Switch The Red Team", "Shows A Red Circle Above Your Head", function(arg)
if arg then
_G.FR = true
    while _G.FR do
    wait()
    game.Workspace.FE.PlayerTeam.RemoteEventR:FireServer()  
    end
    else
    _G.FR = false
end
end)

LPPage:CreateButton("Join The Blue Team", "You Will Join The Blue Team", function()
    local Event = game:GetService("Workspace").FE.CTeamColor.RemoteEventB
Event:FireServer()
end)

LPPage:CreateButton("Join The Red Team", "You Will Join The Red Team", function()
    local Event = game:GetService("Workspace").FE.CTeamColor.RemoteEventR
Event:FireServer()
end)

LPPage:CreateButton("Join The Waiting Team", "You Will Join The Waiting Team", function()
    local Event = game:GetService("Workspace").FE.CTeamColor.RemoteEvent
Event:FireServer()
end)

LPPage:CreateLabel("Reach")
local RunStepped

LPPage:CreateToggle("Reach", "Enables Reach", function(arg)
if arg then
RunStepped = game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceReach then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"], game.Workspace.TPSSystem.TPS, 1)

end
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceReach then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
			end
			end
			end
end)
else
RunStepped:Disconnect()
end
end)

LPPage:CreateSlider("Reach Distance", 0, 100,function(arg)
   DistanceReach = arg
end)

LPPage:CreateLabel("Reach Leg")
LPPage:CreateLabel("Customize Reach Size And Transparency. After Use Fake Leg")

LPPage:CreateButton("Fake Leg [R6]", "Creates Fake Leg For Better View", function()
    if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
    game.Players.LocalPlayer.Character["Left Leg"].Massless = true
   LeftLeg = Instance.new("Part", game.Players.LocalPlayer.Character)
LeftLeg.Name = "Left Leg"
LeftLeg.CanCollide = false
LeftLeg.Color = game.Players.LocalPlayer.Character["Left Leg"].Color
LeftLeg.Size = Vector3.new(1, 2, 1)
LeftLeg.Locked = true
LeftLeg.Position = game.Players.LocalPlayer.Character["Left Leg"].Position

local Attachment = Instance.new("Attachment", LeftLeg)
Attachment.Name = "LeftFootAttachment"
Attachment.Position = Vector3.new(0, -1, 0)

local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
MotorHip.Name = "Fake Left Hip"
MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
MotorHip.CurrentAngle = 0
MotorHip.DesiredAngle = 0
MotorHip.MaxVelocity = 0.1
MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
MotorHip.Part1 = LeftLeg
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
   RightLeg = Instance.new("Part", game.Players.LocalPlayer.Character)
RightLeg.Name = "Right Leg"
RightLeg.CanCollide = false
RightLeg.Color = game.Players.LocalPlayer.Character["Right Leg"].Color
RightLeg.Size = Vector3.new(1, 2, 1)
RightLeg.Locked = true
RightLeg.Position = game.Players.LocalPlayer.Character["Right Leg"].Position

local Attachment = Instance.new("Attachment", RightLeg)
Attachment.Name = "RightFootAttachment"
Attachment.Position = Vector3.new(0, -1, 0)

local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
MotorHip.Name = "Fake Right Hip"
MotorHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
MotorHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
MotorHip.CurrentAngle = 0
MotorHip.DesiredAngle = 0
MotorHip.MaxVelocity = 0.1
MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
MotorHip.Part1 = RightLeg
end
end)

LPPage:CreateButton("Remove Fake Leg [R6]", "Removes Fake Leg", function()
    if LeftLeg ~= nil then
LeftLeg:Destroy()
elseif RightLeg ~= nil then
RightLeg:Destroy()
elseif LeftFoot ~= nil then
LeftFoot:Destroy()
elseif RightFoot ~= nil then
RightFoot:Destroy()
end
for i,z in pairs(game.Players.LocalPlayer.Character.Torso:GetDescendants()) do
        if z.Name == "Fake Left Hip" or z.Name == "Fake Right Hip" then
            z:Destroy()
        end
    end
end)

LPPage:CreateSlider("Reach Leg Size", 1, 100,function(arg)
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(arg, 2, arg)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(arg, 2, arg)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(arg, 2, arg)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(arg, 2, arg)
end
end
end)

LPPage:CreateBox("Reach Leg Transparency", 10044538000, function(arg)
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Transparency = tonumber(arg)
else
game.Players.LocalPlayer.Character["Right Leg"].Transparency = tonumber(arg)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = tonumber(arg)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = tonumber(arg)
end
end
end)

LPPage:CreateLabel("Settings")

LPPage:CreateBox("Replication Lag-Ping [Use 0.01 or 0.02 For Tricks]", 10044538000, function(arg)
settings():GetService("NetworkSettings").IncomingReplicationLag = tonumber(arg)
end)

LPPage:CreateToggle("Vibration", "Turning Off/On Vibration", function(arg)
if arg then
require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).Vibration(2)
    else
    require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).Vibration(1)
end
end)

LPPage:CreateToggle("ViewLock", "Turning Off/On ViewLock", function(arg)
if arg then
require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).ViewLock(2)
    else
    require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).ViewLock(1)
end
end)

LPPage:CreateToggle("Tool Tips", "Turning On/Off Tool Tips", function(arg)
if arg then
require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).ToolTips(1)
    else
    require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).ToolTips(2)
end
end)

LPPage:CreateSlider("Brightness", 0, 7,function(arg)
   require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).Brightness(arg)
end)

LPPage:CreateSlider("Graphics Quality", 0, 4,function(arg)
   require(game:GetService("Players").LocalPlayer.PlayerGui.Start.Settings.Options.Module).Quality(arg)
end)

LPPage:CreateSlider("FOV", 70, 120,function(arg)
   game.Workspace.CurrentCamera.FieldOfView = arg
end)

LPPage:CreateLabel("Level Spoofer")

LPPage:CreateBox("Level", 10044538000, function(arg)
local Targets
	Targets = tonumber(arg)
	wait(0.1)
	local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
mt.__index = function(a, b)
    if tostring(a) == "PPLevel" or tostring(a) == "Level" then
        if tostring(b) == "Value" then
            return Targets;
        end
    end
    return old_index(a, b);
end
end)

LPPage:CreateBox("XP", 10044538000, function(arg)
local Targetz
	Targetz = tonumber(arg)
	wait(0.1)
	local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
mt.__index = function(a, b)
    if tostring(a) == "XP" then
        if tostring(b) == "Value" then
            return Targetz;
        end
    end
    return old_index(a, b);
end
end)

LPPage:CreateLabel("Power Shot")

LPPage:CreateToggle("Always Power Ready", "Each Time You Press 'Z', Power Will Be Ready/Activated", function(arg)
if arg then
_G.READY = true
    while _G.READY do
    wait()
    for i,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
        if v.Name == "PowerReady" and v:IsA("BoolValue") then
        v.Value = true
end
end
end
    else
    _G.READY = false
end
end)

LPPage:CreateButton("Activate Power", "Power Will Be Activated", function()
    game.Players.LocalPlayer.Backpack.PowerActive.Value = true
end)

LPPage:CreateSlider("Power Cooldown", 0, 60,function(arg)
   for i,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
    if v.Name == "PowerValue" and v:IsA("NumberValue") then
    v.Value = arg
end
end
end)


LPPage:CreateLabel("Gamepasses")

LPPage:CreateButton("Enable GamepassController", "Probably Allows You To Use Gamepasses From Players", function()
    local mt = getrawmetatable(game);
setreadonly(mt, false);
local old_index = mt.__index;
mt.__index = function(a, b)
    if tostring(a) == "GamePassController" or tostring(a) == "GamePassControllerFix" or tostring(a) == "GamePassC" then
        if tostring(b) == "Enabled" then
            return true;
            elseif tostring(b) == "Disabled" then
            return false;
        end
    end
    return old_index(a, b);
end

wait(.5)
game:GetService("Workspace").FE.Store.Check:FireServer()
end)

LPPage:CreateButton("Unlock Celebration Packs", "Unlocking Every Celebration Pack", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack1.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack1.CelebrationPack1.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack2.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack2.CelebrationPack2.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack3.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack3.CelebrationPack3.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack4.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack4.CelebrationPack4.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack5.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack5.CelebrationPack5.Style = "RobloxRoundButton"
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack6.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack6.CelebrationPack6.Style = "RobloxRoundButton"
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack7.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.CelebrationPack7.CelebrationPack7.Style = "RobloxRoundButton"
    
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package1.Button.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package2.Button.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package3.Button.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package4.Button.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package5.Button.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package6.Button.Visible = false
game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.Package7.Button.Visible = false

    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF04.Active = true
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF04.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF04.Script.Disabled = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF05.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF05.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF05.Script.Disabled = false
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF06.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF06.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF06.Script.Disabled = false

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF07.Active = true
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF07.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF07.Script.Disabled = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF08.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF08.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF08.Script.Disabled = false
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF09.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF09.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF09.Script.Disabled = false

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF10.Active = true
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF10.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF10.Script.Disabled = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF11.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF11.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF11.Script.Disabled = false
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF12.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF12.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF12.Script.Disabled = false

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF13.Active = true
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF13.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF13.Script.Disabled = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF14.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF14.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF14.Script.Disabled = false
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF15.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF15.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF15.Script.Disabled = false

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF16.Active = true
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF16.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF16.Script.Disabled = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF17.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF17.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF17.Script.Disabled = false
   game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF18.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF18.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF18.Script.Disabled = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF19.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF19.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF19.Script.Disabled = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF20.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF20.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF20.Script.Disabled = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF21.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF21.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF21.Script.Disabled = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF22.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF22.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF22.Script.Disabled = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF23.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF23.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF23.Script.Disabled = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF24.Active = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF24.Selectable = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF24.Script.Disabled = false
    
    
    game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF04.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration4()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF05.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration5()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF06.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration6()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF07.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration7()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF08.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration8()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF09.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration9()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF10.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration10()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF11.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration11()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF12.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration12()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF13.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration13()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF14.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration14()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF15.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration15()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF16.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration16()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF17.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration17()
end)


game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF18.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration18()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF19.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration19()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF20.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration20()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF21.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration21()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF22.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration22()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF23.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration23()
end)

game:GetService("Players").LocalPlayer.PlayerGui.Start.Celebrations.CelebrationsSelect.SF24.MouseButton1Click:Connect(function()
    require(game.Players.LocalPlayer.Backpack.CelebrationsModule).Celebration24()
end)
end)

LPPage:CreateToggle("Blue Flame", "Flame Color Effect Will Be Blue Now.", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.BlueFlame.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.Image = "rbxassetid://5366457711"
        game:GetService("Players").LocalPlayer.Backpack.FValue.Value = 2
    else
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.BlueFlame.BlueFlame.Style = "RobloxRoundDefaultButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.Image = "rbxassetid://1595877615"
       game:GetService("Players").LocalPlayer.Backpack.FValue.Value = 1
    end
end)

local AnimationCurveLoop

LPPage:CreateToggle("More Curve", "The Ball Curves More", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.WoodenFloor.Style = "RobloxRoundButton"

local Humanoid = game.Players.LocalPlayer.Character.Humanoid

AnimationCurveLoop = Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
    if AnimationTrack.Name == "OldMKickL" or AnimationTrack.Name == "OldMKick" or AnimationTrack.Name == "OldLKickL" or AnimationTrack.Name == "OldLKick" or AnimationTrack.Name == "MKickL" or AnimationTrack.Name == "MKick" or AnimationTrack.Name == "LKickL" or AnimationTrack.Name == "LKick" or AnimationTrack.Name == "OldDribbleL" or AnimationTrack.Name == "OldDribble" or AnimationTrack.Name == "DribbleL" or AnimationTrack.Name == "Dribble" then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude < 3.45 then
        if game.Players.LocalPlayer.Backpack.Curving.Value == 2 then
        wait(0.1)
                local A_1T = game:GetService("Workspace").TPSSystem.TPS
local A_2T = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local EventT = game:GetService("Workspace").FE.Actions.KickC1
EventT:FireServer(A_1T, A_2T)
wait(0.2)
EventT:FireServer(A_1T, A_2T)

elseif game.Players.LocalPlayer.Backpack.Curving.Value == 1 then
wait(0.1)
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC2
Event:FireServer(A_1, A_2)
wait(0.2)
Event:FireServer(A_1, A_2)

            end
        end
    end
end)
    else
        AnimationCurveLoop:Disconnect()
        game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.WoodenFloor.WoodenFloor.Style = "RobloxRoundDefaultButton"
    end
end)

LPPage:CreateToggle("Frozen Ball", "Freezes The Flame Ball When It Touched You. Ice Is NON-FE", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Frozen.Style = "RobloxRoundButton"
    
_G.FROZEN = true
    while _G.FROZEN do
    wait()
        game:GetService("Players").LocalPlayer.Backpack.Frozen.Value = true
        for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "TPS" and v:IsA("Part") then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 5 then
    if v.Fire.Enabled == true or v.FireB.Enabled == true then
       v.BrickColor = BrickColor.new("Cyan")
       local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
wait(.1)
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
wait(2.4)
v.BrickColor = BrickColor.new("Institutional white")
    end
    end
    end
    end
    end
    else
     game:GetService("Players").LocalPlayer.Backpack.Frozen.Value = false
     _G.FROZEN = false
     game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Frozen.Frozen.Style = "RobloxRoundDefaultButton"
    end
end)

LPPage:CreateToggle("Faster Cooldown", "Reduces The Power Show Cooldown By 50% (30)", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Cooldown.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.PowerValue.Value = 30
    else
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Cooldown.Style = "RobloxRoundDefaultButton"
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.Cooldown.Tick.Visible = false
       game:GetService("Players").LocalPlayer.PlayerGui.Start.PowerShot.PowerValue.Value = 60
    end
end)

local AnimationTackleLoop

LPPage:CreateToggle("Powerful Tackle [BUGGY]", "Your Tackle Will Be Powerful. Very Buggy - Don't Recommend To Use", function(arg)
if arg then
game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.Tick.Visible = true
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.RandomWeather.Style = "RobloxRoundButton"
        game:GetService("Players").LocalPlayer.PlayerGui.Start.TackleGamePass.Value = true
        
        local Humanoid = game.Players.LocalPlayer.Character.Humanoid

AnimationTackleLoop = Humanoid.AnimationPlayed:Connect(function(AnimationTrack)
    if AnimationTrack.Name == "TackleL" or AnimationTrack.Name == "Tackle" or AnimationTrack.Name == "OldTackleL" or AnimationTrack.Name == "OldTackle" then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude < 4.87 then
        wait(0.8)
                local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 30
local A_4 = Vector3.new(4000000, 700, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)

        end
    end
end)
    else
      game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.Tick.Visible = false
    game:GetService("Players").LocalPlayer.PlayerGui.Start.GamePassMenu.Items.RandomWeather.RandomWeather.Style = "RobloxRoundDefaultButton"
      game:GetService("Players").LocalPlayer.PlayerGui.Start.TackleGamePass.Value = false
      AnimationTackleLoop:Disconnect()
    end
end)

PPage:CreateLabel("Users")
local Target

PPage:CreateBox("Player's Name", 10044538000, function(arg)
Target = unpack(GetPlayer(arg))
end)

PPage:CreateButton("Kill Player", "Kill Player In The Server. Burn Needed", function()
    local Event = game:GetService("Workspace").FE.Powers.Burn
Event:FireServer()

wait(0.25)
      game.Players.LocalPlayer.Character.HumanoidRootPart.Fire:Destroy()
      game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight:Destroy()
       for i,v in pairs(Target.Character:GetChildren()) do
       if v:IsA("BasePart") then
       v.Anchored = true
       v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
end)

PPage:CreateButton("Kill All", "Kill All In The Server. Burn Needed", function()
    local Event = game:GetService("Workspace").FE.Powers.Burn
Event:FireServer()

wait(0.25)
      game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight:Destroy()
      game.Players.LocalPlayer.Character.HumanoidRootPart.Fire:Destroy()
      for i, v1 in pairs(game.Players:GetPlayers()) do
   if v1.Name ~= game.Players.LocalPlayer.Name then
       local Character = v1.Character
       for i,v in pairs(Character:GetChildren()) do
       if v:IsA("BasePart") then
       v.Anchored = true
       v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
end
end
end)

PPage:CreateButton("Kill The Blue Team", "Kill Only The Blue Team. Burn Needed", function()
    local Event = game:GetService("Workspace").FE.Powers.Burn
Event:FireServer()

wait(0.25)
game.Players.LocalPlayer.Character.HumanoidRootPart.Fire:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight:Destroy()
      for i, v1 in pairs(game.Players:GetPlayers()) do
   if v1.Name ~= game.Players.LocalPlayer.Name and v1.TeamColor == BrickColor.new("Bright blue") then
       local Character = v1.Character
       for i,v in pairs(Character:GetChildren()) do
       if v:IsA("BasePart") then
       v.Anchored = true
       v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
end
end
end)

PPage:CreateButton("Kill The Red Team", "Kill Only The Red Team. Burn Needed", function()
    local Event = game:GetService("Workspace").FE.Powers.Burn
Event:FireServer()

wait(0.25)
game.Players.LocalPlayer.Character.HumanoidRootPart.Fire:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart.PointLight:Destroy()
      for i, v1 in pairs(game.Players:GetPlayers()) do
   if v1.Name ~= game.Players.LocalPlayer.Name and v1.TeamColor == BrickColor.new("Bright red") then
       local Character = v1.Character
       for i,v in pairs(Character:GetChildren()) do
       if v:IsA("BasePart") then
       v.Anchored = true
       v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
end
end
end)

PPage:CreateButton("Fix Players", "Fixing Player's Parts", function()
     for i, v1 in pairs(game.Players:GetPlayers()) do
   if v1.Name ~= game.Players.LocalPlayer.Name then
       local Character = v1.Character
       for i,v in pairs(Character:GetChildren()) do
       if v:IsA("BasePart") then
       v.Anchored = false
    end
end
end
end
end)

PPage:CreateButton("Teleport To Player", "Teleporting To Player", function()
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
end)

local LoopTPPlay
local LoopClosePlayer

PPage:CreateToggle("Loop Teleport Under Player", "Used For Trolling: Crash The Ball Or Kicks", function(arg)
if arg then
LoopTPPlay = game:GetService("RunService").Heartbeat:Connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame + Vector3.new(0, -17, 0)
end)

for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "Dirt" or v.Name == "SoccerField" and v:IsA("Part") then
        v.LocalTransparencyModifier = 0.50
    end
end

for i,b in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
       if b:IsA("BillboardGui") then
           b:Destroy()
       end
   end
    else
      LoopTPPlay:Disconnect()
      wait(1.5)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lines.Line12.CFrame
      for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "Dirt" or v.Name == "SoccerField" and v:IsA("Part") then
        v.LocalTransparencyModifier = 0
    end
end
    end
end)

PPage:CreateToggle("Loop Teleport Under Closest Player", "Loop Teleporting Under Player Who Is Near Ball", function(arg)
if arg then
local Distance = 500

LoopClosePlayer = game:GetService("RunService").Heartbeat:Connect(function()
    local NearestPlayer, NearestDistance
	for _, player in pairs(game.Players:GetPlayers()) do
	    if player.Name ~= game.Players.LocalPlayer.Name then
		local Character = player.Character
		local DistanceCharacter = player:DistanceFromCharacter(game.Workspace.TPSSystem.TPS.Position)
		if not Character or 
			DistanceCharacter > Distance or
			(NearestDistance and DistanceCharacter >= NearestDistance)
		then
			continue
		end
		NearestDistance = DistanceCharacter
		NearestPlayer = player
	end
	end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = NearestPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -17, 0)
end)

for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "Dirt" or v.Name == "SoccerField" and v:IsA("Part") then
        v.LocalTransparencyModifier = 0.50
    end
end

for i,b in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
       if b:IsA("BillboardGui") then
           b:Destroy()
       end
   end
    else
      LoopClosePlayer:Disconnect()
      wait(1.5)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lines.Line12.CFrame
      for i,v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == "Dirt" or v.Name == "SoccerField" and v:IsA("Part") then
        v.LocalTransparencyModifier = 0
    end
end
    end
end)

local ViewHumDiew
local ViewCamChanged

PPage:CreateToggle("View Player", "Spectate The Player", function(arg)
if arg then
if ViewHumDiew then
			ViewHumDiew:Disconnect()
			ViewCamChanged:Disconnect()
		end
		Viewing = Target
		game.Workspace.CurrentCamera.CameraSubject = Viewing.Character
		local function ViewDied()
			repeat wait() until Target.Character ~= nil
			game.Workspace.CurrentCamera.CameraSubject = Viewing.Character
		end
		ViewHumDied = Target.CharacterAdded:Connect(ViewDied)
		local function ViewChangedF()
			game.Workspace.CurrentCamera.CameraSubject = Viewing.Character
		end
		ViewCamChanged = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(ViewChangedF)
    else
      if Viewing ~= nil then
		Viewing = nil
	end
	if ViewHumDied then
		ViewHumDied:Disconnect()
		ViewCamChanged:Disconnect()
	end
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end)

PPage:CreateLabel("Stats")

local Targeted
local LabelClaimedRewards
local LabelGoals
local LabelSaves
local LabelGames
local LabelAssist
local LabelKOs
local LabelMOTM
local LabelLevel
local LabelXP
local LabelBombs
local LabelSpikes
local LabelBurns
local LabelWalls
local LabelQuality
local LabelBrightness
local LabelFOV
local LabelFoot
local LabelToolT
local LabelVib
local LabelViewL

PPage:CreateBox("Player Name", 10044538000, function(arg)
    Targeted = unpack(GetPlayer(arg))
	wait(0.1)
	LabelClaimedRewards:UpdateLabel("Claim Rewards: ".. game.Lighting[Targeted.Name].ClaimReward.Value)
      LabelGoals:UpdateLabel("Goals: ".. game.Lighting[Targeted.Name].Goals.Value)
      LabelSaves:UpdateLabel("Saves: ".. game.Lighting[Targeted.Name].Saves.Value)
      LabelGames:UpdateLabel("Games: ".. game.Lighting[Targeted.Name].Games.Value)
      LabelAssist:UpdateLabel("Assists: ".. game.Lighting[Targeted.Name].Assist.Value)
      LabelKOs:UpdateLabel("Knockouts [KO]: ".. game.Lighting[Targeted.Name].KOs.Value)
      LabelMOTM:UpdateLabel("Player Of The Match: ".. game.Lighting[Targeted.Name].MOTM.Value)
      LabelLevel:UpdateLabel("Level: ".. game.Lighting[Targeted.Name].Level.Value)
      LabelXP:UpdateLabel("Experience Point [XP]: ".. game.Lighting[Targeted.Name].XP.Value)
      LabelBombs:UpdateLabel("Bombs: ".. game.Lighting[Targeted.Name].Bomb.Value)
      LabelSpikes:UpdateLabel("Spikes: ".. game.Lighting[Targeted.Name].Spike.Value)
      LabelBurns:UpdateLabel("Burns: ".. game.Lighting[Targeted.Name].Burn.Value)
      LabelWalls:UpdateLabel("Walls: ".. game.Lighting[Targeted.Name].Wall.Value)
      LabelQuality:UpdateLabel("Graphics Quality: ".. game.Lighting[Targeted.Name].Quality.Value)
      LabelBrightness:UpdateLabel("Brightness: ".. game.Lighting[Targeted.Name].Brightness.Value)
      LabelFOV:UpdateLabel("Field Of View [FOV]: ".. game.Lighting[Targeted.Name].FOVS.Value)
      LabelFoot:UpdateLabel("Preferred Foot: ".. game.Lighting[Targeted.Name].PreferredFoot.Value)
      LabelToolT:UpdateLabel("Tool Tips: ".. game.Lighting[Targeted.Name].ToolTips.Value)
      LabelVib:UpdateLabel("Vibration: ".. game.Lighting[Targeted.Name].Vibration.Value)
      LabelViewL:UpdateLabel("ViewLock: ".. game.Lighting[Targeted.Name].ViewLock.Value)
end)

PPage:CreateToggle("Auto Update Stats", "Every Two Seconds Information Updates", function(arg)
if arg then
_G.INF = true
    while _G.INF do
    wait(2)
    LabelClaimedRewards:UpdateLabel("Claim Rewards: ".. game.Lighting[Targeted.Name].ClaimReward.Value)
      LabelGoals:UpdateLabel("Goals: ".. game.Lighting[Targeted.Name].Goals.Value)
      LabelSaves:UpdateLabel("Saves: ".. game.Lighting[Targeted.Name].Saves.Value)
      LabelGames:UpdateLabel("Games: ".. game.Lighting[Targeted.Name].Games.Value)
      LabelAssist:UpdateLabel("Assists: ".. game.Lighting[Targeted.Name].Assist.Value)
      LabelKOs:UpdateLabel("Knockouts [KO]: ".. game.Lighting[Targeted.Name].KOs.Value)
      LabelMOTM:UpdateLabel("Player Of The Match: ".. game.Lighting[Targeted.Name].MOTM.Value)
      LabelLevel:UpdateLabel("Level: ".. game.Lighting[Targeted.Name].Level.Value)
      LabelXP:UpdateLabel("Experience Point [XP]: ".. game.Lighting[Targeted.Name].XP.Value)
      LabelBombs:UpdateLabel("Bombs: ".. game.Lighting[Targeted.Name].Bomb.Value)
      LabelSpikes:UpdateLabel("Spikes: ".. game.Lighting[Targeted.Name].Spike.Value)
      LabelBurns:UpdateLabel("Burns: ".. game.Lighting[Targeted.Name].Burn.Value)
      LabelWalls:UpdateLabel("Walls: ".. game.Lighting[Targeted.Name].Wall.Value)
      LabelQuality:UpdateLabel("Graphics Quality: ".. game.Lighting[Targeted.Name].Quality.Value)
      LabelBrightness:UpdateLabel("Brightness: ".. game.Lighting[Targeted.Name].Brightness.Value)
      LabelFOV:UpdateLabel("Field Of View [FOV]: ".. game.Lighting[Targeted.Name].FOVS.Value)
      LabelFoot:UpdateLabel("Preferred Foot: ".. game.Lighting[Targeted.Name].PreferredFoot.Value)
      LabelToolT:UpdateLabel("Tool Tips: ".. game.Lighting[Targeted.Name].ToolTips.Value)
      LabelVib:UpdateLabel("Vibration: ".. game.Lighting[Targeted.Name].Vibration.Value)
      LabelViewL:UpdateLabel("ViewLock: ".. game.Lighting[Targeted.Name].ViewLock.Value)
    end
    else
    _G.INF = false
    end
end)

PPage:CreateButton("Update Stats", "Update Player's Stats", function()
     LabelClaimedRewards:UpdateLabel("Claim Rewards: ".. game.Lighting[Targeted.Name].ClaimReward.Value)
      LabelGoals:UpdateLabel("Goals: ".. game.Lighting[Targeted.Name].Goals.Value)
      LabelSaves:UpdateLabel("Saves: ".. game.Lighting[Targeted.Name].Saves.Value)
      LabelGames:UpdateLabel("Games: ".. game.Lighting[Targeted.Name].Games.Value)
      LabelAssist:UpdateLabel("Assists: ".. game.Lighting[Targeted.Name].Assist.Value)
      LabelKOs:UpdateLabel("Knockouts [KO]: ".. game.Lighting[Targeted.Name].KOs.Value)
      LabelMOTM:UpdateLabel("Player Of The Match: ".. game.Lighting[Targeted.Name].MOTM.Value)
      LabelLevel:UpdateLabel("Level: ".. game.Lighting[Targeted.Name].Level.Value)
      LabelXP:UpdateLabel("Experience Point [XP]: ".. game.Lighting[Targeted.Name].XP.Value)
      LabelBombs:UpdateLabel("Bombs: ".. game.Lighting[Targeted.Name].Bomb.Value)
      LabelSpikes:UpdateLabel("Spikes: ".. game.Lighting[Targeted.Name].Spike.Value)
      LabelBurns:UpdateLabel("Burns: ".. game.Lighting[Targeted.Name].Burn.Value)
      LabelWalls:UpdateLabel("Walls: ".. game.Lighting[Targeted.Name].Wall.Value)
      LabelQuality:UpdateLabel("Graphics Quality: ".. game.Lighting[Targeted.Name].Quality.Value)
      LabelBrightness:UpdateLabel("Brightness: ".. game.Lighting[Targeted.Name].Brightness.Value)
      LabelFOV:UpdateLabel("Field Of View [FOV]: ".. game.Lighting[Targeted.Name].FOVS.Value)
      LabelFoot:UpdateLabel("Preferred Foot: ".. game.Lighting[Targeted.Name].PreferredFoot.Value)
      LabelToolT:UpdateLabel("Tool Tips: ".. game.Lighting[Targeted.Name].ToolTips.Value)
      LabelVib:UpdateLabel("Vibration: ".. game.Lighting[Targeted.Name].Vibration.Value)
      LabelViewL:UpdateLabel("ViewLock: ".. game.Lighting[Targeted.Name].ViewLock.Value)
end)

LabelClaimedRewards = PPage:CreateLabel("Claim Rewards: 33")
LabelGoals = PPage:CreateLabel("Goals: 0")
LabelSaves = PPage:CreateLabel("Saves: 0")
LabelGames = PPage:CreateLabel("Games: 0")
LabelAssist = PPage:CreateLabel("Assists: 0")
LabelKOs = PPage:CreateLabel("Knockouts [KO]: 0")
LabelMOTM = PPage:CreateLabel("Player Of The Match: 0")
LabelLevel = PPage:CreateLabel("Level: 1")
LabelXP = PPage:CreateLabel("Experience Point [XP]: 0")
LabelBombs = PPage:CreateLabel("Bombs: 0")
LabelSpikes = PPage:CreateLabel("Spikes: 0")
LabelBurns = PPage:CreateLabel("Burns: 0")
LabelWalls = PPage:CreateLabel("Walls: 0")
LabelQuality = PPage:CreateLabel("Graphics Quality: 2")
LabelBrightness = PPage:CreateLabel("Brightness: 4")
LabelFOV = PPage:CreateLabel("Field Of View [FOV]: 80")
LabelFoot = PPage:CreateLabel("Preferred Foot: 1")
      LabelToolT = PPage:CreateLabel("Tool Tips: 1")
      LabelVib = PPage:CreateLabel("Vibration: 2")
      LabelViewL = PPage:CreateLabel("ViewLock: 1")

KPage:CreateLabel("Striker")

KPage:CreateToggle("Very Super KickG1", "Regular Kick, But Very Super", function(arg)
if arg then
_G.SKickG1 = true
while _G.SKickG1 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 70
local A_4 = Vector3.new(math.huge, math.huge, math.huge)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
    
    else
        _G.SKickG1 = false
end
end)

KPage:CreateToggle("Very Super KickC1", "Right Curve, But Very Super", function(arg)
if arg then
_G.SKickC1 = true
while _G.SKickC1 do
wait()
for i = 1, 10 do
    local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC1
Event:FireServer(A_1, A_2)
end
end
    
    else
        _G.SKickC1 = false
end
end)

KPage:CreateToggle("Very Super KickC2", "Left Curve, But Very Super", function(arg)
if arg then
_G.SKickC2 = true
while _G.SKickC2 do
wait()
for i = 1, 10 do
    local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC2
Event:FireServer(A_1, A_2)
end
end
    
    else
        _G.SKickC2 = false
end
end)

KPage:CreateToggle("KickG1", "Regular Kick", function(arg)
if arg then
_G.KickG1 = true
while _G.KickG1 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
    
    else
        _G.KickG1 = false
end
end)

KPage:CreateToggle("KickG2", "Ground Shot", function(arg)
if arg then
_G.KickG2 = true
while _G.KickG2 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG2
Event:FireServer(A_1, A_2, A_3, A_4)
end
    
    else
        _G.KickG2 = false
end
end)

KPage:CreateToggle("KickP1", "Power Shot", function(arg)
if arg then
_G.KickP1 = true
while _G.KickP1 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1100, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickP1
Event:FireServer(A_1, A_2, A_3, A_4)
end
    
    else
        _G.KickP1 = false
end
end)

KPage:CreateToggle("KickP1", "Ground Power Shot", function(arg)
if arg then
_G.KickP2 = true
while _G.KickP2 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1100, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickP2
Event:FireServer(A_1, A_2, A_3, A_4)
end
    
    else
        _G.KickP2 = false
end
end)

KPage:CreateToggle("KickC1", "Adds Right Curve", function(arg)
if arg then
_G.KickC1 = true
while _G.KickC1 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC1
Event:FireServer(A_1, A_2)
end
    
    else
        _G.KickC1 = false
end
end)

KPage:CreateToggle("KickC2", "Adds Left Curve", function(arg)
if arg then
_G.KickC2 = true
while _G.KickC2 do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC2
Event:FireServer(A_1, A_2)
end
    
    else
        _G.KickC2 = false
end
end)

KPage:CreateToggle("Tackle", "Tackle Slide", function(arg)
if arg then
_G.Tackle = true
while _G.Tackle do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.Head
local Event = game:GetService("Workspace").FE.Actions.Tackle
Event:FireServer(A_1, A_2)
end
    
    else
        _G.Tackle = false
end
end)

KPage:CreateToggle("Header", "Head Control", function(arg)
if arg then
_G.Header = true
while _G.Header do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.Head
local Event = game:GetService("Workspace").FE.Actions.Header
Event:FireServer(A_1, A_2)
end
    
    else
        _G.Header = false
end
end)

KPage:CreateLabel("Goalkeeper")

KPage:CreateToggle("SaveT", "Save [Torso]", function(arg)
if arg then
_G.SaveT = true
while _G.SaveT do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.SaveT
Event:FireServer(A_1, A_2)
end
    
    else
        _G.SaveT = false
end
end)

KPage:CreateToggle("SaveLA", "Save [Left Arm]", function(arg)
if arg then
_G.SaveLA = true
while _G.SaveLA do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.SaveLA
Event:FireServer(A_1, A_2)
end
    
    else
        _G.SaveLA = false
end
end)

KPage:CreateToggle("SaveRA", "Save [Right Arm]", function(arg)
if arg then
_G.SaveRA = true
while _G.SaveRA do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.SaveRA
Event:FireServer(A_1, A_2)
end
    
    else
        _G.SaveRA = false
end
end)

KPage:CreateToggle("SaveLL", "Save [Left Leg]", function(arg)
if arg then
_G.SaveLL = true
while _G.SaveLL do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.SaveLL
Event:FireServer(A_1, A_2)
end
    
    else
        _G.SaveLL = false
end
end)

KPage:CreateToggle("SaveRL", "Save [Right Leg]", function(arg)
if arg then
_G.SaveRL = true
while _G.SaveRL do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.SaveRL
Event:FireServer(A_1, A_2)
end
    
    else
        _G.SaveRL = false
end
end)

KPage:CreateLabel("Functions")

KPage:CreateToggle("Auto Hold Ground Shot", "Auto Holding Ground Shot", function(arg)
if arg then
_G.HoldGround = true
while _G.HoldGround do
wait()
game:GetService("Players").LocalPlayer.Backpack.Ground.Value = true
end
    
    else
        _G.HoldGround = false
        wait(1)
        game:GetService("Players").LocalPlayer.Backpack.Ground.Value = false
end
end)

KPage:CreateToggle("Auto Hold Right Curve", "Auto Holding Right Curve", function(arg)
if arg then
_G.HoldRight = true
while _G.HoldRight do
wait()
game:GetService("Players").LocalPlayer.Backpack.Curving.Value = 2
end
    
    else
        _G.HoldRight = false
        wait(1)
        game:GetService("Players").LocalPlayer.Backpack.Curving.Value = 0
end
end)

KPage:CreateToggle("Auto Hold Left Curve", "Auto Holding Left Curve", function(arg)
if arg then
_G.HoldLeft = true
while _G.HoldLeft do
wait()
game:GetService("Players").LocalPlayer.Backpack.Curving.Value = 1
end
    
    else
        _G.HoldLeft = false
        wait(1)
        game:GetService("Players").LocalPlayer.Backpack.Curving.Value = 0
end
end)

KPage:CreateToggle("Stop The Ball", "Loop Stop The Ball", function(arg)
if arg then
_G.StopBall = true
while _G.StopBall do
wait()
for i = 1, 10 do
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 0, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end
    
    else
        _G.StopBall = false
end
end)

KPage:CreateToggle("Launch The Ball", "Loop Launch The Ball", function(arg)
if arg then
_G.LaunchBall = true
while _G.LaunchBall do
wait()
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, math.huge, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
    
    else
        _G.LaunchBall = false
end
end)

KPage:CreateLabel("Trolling")

KPage:CreateButton("Stop The Ball [Once]", "Stop The Ball Once", function()
    for i = 1, 10 do
local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 0, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end)

KPage:CreateButton("Launch The Ball [Once]", "Launch The Ball Once", function()
    local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, math.huge, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end)

KPage:CreateLabel("Goal")

KPage:CreateButton("Loop Score To The Red Team", "Scoring The Goal To The Red Team. Sometimes Work - Unfixable", function()
    local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 70
local A_4 = Vector3.new(4000000, 1, -4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end)

KPage:CreateButton("Score To The Red Team", "Scoring The Goal To The Red Team. Sometimes Work", function()
    local A_1 = game:GetService("Workspace").TPSSystem.TPS
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 70
local A_4 = Vector3.new(0, 1, -100000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end)

PWRPage:CreateLabel("Miscellaneous")

PWRPage:CreateToggle("Auto Kick Powers", "Kicks Away Bombs And Spikes If They Are Near", function(arg)
if arg then
_G.BOMBS = true
    while _G.BOMBS do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
            local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end
    end
    else
    _G.BOMBS = false
end
end)

PWRPage:CreateToggle("Auto Crash Powers", "Crashing Bombs And Spikes If They Are Near", function(arg)
if arg then
_G.CRASHB = true
    while _G.CRASHB do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
            local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 70
local A_4 = Vector3.new(4000000, -math.huge, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end
    end
    else
    _G.CRASHB = false
end
end)

PWRPage:CreateToggle("Auto Pass Through The Wall", "Allows You To Pass Through The Power Wall", function(arg)
if arg then
_G.THROUWAL = true
    while _G.THROUWAL do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Wall" then
           v.CanCollide = false
        end
    end
    end
    else
    _G.THROUWAL = false
end
end)

PWRPage:CreateToggle("Auto Dodge Powers [BUGGY]", "Auto Dodging Bombs And Spikes When They Are Near", function(arg)
if arg then
_G.DODGE = true
while _G.DODGE do
wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 40 then
           game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 30), 0, math.random(-10, 20)))
        end
        end
        end
        end
    else
    _G.DODGE = false
end
end)

PWRPage:CreateLabel("Activation")

local POWERSTIME
PWRPage:CreateBox("Use Time", 10044538000, function(arg)
    POWERSTIME = tonumber(arg)
end)

PWRPage:CreateButton("All Powers", "Using All Powers. Set Use Time For Work", function()
for i = 1, POWERSTIME do
local Wall = game:GetService("Workspace").FE.Powers.Wall
Wall:FireServer()

local Burn = game:GetService("Workspace").FE.Powers.Burn
Burn:FireServer()

local Bomb = game:GetService("Workspace").FE.Powers.Bomb
Bomb:FireServer()

local Spike = game:GetService("Workspace").FE.Powers.Spike
Spike:FireServer()
end
end)

PWRPage:CreateButton("Wall", "Using Wall. Set Use Time For Work", function()
for i = 1, POWERSTIME do
local Event = game:GetService("Workspace").FE.Powers.Wall
Event:FireServer()
end
end)

PWRPage:CreateButton("Burn", "Using Burn. Set Use Time For Work", function()
for i = 1, POWERSTIME do
local Event = game:GetService("Workspace").FE.Powers.Burn
Event:FireServer()
end
end)

PWRPage:CreateButton("Bomb", "Using Bomb. Set Use Time For Work", function()
for i = 1, POWERSTIME do
local Event = game:GetService("Workspace").FE.Powers.Bomb
Event:FireServer()
end
end)

PWRPage:CreateButton("Spike", "Using Spike. Set Use Time For Work", function()
for i = 1, POWERSTIME do
local Event = game:GetService("Workspace").FE.Powers.Spike
Event:FireServer()
end
end)

PWRPage:CreateLabel("Kicks")

PWRPage:CreateToggle("Very Super KickG1", "Regular Kicking Bombs & Spikes, But Very Super", function(arg)
if arg then
_G.PSKickG1 = true
while _G.PSKickG1 do
wait()
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 70
local A_4 = Vector3.new(math.huge, math.huge, math.huge)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end
end
    
    else
        _G.PSKickG1 = false
end
end)

PWRPage:CreateToggle("Very Super KickC1", "Right Curving Bombs & Spikes, But Very Super", function(arg)
if arg then
_G.PSKickC1 = true
while _G.PSKickC1 do
wait()
for i = 1, 10 do
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
    local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC1
Event:FireServer(A_1, A_2)
end
end
end
end
    
    else
        _G.PSKickC1 = false
end
end)

PWRPage:CreateToggle("Very Super KickC2", "Left Curving Bombs & Spikes, But Very Super", function(arg)
if arg then
_G.PSKickC2 = true
while _G.PSKickC2 do
wait()
for i = 1, 10 do
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
    local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC2
Event:FireServer(A_1, A_2)
end
end
end
end
    
    else
        _G.PSKickC2 = false
end
end)

PWRPage:CreateToggle("KickG1", "Regular Kicking Bombs & Spikes", function(arg)
if arg then
_G.BOMBSG1 = true
    while _G.BOMBSG1 do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
            local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end
    end
    else
    _G.BOMBSG1 = false
end
end)

PWRPage:CreateToggle("KickG2", "Ground Shot Kicking Bombs & Spikes", function(arg)
if arg then
_G.BOMBSG2 = true
    while _G.BOMBSG2 do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
            local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1300, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG2
Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end
    end
    else
    _G.BOMBSG2 = false
end
end)

PWRPage:CreateToggle("KickP1", "Power Shot Kicking Bombs & Spikes", function(arg)
if arg then
_G.BOMBSP1 = true
    while _G.BOMBSP1 do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
            local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1100, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickP1
Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end
    end
    else
    _G.BOMBSP1 = false
end
end)

PWRPage:CreateToggle("KickP2", "Ground Power Shot Kicking Bombs & Spikes", function(arg)
if arg then
_G.BOMBSP2 = true
    while _G.BOMBSP2 do
    wait()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
            local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 65
local A_4 = Vector3.new(4000000, 1100, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickP2
Event:FireServer(A_1, A_2, A_3, A_4)
        end
    end
    end
    else
    _G.BOMBSP2 = false
end
end)

PWRPage:CreateToggle("KickC1", "Adds Right Curve To Bombs & Spikes", function(arg)
if arg then
_G.PKickC1 = true
while _G.PKickC1 do
wait()
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC1
Event:FireServer(A_1, A_2)
end
end
end
    
    else
        _G.PKickC1 = false
end
end)

PWRPage:CreateToggle("KickC2", "Adds Left Curve To Bombs & Spikes", function(arg)
if arg then
_G.PKickC2 = true
while _G.PKickC2 do
wait()
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local Event = game:GetService("Workspace").FE.Actions.KickC2
Event:FireServer(A_1, A_2)
end
end
end
    
    else
        _G.PKickC2 = false
end
end)

PWRPage:CreateToggle("Stop The Powers", "Loop Stopping The Bombs & Spikes", function(arg)
if arg then
_G.PStopBall = true
while _G.PStopBall do
wait()
for i = 1, 10 do
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 0, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end
end
end
    
    else
        _G.PStopBall = false
end
end)

PWRPage:CreateToggle("Launch The Powers", "Loop Launching The Bombs & Spikes", function(arg)
if arg then
_G.PLaunchBall = true
while _G.PLaunchBall do
wait()
for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, math.huge, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end
end
    
    else
        _G.PLaunchBall = false
end
end)

PWRPage:CreateButton("Stop The Powers [Once]", "Stopping The Bombs & Spikes Once", function()
    for i = 1, 10 do
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, 0, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end
end
end)

PWRPage:CreateButton("Launch The Powers [Once]", "Launching The Bombs & Spikes Once", function()
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Bomb" or v.Name == "Spike" then
    local A_1 = v
local A_2 = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
local A_3 = 0
local A_4 = Vector3.new(4000000, math.huge, 4000000)
local Event = game:GetService("Workspace").FE.Actions.KickG1
Event:FireServer(A_1, A_2, A_3, A_4)
end
end
end)

BPage:CreateLabel("Miscellaneous")

BPage:CreateToggle("Trail", "Enables Trail Of The Ball", function(arg)
if arg then
game.Workspace.TPSSystem.TPS.Trail.Enabled = true
    
    else
        game.Workspace.TPSSystem.TPS.Trail.Enabled = false
end
end)

BPage:CreateToggle("Tracer", "Shows Tracer", function(arg)
if arg then
local beam = Instance.new("Beam")
       beam.Name = "TracerBeam"
		beam.Parent = game.Workspace.TPSSystem.TPS
--		beam.Color = ColorSequence.new(Color3.fromRGB(18, 200, 5))
		beam.TextureLength = 7
		beam.TextureMode = "Static"
		beam.TextureSpeed = 1
		beam.FaceCamera = true

		local attachmentPlayer = Instance.new("Attachment")
		attachmentPlayer.Name = "BallArrow"
		attachmentPlayer.Parent = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

		beam.Attachment1 = game.Workspace.TPSSystem.TPS.Attachment1
		beam.Attachment0 = attachmentPlayer
    else
        game.Workspace.TPSSystem.TPS.TracerBeam:Destroy()
end
end)

BPage:CreateToggle("Rainbow Color", "Color From RGB", function(arg)
if arg then
local Brick = workspace.TPSSystem.TPS --Change To Brick
local speed = 10 --Change to speed you want
_G.RAIN = true
while _G.RAIN do
	for i = 0,1,0.001*speed do
		Brick.Color = Color3.fromHSV(i,1,1) --creates a color using i
		wait()
	end
end
    else
        _G.RAIN = false
        wait(3.3)
        workspace.TPSSystem.TPS.Color = Color3.fromRGB(248, 248, 248) --creates a color using i
end
end)

BPage:CreateToggle("Rainbow Trail", "Enables Special Rainbow Trail", function(arg)
if arg then
local speed = 15 --Change to speed you want
_G.RANB = true
while _G.RANB do
	for i = 0,1,0.001*speed do
		local startColor = Color3.fromHSV(i, 1, 1)
local endColor = Color3.fromHSV(i, 1, 1)
local sequence = ColorSequence.new(startColor, endColor)
game.Workspace.TPSSystem.TPS.Trail.Color = sequence
wait()
	end
end
    else
        _G.RANB = false
        wait(3.3)
        local startColor = Color3.fromRGB(255, 255, 255)
local endColor = Color3.fromRGB(255, 255, 255)
local sequence = ColorSequence.new(startColor, endColor)
game.Workspace.TPSSystem.TPS.Trail.Color = sequence
end
end)

BPage:CreateLabel("Configurations")

BPage:CreateBox("Size", 10044538000, function(arg)
    game.Workspace.TPSSystem.TPS.Size = Vector3.new(arg, arg, arg)
end)

BPage:CreateToggle("Better React", "Gives You A Better Reaction Time Of The Ball", function(arg)
if arg then
RunStepped2 = game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= 3 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"],game.Workspace.TPSSystem.TPS,0)
			firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"],game.Workspace.TPSSystem.TPS,1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"],game.Workspace.TPSSystem.TPS,0)
			firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"],game.Workspace.TPSSystem.TPS,1)

end
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= 3 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 1)

end
end
end
end)
else
RunStepped2:Disconnect()
end
end)

BPage:CreateToggle("Collision", "Enables/Disables The Ball Collision", function(arg)
if arg then
game.Workspace.TPSSystem.TPS.CanCollide = false
else
game.Workspace.TPSSystem.TPS.CanCollide = true
end
end)

BPage:CreateToggle("View", "Spectate The Ball", function(arg)
if arg then
game.Workspace.CurrentCamera.CameraSubject = game.Workspace.TPSSystem.TPS
    else
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end)

BPage:CreateButton("Remove Textures", "Removes Decals, Effects [Expect Flame] And Textures From The Ball", function()
     local Ball = game.Workspace.TPSSystem.TPS
local Player = game.Players.LocalPlayer
local HRP = Player.Character.HumanoidRootPart
local RightLeg, LeftLeg = Player.Character["Right Leg"], Player.Character["Left Leg"]

for i,BallCON in pairs(Ball:GetChildren()) do
    if BallCON:IsA("Decal") or BallCON:IsA("Smoke") or BallCON:IsA("PointLight") or BallCON:IsA("ParticleEmitter") then
       BallCON:Destroy()
    end
end

for i,BALLFIRE in pairs(Ball:GetChildren()) do
    if BALLFIRE:IsA("Fire") then
       BALLFIRE.Heat = 1
       BALLFIRE.Size = 5
    end
end

Ball.Massless = true
Ball.CustomPhysicalProperties = false
end)

MRPage:CreateLabel("Mobile Reach [CAN BE USED WITH PC AND MOBILE]")
MRPage:CreateLabel("If It Still Doesn't Work For Mobile Players - Let Me Know And I'll Fix It")
MRPage:CreateLabel("Reach: Method 1")
local RunSteppedMobile
local DistanceReachMobile = 0

MRPage:CreateButton("Enable Reach", "Enables Reach", function()
    RunSteppedMobile = game:GetService("RunService").RenderStepped:Connect(function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceReachMobile then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["Right Leg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["Left Leg"], game.Workspace.TPSSystem.TPS, 1)

end
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.Workspace.TPSSystem.TPS.Position).Magnitude <= DistanceReach then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["RightLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 0)
			firetouchinterest(game.Players.LocalPlayer.Character["LeftLowerLeg"], game.Workspace.TPSSystem.TPS, 1)
			end
			end
			end
			end)
end)

MRPage:CreateButton("Disable Reach", "Disable Reach", function()
    RunSteppedMobile:Disconnect()
end)

MRPage:CreateButton("Reach - 0", "Setting Size Of Reach", function()
    DistanceReachMobile = 0
end)

MRPage:CreateButton("Reach - 2", "Setting Size Of Reach", function()
    DistanceReachMobile = 2
end)

MRPage:CreateButton("Reach - 3", "Setting Size Of Reach", function()
    DistanceReachMobile = 3
end)

MRPage:CreateButton("Reach - 5", "Setting Size Of Reach", function()
    DistanceReachMobile = 5
end)

MRPage:CreateButton("Reach - 8", "Setting Size Of Reach", function()
    DistanceReachMobile = 8
end)

MRPage:CreateButton("Reach - 10", "Setting Size Of Reach", function()
    DistanceReachMobile = 10
end)

MRPage:CreateButton("Reach - 15", "Setting Size Of Reach", function()
    DistanceReachMobile = 15
end)

MRPage:CreateButton("Reach - 20", "Setting Size Of Reach", function()
    DistanceReachMobile = 20
end)

MRPage:CreateButton("Reach - 25", "Setting Size Of Reach", function()
    DistanceReachMobile = 25
end)

MRPage:CreateButton("Reach - 30", "Setting Size Of Reach", function()
    DistanceReachMobile = 30
end)

MRPage:CreateButton("Reach - 35", "Setting Size Of Reach", function()
    DistanceReachMobile = 35
end)

MRPage:CreateButton("Reach - 50", "Setting Size Of Reach", function()
    DistanceReachMobile = 50
end)

MRPage:CreateButton("Reach - 60", "Setting Size Of Reach", function()
    DistanceReachMobile = 60
end)

MRPage:CreateButton("Reach - 70", "Setting Size Of Reach", function()
    DistanceReachMobile = 70
end)

MRPage:CreateButton("Reach - 80", "Setting Size Of Reach", function()
    DistanceReachMobile = 80
end)

MRPage:CreateButton("Reach - 90", "Setting Size Of Reach", function()
    DistanceReachMobile = 90
end)

MRPage:CreateButton("Reach - 100", "Setting Size Of Reach", function()
    DistanceReachMobile = 100
end)

MRPage:CreateLabel("Reach: Method 2")
MRPage:CreateLabel("Customize Reach Size And Transparency. After Use Fake Leg")

local LeftLegM
local RightLegM
local LeftFootM
local RightFootM

MRPage:CreateButton("Fake Leg [R6]", "Creates Fake Leg For Better View", function()
    if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
    game.Players.LocalPlayer.Character["Left Leg"].Massless = true
   LeftLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
LeftLegM.Name = "Left Leg"
LeftLegM.CanCollide = false
LeftLegM.Color = game.Players.LocalPlayer.Character["Left Leg"].Color
LeftLegM.Size = Vector3.new(1, 2, 1)
LeftLegM.Locked = true
LeftLegM.Position = game.Players.LocalPlayer.Character["Left Leg"].Position

local Attachment = Instance.new("Attachment", LeftLegM)
Attachment.Name = "LeftFootAttachment"
Attachment.Position = Vector3.new(0, -1, 0)

local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
MotorHip.Name = "Fake Left Hip"
MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
MotorHip.CurrentAngle = 0
MotorHip.DesiredAngle = 0
MotorHip.MaxVelocity = 0.1
MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
MotorHip.Part1 = LeftLegM
elseif game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 1 then
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
   RightLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
RightLegM.Name = "Right Leg"
RightLegM.CanCollide = false
RightLegM.Color = game.Players.LocalPlayer.Character["Right Leg"].Color
RightLegM.Size = Vector3.new(1, 2, 1)
RightLegM.Locked = true
RightLegM.Position = game.Players.LocalPlayer.Character["Right Leg"].Position

local Attachment = Instance.new("Attachment", RightLegM)
Attachment.Name = "RightFootAttachment"
Attachment.Position = Vector3.new(0, -1, 0)

local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
MotorHip.Name = "Fake Right Hip"
MotorHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
MotorHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
MotorHip.CurrentAngle = 0
MotorHip.DesiredAngle = 0
MotorHip.MaxVelocity = 0.1
MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
MotorHip.Part1 = RightLegM
end
end)

MRPage:CreateButton("Remove Fake Leg [R6]", "Removes Fake Leg", function()
    if LeftLegM ~= nil then
LeftLegM:Destroy()
elseif RightLegM ~= nil then
RightLegM:Destroy()
elseif LeftFootM ~= nil then
LeftFootM:Destroy()
elseif RightFootM ~= nil then
RightFootM:Destroy()
end
for i,z in pairs(game.Players.LocalPlayer.Character.Torso:GetDescendants()) do
        if z.Name == "Fake Left Hip" or z.Name == "Fake Right Hip" then
            z:Destroy()
        end
    end
end)

MRPage:CreateButton("Reach Leg Transparency - 0", "Setting Leg's Transparency To 0", function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 0
else
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 0
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 0
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 0
end
end
end)

MRPage:CreateButton("Reach Leg Transparency - 0.2", "Setting Leg's Transparency To 0.2", function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 0.2
else
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 0.2
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 0.2
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 0.2
end
end
end)

MRPage:CreateButton("Reach Leg Transparency - 0.5", "Setting Leg's Transparency To 0.5", function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 0.5
else
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 0.5
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 0.5
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 0.5
end
end
end)

MRPage:CreateButton("Reach Leg Transparency - 1", "Setting Leg's Transparency To 1", function()
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
else
game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 1
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 1
end
end
end)

MRPage:CreateButton("Reach Leg - 1", "Setting Leg's Size To 1", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(1, 2, 1)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(1, 2, 1)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(1, 2, 1)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(1, 2, 1)
end
end
end)

MRPage:CreateButton("Reach Leg - 3", "Setting Leg's Size To 3", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(3, 2, 3)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(3, 2, 3)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(3, 2, 3)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(3, 2, 3)
end
end
end)

MRPage:CreateButton("Reach Leg - 5", "Setting Leg's Size To 5", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(5, 2, 5)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(5, 2, 5)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(5, 2, 5)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(5, 2, 5)
end
end
end)

MRPage:CreateButton("Reach Leg - 8", "Setting Leg's Size To 8", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(8, 2, 8)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(8, 2, 8)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(8, 2, 8)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(8, 2, 8)
end
end
end)

MRPage:CreateButton("Reach Leg - 10", "Setting Leg's Size To 10", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(10, 2, 10)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(10, 2, 10)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(10, 2, 10)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(10, 2, 10)
end
end
end)

MRPage:CreateButton("Reach Leg - 15", "Setting Leg's Size To 15", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(15, 2, 15)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(15, 2, 15)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(15, 2, 15)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(15, 2, 15)
end
end
end)

MRPage:CreateButton("Reach Leg - 20", "Setting Leg's Size To 20", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(20, 2, 20)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(20, 2, 20)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(20, 2, 20)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(20, 2, 20)
end
end
end)

MRPage:CreateButton("Reach Leg - 25", "Setting Leg's Size To 25", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(25, 2, 25)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(25, 2, 25)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(25, 2, 25)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(25, 2, 25)
end
end
end)

MRPage:CreateButton("Reach Leg - 30", "Setting Leg's Size To 30", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(30, 2, 30)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(30, 2, 30)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(30, 2, 30)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(30, 2, 30)
end
end
end)

MRPage:CreateButton("Reach Leg - 35", "Setting Leg's Size To 35", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(35, 2, 35)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(35, 2, 35)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(35, 2, 35)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(35, 2, 35)
end
end
end)

MRPage:CreateButton("Reach Leg - 50", "Setting Leg's Size To 50", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(50, 2, 50)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(50, 2, 50)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(50, 2, 50)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(50, 2, 50)
end
end
end)

MRPage:CreateButton("Reach Leg - 60", "Setting Leg's Size To 60", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(60, 2, 60)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(60, 2, 60)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(60, 2, 60)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(60, 2, 60)
end
end
end)

MRPage:CreateButton("Reach Leg - 70", "Setting Leg's Size To 70", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(70, 2, 70)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(70, 2, 70)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(70, 2, 70)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(70, 2, 70)
end
end
end)

MRPage:CreateButton("Reach Leg - 80", "Setting Leg's Size To 80", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(80, 2, 80)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(80, 2, 80)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(80, 2, 80)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(80, 2, 80)
end
end
end)

MRPage:CreateButton("Reach Leg - 90", "Setting Leg's Size To 90", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(90, 2, 90)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(90, 2, 90)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(90, 2, 90)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(90, 2, 90)
end
end
end)

MRPage:CreateButton("Reach Leg - 100", "Setting Leg's Size To 100", function()
   if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
   if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["Left Leg"].Massless = true
game.Players.LocalPlayer.Character["Left Leg"].Size = Vector3.new(100, 2, 100)
else
game.Players.LocalPlayer.Character["Right Leg"].Massless = true
game.Players.LocalPlayer.Character["Right Leg"].Size = Vector3.new(100, 2, 100)
end
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
if game.Lighting[game.Players.LocalPlayer.Name].PreferredFoot.Value == 2 then
game.Players.LocalPlayer.Character["LeftLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["LeftLowerLeg"].Size = Vector3.new(100, 2, 100)
else
game.Players.LocalPlayer.Character["RightLowerLeg"].Massless = true
game.Players.LocalPlayer.Character["RightLowerLeg"].Size = Vector3.new(100, 2, 100)
end
end
end)

TPPage:CreateLabel("Waypoints")

TPPage:CreateButton("Teleport To The Ball", "Teleporting You To The Ball", function()
game.Players.LocalPlayer.Character:MoveTo(game.Workspace.TPSSystem.TPS.Position)
end)

TPPage:CreateButton("Teleport To The Center", "Teleporting You To The Center", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lines.Line12.CFrame
end)

TPPage:CreateButton("Teleport To The Red Box", "Teleporting You To The Red Goal", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.229434282, 13.2999945, -111.25293, -0.999964356, 6.47347465e-09, -0.00844059512, 5.92729865e-09, 1, 6.47332428e-08, 0.00844059512, 6.46809042e-08, -0.999964356)
end)

TPPage:CreateButton("Teleport To The Blue Box", "Teleporting You To The Blue Goal", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.337467283, 13.2999945, 113.940865, 0.999967039, 4.84168332e-08, 0.00811586808, -4.90094685e-08, 1, 7.28228073e-08, -0.00811586808, -7.32181604e-08, 0.999967039)
end)

TPPage:CreateButton("Teleport To Random Blue Spawn", "Teleporting You To The Blue Spawn", function()
    local BlueSpawns = game.Workspace.BSpawns:GetChildren()

local WayRandom = math.random(1, #BlueSpawns)
    game.Players.LocalPlayer.Character:MoveTo(BlueSpawns[WayRandom].Position)
end)

TPPage:CreateButton("Teleport To Random Red Spawn", "Teleporting You To The Red Spawn", function()
    local RedSpawns = game.Workspace.RSpawns:GetChildren()

local WayRandom = math.random(1, #RedSpawns)
    game.Players.LocalPlayer.Character:MoveTo(RedSpawns[WayRandom].Position)
end)

CPage:CreateLabel("R15 Animations")

CPage:CreateButton("CelebrationB", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationB
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationBHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationBHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationG", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationG
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationGHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationGHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationH", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationH
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationHHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationHHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationJ", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationJ
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationJHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationJHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationM", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationM
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationMHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationMHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationN", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationN
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationNHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationNHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationT", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationT
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationTHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationTHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationU", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationU
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationUHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationUHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationY", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationY
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationYHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewCelebrationYHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationA", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewExtraCelebrationA
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationB", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewExtraCelebrationB
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationC", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewExtraCelebrationC
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationD", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewExtraCelebrationD
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationE", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewExtraCelebrationE
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationF", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.NewExtraCelebrationF
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateLabel("R6 Animations")

CPage:CreateButton("CelebrationB", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationB
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationBHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationBHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationG", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationG
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationGHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationGHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationH", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationH
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationHHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationHHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationJ", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationJ
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationJHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationJHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationM", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationM
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationMHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationMHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationN", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationN
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationNHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationNHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationT", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationT
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationTHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationTHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationU", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationU
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationUHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationUHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationY", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationY
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("CelebrationYHold", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.CelebrationYHold
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationA", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.ExtraCelebrationA
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationB", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.ExtraCelebrationB
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationC", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.ExtraCelebrationC
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationD", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.ExtraCelebrationD
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationE", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.ExtraCelebrationE
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

CPage:CreateButton("ExtraCelebrationF", "Loads Animation.", function()
local Anim = game:GetService("Players").LocalPlayer.PlayerGui.Animations.ExtraCelebrationF
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
end)

VPage:CreateLabel("Ball ESP")

VPage:CreateToggle("Highlight", "Allows You To See Normally And Through Walls", function(arg)
if arg then
local Highlight = Instance.new("Highlight", game.Workspace.TPSSystem.TPS)
Highlight.FillColor = Color3.fromRGB(255, 255, 255)
Highlight.FillTransparency = 0.2
Highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
    else
game.Workspace.TPSSystem.TPS.Highlight:Destroy()
end
end)


VPage:CreateToggle("Box", "Creates Box", function(arg)
if arg then
local Ball = game.Workspace.TPSSystem.TPS

surfaces = {"Front", "Back", "Top", "Bottom", "Left", "Right"}
        for i = 1, #surfaces do
            local sgui = Instance.new("SurfaceGui", Ball)
			sgui.Name = "BallESP"
            sgui.AlwaysOnTop = true
            sgui.Face = surfaces[i]
            local frm = Instance.new("Frame", sgui)
            frm.Size = UDim2.new(1,0,1,0)
            frm.BackgroundColor3 = Color3.fromRGB(255, 250, 250)
	frm.BackgroundTransparency = 0.25
end
    else
    local Ball = game.Workspace.TPSSystem.TPS
    for i,v in pairs(Ball:GetChildren()) do
        if v.Name == "BallESP" or v.Name == "BallName" then
        v:Destroy()
end
end
end
end)

VPage:CreateToggle("Textlabel", "Creates Text", function(arg)
if arg then
local Ball = game.Workspace.TPSSystem.TPS
    
    local bgui = Instance.new("BillboardGui", Ball)
	bgui.Name = ("BallName")
	bgui.AlwaysOnTop = true
	bgui.ExtentsOffset = Vector3.new(0,3,0)
	bgui.Size = UDim2.new(0,200,0,50)
	local nam = Instance.new("TextLabel",bgui)
	nam.Text = "Ball"
	nam.BackgroundTransparency = 1
	nam.TextSize = 19
	nam.Font = ("Arial")
	nam.TextColor3 = Color3.new(255, 250, 250)
	nam.Size = UDim2.new(0,200,0,66)
    else
local Ball = game.Workspace.TPSSystem.TPS
    for i,v in pairs(Ball:GetChildren()) do
        if v.Name == "BallESP" or v.Name == "BallName" then
        v:Destroy()
end
end
end
end)

VPage:CreateLabel("Players ESP")

local ESPz = loadstring(game:HttpGet("https://paste.ee/r/aFx08", true))()

VPage:CreateToggle("ESP", "Toggles ESP", function(arg)
ESPz:Toggle(arg)
end)

CRPage:CreateButton("Copy YouTube Channel", "Copies YouTube Link", function()
setclipboard("https://www.youtube.com/channel/UCIt3DWNjBgU5hGO6dWnUljA")
end)
CRPage:CreateLabel("Scripts & Functions: DinzyHeroExploits")
CRPage:CreateLabel("UI Library: Vanis UI Library")
CRPage:CreateLabel("Updated: 19.04.2023 (19th April, 2023)")
