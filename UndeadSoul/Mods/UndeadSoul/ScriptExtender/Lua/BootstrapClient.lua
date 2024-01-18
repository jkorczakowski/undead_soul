if Ext.Mod.IsModLoaded("67fbbd53-7c7d-4cfa-9409-6d737b4d92a9") then
  Ext.Utils.Print("Compatibility Framework detected - attempting to register Undead Soul with framework")
  local subClasses = {
    mawetUndeadSoul = {
      modGuid = "35e8df86-5c3d-4d5d-81bf-7ff3a1717a9a",
      subClassGuid = "d7c37ef7-5661-4630-b88d-377c15f7e404",
      class = "sorcerer",
      subClassName = "Undead Soul"
    }
  }

  local function OnStatsLoaded()
    Mods.SubclassCompatibilityFramework.Api.InsertSubClasses(subClasses)
  end

  Ext.Events.StatsLoaded:Subscribe(OnStatsLoaded)
end
