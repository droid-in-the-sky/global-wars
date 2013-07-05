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

-- fill all countries colors from continents
for x, X in ipairs(MAP.continents) do
    for _, c in ipairs(X) do
        assert(not MAP[c].color)
        MAP[c].color = X.color
    end
end

TMAP = {
    ns = {},    -- { 4, 5, 2 } number of points of each country
    xs = {},    -- { a,b,c,d , a,b,c,e,f, a,b }
    ys = {},    -- { a,b,c,d , a,b,c,e,f, a,b }
}
for c, C in ipairs(MAP) do
    TMAP.ns[c] = #C.points / 2
    assert(TMAP.ns[c] <= 10)        -- Ceu: "var u16[10] xs, ys";
--print('#', TMAP.ns[c])
    for j, v in ipairs(C.points) do
        if j%2 == 1 then
            TMAP.xs[#TMAP.xs+1] = v
--print(v)
        else
            TMAP.ys[#TMAP.ys+1] = v
        end
    end
end

function xs_min_max ()
    local xmin = TMAP.xs[1]
    local xmax = TMAP.xs[1]
    for _, x in ipairs(TMAP.xs) do
        if x < xmin then
            xmin = x
        elseif x > xmax then
            xmax = x
        end
    end
    return xmin,xmax
end

function ys_min_max ()
    local ymin = TMAP.ys[1]
    local ymax = TMAP.ys[1]
    for _, y in ipairs(TMAP.ys) do
        if y < ymin then
            ymin = y
        elseif y > ymax then
            ymax = y
        end
    end
    return ymin,ymax
end

local _R = 10

function MAP_vspoint (x, y)
    for c, C in ipairs(MAP) do
        local _x, _y = unpack(C.center)
        if x>(_x-_R) and x<(_x+_R) and
           y>(_y-_R) and y<(_y+_R) then
            return c
        end
    end
    return 0
end

BORDERS = {}
    -- { {p1,p2}, {p3,p4}, ... }
    for i=1, #MAP.borders do
        for j=i+1, #MAP.borders do
            if MAP.borders[i][j] == 1 then
                BORDERS[#BORDERS+1] = { MAP[i].center, MAP[j].center }
            end
        end
    end
