ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('tutkanpaljastin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('tutkanpaljastus:kaynnistys', source)
end)