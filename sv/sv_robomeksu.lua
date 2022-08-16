ESX             = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  

--[[RegisterNetEvent('esx_robomeksu:rahatarkistus')
AddEventHandler('esx_robomeksu:rahatarkistus', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(1250)
end)]]

RegisterNetEvent('esx_robomeksu:rahatarkistus')
AddEventHandler('esx_robomeksu:rahatarkistus', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= 1250 then
		xPlayer.removeMoney(1250)
		TriggerClientEvent('esx_robomeksu:onnistunut', source)
	else
		TriggerClientEvent('esx_robomeksu:eirahaa', source)
	end
end)