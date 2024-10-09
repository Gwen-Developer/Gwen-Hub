local Camera = require(ReplicatedStorage.Util.CameraShaker)
Camera:Stop()
local CombatFramework = require(Player.PlayerScripts:WaitForChild("CombatFramework"))
local CombatFrameworkR = getupvalues(CombatFramework)[2]

function GetCurrentBlade() 
	local p13 = CombatFrameworkR.activeController
	local ret = p13.blades[1]
	if not ret then return end
	while ret.Parent ~= Player.Character do ret = ret.Parent end
	return ret
end
local Count = 0
function AttackNoCD()
	pcall(function()
		local AC = CombatFrameworkR.activeController
		for i = 1, 1 do
			local bladehit = require(ReplicatedStorage.CombatFramework.RigLib).getBladeHits(Player.Character,{Player.Character.HumanoidRootPart},80)
			if #bladehit > 0 then
				local u8 = debug.getupvalue(AC.attack, 5)
				local u9 = debug.getupvalue(AC.attack, 6)
				local u7 = debug.getupvalue(AC.attack, 4)
				local u10 = debug.getupvalue(AC.attack, 7)
				local u12 = (u8 * 798405 + u7 * 727595) % u9
				local u13 = u7 * 798405
				(function()
					u12 = (u12 * u9 + u13) % 1099511627776
					u8 = math.floor(u12 / u9)
					u7 = u12 - u8 * u9
				end)()
				u10 = u10 + 1
				debug.setupvalue(AC.attack, 5, u8)
				debug.setupvalue(AC.attack, 6, u9)
				debug.setupvalue(AC.attack, 4, u7)
				debug.setupvalue(AC.attack, 7, u10)
				Count = Count+1
				if Player.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then
					AC.animator.anims.basic[1]:Play(0.01,0.01,0.01)
					if Count >= 2 then
						ReplicatedStorage.RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
						Count = 0
					end
					ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
					ReplicatedStorage.RigControllerEvent:FireServer("hit", bladehit, 3, "")
				end
			end
		end
	end)
end
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.UseFAttack and Player.Character.Stun.Value == 0 then
				AttackNoCD()
				task.wait(_G.FastAttackDelay)
			end
		end)
	end
end)
