local vammanen      = 300

local crosshair     = false     --//-- Crosshair päälle tai pois

local veivaus       = 0.0       --//-- Näytön veivaus ampuessa [0.0-1.0]

local isSniper        = {         --//-- Snipuihin kiikarihudi

    100416529,         --//-- WEAPON_SNIPERRIFLE

    205991906,         --//-- WEAPON_HEAVYSNIPER

    177293209,          --//-- WEAPON_HEAVYSNIPER_MK2

    -952879014,         --//-- WEAPON_MARKSMANRIFLE

    1785463520,         --//-- WEAPON_MARKSMANRIFLE_MK2

}

function HashInTable ( hash )

    for k, v in pairs ( isSniper ) do

        if ( hash == v ) then

            return true

        end

    end

    return false

end



function ManageCrosshair()

    local ped = GetPlayerPed ( -1 )

    local _, hash = GetCurrentPedWeapon( ped, true )

        if not HashInTable ( hash ) then

            HideHudComponentThisFrame( 14 )

        end

end


Citizen.CreateThread(function()

    while true do

        Citizen.Wait(5)

        local ped = GetPlayerPed( -1 )

        local ase = GetSelectedPedWeapon(ped)


        ManageCrosshair()


       
        if IsPedArmed(ped, 6) then
       
            DisableControlAction(1, 140, true)
       
            DisableControlAction(1, 141, true)    --//-- POISTAA KOLKKAUKSEN KÄYTÖSTÄ ASE KÄDESSÄ
       
            DisableControlAction(1, 142, true)
       
        end


        DisplayAmmoThisFrame(false)
        
        end

end)


local rekyylit = {


	--//-- PISTOOLIT

    [453432689]     = 1.0,      -- PISTOL

    [-1075685676]   = 1.0,      -- PISTOL MK2

    [1593441988]    = 1.0,      -- COMBAT PISTOL

    [-1716589765]   = 1.0,      -- PISTOL .50

    [-1076751822]   = 1.0,      -- SNS PISTOL

    [-2009644972] 	= 1.0, 		-- SNS PISTOL MK2

    [-771403250]    = 1.0,      -- HEAVY PISTOL

    [137902532]     = 1.0,      -- VINTAGE PISTOL

    [-598887786]    = 4.7,      -- MARKSMAN PISTOL

    [-1045183535]   = 3.0,      -- REVOLVER

    [-879347409]    = 2.1,      -- REVOLVER MK2

    [584646201]     = 0.2,      -- AP PISTOL

    [-1746263880]   = 2.1,      -- DOUBLEACTION REVOLVER

    [911657153]     = 0.2,      -- TAZER


    --//-- SMGT

    [324215364]     = 0.2,      -- MICRO SMG

    [736523883]     = 0.2,      -- SMG

    [2024373456]    = 0.1,      -- SMG MK2

    [-1121678507]   = 0.05,      -- MINISMG

    [-270015777]    = 0.1,      -- ASSAULTSMG

    [-619010992]    = 0.1,      -- MACHINE PISTOL

    [171789620]     = 0.2,      -- COMBAT PDW


    --//-- RIFLET

    [-1074790547]   = 0.1,      -- ASSAULT RIFLE

    [961495388]     = 0.1,		-- ASSAULT RIFLE MK2
    
    [-2084633992]   = 0.05, 	-- CARBINE RIFLE 	
    	
    [-86904375]     = 0.1,      -- CARBINE RIFLE MK2
    
    [-1357824103]   = 0.1,      -- ADVANCED RIFLE
    
    [-1063057011]   = 0.1,      -- SPECIAL CARBINE
    
    [-1768145561]   = 0.1,      -- SPECIAL CARBINE MK2
    
    [2132975508]    = 0.1,      -- BULLPUP RIFLE
    
    [-2066285827]   = 0.1,      -- BULLPUP RIFLE MK2
    
    [1649403952]    = 0.1,      -- COMPACT RIFLE
    

    --//-- LMGT

    [-1660422300]   = 0.0,      -- MG

    [2144741730]    = 0.0,      -- COMBATMG

    [-608341376]    = 0.0,      -- COMBATMG MK2

    [1627465347]    = 0.2,      -- GUSENBERG


    --//-- HAULIKOT

    [487013001]     = 0.1,     -- PUMP SHOTGUN

    [1432025498]    = 0.1, 		-- PUMP SHOTGUN MK2
    
    [2017895192]    = 0.1, 		-- SAWNOFF SHOTGUN
    
    [-1654528753]   = 0.1, 		-- BULLPUP SHOTGUN
    
    [-494615257]    = 0.1, 		-- ASSAULT SHOTGUN
    
    [-1466123874]   = 3.1, 		-- MUSKET
    
    [984333226]     = 0.1, 		-- HEAVY SHOTGUN
    
    [-275439685]    = 0.0, 		-- DOUBLE BARREL SHOTGUN
    
    [317205821]     = 0.1,		-- SWEEPER SHOTGUN
    

    --//-- SNIPERIT

    [100416529]     = 1.5, 		-- SNIPER RIFLE

    [205991906]     = 2.0, 		-- HEAVY SNIPER
    
    [177293209]     = 0.0,		-- HEAVY SNIPER MK2
    
    [-952879014]    = 1.7,      -- MARKSMAN RIFLE
    
    [1785463520]    = 0.1,      -- MARKSMAN RIFLE MK2
    

    --//-- MUUT

    [-1568386805]   = 0.1,      -- GRENADE LAUNCHER

    [-1312131151]   = 1.1,      -- RPG

    [1119849093]    = 0.0,      -- MINIGUN

    [2138347493]    = 0.5, 		-- FIREWORK LAUNCHER

    [1834241177]    = 0.5, 		-- RAILGUN

    [1672152130]    = 0.1, 		-- HOMING LAUNCHER	
}



