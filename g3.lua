dofile 'map2.lua'

PLAYERS = {
    [1] = {
        color = { 0xFF, 0x00, 0x00 },
    },
    [2] = {
        color = { 0x00, 0x00, 0xFF },
    },
    [3] = {
        color = { 0xFF, 0xFF, 0xFF },
    },
}

STATES = {
    [1] = {
        type = 'fortify',
        [1] = { 0, 3, 3, 0, 0, 0 },  -- 0 armies in country 1
        [2] = { 1, 0, 0, 5, 0, 0 },  -- 5 armies in country 4
        [3] = { 0, 0, 0, 0, 2, 4 },  -- 4 armies in country 6
    },
}

MOVES = {
}
