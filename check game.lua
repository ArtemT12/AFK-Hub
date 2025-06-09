local GameData = {
    BladeBall = {
        ids = {
            13772394625, 14732610803, 14915220621, 15131065025,
            15144787112, 15185247558, 15234596844, 15264892126, 15509350986
        },
        src = "https://raw.githubusercontent.com/ArtemT12/AFK-Hub/main/Blade%20Ball.lua"
    },
    CriminalTycoon = {
        ids = {14218711698},
        src = "https://raw.githubusercontent.com/ArtemT12/AFK-Hub/main/Criminal%20Tycoon.lua"
    },
    HideOrDie = {
        ids = {
            18799085098, 82685362886558, 95995789269060, 126882336059890
        },
        src = "https://raw.githubusercontent.com/ArtemT12/AFK-Hub/main/Hide%20Or%20Die.lua"
    },
    ThiefSimulator = {
        ids = {8232438881},
        src = "https://raw.githubusercontent.com/ArtemT12/AFK-Hub/main/Thief%20Simulator.lua"
    }
}
local Place = game.PlaceId
local match = false

for _, g in pairs(GameData) do
    for _, id in ipairs(g.ids) do
        if id == Place then
            match = true
            local ok, err = pcall(function()
                loadstring(game:HttpGet(g.src))()
            end)
            if not ok then
                warn("Script failed:", err)
            end
            break
        end
    end
    if match then break end
end

if not match then
    warn("Not Supported (PlaceId: " .. Place .. ")")
end
