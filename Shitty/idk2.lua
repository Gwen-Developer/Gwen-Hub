require(ReplicatedStorage.Util.CameraShaker):Stop()
require(Player.PlayerScripts.CombatFramework.Particle).play = function() end
hookfunction(require(ReplicatedStorage.Effect.Container.Death), function()end)
hookfunction(require(ReplicatedStorage.Effect.Container.Respawn), function()end)
hookfunction(require(ReplicatedStorage:WaitForChild("GuideModule")).ChangeDisplayedNPC,function() end) 
spawn(function()
	for i = 1,5 do 
		repeat task.wait(1) until Player.Character:FindFirstChildOfClass('Tool') and (Player.Character:FindFirstChildOfClass('Tool').ToolTip == 'Melee' or Player.Character:FindFirstChildOfClass('Tool').ToolTip == 'Sword')
		local acc5 = debug.getupvalues(require(Player.PlayerScripts.CombatFramework))[2].activeController
		if not acc5 or not acc5.equipped then 
			repeat task.wait() until acc5 and acc5.equipped
		end
		for i,v in pairs(acc5.data) do  
			if typeof(v) == 'function' then 
				hookfunction(v,function() end )
			end
		end
		wait(3)
	end
end)
