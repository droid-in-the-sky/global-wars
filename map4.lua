MAP = {
    -- NORTH AMERICA

    [1] = {
        name    = 'Alaska',
        center  = { 190,170 },
        points  = { 120,200, 150,220, 200,200, 250,210, 240,150, 180,140 },
        borders = { 'Northern', 'Alberta' }
    },
    [2] = {
        name    = 'Northern',
        center  = { 320,180 },
        points  = { 240,150, 250,210, 390,210, 400,170 },
        borders = { 'Alaska', 'Alberta', 'Ontario', 'Greenland' }
    },
    [3] = {
        name    = 'Alberta',
        center  = { 310,240 },
        points  = { 250,210, 270,280, 370,280, 370,210 },
        borders = { 'Alaska', 'Northern', 'Ontario', 'California' }
    },
    [4] = {
        name    = 'Ontario',
        center  = { 410,250 },
        points  = { 370,210, 400,220, 460,270, 460,300, 390,280, 370,280 },
        borders = { 'Northern', 'Alberta', 'California', 'New York', 
    'Quebec', 'Greenland' }
    },
    [5] = {
        name    = 'California',
        center  = { 320,320 },
        points  = { 390,280, 370,280, 270,280, 260,330, 270,370, 330,380, 
    360,340, 390,330 },
        borders = { 'Alberta', 'Ontario', 'New York', 'Mexico' }
    },
    [6] = {
        name    = 'New York',
        center  = { 420,340 },
        points  = { 390,280, 390,330, 360,340, 330,380, 340,390, 420,380, 
    500,300, 460,300 },
        borders = { 'Ontario', 'California', 'Quebec', 'Mexico' }
    },
    [7] = {
        name    = 'Quebec',
        center  = { 500,260 },
        points  = { 500,300, 460,300, 460,270, 490,210, 560,260  },
        borders = { 'Ontario', 'New York', 'Greenland' }
    },
    [8] = {
        name    = 'Greenland',
        center  = { 610,120 },
        points  = { 580,240, 520,110, 620,60, 690,90, 660,170 },
        borders = { 'Northern', 'Ontario', 'Quebec' }
    },
    [9] = {
        name    = 'Mexico',
        center  = { 330,420 },
        points  = { 270,370, 330,380, 340,390, 340,420, 380,430, 370,480, 
    310,430  },
        borders = { 'California', 'New York', 'Venezuela' }
    },


    [10] = {
        name    = 'Venezuela',
        center  = { 410,490 },
        points  = { 370,480, 370,520, 410,540, 450,510, 510,500, 450,460 },
        borders = { 'Mexico', 'Peru', 'Brazil' }
    },
    [11] = {
        name    = 'Peru',
        center  = { 440,610 },
        points  = { 370,520, 410,540, 390,560, 420,580, 450,580, 500,660, 
    420,630, 360,560 },
        borders = { 'Venezuela', 'Argentina', 'Brazil' }
    },
    [12] = {
        name    = 'Brazil',
        center  = { 510,570 },
        points  = { 410,540, 390,560, 420,580, 450,580, 500,660, 490,690, 510,700, 530,660, 560,640, 590,550, 520,520, 510,500, 450,510 },
        borders = { 'Venezuela', 'Argentina', 'Peru', 'Argelia' }
    },
    [13] = {
        name    = 'Argentina',
        center  = { 440,710 },
        points  = { 420,630, 500,660, 490,690, 510,700, 480,740, 450,760, 
    440,850, 400,800 },
        borders = { 'Brazil', 'Peru' }
    },

    [14] = {
        name    = 'Argelia',
        center  = { 700,510 },
        points  = { 740,600, 770,600, 770,570, 800,550, 800,500, 740,470, 730,400, 650,420, 620,520, 660,580, 720,580 },
        borders = { 'Brazil', 'Congo', 'Sudan', 'Egypt', 'Italy' },
    },
    [15] = {
        name    = 'Congo',
        center  = { 800,620 },
        points  = { 740,600, 770,600, 770,570, 800,550, 820,590, 860,600, 830,660, 810,680, 740,630, },
        borders = { 'Argelia', 'South Africa', 'Sudan' }
    },
    [16] = {
        name    = 'South Africa',
        center  = { 810,750 },
        points  = { 740,630, 810,680, 830,660, 880,680, 880,710, 860,730, 840,810, 780,830, 750,720 },
        borders = { 'Congo', 'Sudan' }--, 'Madagascar' }
    },
    [17] = {
        name    = 'Sudan',
        center  = { 880,570 },
        points  = { 800,500, 800,550, 820,590, 860,600, 830,660, 880,680, 
        880,640, 940,550, 900,560, 860,490 },
        borders = { 'Congo', 'South Africa', 'Argelia', 'Egypt' }--, 'Madagascar' }
    },
    [18] = {
        name    = 'Egypt',
        center  = { 800,460 },
        points  = { 730,400, 780,430, 840,430, 860,490, 800,500, 740,470 },
        borders = { 'Argelia', 'Sudan', 'Saudi Arabia' },
    },

    [19] = {
        name    = 'Italy',
        center  = { 760,350 },
        points  = { 800,360, 790,400, 780,360, 740,340, 770,380, 730,350, 
        710,350, 720,320, 760,320, 780,340, 790,310, 810,340 },
        borders = { 'Egypt', 'Saudi Arabia', 'Argelia', },
    },

    [20] = {
        name    = 'Saudi Arabia',
        center  = { 890,410 },
        points  = { 840,430, 910,540, 970,480, 910,450, 980,460, 970,400, 
        940,390, 920,400, 900,380, 870,370, 800,360, 810,400, 850,400  },
        borders = { 'Egypt' },
    },

    lines = {
        { 400,190, 530,140 },   -- ? => greenland
        { 430,240, 540,160 },   -- ontario => greenland
        { 550,250, 570,230 },   -- quebec => greenland
        { 590,560, 620,540 },   -- Brazil => Argelia
    },

    continents = {
        [1] = { 'Alaska', 'Northern', 'Alberta', 'Ontario', 'California', 'Mexico', 'New York', 'Quebec', 'Greenland',
            color = { 0xCC, 0x00, 0x00 },
        },
        [2] = { 'Venezuela', 'Peru', 'Argentina', 'Brazil',
            color = { 0x00, 0xCC, 0x00 },
        },
        [3] = { 'Argelia', 'Congo', 'South Africa', 'Sudan', 'Egypt',
            color = { 0xCC, 0x00, 0xCC },
        },
        [4] = { 'Italy',
            color = { 0x00, 0x00, 0xCC },
        },
        [5] = { 'Saudi Arabia',
            color = { 0xCC, 0xCC, 0x00 },
        },
    },
}

dofile 'map.lua'
