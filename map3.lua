MAP = {
    -- NORTH AMERICA

    [1] = {     -- alaska
        center = { 45,55 },
        points = { 10,10, 80,10, 80,100, 10,100 },
        color  = nil,    -- filled below
    },
    [2] = {     -- ?
        center = { 150,40 },
        points = { 80,10, 220,10, 220,70, 80,70 },
        color  = nil,    -- filled below
    },
    [3] = {     -- vancouver
        center = { 130,95 },
        points = { 80,70, 180,70, 180,120, 80,120 },
        color  = nil,    -- filled below
    },
    [4] = {     -- california
        center = { 140,160 },
        points = { 80,120, 200,120, 200,200, 80,200 },
        color  = nil,    -- filled below
    },
    [5] = {     -- mexico
        center = { 130,260 },
        points = { 80,200, 160,200, 160,320, 100,320 },
        color  = nil,    -- filled below
    },
    [6] = {     -- new york
        center = { 240,185 },
        points = { 200,120, 300,120, 250,250, 160,250, 160,200, 200,200 },
        color  = nil,    -- filled below
    },
    [7] = {     -- ottawa
        center = { 225,95 },
        points = { 180,70, 270,70, 270,120, 180,120 },
        color  = nil,    -- filled below
    },
    [8] = {     -- quebec
        center = { 310,95 },
        points = { 270,70, 400,70, 300,120, 270,120 },
        color  = nil,    -- filled below
    },
    [9] = {     -- greenland
        center = { 355,30 },
        points = { 300,0, 410,0, 410,60, 300,60 },
        color  = nil,    -- filled below
    },

    -- SOUTH AMERICA
    -- { 210,340, 350,440, 250,640, 90,440 },

    [10] = {    -- venezuela
        center = { 205,375 },
        points = { 210,340, 270,390, 180,410, 130,400 },
        color  = nil,    -- filled below
    },
    [11] = {    -- peru
        center = { 122,447 },
        points = { 180,410, 130,400, 90,440, 120,510, 190,515, 140,450 },
        color  = nil,    -- filled below
    },
    [12] = {    -- argentina
        center = { 195,570 },
        points = { 120,510, 190,515, 270,600, 250,640 },
        color  = nil,    -- filled below
    },
    [13] = {    -- brazil
        center = { 250,480 },
        points = { 270,600, 350,440, 270,390, 180,410, 140,450, 190,515 },
        color  = nil,    -- filled below
    },
    borders = {
        { 0, 1, 1, 0, 0, 0, 0, 0, 0 },          -- alaska
        { 1, 0, 1, 0, 0, 0, 1, 0, 1 },          -- ?
        { 1, 1, 0, 1, 0, 0, 1, 0, 0 },          -- vancouver
        { 0, 0, 1, 0, 1, 1, 1, 0, 0 },          -- california
        { 0, 0, 0, 1, 0, 1, 0, 0, 0, [10]=1 },  -- mexico
        { 0, 0, 0, 1, 1, 0, 1, 1, 0 },          -- new york
        { 0, 1, 1, 1, 0, 1, 0, 1, 1 },          -- ottawa
        { 0, 0, 0, 0, 0, 1, 1, 0, 1 },          -- quebec
        { 0, 1, 0, 0, 0, 0, 1, 1, 0 },          -- greenland

        { 0,0,0,0,1,0,0,0,0,
          0, 1, 0, 1, },        -- venezuela
        { 0,0,0,0,0,0,0,0,0,
          1, 0, 1, 1 },         -- peru
        { 0,0,0,0,0,0,0,0,0,
          0, 1, 0, 1 },         -- argentina
        { 0,0,0,0,0,0,0,0,0,
          1, 1, 1, 0 },         -- brazil
    },

    continents = {
        [1] = { 1, 2, 3, 4, 5, 6, 7, 8, 9,
            color = { 0xCC, 0x00, 0x00 },
        },
        [2] = { 10, 11, 12, 13,
            color = { 0x00, 0xCC, 0x00 },
        },
    },
}

dofile 'map.lua'
