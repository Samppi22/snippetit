Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(0.5) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.1) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.1) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(1.5, 1.5) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		
	end
end)


--Ei pysty aseita nostamaan, erittele aseet

Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(1)
		  RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
		  RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
		  RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
	  RemoveAllPickupsOfType(0xBFEFFF6D) -- assaultrifle
	  RemoveAllPickupsOfType(0x88EAACA7) -- golfclub
	  RemoveAllPickupsOfType(0xC5B72713) -- snspistol
	  RemoveAllPickupsOfType(0x6DFF6B70) -- microsmg
	  DisablePlayerVehicleRewards(PlayerId())
	end
  end)
  -- List of pickup hashes (https://pastebin.com/8EuSv2r1)
