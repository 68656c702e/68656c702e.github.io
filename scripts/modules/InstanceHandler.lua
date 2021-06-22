local module = {}

module.Instances = {}

function module.Instances:CreatePart(Parent, Color, Size, Anchored)
    local Part = Instance.new("Part")
    Part.Color = Color or Color3.fromRGB(0,0,0)
    Part.Size = Size or Vector3.new(4,1,2)
    Part.Anchored = Anchored or true
    Part.Parent = Parent

    return Part
end

function module.Instances:CreateSurfaceGUI(Adornee, PixelsPerStud, LightInfluence, Face)
    local SurfaceGUI = Instance.new("SurfaceGui", Adornee)
    SurfaceGUI.Adornee = Adornee
    SurfaceGUI.LightInfluence = LightInfluence or 0
    SurfaceGUI.PixelsPerStud = PixelsPerStud or 1000
    SurfaceGUI.Face = Face or "Front"

    return SurfaceGUI
end

function module.Instances:CreateTextBox(Parent, Color, Font, Size, TextSize, TextScaled, TextWrapped, TextTransparency, RichText, TextXAlignment, TextYAlignment, BackgroundTransparency)
    local TextBox = Instance.new("TextBox")
    TextBox.Font = Font or "SourceSans"
    TextBox.Size = Size or UDim2.new(1,0,1,0)
    TextBox.TextSize = TextSize or 14
    TextBox.BackgroundTransparency = BackgroundTransparency
    TextBox.TextScaled = TextScaled or false
    TextBox.TextTransparency = TextTransparency
    TextBox.TextXAlignment = TextXAlignment or "Center"
    TextBox.TextYAlignment = TextYAlignment or "Center"
    TextBox.RichText = RichText
    TextBox.TextColor3 = Color or Color3.fromRGB(255,255,255)
    TextBox.TextWrapped = TextWrapped or true
    TextBox.Parent = Parent

    return TextBox
end

return module