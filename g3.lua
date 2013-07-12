if __ANDROID__ then
    dofile '/data/data/org.droid_in_the_sky.global_wars/lib/lib_lua_map2.so'
else
    dofile 'map2.lua'
end

PLAYERS = {
    [1] = {
        type  = 'human',
        color = { 0xFF, 0x00, 0x00 },
    },
    [2] = {
        type  = 'ai',
        color = { 0x00, 0x00, 0xFF },
    },
    [3] = {
        type  = 'ai',
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
