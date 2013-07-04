function AI_move (me)
    local M = {}
    MOVES[#MOVES][me] = M

    local S = STATES[#STATES][me]
    for c1, a in ipairs(S) do
        if a > 1 then       -- I have at least 2 in "c", attack
            local t = {}
            for c2, isN in ipairs(MAP.borders[c1]) do
                if isN==1 and S[c2]==0 then
                    t[#t+1] = c2    -- (is neighbour) and (not mine)
                end
            end
            -- attack w/ all armies, from c1, to random c2
            M[#M+1] = { a-1, c1, t[ math.random(#t) ] }
        end
    end
end
