RegisterCommand('väri', function(source, args)
local src = source -- mitä vammainen älä koske mun filuun 
    TriggerClientEvent('typhon:tint', src, args[1])
end, false)