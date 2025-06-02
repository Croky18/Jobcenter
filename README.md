# ESX Legacy Job Selector with OX_lib

A clean and configurable job selector for ESX Legacy, using [OX_lib](https://github.com/overextended/ox_lib) with support for:
- 🧍‍♂️ NPC interaction (optional)
- 📍 Marker-based interaction (optional)
- 🗺️ Customizable blip
- 🧾 Fully adjustable via `config.lua`
- [PREVIEW](https://www.youtube.com/watch?v=HlS7fpvyo9w)

---

## 🚀 Features
- OX_lib Context Menu for smooth job selection
- NPC or Marker or both (toggle in config)
- `[E]` interaction UI using `lib.showTextUI`
- Configurable jobs, blip, marker and prompt

---

## 🛠️ Installation

1. Download de bestanden en plaats de map in je `resources` folder.
2. Download de ox_lib voor de job [verplicht] [https://github.com/overextended/ox_lib]
3. Voeg het script toe aan je `server.cfg`:
   ```cfg
   ensure jobcenter
