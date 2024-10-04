_G.FastAttackDelay = _G.FastAttackDelay or 0.0014691234
local CombatFramework = require(Player.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]
local RigLib = require(ReplicatedStorage.CombatFramework.RigLib)
require(Player.PlayerScripts.CombatFramework.Particle).play = function() end
require(ReplicatedStorage.Util.CameraShaker):Stop()
hookfunction(RigLib.wrapAttackAnimationAsync,function(p_u_28, p_u_29, p_u_30, p_u_31, p_u_32)
    local ac = CombatFrameworkR.activeController
    local v_u_36 = tick()
    if ac and ac.equipped then
        local v37 = RigLib.getBladeHits(p_u_29, p_u_30, p_u_31)
        if #v37 > 0 then
			p_u_32(v37)
			if true and tick() - v_u_36 >= _G.FastAttackDelay  then
				ReplicatedStorage.RigControllerEvent:FireServer("weaponChange", tostring(ac.currentWeaponModel))
			end
        end
    end
end)
task.spawn(function()
    for i = 1,5 do 
        repeat task.wait(1) until Player.Character:FindFirstChildOfClass('Tool') and (Player.Character:FindFirstChildOfClass('Tool').ToolTip == 'Melee' or Player.Character:FindFirstChildOfClass('Tool').ToolTip == 'Sword')
        local acc5 = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2].activeController
        if not acc5 or not acc5.equipped then 
            repeat task.wait()
            until acc5 and acc5.equipped
        end
        for i,v in pairs(acc5.data) do  
            if typeof(v) == 'function' then 
                hookfunction(v,function() end )
            end
        end
        wait(3)
    end
end)
getgenv().AttackFunction = function()
    local ac = CombatFrameworkR.activeController
    if ac and ac.equipped then
        if not getgenv().CurrentCharHum or not getgenv().CurrentCharHum.Parent or getgenv().CurrentCharHum.ClassName ~='Humanoid' then 
            getgenv().CurrentCharHum = Player.Character:FindFirstChildOfClass('Humanoid')
        end
        if (getgenv().CurrentCharHum and getgenv().CurrentCharHum.Parent.Stun.Value <= 0) then
            ac.hitboxMagnitude = 60
            ac.active = false
            ac.blocking = false
            ac.focusStart = 0
            ac.hitSound = nil
            ac.increment = 0
            ac.timeToNextAttack = 0
            ac.timeToNextBlock = 0
            pcall(function()
                ac:attack()
            end)
        end
    end
end
task.spawn(function()
    while task.wait() do 
        if _G.UseFAttack then 
            AttackFunction()
        end
    end
end)
