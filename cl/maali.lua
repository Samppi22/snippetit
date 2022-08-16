RegisterNetEvent('typhon:tint')
AddEventHandler('typhon:tint', function(tint) -- Väri = ARG 1
local ped = PlayerPedId()

	SetPedWeaponTintIndex(ped, GetSelectedPedWeapon(ped), tonumber(tint)) -- Muunnetaan se int dataksi
end)