local Players = game:GetService("Players")
local Remote = Player.PlayerGui:FindFirstChildOfClass("RemoteEvent")
local Player = Players.LocalPlayer
local Console = Player.PlayerGui:WaitForChild("Console")
local ConsoleUI = Console:FindFirstChildOfClass("SurfaceGui")
local ConsoleText = ConsoleUI:FindFirstChildOfClass("TextBox")
local LastText = ""
script.Parent = Player

ConsoleText.TextEditable = true

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    if LastText == ConsoleText.Text then return end -- for optimization

    Remote:FireServer(ConsoleText.Text)
    LastText = ConsoleText.Text
end)