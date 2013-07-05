-- make a move for player "p"
function AI_move (p)
    local MSp = {
        -- { a, fr, to, },
        -- { a, fr, to, },
    }

    -- my current state (armies on each country)
    local S = STATES[#STATES][p]

    -- for each country
    for c1, a in ipairs(S) do
        if a > 1 then       -- I have at least 2 in "c", attack
            local t = {}    -- hold "to" possibilites from "c"

            -- for each "c2" in "c1" border
            for c2, isN in ipairs(MAP.borders[c1]) do
                if isN==1 and S[c2]==0 then
                    t[#t+1] = c2    -- (is neighbour) and (not mine)
                end
            end

            -- attack w/ all armies, from c1, to random c2
            if #t > 0 then
                MSp[#MSp+1] = { a-1, c1, t[ math.random(#t) ] }
            end
        end
    end

    return MSp
end
