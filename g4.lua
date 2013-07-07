dofile 'map1.lua'

PLAYERS = {
    [1] = {
        type  = 'human',
        color = { 0xFF, 0x00, 0x00 },
    },
    [2] = {
        type  = 'ai',
        color = { 0x00, 0x00, 0xFF },
    },
}

STATES = {
    {
        type = 'fortify',
        [1] = { 0, 2, 2, 0, },  -- 0 armies in country 1
        [2] = { 1, 0, 0, 3, },  -- 3 armies in country 4
    },
    {
        type = 'fortifying',
        [1] = { 0, 2, 2, 0, },
        [2] = { 1, 0, 0, 3, },
    },
    {
        type = 'attack',
        [1] = { 0, 3, 3, 0, },
        [2] = { 1, 0, 0, 5, },
    },
}

MOVES = {
    {
        --type = 'fortify',
        [1] = {
            { 1, 0, 2 },    -- 1 armies to country 2
            { 1, 0, 3 },    -- 1 armies to country 3
        },
        [2] = {
            { 2, 0, 4 },    -- 2 armies to country 4
        },
    },
}
