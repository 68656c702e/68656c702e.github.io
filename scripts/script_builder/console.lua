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
local Player = getfenv(0).owner or Players:GetPlayerFromCharacter(script.Parent)

local ConsoleUI = InstanceHandler.Instances:CreatePart(script, Color3.fromRGB(25, 25, 25), Vector3.new(10,5,0), true)
ConsoleUI.Position = Player.Character.HumanoidRootPart.Position