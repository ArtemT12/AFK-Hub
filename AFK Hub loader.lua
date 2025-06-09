local GameData = {
    BladeBall = {
        ids = {
            13772394625, 14732610803, 14915220621, 15131065025,
            15144787112, 15185247558, 15234596844, 15264892126, 15509350986, 16281300371
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

local currentId = game.PlaceId
local matched = false

for _, entry in pairs(GameData) do
    for _, id in ipairs(entry.ids) do
        if id == currentId then
            matched = true
            local success, result = pcall(function()
                local scriptSource = game:HttpGet(entry.src)
                assert(type(loadstring) == "function", "loadstring unsupported")
                local exec = loadstring(scriptSource)
                assert(type(exec) == "function", "Script did not return a function")
                exec()
            end)
            if not success then
                warn("Failed to load script for game ID:", currentId, "\nError:", result)
            end
            break
        end
    end
    if matched then break end
end

if not matched then
    warn("Game not supported (PlaceId: " .. currentId .. ")")
end
