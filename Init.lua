-- Init.lua

-- Implements the main entrypoint for the plugin, as well as all the handling needed

function Initialize(Plugin)
	dofile(cPluginManager:GetPluginsPath() .. "/InfoReg.lua")

  Plugin:SetName("GraveChest")
	Plugin:SetVersion(.1)

	--Hook into the HOOK_KILLING to see when something is going to die
  cPluginManager.AddHook(cPluginManager.HOOK_KILLING, OnKilling)
  --Hook into the the right click action so we can 
  cPluginManager:AddHook(cPluginManager.HOOK_PLAYER_RIGHT_CLICKING_ENTITY, OnPlayerRightClickingEntity);
  
  --register
  RegisterPluginInfoCommands()
  -- let the user know our plugin is running
  
	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
  -- let upstream know we started ok....not that we have a fail mode yet...
	return true
end
