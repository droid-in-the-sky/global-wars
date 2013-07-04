PLAYERS = {
    [1] = {
        color = { 0xFF, 0x00, 0x00 },
    },
    [2] = {
        color = { 0x00, 0x00, 0xFF },
    },
}

STATES = {
    {
        [1] = { 0, 2, 2, 0, },  -- 0 armies in country 1
        [2] = { 1, 0, 0, 3, },  -- 3 armies in country 4
    },
    {
        [1] = { 0, 1, 0, 0, },
        [2] = { 1, 0, 2, 1, },
    },
    {
        [1] = { 0, 0, 0, 0, },
        [2] = { 1, 1, 1, 1, },
    },
}

MOVES = {
    {
        [1] = {
            { 1, 2, 1 },    -- 1 armies from country 2 to 1
        },
        [2] = {
            { 2, 4, 3 },    -- 2 armies from country 4 to 3
        },
    },
    {
        [1] = {
        },
        [2] = {
            { 1, 3, 2 },    -- 1 armies from country 3 to 2
        },
    },
}

function moves ()
    -- foreach player
    for p, ms in ipairs(MOVES) do
        -- foreach move of a player
        for _, m in ipairs(ms) do
            local a, fr, to = unpack(m)
            assert(STATE[p][fr] > a)    -- at least "a+1" to move "a"
            STATE[p][fr] = STATE[p][fr] - a;
        end
    end
end
