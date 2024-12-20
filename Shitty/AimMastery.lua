spawn(function()
	local gg = getrawmetatable(game)
	local old = gg.__namecall
	setreadonly(gg,false)
	gg.__namecall = newcclosure(function(...)
		local method = getnamecallmethod()
		local args = {...}
		if tostring(method) == "FireServer" then
			if tostring(args[1]) == "RemoteEvent" then
				if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
					if UseSkill then
						if type(args[2]) == "vector" then 
							args[2] = PositionMob
						else
							args[2] = CFrame.new(PositionMob)
						end
						return old(unpack(args))
					end
				end
			end
		end
		return old(...)
	end)
end)
spawn(function() 
    local old 
    old = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        if getnamecallmethod() == "FireServer" and tostring(self) == "RE/ShootGunEvent" then
            pcall(function() 
				qweqweqwe()
				args[1] = zxczxczxcz[1].Position
				args[2] = zxczxczxcz
				return old(self, unpack(args))
			end)
        end
        return old(self, ...) 
    end)
end)
