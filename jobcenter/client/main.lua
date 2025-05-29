local shown = false
local nearNPC = false

CreateThread(function()
    local model = Config.NPC.model
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local ped = CreatePed(0, model, Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z - 1, Config.NPC.coords.w, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    while true do
        local sleep = 1000
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local dist = #(coords - vector3(Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z))

        if dist < Config.NPC.interactionDistance then
            sleep = 0
            if not shown then
                shown = true
                lib.showTextUI(Config.NPC.promptText, {
                    position = "left-center",
                    icon = "briefcase",
                })
            end

            if IsControlJustReleased(0, 38) then -- E
                openJobMenu()
            end
        else
            if shown then
                lib.hideTextUI()
                shown = false
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
