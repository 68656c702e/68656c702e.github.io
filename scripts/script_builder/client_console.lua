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

ConsoleText.TextEditable = true
ConsoleText.Selectable = true
ConsoleUi.Parent = Player.PlayerGui
ConsoleUi.Adornee = Console

Mouse.Button1Down:Connect(function()
    if Mouse.Target == Console then
        ConsoleText:CaptureFocus()
    end
end)

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    ConsoleText.Text:gsub("\\n", "\n")
    if LastText == ConsoleText.Text then return end -- for optimization

    Remote:FireServer(ConsoleText.Text:gsub("\\n", "\n"))
    LastText = ConsoleText.Text:gsub("\\n", "\n")
end)