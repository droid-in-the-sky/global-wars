dofile 'map4.lua'

local STATE = {
    type = 'fortify',
}

for i, tp in ipairs(PLAYERS) do
    STATE[i] = {}
    for c=1, #MAP do
        STATE[i][c] = 0
    end
end

-- randomize countries
local got = {}
local n = 0
local p = -1
print(n, #MAP)
while n < #MAP do
    p = (p + 1) % 6
    if PLAYERS[p+1] then
        while true do
            local c = math.random(#MAP)
            if not got[c] then
                got[c] = true
                STATE[p+1][c] = 1
                n = n + 1
                break
            end
        end
    end
end
print(n, #MAP)

local file = 'games/'..os.time()..'.lua'

local f = assert(io.open(file,'w'))
f:write([[
    dofile 'map4.lua'
    PLAYERS = ]]..table2string(PLAYERS)..[[
    STATES  = {
        [1]  = ]]..table2string(STATE)..[[,
    }
    MOVES   = {};
]])
f:close()

return file
