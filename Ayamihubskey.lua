-- Gui to Lua
-- Version: 3.2

-- Instances:

local LoadUi = Instance.new("ScreenGui")
local KeySytem = Instance.new("Folder")
local Key = Instance.new("Frame")
local Logo = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local Box = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local Get = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Check = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Dis = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

--Properties:

LoadUi.Name = "LoadUi"
LoadUi.Parent = game.CoreGui
LoadUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

KeySytem.Name = "KeySytem"
KeySytem.Parent = LoadUi

Key.Name = "Key"
Key.Parent = LoadUi
Key.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Key.Position = UDim2.new(0.287708133, 0, 0.411370039, 0)
Key.Size = UDim2.new(0, 291, 0, 100)

Logo.Name = "Logo"
Logo.Parent = Key
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.Position = UDim2.new(-0.422680408, 0, 0, 0)
Logo.Size = UDim2.new(0, 100, 0, 100)

ImageLabel.Parent = Logo
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "rbxassetid://7584008919"

Box.Name = "Box"
Box.Parent = Key
Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Box.Position = UDim2.new(0.0137457047, 0, 0.0800000131, 0)
Box.Size = UDim2.new(0, 283, 0, 26)
Box.Font = Enum.Font.SourceSans
Box.Text = "Type Key Here.."
Box.TextColor3 = Color3.fromRGB(0, 0, 0)
Box.TextSize = 14.000

UICorner.Parent = Key

Get.Name = "Get"
Get.Parent = Key
Get.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Get.Position = UDim2.new(0.0385778286, 0, 0.423076868, 0)
Get.Size = UDim2.new(0, 80, 0, 45)
Get.Font = Enum.Font.SciFi
Get.Text = "Get Key"
Get.TextColor3 = Color3.fromRGB(0, 0, 0)
Get.TextSize = 14.000
    Get.MouseButton1Click:Connect(function()
        Get.Text = "Copy Success"
        setclipboard("Paste TO GetKey Link")
        wait(0.5)
        Get.Text = "Get Key"
    end)
UICorner_2.CornerRadius = UDim.new(0, 7)
UICorner_2.Parent = Get

Check.Name = "Check"
Check.Parent = Key
Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Check.Position = UDim2.new(0.677753091, 0, 0.423076868, 0)
Check.Size = UDim2.new(0, 80, 0, 45)
Check.Font = Enum.Font.SciFi
Check.Text = "Check Key"
Check.TextColor3 = Color3.fromRGB(0, 0, 0)
Check.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 7)
UICorner_3.Parent = Check

Dis.Name = "Dis"
Dis.Parent = Key
Dis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dis.Position = UDim2.new(0.361601889, 0, 0.423076868, 0)
Dis.Size = UDim2.new(0, 80, 0, 45)
Dis.Font = Enum.Font.SciFi
Dis.Text = "Discord"
Dis.TextColor3 = Color3.fromRGB(0, 0, 0)
Dis.TextSize = 14.000

    Dis.MouseButton1Click:Connect(function()
        Dis.Text = "Copy Success"
        setclipboard("Paste TO GetKey Link")
        wait(0.5)
        Dis.Text = "Get Key"
    end)

UICorner_4.CornerRadius = UDim.new(0, 7)
UICorner_4.Parent = Dis

_G.Key_KeyPass = "1"

    Check.MouseButton1Click:Connect(function()
        local KeyInput = Box.Text
        local CorrectKey = _G.Key_KeyPass
        if KeyInput == CorrectKey then
            Box.Text = ""
            Box.TextColor3 = Color3.fromRGB(255, 255, 0)
            Box.Text = "Success Key !"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zpshub/MeMayBeoHub/main/Main"))()
            local SysemKey = game.CoreGui:FindFirstChild("LoadUi")
            Key:TweenSize(UDim2.new(0,1,0,1),"Out","Quad",1,true)
            wait(.2)
            Key.Position = UDim2.new(1000, 0, 1000, 0)
        else
            Box.TextColor3 = Color3.fromRGB(255, 0, 0)
            Box.Text = "Checking..."
            wait(.1)
            Box.Text = "Incorrect Key !"
            wait(0.5)
            Box.TextColor3 = Color3.fromRGB(0, 0, 0)
            Box.Text = "Type Key Here ..."
        end
    end)
