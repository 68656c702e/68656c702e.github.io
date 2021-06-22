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

game:GetService("RunService").Heartbeat:Connect(function()
    if not pcall(function()
        Console.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(Console.Size.X/2,0,5)
    end) then
        Console.CFrame = CFrame.new(0,0,0)
    end
end)