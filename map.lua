for idx, C in ipairs(MAP) do
    MAP[C.name] = C     -- ['Brazil'] = C
    C.idx = idx
end

-- fill all countries colors from continents
for _, C in ipairs(MAP.continents) do
    for _, name in ipairs(C) do
        assert(not MAP[name].color)
        MAP[name].color = C.color
    end
end

TMAP = {
    ns = {},    -- { 4, 5, 2 } number of points of each country
    xs = {},    -- { a,b,c,d , a,b,c,e,f, a,b }
    ys = {},    -- { a,b,c,d , a,b,c,e,f, a,b }
}
for c, C in ipairs(MAP) do
    TMAP.ns[c] = #C.points / 2
    assert(TMAP.ns[c] <= 25)        -- Ceu: "var u16[25] xs, ys";
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
    for _, C in ipairs(MAP) do
        for _, name in ipairs(C.borders) do
            BORDERS[#BORDERS+1] = { C.center, MAP[name].center }
        end
    end
