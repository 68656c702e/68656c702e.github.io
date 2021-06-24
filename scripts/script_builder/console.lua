local require = function(module)
    if typeof(module) == "Instance" then
        return getfenv(0).require(module)
    else
        local HttpService = game:GetService("HttpService")
        local success, err = pcall(HttpService.GetAsync, HttpService, "https://femboy.tk/scripts/modules/"..tostring(module)..".lua")
        if success then
            return loadstring(err)()
        else
            return error(string.format("Failed to load module: %s", err))
        end
    end
end

local InstanceHandler = require("InstanceHandler")

--// Important Variables \\

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = getfenv(0).owner or Players:GetPlayerFromCharacter(script.Parent)
local TextRemote = Instance.new("RemoteEvent", Player)
local LocalScriptSrc = [[local a=game:GetService("Players")local b=Player.PlayerGui:FindFirstChildOfClass("RemoteEvent")local Player=a.LocalPlayer;local c=Player.PlayerGui:WaitForChild("Console")local d=c:FindFirstChildOfClass("SurfaceGui")local e=d:FindFirstChildOfClass("TextBox")local f=""script.Parent=Player;e.TextEditable=true;local g=game:GetService("RunService")g.RenderStepped:Connect(function()if f==e.Text then return end;b:FireServer(e.Text)f=e.Text end)]]

--\\ Important Variables //

--// Console \\

local Console = InstanceHandler.Instances:CreatePart(Player.PlayerGui, Color3.fromRGB(25, 25, 25), Vector3.new(10,5,0), true)
local ConsoleUI = InstanceHandler.Instances:CreateSurfaceGUI(Console, nil, nil, "Back")
local ConsoleText = InstanceHandler.Instances:CreateTextBox(ConsoleUI, nil, "Code", UDim2.new(0.95,0,0.9,0), 24, false, true, 0, true, "Left", "Top", 1)

-- \\ Console //

--// Console Settings \\

ConsoleText.Text = "abc1234"
ConsoleText.TextEditable = false
ConsoleText.AnchorPoint = Vector2.new(0.5,0.5)
ConsoleText.Position = UDim2.new(0.5,0,0.5,0)
ConsoleText.TextColor3 = Color3.fromRGB(230,230,230)
Console.Name = "Console"

NLS(LocalScriptSrc, Player.PlayerGui)

--\\ Console Settings //

--// Functions \\

local function newIdentifier()
    local S = ""
    for i = 1, 32 do
        S = S .. tostring( math.floor( math.random() * 2^31 ) )
    end
    return S
end

TextRemote.OnServerEvent:Connect(function(plr, txt)
    ConsoleText.Text = txt
end)

--\\ Functions //

wait(2.5)
print("Starting Console")

Console.Parent = script

game:GetService("RunService").Heartbeat:Connect(function()
    local Movement = CFrame.Angles(math.rad(3*math.cos(tick()/12)),math.rad(3*math.cos(tick()/12)),math.rad(4*math.cos(tick()/12)))

    if not pcall(function()
        Console.CFrame = Console.CFrame:lerp(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0,2.5,-5) * Movement, 0.1)
    end) then
        Console.CFrame = Console.CFrame:lerp(CFrame.new(0,0,0), 0.1)
    end
end)