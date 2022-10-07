CreateThread(function()
    local IsPaused = false;
    ESX = exports["extended"]:getSharedObject();
    while ESX == nil do Wait(5) end
    while not ESX.IsPlayerLoaded() do Wait(5) end

    ESX.PlayerData = ESX.GetPlayerData();

	while true do
		Wait(50)
	    if IsPauseMenuActive() and not IsPaused then
			IsPaused = true;
            print("showw false");
			SendNUIMessage({type = "show", show = false});
	    elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false;
            SendNUIMessage({type = "show", show = true});
            print("showw true");
		end
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(player) 
    ESX.PlayerData = player;

	local job = player.job;
	local job2 = player.job2;
    print("^1huddddd esx:playerLoaded^0");
    
    SendNUIMessage({
        type = "setData",
        Job = job.label.. " - " ..job.grade_label, 
        Orga = job2.label.. " - " ..job2.grade_label
    });

    SendNUIMessage({
        type = "show",
        show = true
    });
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    SendNUIMessage({
        type = "setData",
        Job = job.label.. " - " ..job.grade_label, 
        Orga = ESX.PlayerData.job2.label.. " - " ..ESX.PlayerData.job2.grade_label
    });
end)

RegisterNetEvent("esx:setJob2")
AddEventHandler("esx:setJob2", function(job2)
    SendNUIMessage({ 
        type = "setData",
        Job = ESX.PlayerData.job.label.. " - " ..ESX.PlayerData.job.grade_label, 
        Orga = job2.label.. " - " ..job2.grade_label
    });
end)

RegisterNetEvent("ui:toggle") 
AddEventHandler("ui:toggle", function(bool) 
	SendNUIMessage({type = "show", show = bool});
end)