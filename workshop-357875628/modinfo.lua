name = "Wall Gates"
description = "Different kind of walls, you can open and close them, so they act like a doors. You can now close your base area and don't have to use hammer to get in/out and rebuild your walls."
author = "_Q_"
version = "2.0.1"

forumthread = ""

api_version = 10

icon_atlas = "wall gates.xml"
icon = "wall gates.tex"

--This lets the clients know that they need to download the mod before they can join a server that is using it.
all_clients_require_mod = true

--This let's the game know that this mod doesn't need to be listed in the server's mod listing
client_only_mod = false

--Let the mod system know that this mod is functional with Don't Starve Together
dst_compatible = true

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"wall gates"}

configuration_options =
{
    {
        name = "Wall Gates Version",
        options =
        {
            {description = "Normal", data = "normal"},
			{description = "Recolored", data = "recolored"},
        },
        default = "normal",
    },
	
	{
        name = "Wall Gates Recipe",
        options =
        {
            {description = "Gears", data = "gears"},
			{description = "Electrical Doodad", data = "transistor"},
			{description = "Gold", data = "gold"},
        },
        default = "gears",
    },
	
}