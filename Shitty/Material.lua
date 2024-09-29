local MaterialAPI = {}
local MaterialList = {
	[2753915549] = {
		["Magma Ore"] = {"Military Soldier", "Military Spy"},
		["Leather"] = {"Pirate", "Brute"} ,
		["Scrap Metal"] = {"Pirate", "Brute"},
		["Angel Wings"] = {"God's Guard", "Shanda"},
		["Fish Tail"] = {"Fishman Warrior","Fishman Commando"}
	},
	[4442272183] = {
		["Leather"] = {"Mercenary", "Marine Captain"} ,
		["Scrap Metal"] = {"Mercenary", "Marine Captain"},
		["Magma Ore"] = {"Magma Ninja", "Lava Pirate"},
		["Radioactive Material"] = {"Factory Staff"},
		["Vampire Fang"] = {"Vampire"},
		["Mystic Droplet"] = {"Water Fighter", "Sea Soldier"};
	},
	[7449423635] = {
		["Leather"] = {"Pirate Millionaire", "Pistol Billionaire"} ,
		["Scrap Metal"] = {"Pirate Millionaire", "Pistol Billionaire"},
		["Mini Tusk"] = {"Mythological Pirate"},
		["Fish Tail"] = {"Fishman Raider", "Fishman Captain"},
		["Dragon Scale"] = {"Dragon Crew Archer", "Dragon Crew Warrior"},
		["Conjured Cocoa"] = {"Cocoa Warrior", "Chocolate Bar Battler"},
		["Demonic Wisp"] = {"Demonic Soul"},
	}
}
function MaterialAPI:ListMaterial(IdPlace)
	local List = {}
	for i,v in pairs(MaterialList[IdPlace]) do
		table.insert(List, i)
	end
	return List
end
function MaterialAPI:CheckMaterialMob(IdPlace,Material)
	return MaterialList[IdPlace][Material]
end
return MaterialAPI
