-- E N G I N E --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/engine off" then
		CancelEvent()
		--------------
		TriggerClientEvent('engineoff', s)
	elseif message == "/engine on" then
		CancelEvent()
		--------------
		TriggerClientEvent('engineon', s)
	elseif message == "/engine" then
		CancelEvent()
		--------------
		TriggerClientEvent('engine', s)
	end
end)
-- T R U N K --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/trunk" then
		CancelEvent()
		--------------
		TriggerClientEvent('trunk', s)
	end
end)
-- etuvasen --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/leftf" then
		CancelEvent()
		--------------
		TriggerClientEvent('leftf', s)
	end
end)

-- etuoikia --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/rightf" then
		CancelEvent()
		--------------
		TriggerClientEvent('rightf', s)
	end
end)

-- takaoikia --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/rightb" then
		CancelEvent()
		--------------
		TriggerClientEvent('rightb', s)
	end
end)

-- takavase --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/leftb" then
		CancelEvent()
		--------------
		TriggerClientEvent('leftb', s)
	end
end)
-- H O O D --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/hood" then
		CancelEvent()
		--------------
		TriggerClientEvent('hood', s)
	end
end)
-- L O C K --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/lock" then
		CancelEvent()
		--------------
		TriggerClientEvent('lock', s)
	end
end)
-- S A V E --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/save" then
		CancelEvent()
		--------------
		TriggerClientEvent('save', s)
	end
end)
-- R E M O T E --
AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/sveh" then
		CancelEvent()
		--------------
		TriggerClientEvent('controlsave', s)
	end
end)