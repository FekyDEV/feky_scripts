--[[
    #####################################################################
    #                                                                   #
    #                 feky_anticheat - FekyDEV - 16-03-2022             #
    #                                                                   #
    #####################################################################
]]--

CreateThread(function()
    local currWeapon = 0
    local fireWeapon = nil
    local fireCount = 0

    local first_count = 0 -- INF AMMO
    local count1 = 0      -- INF AMMO
    local count2 = 0      -- INF AMMO
    local make_sure = 0   -- INF AMMO

    local gattcha = false -- wallhack


    while true do
        Wait(1)
    
        local playerped = GetPlayerPed(PlayerId())

        -- Wallhack
        local wallhack = GetUsingseethrough(playerped)

        if gattcha == false then
            if wallhack == 1 then
                print("Definitly cheater!")
                gattcha = true
            end  
        end


        -- Infinity Ammo
        if IsPedShooting(playerped) then
            fireWeapon = GetSelectedPedWeapon(playerped)
            fireCount = fireCount + 1
            local ammo = GetAmmoInPedWeapon(playerped, fireWeapon)

            if first_count == 0 then
                first_count = (first_count + 1)
                if count1 == 0 then
                    count1 = ammo
                    --print("1.Strela = "..count1)
                end
            else
                if count2 == 0 and count1 > 0 then
                    count2 = ammo
                    --print("2.Strela = "..count2)

                    if count2 >= count1 then

                        make_sure = (make_sure + 1)
                        
                        if make_sure < 3 then
                            print("Analyzing..." .. make_sure.."/2")
                            first_count = 0
                            count1 = 0
                            count2 = 0
                        elseif make_sure == 3 then
                            print("Result = Definitly cheater!")
                        end
                        
                    else 
                        print("Result = Nothing")
                        first_count = 0
                        count1 = 0
                        count2 = 0
                    end
                end
            end

        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)

            SetTextFont(0)
            SetTextProportional(1)
            SetTextScale(0.0, 0.3)
            SetTextColour(128, 255, 128, 500)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString("Protection -> ENABLED")
            DrawText(0.005, 0.005)
end
end)