Citizen.CreateThread(function()

    
    while true do
    
        if IsPedArmed(PlayerPedId(), 6) then
    
            local isSniper = false
    
            local currentWeaponHash = GetSelectedPedWeapon(PlayerPedId())
    
            if currentWeaponHash == GetHashKey('WEAPON_MARKSMANRIFLE') then
    
                isSniper = true

            elseif currentWeaponHash == GetHashKey('WEAPON_MARKSMANRIFLE_MK2') then
    
                isSniper = true

            elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER') then
    
                isSniper = true
    
            elseif currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2') then
    
                isSniper = true

            elseif currentWeaponHash == GetHashKey('WEAPON_SNIPERRIFLE') then
    
                isSniper = true
    
            end



            if not isSniper then

                HideHudComponentThisFrame(14)

            end

        else

            Wait(1000)

        end

        Wait(0)

    end

end)



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(1)

        if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then

            local _,tykki = GetCurrentPedWeapon(PlayerPedId())

            _,luoti = GetAmmoInClip(PlayerPedId(), tykki)

            if rekyylit[tykki] and rekyylit[tykki] ~= 0 then

                tv = 0

                if GetFollowPedCamViewMode() ~= 4 then

                    repeat 

                        Wait(5)

                        p = GetGameplayCamRelativePitch()

                        SetGameplayCamRelativePitch(p+0.1, 0.2)

                        tv = tv+0.1

                    until tv >= rekyylit[tykki]

                else

                    repeat 

                        Wait(5)

                        p = GetGameplayCamRelativePitch()

                        if rekyylit[tykki] > 0.1 then

                            SetGameplayCamRelativePitch(p+0.6, 1.2)

                            tv = tv+0.6

                        else

                            SetGameplayCamRelativePitch(p+0.016, 0.333)

                            tv = tv+0.1

                        end

                    until tv >= rekyylit[tykki]

                end

            end

        end

    end

end)

Citizen.CreateThread(function()

    local odota = vammanen

    math.random(GetGameTimer())

    while true do

        Citizen.Wait(odota)

        local ped = PlayerPedId()

        if IsPedArmed(PlayerPedId(), 6) then

            odota = 5

            if IsPedShooting(ped) then

                local _, tykki = GetCurrentPedWeapon(ped)

                _, cpanos = GetAmmoInClip(ped, tykki)

                if rekyylit[tykki] and rekyylit[tykki] ~= 0 then

                    tv = 0

                    repeat 

                        Wait(1)

                        x = GetGameplayCamRelativePitch()

                        local cx

                        if GetFollowVehicleCamViewMode() == 4 then

                            if IsPedDoingDriveby(ped) then

                                cx = math.random(100, 200)/100

                            else

                                cx = math.random(0, 100)/100

                            end

                        else

                            if IsPedDoingDriveby(ped) then

                                cx = math.random(250, 350)/100

                            else

                                cx = math.random(0, 100)/100

                            end

                        end


                        
                        SetGameplayCamRelativePitch(x+cx, 0.1)
                        
                        tv = tv+0.1

                    until tv >= rekyylit[tykki]
                
                end
                
            end
            
        else
            
            odota = vammanen
            
        end
        
    end
    
end)