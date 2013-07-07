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
    [1] = {
        type = 'fortify',
        [1] = { 0, 2, 2, 0, },  -- 0 armies in country 1
        [2] = { 1, 0, 0, 3, },  -- 3 armies in country 4
    },
}

MOVES = {
}
