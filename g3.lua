if __ANDROID__ then
    dofile '/data/data/org.droid_in_the_sky.global_wars/lib/lib_lua_map2.so'
else
    dofile 'map2.lua'
end

PLAYERS = {
    'human',
    'ai',
    'ai',
    false,
    false,
    false,
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
