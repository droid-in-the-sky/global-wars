local function copy (t)
    if type(t) ~= 'table' then
        return t
    end

    local ret = {}
    for i,v in ipairs(t) do
        ret[i] = copy(v)
    end
    return ret
end

local function country2player (S, c1)
    for p, T in ipairs(S) do
        for c2, v in ipairs(T) do
            if c1==c2 and v>0 then
                return p
            end
        end
    end
    error'empty country'
end

function SRV_go ()
    -- before attack (remove from "fr")
    local S1 = copy(STATES[#STATES])
    STATES[#STATES+1] = S1

    -- foreach player
    assert(#MOVES[#MOVES] == #PLAYERS, 'missing player move')
    for p, MS in ipairs(MOVES[#MOVES]) do
        -- foreach player move
        for _, M in ipairs(MS) do
            local a, fr, to = unpack(M)
            assert(S1[p][fr] > a, 'invalid move')
                -- at least "a+1" to move "a"

            -- remove from fr
            S1[p][fr] = S1[p][fr] - a;
        end
    end

    -- after attack (inserts into "to")
    local S2 = copy(S1)
    STATES[#STATES+1] = S2

    -- first move fr=>to (yielding shared countries)
    -- foreach player
    for p, MS in ipairs(MOVES[#MOVES]) do
        -- foreach player move
        for _, M in ipairs(MS) do
            local a, fr, to = unpack(M)
            S2[p][to] = a
        end
    end

    -- now decides who owns each country
    for c=1, #MAP do
        while true do   -- until single owner
            local A = {}    -- { p1, p2, p3, ... } (#armies)
            local o         -- original owner
            local n = 0
            local min = 999
            for p=1, #PLAYERS do
                A[p] = S2[p][c]     -- # of moved armies
                if A[p] < min then
                    min = A[p]      -- min # of moved armies
                end
                if S1[p][c] > 0 then
                    o = p
                end
                if A[p] > 0 then
                    n = n + 1       -- # of contesters
                end
print(c, p, A[p], A[p]>0, n)
            end

            assert(n > 0)
            if n == 1 then
                break
            end

            -- shared country: fight!
            for p, a in ipairs(A) do
                local dice = {}
                A[p] = dice
                for i=1, a do
                    dice[#dice+1] = math.random(6)
                    if p == o then  -- defense bonus
                        dice[#dice] = dice[#dice] + 0.5
                    end
                end
                table.sort(dice, -- A[p] = { 6,6,5,3,1 }
                    function (n1,n2)
                        return n1 > n2
                    end)
print(c,p,a, '//', unpack(dice))
            end

            -- compare up to the least # of armies
            for i=1, min do
                local wv = 0    -- win value
                local wp        -- win player
                for p=1, #PLAYERS do
                    local v = A[p][i] or 0
                    if v > wv then
                        wv = v
                        wp = p
                    end
                end

                for p=1, #PLAYERS do
                    if S2[p][c]>0 and p~=wp then
                        S2[p][c] = S2[p][c] - 1
                    end
                end
            end
        end
    end

    -- prepares next moves
    MOVES[#MOVES+1] = {}
end

local function table2string (t, tab, cache)
    tab = tab or 0
    cache = cache or {}     -- refuse cycles

    local ret = {}

    for k, v in pairs(t) do
        assert(type(k) == 'number'  or
               type(k) == 'string'  or
               type(k) == 'boolean')
        assert(type(v) == 'number'  or
               type(v) == 'string'  or
               type(v) == 'boolean' or
               type(v) == 'table')
        if type(v) == 'table' then
            assert(not cache[v])
            cache[v] = true
        end

        if type(k) == 'string' then
            k = '"'..k..'"'
        end

        if type(v) == 'string' then
            v = '"'..v..'"'
        elseif type(v) == 'table' then
            v = table2string(v, tab+4, cache)
        end

        ret[#ret+1] = string.rep(' ',tab+4)..'['..k..'] = '..v..','
    end

    return '{\n'..table.concat(ret,'\n')..'\n'..string.rep(' ',tab)..'}'
end

function SRV_save (file)
    local f = assert(io.open(file, 'w'))
    f:write('PLAYERS = '..table2string(PLAYERS)..'\n')
    f:write('STATES  = '..table2string(STATES)..'\n')
    f:write('MOVES   = '..table2string(MOVES)..'\n')
    f:close()
end
