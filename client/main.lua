local shown = false
local ped = nil

-- Spawnt de NPC als geactiveerd
CreateThread(function()
    if Config.UseNPC then
        local model = Config.NPC.model
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(0) end

        ped = CreatePed(0, model, Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z - 1, Config.NPC.coords.w, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end

    -- Voeg blip toe als actief
    if Config.Blip.enabled then
        local blip = AddBlipForCoord(Config.Blip.coords)
        SetBlipSprite(blip, Config.Blip.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.Blip.scale)
        SetBlipColour(blip, Config.Blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.name)
        EndTextCommandSetBlipName(blip)
    end
end)

-- Marker en Interactie Logica
CreateThread(function()
    while true do
        local sleep = 1000
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local dist = #(coords - Config.Marker.coords)

        if dist < 10.0 then
            sleep = 0

            if Config.UseMarker then
                DrawMarker(Config.Marker.type, Config.Marker.coords.x, Config.Marker.coords.y, Config.Marker.coords.z - 1.0, 0, 0, 0, 0, 0, 0,
                    Config.Marker.size.x, Config.Marker.size.y, Config.Marker.size.z,
                    Config.Marker.color.r, Config.Marker.color.g, Config.Marker.color.b, Config.Marker.color.a, false, false, 2, nil, nil, false)
            end

            if dist < Config.NPC.interactionDistance then
                if not shown then
                    shown = true
                    lib.showTextUI(Config.NPC.promptText, {
                        position = "left-center",
                        icon = "briefcase",
                    })
                end

                if IsControlJustReleased(0, 38) then
                    openJobMenu()
                end
            else
                if shown then
                    lib.hideTextUI()
                    shown = false
                end
            end
        end

        Wait(sleep)
    end
end)

function openJobMenu()
    local options = {}
    for _, job in ipairs(Config.Jobs) do
        table.insert(options, {
            title = job.label,
            icon = 'briefcase',
            onSelect = function()
                TriggerServerEvent('customjob:setJob', job.value)
            end
        })
    end

    lib.registerContext({
        id = 'job_selector_menu',
        title = 'Kies je Baan',
        options = options
    })

    lib.showContext('job_selector_menu')
end
