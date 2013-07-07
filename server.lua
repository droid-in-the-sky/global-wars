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

function SRV_go ()
    assert(#MOVES[#MOVES] == #PLAYERS)

    local S2 = STATES[#STATES]  -- already w/o moved armies
    local S3 = copy(S2)         -- after fortifying/attacking
    STATES[#STATES+1] = S3

    if S2.type == 'fortifying' then
        S3.type = 'attack'
    else
        S3.type = 'fortify'
    end

    -- first move fr=>to (yielding shared countries)
    -- foreach player
    for p, MSp in ipairs(MOVES[#MOVES]) do
        -- foreach player move
        for _, M in ipairs(MSp) do
            local a, fr, to = unpack(M)
--print('srv', p, a, fr, to)
            S3[p][to] = S3[p][to] + a
                -- accumulate (multiple moves from "p" to "to")
        end
    end

    -- now decides who owns each country
    -- foreach country
    for c=1, #MAP do
        while true do   -- until single owner in the country
            local A = {}    -- { p1, p2, p3, ... } (#armies)
            local o         -- original owner
            local n = 0
            for p=1, #PLAYERS do
                A[p] = S3[p][c]     -- # of armies of "p" in "c"
                if S2[p][c] > 0 then
                    o = p           -- owner in previous state
                end
                if A[p] > 0 then
                    n = n + 1       -- # of players in "c"
                end
--print(c, p, A[p], A[p]>0, n)
            end

            assert(n > 0)
            if n == 1 then
                break               -- single owner: stop!
            end

            -- shared country: fight!
            local min = 999
            for p, a in ipairs(A) do
                if a>0 and a<min then
                    min = a         -- find the smallest army
                end
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
--print(c,p,a, '//', unpack(dice))
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
                    if S3[p][c]>0 and p~=wp then
                        S3[p][c] = S3[p][c] - 1
                    end
                end
            end
        end
    end

    return true
end

-- number of "p" armies to fortify on "S"
function SRV_fs (S, p)
    assert(S.type == 'fortify')

    -- # of countries owned by "p"
    local A = 0
    for _,a in ipairs(S[p]) do
        if a > 0 then
            A = A + 1
        end
    end

    local fs = math.floor(A/2)   -- armies = #c/2
    if A>0 and fs<3 then
        fs = 3              -- minimum of 3
    end
    return fs   -- 0 (dead), 3 (minimum), X (#c/2)
end

function SRV_move (p, MSp)
    local fs = SRV_move_ins(p, MSp)
    assert(fs == 0, fs)
end

function SRV_move_rem ()
    STATES[#STATES] = nil
    MOVES [#MOVES]  = nil
end

function SRV_move_inc (T, c)
    for _, t in ipairs(T) do
        local a, fr, to = unpack(t)
        if to == c then
            t[1] = a + 1
            return
        end
    end
    T[#T+1] = { 1, 0, c }
end

function SRV_move_ins (p, MSp)
    --   p: player
    -- MSp: moves of "p"

    local s = #STATES
    if s % 2 == 0 then
        s = s - 1           -- last fortify/attack
    end

    -- S1: current server state on "s"
    local S1 = STATES[s]
    assert(S1.type=='fortify' or S1.type=='attack')

    -- S2: next state after move, before fortify/attack
    local S2

    if s == #STATES then     -- first to move
        S2 = copy(S1)           -- copy from current
        STATES[#STATES+1] = S2  -- new state
        MOVES[#MOVES+1]   = {}  -- new moves
        if S1.type == 'fortify' then
            S2.type = 'fortifying'
        else
            S2.type = 'attacking'
        end
    else                     -- other "p" already moved
        assert(s == #STATES-1)  -- at most 1 behind
        S2 = STATES[#STATES]    -- take ongoing state
    end

    -- MS: moves from all countries on "s"
    assert(not MOVES[#MOVES][p], 'player '..p..' already moved')
    MOVES[#MOVES][p] = MSp

    -- number of armies to fortify
    local fs = 0
    if S1.type == 'fortify' then
        fs = SRV_fs(S1, p)
    end

    -- apply MSp => S2
    -- foreach move in moves
    for _, M in ipairs(MSp) do
        local a, fr, to = unpack(M)

        if fr == 0 then
            assert(S1.type == 'fortify', S1.type)
            fs = fs - a
        else
            assert(S1.type == 'attack')
            assert(S1[p][fr] > a, 'player '..p..' can\'t move from '..fr)
                -- at least "a+1" to move "a"

            -- remove from fr
            S2[p][fr] = S2[p][fr] - a;
--print(p, '('..a..') '..fr..'=>'..to)
        end
    end

    return fs
end
