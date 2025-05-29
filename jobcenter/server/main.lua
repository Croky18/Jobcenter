ESX = exports["es_extended"]:getSharedObject()

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
    TriggerEvent("updatechecker:check", "jobcenter", "Croky18/jobcenter", "1.0.0")
    end
end)

RegisterServerEvent('customjob:setJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.setJob(job, 0)
        TriggerClientEvent('esx:showNotification', source, '~g~Job gewijzigd naar: ~s~' .. job)
    end
end)
