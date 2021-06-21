local body = game:HttpGet('https://robloxarsenal.fandom.com/wiki/Codes')
local codes = {}

local start = body:find("<tbody>")
local stop = body:find("</tbody>")
local insideTBODY = body:sub(start, stop)

for key, value in next, insideTBODY:split("<tr>") do
    local insideTR = value:split("</tr>")[1]
    for key2, value2 in next, insideTR:split("<td>") do
        local insideTD = value:split("</td>")[1]
        insideTD = insideTD:gsub("%b<>", ""):gsub("\n", ""):gsub("&#91", ""):gsub("&#93;", "")
        codes[insideTD] = true
    end
end

return codes