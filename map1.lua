MAP = {
    [1] = {
        center = { 90,40 },
        points = { 50,50, 80,10, 110,30, 130,70 },
        color  = nil,    -- filled below
    },
    [2] = {
        center = { 90,85 },
        points = { 50,50, 130,70, 100,120, 30,100 },
        color  = nil,    -- filled below
    },
    [3] = {
        center = { 130,85 },
        points = { 130,70, 180,60, 100,120 },
        color  = nil,    -- filled below
    },
    [4] = {
        center = { 125,150 },
        points = { 30,100, 100,120, 180,60, 180,200, 100,230 },
        color  = nil,    -- filled below
    },

    borders = {
        { 0, 1, 0, 0 },
        { 1, 0, 1, 1 },
        { 0, 1, 0, 1 },
        { 0, 1, 1, 0 },
    },

    continents = {
        [1] = { 1, 2, 3,
            color = { 0xFF, 0xFF, 0x00 },
        },
        [2] = { 4,
            color = { 0x00, 0xFF, 0xFF },
        },
    },
}

dofile 'map.lua'
