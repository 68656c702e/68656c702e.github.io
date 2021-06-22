local module = {}

module.Instances = {}

function module.Instances:CreatePart(Parent, Color, Size, Anchored)
    local Part = Instance.new("Part")
    Part.Color = Color or Color3.fromRGB(0,0,0)
    Part.Size = Size or Vector3.new(4,1,2)
    Part.Anchored = Anchored or true

    return Part
end

return module