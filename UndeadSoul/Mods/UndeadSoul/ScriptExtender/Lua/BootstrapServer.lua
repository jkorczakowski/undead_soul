------------ DEPRECATED DATA, FOR POSSIBLE FUTURE USAGE

-- Ext.Utils.Print("Undead Soul - Registering Hooks")

-- target = {}
-- combatGuid = {}
-- messageText = "DUPA"

-- -- Registering CombatStarted Event for guid, which we will use to pasue combat during our custom reaction
-- Ext.Osiris.RegisterListener("CombatStarted", 1, "after", 
--     function(_combatGuid)
--         _P("------- Registering CombatStarted")
--         combatGuid = _combatGuid
--     end
-- )

-- -- Register CombatEnded Event to clear variable
-- Ext.Osiris.RegisterListener("CombatEnded", 1, "after",
--     function(_combatGuid)
--         _P("------- Registering CombatEnded")
--         combatGuid = {}
--     end
-- )

-- -- -- Subscribing to DealtDamage to get target uid, check if target has required passive, sorcery points, less than 1 hp and is not dead, if conditions are met, pause combat and open dialog
-- -- local function HandleDealtDamage(e)
-- --     -- _P('------- HandleDealtDamage')
-- --     target = e.Target

-- --     local targetUuid = target.Uuid.EntityUuid
-- --     local targetHitPoints = GetHitpoints(targetUuid)

-- --     if  HasPassive(targetUuid,"DeathsGift") == 1 and GetActionResourceValuePersonal(targetUuid, "SorceryPoint", 0) >= 4 and targetHitPoints < 1 and IsDead(targetUuid) == 0 and IsInCombat(target) == 1
-- --         then
-- --             Osi.PauseCombat(combatGuid)
-- --             Osi.OpenMessageBoxYesNo(targetUuid, messageText)
-- --         end
-- -- end

-- -- Ext.Events.DealtDamage:Subscribe(HandleDealtDamage)

-- -- Alternate version: ask before damage dealt, comment HandleDealtDamage and subscriber

-- local function HandleDealDamage(e)
--     _P('------- HandleDealDamage')
--     target = e.Target
--     local targetUuid = target.Uuid.EntityUuid

--     if  HasPassive(targetUuid,"DeathsGift") == 1 and GetActionResourceValuePersonal(targetUuid, "SorceryPoint", 0) >= 4 and IsDead(targetUuid) == 0 and IsInCombat(targetUuid) == 1
--         then
--             _P('------- Using spell')
--             UseSpell(targetUuid,"Target_DeathsGiftDummy",targetUuid, targetUuid)
--         end
-- end

-- Ext.Osiris.RegisterListener("CastedSpell", 5, "after",
--     function(_caster, _spell, _spellType, _spellElement, _storyActionID)
--         local targetUuid = target.Uuid.EntityUuid

--         if  HasPassive(targetUuid,"DeathsGift") == 1 and GetActionResourceValuePersonal(targetUuid, "SorceryPoint", 0) >= 4 and IsDead(targetUuid) == 0 and IsInCombat(targetUuid) == 1
--             then
--                 _P('------- Registering CastedSpell')
--                 ApplyStatus(targetUuid, "DOWNED", 1, 1, targetUuid)    
--             end

--     end
-- )

-- local function HandleBeforeDealDamage(e)
-- _P('------- HandleBeforeDealDamage')

--     local targetUuid = target.Uuid.EntityUuid
--     local targetHitPoints = GetHitpoints(targetUuid)
--     local originalDamageDone = e.Hit.TotalDamageDone
--     local x,y,z = GetPosition(targetUuid)

--     local hasProperPassive = HasPassive(targetUuid,"DeathsGift") == 1
--     local hasSorceryPoints = GetActionResourceValuePersonal(targetUuid, "SorceryPoint", 0) >= 4
--     local isDamageEnoughToKill = targetHitPoints <= originalDamageDone
--     local isNotDead = IsDead(targetUuid) == 0
--     local isInCombat = IsInCombat(targetUuid) == 1

--     _P("-- HasProperPassive: ")
--     _D(hasProperPassive)
--     _P("-- HasSorceryPoints: ")
--     _D(hasSorceryPoints)
--     _P("-- IsDamageEnoughToKill: ")
--     _D(isDamageEnoughToKill)
--     _P("-- IsNotDead: ")
--     _D(isNotDead)
--     _P("-- IsInCombat: ")
--     _D(isInCombat)    

--     if  HasPassive(targetUuid,"DeathsGift") == 1 and GetActionResourceValuePersonal(targetUuid, "SorceryPoint", 0) >= 4 and targetHitPoints <= originalDamageDone and IsDead(targetUuid) == 0 and IsInCombat(targetUuid) == 1
--         then
--             _P('------- Trying to pause combat and open message box')

--             UseSpell(targetUuid,"Target_DeathsGiftDummy",targetUuid, targetUuid)
            
--             -- Osi.PauseCombat(combatGuid)
--             -- Osi.OpenMessageBoxYesNo(targetUuid, messageText)
--         end



-- end


-- Ext.Events.DealDamage:Subscribe(HandleDealDamage)
-- -- Ext.Events.BeforeDealDamage:Subscribe(HandleBeforeDealDamage)



-- -- Registering MessageBoxYesNoClose to apply healing status if user picked yes and unpause combat despite of player choice
-- Ext.Osiris.RegisterListener("MessageBoxYesNoClosed", 3, "after", function(character, content, resultChoice) 
--     _P("------- Registering MessageBoxYesNoClosed")
--     if content == messageText and resultChoice == 1
--         then
--             local targetUuid = target.Uuid.EntityUuid
--             ApplyStatus(targetUuid, "DEATH_WARD", 1, 1, targetUuid)
--             target = {}
--         end
    
--     ResumeCombat(combatGuid)
-- end)


