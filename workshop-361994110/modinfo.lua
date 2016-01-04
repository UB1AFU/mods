-- This information tells other players more about the mod
name = "Bee Nice"
description = "Bees no longer attack you when harvesting their honey while wearing the Beekeeper Hat. v0.32"
author = "Ryuu"
version = "0.32"

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
-- Example:
-- http://forums.kleientertainment.com/showthread.php?19505-Modders-Your-new-friend-at-Klei!
-- becomes
-- 19505-Modders-Your-new-friend-at-Klei!
forumthread = "25059-Download-Sample-Mods"

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

icon_atlas = "bee_nice.xml"
icon = "bee_nice.tex"

--Compatible with both the base game and Reign of Giants
--Let the mod system know that this mod is functional with Don't Starve Together
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

all_clients_require_mod = false

--This let's the game know that this mod doesn't need to be listed in the server's mod listing
client_only_mod = false

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"bee_nice"}