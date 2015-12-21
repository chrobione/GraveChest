
-- Info.lua

-- Implements the g_PluginInfo standard plugin description

g_PluginInfo = 
{
      Name = "GraveChest",
	Version = "0.1",
	Date = "2015-12-13",
	SourceLocation = "https://github.com/chrobione/GraveChest",
	Description = [[A plugin for Cuberite to allow all of the player's items will be placed inside of the GraveChest. The GraveChest can be use to retrieve the player's items after their death..
	]],  --plugin info
    Commands = 
    {
          ["/gravechest"] = 
          {
                --this should only be called by
                Permission = "",
                HelpString = "",
                Handler = nil,
                Subcommands =
                {
                      chests = 
                      {
                            HelpString = "allows admin to have a count of all chests in database",
                            Permission = "gravechest.admin.totalchests",
                            Handler = HandleCmdChests
                      }--chests
                }--
          }
          
      },--commands
      Permissions =
      {
            ["gravechest.admin.openall"] =
            {
                  Description = "Allows the chest to be opened by non-oweners",
                  RecommendedGroups = "Admins, mods"
            },
            ["gravechest.admin.totalchests"] = 
            {
                  Description = "Allows the total count of unrecovered chests",
                  RecommendedGroups = "Admins, mods"
            }
      }--permissions
}; --plugin info