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

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = getfenv(0).owner or Players:GetPlayerFromCharacter(script.Parent)

local Console = InstanceHandler.Instances:CreatePart(script, Color3.fromRGB(25, 25, 25), Vector3.new(10,5,0), true)
local ConsoleUI = InstanceHandler.Instances:CreateSurfaceGUI(Console)
local ConsoleText = InstanceHandler.Instances:CreateTextBox(ConsoleUI, nil, "Code", 14, false, true, 0, true)

game:GetService("RunService").Heartbeat:Connect(function()
    local Movement = CFrame.Angles(math.rad(3*math.cos(tick()/24)),math.rad(3*math.cos(tick()/24)),math.rad(4*math.cos(tick()/24)))

    if not pcall(function()
        Console.CFrame = Console.CFrame:lerp(Player.Character.HumanoidRootPart.CFrame * CFrame.new(0,2.5,-5) * Movement, 0.1)
    end) then
        Console.CFrame = Console.CFrame:lerp(CFrame.new(0,0,0), 0.1)
    end
end)