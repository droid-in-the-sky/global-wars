-- make a move for player "p" on state "s"
function AI_move (s, p)
    local MSp = {
        -- { a, fr, to, },
        -- { a, fr, to, },
    }

    -- my current state (armies on each country)
    local S = STATES[s]
    assert(S.type=='fortify' or S.type=='attack', S.type or 'unk')
    local Sp = S[p]

    if S.type == 'fortify' then
        local fs = SRV_fs(S, p)
        while fs > 0 do
            local n = math.random(fs)   -- fortify a random number
            fs = fs - n
            while true do
                local c = math.random(#MAP) --  on a random "c" that I own
                if Sp[c] > 0 then
                    MSp[#MSp+1] = { n, 0, c }
--print('ai', p, n, 0, c)
                    break
                end
            end
        end

    else      -- 'attack'
        -- for each country
        for c1, a in ipairs(Sp) do
            if a > 1 then       -- I have at least 2 in "c", attack
                local t = {}    -- hold "to" possibilites from "c"

                -- for each "c2" in "c1" border
                for c2, isN in ipairs(MAP.borders[c1]) do
                    if isN==1 and Sp[c2]==0 then
                        t[#t+1] = c2    -- (is neighbour) and (not mine)
                    end
                end

                -- attack w/ all armies, from c1, to random c2
                if #t > 0 then
                    MSp[#MSp+1] = { a-1, c1, t[ math.random(#t) ] }
                end
            end
        end
    end

    return MSp
end
