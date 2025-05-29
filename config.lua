Config = {}

Config.UseNPC = false        -- Zet op false als je geen NPC wilt
Config.UseMarker = true     -- Zet op false als je geen marker wilt

Config.NPC = {
    model = "cs_bankman",
    coords = vector4(-262.1510, -963.9958, 31.2237, 200.4578),
    interactionDistance = 2.0,
    promptText = "[E] Praat met de Job Manager"
}

Config.Jobs = {
    {label = '⚠️ Werkloos', value = 'unemployed'},
    {label = '🚓 Politie', value = 'police'},
    {label = '🚑 Ambulance', value = 'ambulance'},
    {label = '🚕 Taxi', value = 'taxi'},
    {label = '🔧 Monteur', value = 'mechanic'},
}

Config.Blip = {
    enabled = true,
    coords = vector3(-262.1510, -963.9958, 31.2237),
    sprite = 351,         -- briefcase
    color = 26,           -- blauw
    scale = 1.0,
    name = "Job Center"
}

Config.Marker = {
    coords = vector3(-262.1510, -963.9958, 32.2237),
    type = 2,         -- Marker ID
    color = {r = 0, g = 150, b = 255, a = 150},
    size = {x = 0.6, y = 0.6, z = 0.6}
}