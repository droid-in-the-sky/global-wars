MAP = {
    -- NORTH AMERICA

    {
        name    = 'Alaska',
        center  = { 190,170 },
        points  = { 120,200, 150,220, 200,200, 250,210, 240,150, 180,140 },
        borders = { 'Northern', 'Alberta' }
    },
    {
        name    = 'Northern',
        center  = { 320,180 },
        points  = { 240,150, 250,210, 390,210, 400,170 },
        borders = { 'Alaska', 'Alberta', 'Ontario', 'Greenland' }
    },
    {
        name    = 'Alberta',
        center  = { 310,240 },
        points  = { 250,210, 270,280, 370,280, 370,210 },
        borders = { 'Alaska', 'Northern', 'Ontario', 'California' }
    },
    {
        name    = 'Ontario',
        center  = { 410,250 },
        points  = { 370,210, 400,220, 460,270, 460,300, 390,280, 370,280 },
        borders = { 'Northern', 'Alberta', 'California', 'New York', 'Quebec', 'Greenland' }
    },
    {
        name    = 'California',
        center  = { 320,320 },
        points  = { 390,280, 370,280, 270,280, 260,330, 270,370, 330,380, 360,340, 390,330 },
        borders = { 'Alberta', 'Ontario', 'New York', 'Mexico' }
    },
    {
        name    = 'New York',
        center  = { 420,340 },
        points  = { 390,280, 390,330, 360,340, 330,380, 340,390, 420,380, 500,300, 460,300 },
        borders = { 'Ontario', 'California', 'Quebec', 'Mexico' }
    },
    {
        name    = 'Quebec',
        center  = { 500,260 },
        points  = { 500,300, 460,300, 460,270, 490,210, 560,260  },
        borders = { 'Ontario', 'New York', 'Greenland' }
    },
    {
        name    = 'Greenland',
        center  = { 610,120 },
        points  = { 580,240, 520,110, 620,60, 690,90, 660,170 },
        borders = { 'Northern', 'Ontario', 'Quebec', 'Iceland', }
    },
    {
        name    = 'Mexico',
        center  = { 330,420 },
        points  = { 270,370, 330,380, 340,390, 340,420, 380,430, 370,480, 310,430  },
        borders = { 'California', 'New York', 'Venezuela' }
    },

    -- SOUTH AMERICA

    {
        name    = 'Venezuela',
        center  = { 410,490 },
        points  = { 370,480, 370,520, 410,540, 450,510, 510,500, 450,460 },
        borders = { 'Mexico', 'Peru', 'Brazil' }
    },
    {
        name    = 'Peru',
        center  = { 440,610 },
        points  = { 370,520, 410,540, 390,560, 420,580, 450,580, 500,660, 
    420,630, 360,560 },
        borders = { 'Venezuela', 'Argentina', 'Brazil' }
    },
    {
        name    = 'Brazil',
        center  = { 510,570 },
        points  = { 410,540, 390,560, 420,580, 450,580, 500,660, 490,690, 510,700, 530,660, 560,640, 590,550, 520,520, 510,500, 450,510 },
        borders = { 'Venezuela', 'Argentina', 'Peru', 'Algeria' }
    },
    {
        name    = 'Argentina',
        center  = { 440,710 },
        points  = { 420,630, 500,660, 490,690, 510,700, 480,740, 450,760, 440,850, 400,800 },
        borders = { 'Brazil', 'Peru' }
    },

    -- AFRICA

    {
        name    = 'Algeria',
        center  = { 700,510 },
        points  = { 740,600, 770,600, 770,570, 800,550, 800,500, 740,470, 730,400, 650,420, 620,520, 660,580, 720,580 },
        borders = { 'Brazil', 'Congo', 'Sudan', 'Egypt', 'Italy', 'Spain' },
    },
    {
        name    = 'Congo',
        center  = { 800,620 },
        points  = { 740,600, 770,600, 770,570, 800,550, 820,590, 860,600, 830,660, 810,680, 740,630, },
        borders = { 'Algeria', 'South Africa', 'Sudan' }
    },
    {
        name    = 'South Africa',
        center  = { 810,750 },
        points  = { 740,630, 810,680, 830,660, 880,680, 880,710, 860,730, 840,810, 780,830, 750,720 },
        borders = { 'Congo', 'Sudan', 'Madagascar' }
    },
    {
        name    = 'Sudan',
        center  = { 880,570 },
        points  = { 800,500, 800,550, 820,590, 860,600, 830,660, 880,680, 880,640, 940,550, 900,560, 860,490 },
        borders = { 'Congo', 'South Africa', 'Algeria', 'Egypt', 'Madagascar' }
    },
    {
        name    = 'Egypt',
        center  = { 800,460 },
        points  = { 730,400, 780,430, 840,430, 860,490, 800,500, 740,470 },
        borders = { 'Algeria', 'Sudan', 'Saudi Arabia' },
    },
    {
        name    = 'Madagascar',
        center  = { 900,750 },
        points  = { 920,700, 910,760, 890,770, 890,750 },
        borders = { 'Sudan', 'South Africa' },
    },

    -- EUROPE

    {
        name    = 'Italy',
        center  = { 760,350 },
        points  = { 800,360, 790,400, 780,360, 740,340, 770,380, 730,350, 710,350, 720,320, 760,320, 780,340, 790,310, 810,340 },
        borders = { 'Egypt', 'Saudi Arabia', 'Algeria', },
    },
    {
        name    = 'Spain',
        center  = { 670,370 },
        points  = { 720,320, 680,320, 690,350, 650,360, 650,390, 690,390, 710,350 },
        borders = { 'Italy', 'Algeria', 'England', 'Germany' },
    },
    {
        name    = 'England',
        center  = { 690,290 },
        points  = { 700,300, 670,310, 680,250 },
        borders = { 'Italy', 'Germany' },
    },
    {
        name    = 'Germany',
        center  = { 750,290 },
        points  = { 700,310, 730,280, 780,280, 790,310, 780,340, 760,320, 720,320, 700,310 },
        borders = { 'Italy', 'Spain', 'England' },
    },
    {
        name    = 'Iceland',
        center  = { 650,210 },
        points  = { 670,210, 670,220, 630,220, 630,210 },
        borders = { 'Greenland', 'England', 'Scandinavia' },
    },
    {
        name    = 'Scandinavia',
        center  = { 750,210 },
        points  = { 710,230, 750,180, 800,160, 810,230, 780,240, 780,200, 760,230, 750,260, 710,230 },
        borders = { 'Germany', 'England', 'Iceland' },
    },
    {
        name    = 'Ukraine',
        center  = { 870,260 },
        points  = { 780,280, 790,310, 810,340, 850,320, 870,370, 900,380, 890,340, 900,330, 890,310, 900,300, 960,290, 960,270, 950,260, 950,180, 900,180, 850,210, 830,210, 820,190, 850,190, 800,160, 810,230 },
        borders = { 'Germany', 'Italy', 'Scandinavia', 'Saudi Arabia', 'Afghanistan' },
    },

    -- ASIA

    {
        name    = 'Saudi Arabia',
        center  = { 890,410 },
        points  = { 840,430, 910,540, 970,480, 910,450, 980,460, 970,400, 940,390, 920,400, 900,380, 870,370, 800,360, 810,400, 850,400  },
        borders = { 'Egypt', 'Ukraine', 'Afghanistan', 'India' },
    },
    {
        name    = 'Afghanistan',
        center  = { 970,330 },
        points  = { 950,220, 950,260, 960,270, 960,290, 900,300, 890,310, 900,330, 920,330, 940,390, 970,400, 1020,390, 1040,320 },
        borders = { 'Ukraine', 'Saudi Arabia', 'Ural', 'India', 'China' },
    },
    {
        name    = 'Ural',
        center  = { 990,230 },
        points  = { 960,150, 950,180, 950,220, 1040,320, 1060,310, 1020,270, 1030,250 },
        borders = { 'Ukraine', 'Afghanistan', 'Siberia', 'China' },
    },
    {
        name    = 'Siberia',
        center  = { 1050,190 },
        points  = { 1060,110, 1130,140, 1100,180, 1120,230, 1100,270, 1070,250, 1050,260, 1070,290, 1070,320, 1020,270, 1030,250, 960,150 },
        borders = { 'Ural', 'China', 'Mongolia' },
    },
    {
        name    = 'India',
        center  = { 1040,460 },
        points  = { 1020,390, 1040,420, 1120,450, 1090,480, 1050,560, 1020,480, 980,460, 970,400 },
        borders = { 'Saudi Arabia', 'Afghanistan', 'China', 'Vietnam' },
    },
    {
        name    = 'China',
        center  = { 1120,390 },
        points  = { 1060,310, 1110,350, 1200,360, 1230,430, 1200,470, 1120,450, 1040,420, 1020,390, 1040,320 },
        borders = { 'India', 'Afghanistan', 'Ural', 'Siberia', 'Vietnam', 'Mongolia' },
    },
    {
        name    = 'Vietnam',
        center  = { 1150,490 },
        points  = { 1120,450, 1200,470, 1170,480, 1200,530, 1190,550, 1160,520, 1150,540, 1140,500, 1100,470 },
        borders = { 'India', 'China' },
    },
    {
        name    = 'Mongolia',
        center  = { 1170,320 },
        points  = { 1180,270, 1210,270, 1240,300, 1230,350, 1250,380, 1220,360, 1200,360, 1110,350, 1070,320, 1070,290, 1180,300 },
        borders = { 'China', 'Siberia', 'Japan' },
    },
    {
        name    = 'Tchita',
        center  = { 1170,250 },
        points  = { 1190,220, 1200,250, 1240,280, 1240,300, 1210,270, 1180,270, 1180,300, 1070,290, 1050,260, 1070,250, 1100,270, 1120,230, 1150,220 },
        borders = { 'Siberia', 'Mongolia' },
    },
    {
        name    = 'XXXX',
        center  = { 1180,180 },
        points  = { 1130,140, 1100,180, 1120,230, 1150,220, 1190,220, 1200,250, 1220,200, 1250,200, 1240,170, 1270,150 },
        borders = { 'Siberia', 'Tchita' },
    },
    {
        name    = 'Vladivostok',
        center  = { 1290,180 },
        points  = { 1200,250, 1220,200, 1250,200, 1240,170, 1270,150, 1320,150, 1370,170, 1370,190, 1340,170, 1340,200, 1300,220, 1310,280, 1290,250, 1290,200, 1260,220, 1230,220, 1220,250, 1250,260, 1260,300, 1230,350, 1240,300, 1240,280 },
        borders = { 'Mongolia', 'Tchita', 'XXXX', 'Japan' },
    },
    {
        name    = 'Japan',
        center  = { 1280,370 },
        points  = { 1290,330, 1300,370, 1270,400, 1280,380, 1280,330 },
        borders = { 'Vladivostok', 'Mongolia' },
    },

    -- OCEANIA

    {
        name    = 'Sumatra',
        center  = { 1180,620 },
        points  = { 1140,570, 1200,620, 1200,630, 1190,640 },
        borders = { 'Vietnam', 'Australia' },
    },
    {
        name    = 'Borneo',
        center  = { 1220,590 },
        points  = { 1240,560, 1230,620, 1210,610, 1200,590, 1230,560 },
        borders = { 'Vietnam', 'Australia' },
    },
    {
        name    = 'New Guinea',
        center  = { 1330,620 },
        points  = { 1320,600, 1370,630, 1340,640, 1300,600 },
        borders = { 'Borneo', 'Australia' },
    },
    {
        name    = 'Australia',
        center  = { 1300,730 },
        points  = { 1350,660, 1360,700, 1400,740, 1380,810, 1350,830, 1320,820, 1290,780, 1210,810, 1190,730, 1290,660, 1340,690 },
        borders = { 'Borneo', 'Sumatra', 'New Guinea' },
    },

    lines = {
        { 400,190,   530,140 },  -- ? => greenland
        { 430,240,   540,160 },  -- ontario => greenland
        { 550,250,   570,230 },  -- quebec => greenland
        { 600,560,   620,540 },  -- Brazil => Algeria
        { 720,390,   710,370 },  -- Algeria => Spain
        { 730,390,   740,370 },  -- Algeria => Italy
        { 860,780,   880,770 },  -- South Africa => Madagascar
        { 890,660,   910,700 },  -- Sudan => Madagascar
        { 780,420,   770,390 },  -- Egypt   => Italy
        { 680,220,   700,230 },  -- Iceland => Scandinavia
        { 650,230,   670,250 },  -- Iceland => England
        { 1260,320, 1270,340 },  -- Vladivostok => Japan
        { 1240,350, 1270,360 },  -- Mongolia => Japan
        { 1200,650, 1210,700 },  -- Sumatra => Australia
        { 1240,620, 1260,660 },  -- Borneo => Australia
        { 1310,620, 1300,650 },  -- New Guinea => Australia
        { 1160,570, 1170,540 },  -- New Guinea => Vietnam
        { 1210,570, 1200,550 },  -- Borneo => Vietnam
        { 1240,600, 1290,600 },  -- Borneo => New Guinea
    },

    continents = {
        [1] = { 'Alaska', 'Northern', 'Alberta', 'Ontario', 'California', 'Mexico', 'New York', 'Quebec', 'Greenland',
            color = { 0xCC, 0x00, 0x00 },
        },
        [2] = { 'Venezuela', 'Peru', 'Argentina', 'Brazil',
            color = { 0x00, 0xCC, 0x00 },
        },
        [3] = { 'Algeria', 'Congo', 'South Africa', 'Sudan', 'Egypt', 'Madagascar',
            color = { 0xCC, 0x00, 0xCC },
        },
        [4] = { 'Italy', 'Spain', 'England', 'Germany', 'Iceland', 'Scandinavia', 'Ukraine',
            color = { 0x00, 0x00, 0xCC },
        },
        [5] = { 'Saudi Arabia', 'Afghanistan', 'Ural', 'Siberia', 'India', 'China', 'Vietnam', 'Mongolia', 'Tchita', 'XXXX', 'Vladivostok', 
'Japan',
            color = { 0xCC, 0xCC, 0x00 },
        },
        [6] = { 'Sumatra', 'Borneo', 'New Guinea', 'Australia',
            color = { 0xCC, 0x00, 0x00 },
        },
    },
}

dofile 'map.lua'
