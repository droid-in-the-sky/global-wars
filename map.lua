MAP = {
    [1] = {
        center = { 90,40 },
        points = { 50,50, 80,10, 110,30, 130,70 },
    },
    [2] = {
        center = { 90,85 },
        points = { 50,50, 130,70, 100,120, 30,100 },
    },
    [3] = {
        center = { 130,85 },
        points = { 130,70, 180,60, 100,120 },
    },
    [4] = {
        center = { 125,150 },
        points = { 30,100, 100,120, 180,60, 180,200, 100,230 }
    },
}

function map2t ()
    local t = {
        ns = {},    -- { 4, 5, 2 } number of points of each country
        xs = {},    -- { a,b,c,d , a,b,c,e,f, a,b }
        ys = {},    -- { a,b,c,d , a,b,c,e,f, a,b }
    }
    for i, c in ipairs(MAP) do
        t.ns[i] = #c.points / 2
        assert(t.ns[i] <= 10)        -- Ceu: "var u16[10] xs, ys";
print('#', t.ns[i])
        for j, v in ipairs(c.points) do
            if j%2 == 1 then
                t.xs[#t.xs+1] = v
print(v)
            else
                t.ys[#t.ys+1] = v
            end
        end
    end
    return t
end

TMAP = map2t(MAP)

function xs ()
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

function ys ()
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
