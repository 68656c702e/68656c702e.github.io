local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Remote = Player.PlayerGui:FindFirstChildOfClass("RemoteEvent")
local Console = Player.PlayerGui:WaitForChild("Console")
local ConsoleUI = Console:FindFirstChildOfClass("SurfaceGui")
local ConsoleText = ConsoleUI:FindFirstChildOfClass("TextBox")
local LastText = ""
script.Parent = Player

local ConsoleUi = ConsoleUI:Clone()
local ConsoleText = ConsoleUi:FindFirstChildOfClass("TextBox")
ConsoleUI:Destroy()

local autoFill = {
    abc1234567890 = true
}

ConsoleText.TextEditable = true
ConsoleText.Selectable = true
ConsoleUi.Parent = Player.PlayerGui
ConsoleUi.Adornee = Console

Mouse.Button1Down:Connect(function()
    if Mouse.Target == Console then
        ConsoleText:CaptureFocus()
    end
end)

Mouse.KeyDown:Connect(function(key)
    if key == "\9" then -- keycode for tab
        local splits = string.spltit(ConsoleText.Text, " ")
        for k,v in next, autoFill do
            print(k, splits[#splits])
            if string.find(splits[#splits], splits[#splits]) and k ~= splits[#splits] then
                ConsoleText.Text = ConsoleText.Text..string.sub(k, #splits[#splits])
            end
        end
    end
end)

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    ConsoleText.Text = ConsoleText.Text:gsub("\\\n", "\\l")
    ConsoleText.Text = ConsoleText.Text:gsub("\\n", "\n")
    ConsoleText.Text = ConsoleText.Text:gsub("\\l", "\\n")
    if LastText == ConsoleText.Text then return end -- for optimization

    Remote:FireServer(ConsoleText.Text)
    LastText = ConsoleText.Text
end)