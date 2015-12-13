
-- plugin.lua

-- Implements the main entrypoint for the plugin, as well as all the handling needed

-- Deathdrop plugin allows for a players inventory to be copied to a chest before death to remove some of the pain of long mining trips.

  --To do: add functionality to make sure that the chest is not placed in lava/bedrock basically anywhere that would reneder the use of the plugin u and to check if
    --the chest has enough slots to hold complete inventory.




function Initialize(Plugin)
	Plugin:SetName("GraveChest")
	Plugin:SetVersion(.1)

	--Hook into the HOOK_KILLING to see when something is going to die
  cPluginManager.AddHook(cPluginManager.HOOK_KILLING, OnKilling)
  -- let the user know our plugin is running
	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
  -- let upstream know we started ok....not that we have a fail mode yet...
	return true
end

function OnKilling(Victim, Killer, TDI)
  --In this function something is about to die and we need to figure out if its a player.
  if (Victim:IsPlayer()) then
    --Ok so it a player 
    --Give a lighting bolt above to let the player know their stuff is saved
    Victim:GetWorld():CastThunderbolt(Victim:GetPosition().x, Victim:GetPosition().y, Victim:GetPosition().z);
    --Build the chest and face no sure what ZM is yet...
    Victim:GetWorld():SetBlock(Victim:GetPosition().x,(Victim:GetPosition().y +2) , Victim:GetPosition().z, E_BLOCK_CHEST, E_META_CHEST_FACING_ZM)
    --get the players items and copy them to a chest
    local Items = cItems()
    local TESTVAR = Victim:GetInventory()
    TESTVAR:CopyToItems(Items)
    Victim:GetWorld():DoWithChestAt(Victim:GetPosition().x, (Victim:GetPosition().y +2), Victim:GetPosition().z,
			function(a_Chest)
				a_Chest:GetContents():AddItems(Items)
			end)
    --Remove the items from the inventory so that when the player dies the system doesnt drop
    Victim:GetInventory():Clear()      
     
  else
      --This is a Mob which this plugin does not care about.
  end
  --return false to let everyone know we good...I think...readup on this
  return false
  --close up the program.
end