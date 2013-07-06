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
                local att = {}  -- hold "attacking" possibilites from "c"
                local mov = {}  -- hold "moving"    possibilites from "c"

                -- for each "c2" in "c1" border
                for c2, isN in ipairs(MAP.borders[c1]) do
                    if isN == 1 then        -- is neighbour
                        if Sp[c2] == 0 then -- not mine: attack
                            att[#att+1] = c2
                        else                --  is mine: move
                            mov[#mov+1] = c2
                        end
                    end
                end

                local c2, aa
                if #att > 0 then
                    -- attack w/ all from c1, to random c2
                    c2 = att[ math.random(#att) ]
                    aa = a - 1
--print('att', aa, c1, c2)
                elseif #mov > 0 then
                    -- move random a from c1, to random c2
                    c2 = mov[ math.random(#mov) ]
                    aa = math.random(a-1)
--print('mov', aa, c1, c2)
                end
                MSp[#MSp+1] = { aa, c1, c2 }
            end
        end
    end
    return MSp
end
