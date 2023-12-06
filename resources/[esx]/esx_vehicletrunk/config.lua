Config = {}
Config.DirtyMoney = 'Argent sale'
Config.Cash = 'Argent'
Config.MaxDistance = 1.5 --max distance to access trunk
Config.VecOffset = 2.5 --how much behind the car trunk is located. Very cheap way of accomplishing the goal
Config.Radius = 4.5 --How far away to search for vehicles (only for GetClosestVehicle
Config.Ammo = 250 --Ammo to give player on weapon pull
Config.AllowEmpty = true --Allow empty weapons to be stored (no ammo system(too lazy) so you can get ammo by simply adding weapons inside the trunk)
Config.EnableDupeProtection = false --Delete trunk content if trunk was open and player leaves the server
Config.CheckForGlitchedTrunks = false --Release glitched trunks
Config.EnableDebugMarker = false --Debug marker (see github readme img)

--- Vehicle type ref = https://runtime.fivem.net/doc/reference.html#_0x29439776AAA00A62
Config.VehicleCarry = {
	{value = 150}, -- Compacts
	{value = 200}, -- Sedans
	{value = 400}, -- Suvs
	{value = 150}, -- Coupes
	{value = 150}, -- Muscle
	{value = 80}, -- Sports classics
	{value = 80}, -- Sports
	{value = 50}, -- Super
	{value = 25}, -- Motorcycles
	{value = 500}, -- Off-road
	{value = 1000}, -- Industrial
	{value = 1000}, -- Utility
	{value = 500}, -- Vans
	{value = 0}, -- Cycles
	{value = 300}, -- Boats
	{value = 300}, -- Helicopter
	{value = 2000}, -- Planes
	{value = 300}, -- Service
	{value = 300}, -- Emergency
	{value = 500}, -- Military
	{value = 750},	-- Commercial
	{value = 4000}, -- Trains
}

Config.VehicleTrunkDistance = {

}

Config.LinersTake = {
	"Eh bien, tu l'as quand même pris.",
	"Tu sais prendre des décisions rationnelles, au moins.",
	"Je sais que tu le voulais malgré tout.",
	"N'y pense même pas...",
	"Voilà. Pas besoin de remercier.",
	"De rien.",

}
Config.LinersAdd = {
	"Eh bien, ça ne vaut même pas la peine de le dire.",
	"Pas besoin de ça pour des gens comme toi.",
	"D'abord, tu veux mettre une arme, et maintenant tu ne veux plus ?",
	"Il faut vraiment être énervé pour s'embêter avec ça.",
	"La prochaine fois, tu peux laisser le coffre fermé.",
}