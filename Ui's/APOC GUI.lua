local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ausommet/ScriptZSave/main/UILib")) ()

local window = library.initiate("ZZZZ Hub by Z44_X", {
    default = UDim2.new(0, 500, 0, 500),
    resize = true,
    min = UDim2.new(0, 100, 0, 100),
    max = UDim2.new(0, 700, 0, 700)
})

local Themes_Ui = {
    BackgroundColor = Color3.fromRGB(255, 5, 63),
    TextColor = Color3.fromRGB(255, 43, 34),
    AccentColor = Color3.fromRGB(30, 30, 30),
    GrayContrastColor = Color3.fromRGB(35, 35, 35),
    DarkContrastColor = Color3.fromRGB(25, 25, 25),
}

--game services 
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = Game:GetService("RunService")

local Client = Players.LocalPlayer

local chatspaminput = ""

if game.PlaceId == 1600503 then
end


function PkGodd(player)
    for _, v in pairs(Players[player].Character:GetDescendants()) do
        if v.Name == "DefenseMultiplier" then
            fireserver("ChangeParent", v, nil)
        end
    end
    R.AddClothing:FireServer("DefenseMultiplier", Players[player].Character.Humanoid, 0, "", "")
end

function UnPkGodd(player)
    for _, v in pairs(Players[player].Character:GetDescendants()) do
        if v.Name == "DefenseMultiplier" then
            fireserver("ChangeParent", v, nil)
        end
    end
end


function setvalue(Value, Min, Max, Clamp)
    if not Clamp then 
        Value = math.clamp(Value, Min, Max)
        return Value
    end
    Value = math.floor(Value + Clamp)
	Value = math.clamp(Value, Min, Max)
	return Value
end

--apoc functions
R = require(ReplicatedStorage.Node).Remote
local metaCall = getrawmetatable(getrenv().shared)
for i, v in pairs(debug.getupvalues(metaCall.__index)) do
     if i == 3 then
         for a, b in pairs(debug.getupvalues(v)) do
            if a == 6 then
                Serial = b
             elseif a == 7 then
                 GetKey = b
            end
        end
    end
end

function fireserver(Re, ...)
    Re = R[tostring(Re)]
    Re:FireServer(Serial({...}, GetKey()))
end

function getcar()
    local Seatfound = false
    for _, v in pairs(Workspace.Vehicles:GetDescendants()) do
        if v.Name ~= "VehicleWreck" and v:IsA("Weld") and v.Name == "SeatWeld" and v.Part1 ~= nil and v.Part1.Parent.Name == Client.Name then
            Seatfound = true
            if v.Parent.Parent.Parent.Name == "Seats" then
                return vehicles, v.Parent.Parent.Parent.Parent
            else
                return v.Parent.Parent.Parent
            end
        end
    end
    if Seatfound == false then
        return false
    end
end

function repair(car, value)
    fireserver("ChangeValue", car.Stats.Armor, value)
    fireserver("ChangeValue", car.Stats.Engine, value)
    fireserver("ChangeValue", car.Stats.Fuel, value)
    fireserver("ChangeValue", car.Stats.Tank, value)
    fireserver("ChangeValue", car.Stats.Hull, value)
end

function Bringg(player)
    spawn(function()
        AddClothing = game.Workspace.Remote.AddClothing
        teleporter = Players[player]
        Goto = Players.LocalPlayer

        AddClothing:FireServer("driven", teleporter.Character, "","","")
        AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
        AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
        game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
        wait(0.2)
        game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
        wait(1)
        fireserver("ChangeParent", teleporter.Character.driven, nil)
        fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
        fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)
        return
    end)
end

function kickgroups()
	for i, v in pairs(Lighting.Groups:GetChildren()) do
		if v.Name ~= ("GlobalGroups") then
			for _, players in pairs(Players:GetPlayers()) do
				Workspace.Remote.GroupKick:FireServer(v, players)
			end
		end
	end
end

function vitals(player, hunger, thirst)
    fireserver("ChangeValue", Players[player].playerstats.Hunger, hunger)
	fireserver("ChangeValue", Players[player].playerstats.Thirst, thirst)
end

function texture(model, texture, value)
    if model:IsA("Model") then 
	    fireserver("VehichleLightsSet", model, texture, value)
    end
end


function Bringg(player)
    spawn(function()
        AddClothing = game.Workspace.Remote.AddClothing
        teleporter = Players[player]
        Goto = Players.LocalPlayer

        AddClothing:FireServer("driven", teleporter.Character, "","","")
        AddClothing:FireServer("IsBuildingMaterial", teleporter.Character.HumanoidRootPart, "poop","","")
        AddClothing:FireServer("SeatPoint", teleporter.Character.Torso, "","","")
        game:GetService("Workspace").Remote.HurtZombie:FireServer(teleporter.Character)
        wait(0.2)
        game:GetService("Workspace").Remote.ReplicatePart:FireServer(teleporter.Character.HumanoidRootPart, Goto.Character.Head.CFrame)
        wait(1)
        fireserver("ChangeParent", teleporter.Character.driven, nil)
        fireserver("ChangeParent", teleporter.Character.HumanoidRootPart.IsBuildingMaterial, nil)
        fireserver("ChangeParent", teleporter.Character.Torso.SeatPoint, nil)
        return
    end)
end

function Specc(player)
	if Players[player] and Players[player].Character:FindFirstChild("Humanoid") then
		Workspace.CurrentCamera.CameraSubject = Players[player].Character.Humanoid
	end
end

function Crashh(player)
	R.AddClothing:FireServer("PermanentBan", Players[player], "", "", "")
	repeat wait() until Players[player]:FindFirstChild("PermanentBan")
end

function maptexture(player)
    Workspace.Remote.AddClothing:FireServer("PermanentBan", Players[player], "", "", "")
    wait(.5)
    fireserver("ChangeParent", Players[player], nil)
end

function vest(player)
	local vest;
	for i, v in pairs(Lighting.PlayerVests:GetChildren()) do
		if Players[player]:FindFirstChild(v.Name) then
			vest = Players[player][v.Name]
		end    
	end
	if not vest then 
		return
	end
	fireserver("ChangeParent", vest, Players[player].Character)
end

function novest(player)
	local vest;
	for i,v in pairs(Lighting.PlayerVests:GetChildren()) do
		if Players[player].Character:FindFirstChild(v.Name) then
			vest = Players[player].Character[v.Name]
		end    
	end
	if not vest then 
		return
	end
	fireserver("ChangeParent", vest, Players[player])
end

function setoutfit(Player, Type, ID)
	spawn(function()
		print(Player .. "" .. Type .. "" .. ID)
		local Instance = Players[Player].playerstats.character[string.lower(Type)]
		id = id or 0
		fireserver("ChangeValue", Instance.ObjectID[Type], ID)
		Workspace.Remote.AddClothing:FireServer("anything lol", Instance, "", "", "")
		wait()
		fireserver("ChangeParent", Instance:WaitForChild("anything lol"), nil)
	end)
end

function colormodel(Instance, Color, Texture)
    spawn(function()
        if not Instance:FindFirstChild("SecondaryColor") then
            Workspace.Remote.AddClothing:FireServer("SecondaryColor", Instance, "", "", "")
            repeat wait() until Instance:FindFirstChild("SecondaryColor")
        end
        Workspace.Remote.ColorGun:FireServer(Instance, Color, Texture, Color, Texture)
        wait(.5)
        for _, v in pairs(Instance:GetChildren()) do
            if v.Name == "SecondaryColor" then 
                fireServer("ChangeParent", v, nil)
            end
        end
    end)
end

function nomap()
	if game.PlaceId == 237590657 or game.PlaceId == 290815963 then
		fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"], Lighting)
	elseif game.PlaceId == 237590761 then
		fireserver("ChangeParent", Workspace["TerrainChunks"], Lighting)
	end
end

function map()
	if game.PlaceId == 237590657 or game.PlaceId == 290815963 then
		fireserver("ChangeParent", Lighting["Plates"], Workspace["Anchored Objects"])
	elseif game.PlaceId == 237590761 then
		fireserver("ChangeParent", Lighting["TerrainChunks"], Workspace)
	end
end 

function nobuildings()
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Towns/Cities"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Hills"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Roads"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Dirt Roads"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Plates"]["Fields"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["RoadSigns"], Lighting)
	fireserver("ChangeParent", Workspace["Anchored Objects"]["Trees/Foliage"], Lighting)
end

function buildings()
	fireserver("ChangeParent", Lighting["Towns/Cities"], Workspace["Anchored Objects"])
	fireserver("ChangeParent", Lighting["Hills"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["Roads"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["Dirt Roads"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["Fields"], Workspace["Anchored Objects"]["Plates"])
	fireserver("ChangeParent", Lighting["RoadSigns"], Workspace["Anchored Objects"])
	fireserver("ChangeParent", Lighting["Trees/Foliage"], Workspace["Anchored Objects"])
end 

function loot()
	fireserver("ChangeParent", Workspace["SpawnLoot"], Lighting)
	fireserver("ChangeParent", Workspace["DropLoot"], Lighting)
end



function noloot()
	fireserver("ChangeParent", Lighting["SpawnLoot"], Workspace)
	fireserver("ChangeParent", Lighting["DropLoot"], Workspace)
end 

function teleport(Player, Parameters)
	pcall(function()
		spawn(function()
			repeat wait() until Players[Player] ~= nil and Players[Player].Character ~= nil and Players[Player].Character.Torso ~= nil 
			Workspace.Remote.AddClothing:FireServer("driven", Players[Player].Character, "","","")
			Workspace.Remote.AddClothing:FireServer("IsBuildingMaterial", Players[Player].Character.Torso, "","","")
			Workspace.Remote.AddClothing:FireServer("SeatPoint", Players[Player].Character.Torso, "","","")
			repeat wait() until Players[Player].Character.Torso:FindFirstChild("IsBuildingMaterial") and Players[Player].Character.Torso:FindFirstChild("SeatPoint") and Players[Player].Character:FindFirstChild("driven")
			wait(.1)
			Workspace.Remote.HurtZombie:FireServer(Players[Player].Character)
			Workspace.Remote.ReplicatePart:FireServer(Players[Player].Character.Torso, Parameters) 
			wait(1.1)
			fireserver("ChangeParent", Players[Player].Character.Torso.IsBuildingMaterial, nil)
			fireserver("ChangeParent", Players[Player].Character.Torso.SeatPoint, nil)
			Players[Player].Character:WaitForChild("driven")
			fireserver("ChangeParent", Players[Player].Character.driven, nil)
		end)
	end)
end 





--loops
RunService.RenderStepped:Connect(function()
	if NoClip then
		Client.Character.Humanoid:ChangeState(11)
	end


    if TC4 then
        if Lighting.Materials:FindFirstChild("C4Placed") then
		    Workspace.Remote.PlaceC4:FireServer(Lighting.Materials:FindFirstChild("C4Placed"), Client.Character.Torso.Position - Vector3.new(0, -2.9, 0), true)
        end
	end
    
	if TVS50 then
		if Lighting.Materials:FindFirstChild("VS50Placed") then
			Workspace.Remote.PlaceC4:FireServer(Lighting.Materials:FindFirstChild("VS50Placed"), Client.Character.Torso.Position - Vector3.new(0, -2.9, 0), true)
		end
	end

	if TTM46 then
		if Lighting.Materials:FindFirstChild("TM46Placed") then
			Workspace.Remote.PlaceC4:FireServer(Lighting.Materials:FindFirstChild("TM46Placed"), Client.Character.Torso.Position - Vector3.new(0, -2.9, 0), true)
		end
	end

	if TFlare then
		Workspace.Remote.PlaceMaterial:FireServer("RoadFlareLit", Client.Character.Torso.Position - Vector3.new(-4.5, 2.9, 12.8))
	end 

	if Fire then 
		Workspace.Remote.PlaceMaterial:FireServer("Fireplace", Client.Character.Torso.Position - Lighting.Materials.Head.Position - Vector3.new(-10, 0, 1))
	end

	if CowWalk then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal1", Client.Character.Torso.Position - Lighting.Materials.Animal1.Animal.Head.Position - Vector3.new(-10, 0, 1))
	end


	if CowWalk1 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal2", Client.Character.Torso.Position - Lighting.Materials.Animal2.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

	if CowWalk2 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal3", Client.Character.Torso.Position - Lighting.Materials.Animal3.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

	if CowWalk3 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal4", Client.Character.Torso.Position - Lighting.Materials.Animal4.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

	if CowWalk4 then 
		Workspace.Remote.PlaceMaterial:FireServer("Animal5", Client.Character.Torso.Position - Lighting.Materials.Animal5.Animal.Head.Position - Vector3.new(-10, 0, 1))
    end

    if globalspam then 
        Workspace.Remote.Chat:FireServer("Global", chatspaminput)
        Workspace.Remote.Chat:FireServer("Global", chatspaminput .. ".")
    end

    if groupspam then 
        Workspace.Remote.Chat:FireServer("Group", chatspaminput)
        Workspace.Remote.Chat:FireServer("Group", chatspaminput .. ".")
    end

    if trollspam then 
        Workspace.Remote.Chat:FireServer("Global", "Lel")
        Workspace.Remote.Chat:FireServer("Global", "Ur Bad")
        Workspace.Remote.Chat:FireServer("Global", "Ur Horrible, Uninstall Roblox")
        Workspace.Remote.Chat:FireServer("Global", "U Should Be Disabled.")
        Workspace.Remote.Chat:FireServer("Global", "Cracker!")
    end

end)
        
--local section
local localtab = window.category("Local")
local charactersection = localtab.section("Character")
local Weaponssection = localtab.section("Fire Modes")
local Walkssection = localtab.section("Walks")
local Cowssection = localtab.section("Cows")
local customizationsection = localtab.section("Customization")

local firemode = ""

charactersection.toggle("Infinite Vitals", function(bool)
    if bool then 
        vitals(Client.Name, math.huge, math.huge)
    elseif not bool then
        vitals(Client.Name, 100, 100)
    end
end, false)

charactersection.toggle("Infinite Stamina", function(bool)
    if bool then 
        fireServer("ChangeParentLocal", Client, nil)
    elseif not bool then
        fireServer("ChangeParentLocal", Client, Players)
    end

end, false)


Weaponssection.dropdown("Fire Modes", function(current)
	firemode = current
end, {"Shotgun", "Pump", "Bolt"}, false, true, false)

Weaponssection.button("Set Firemode", function()
	if firemode == "Shotgun" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireServer("ChangeValue", v.Stats.Action, 5)
				fireServer("ChangeValue", v.Stats.Action.Original, 5)
			end
		end
	elseif firemode == "Pump" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do 
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireserver("ChangeValue", v.Stats.Action, 4)
				fireserver("ChangeValue", v.Stats.Action.Original, 4)
			end
		end
	elseif firemode == "Bolt" then 
		for i, v in pairs(Client.Backpack:GetChildren()) do 
			if ReplicatedStorage.Weapons:FindFirstChild(v.Name) then
				fireserver("ChangeValue", v.Stats.Action, 2)
				fireserver("ChangeValue", v.Stats.Action.Original, 2)
			end
		end
	end
end, true)

Walkssection.toggle("Road Flare Walk", function(bool)
    if bool then 
        TFlare = true
    elseif not bool then
        TFlare = false
    end
end, false)

Walkssection.toggle("TM46 Walk", function(bool)
    if bool then 
        TTM46 = true
    elseif not bool then
        TTM46 = false
    end
end, false)

Walkssection.toggle("VS50 Walk", function(bool)
    if bool then 
        TVS50 = true
    elseif not bool then
        TVS50 = false
    end
end, false)

Walkssection.toggle("C4 Walk", function(bool)
    if bool then 
        TC4 = true
    elseif not bool then
        TC4 = false
    end
end, false)

Cowssection.toggle("Cow Walk #1", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal1") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal1, Lighting.Materials)
        end
        CowWalk = true
    elseif not bool then
        CowWalk = false
    end
end, false)

Cowssection.toggle("Cow Walk #2", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal2") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal2, Lighting.Materials)
        end
        CowWalk1 = true
    elseif not bool then
        CowWalk1 = false
    end
end, false)




Cowssection.toggle("Cow Walk #3", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal3") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal3, Lighting.Materials)
        end
        CowWalk2 = true
    elseif not bool then
        CowWalk2 = false
    end
end, false)

Cowssection.toggle("Cow Walk #4", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal4") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal4, Lighting.Materials)
        end
        CowWalk3 = true
    elseif not bool then
        CowWalk3 = false
    end
end, false)

Cowssection.toggle("Cow Walk #5", function(bool)
    if bool then 
        if not Lighting.Materials:FindFirstChild("Animal5") then 
            fireserver("ChangeParent", ReplicatedStorage.Animals.Animal5, Lighting.Materials)
        end
        CowWalk4 = true
    elseif not bool then
        CowWalk4 = false
    end
end, false)

Cowssection.button("Clean Cows!", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if  v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

charactersection.toggle("Pk-God", function(bool)
    if bool then 
       PkGodd(Client.Name)  
    elseif not bool then
        UnPkGodd(Client.Name)
    end
end, false)


charactersection.button("Bring All", function()
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Client then 	
            teleport(v.Name, Client.Character.Torso.CFrame + Vector3.new(-3, 0, 0))
        end
    end
end, true)


charactersection.button("HGod (Fixed)", function()
fireserver("AddDamage", Client.Character.Humanoid, math.huge)
wait()
Client.Character.Humanoid:GetPropertyChangedSignal("Health"):connect(function()
    if Client.Character.Humanoid ~= nil and Client.Character.Humanoid.Health ~= 100 then
        Client.Character.Humanoid.Health = 100
    end
end)
end, true)


-- ~= means not 


charactersection.button("No Fall Damage", function()
    if Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter") then
        Client.PlayerGui.HitEqualsYouDie:FindFirstChild("JumpLimiter").Parent = nil
    end
end, true)

customizationsection.toggle("No Fog", function(bool)
    if bool then 
        Lighting.FogEnd = 9e9
    elseif not bool then
        Lighting.FogEnd = 1300
    end
end, false)

customizationsection.toggle("No-Clip", function(bool)
    if bool then 
        NoClip = true
    elseif not bool then
        NoClip = false
    end
end, false)

customizationsection.button("Tp Crates", function()
pleyr = game.Players.LocalPlayer.Name
pz = game.Lighting.PatientZero
df = game.Lighting.DarkFigure

pz.Parent = Workspace
df.Parent = Workspace

pz:MoveTo(workspace[pleyr].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))
df:MoveTo(workspace[pleyr].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))

end, true)


customizationsection.button("Tp Bodies", function()
for _, corpse in pairs(workspace:GetChildren()) do

if corpse.Name == "Corpse" then

corpse:MoveTo(workspace[game.Players.LocalPlayer.Name].Torso.Position + Vector3.new(math.random(-10,10),0,math.random(-10,10)))

end

end
end, true)

customizationsection.button("Tp Crates", function()

end, true)

--players
local playerstab = window.category("Players")
local playerssection = playerstab.section("Players")
local functionssection = playerstab.section("Functions")
local bodysection = playerstab.section("BodyAppearance")
local vitalssection = playerstab.section("Vitals")
local statssection = playerstab.section("Stats")
local appearancesection = playerstab.section("Appearance")
local rainsection = playerstab.section("Rainbow Stuff")


local SelectedPlayer = Client.Name 

playerssection.dropdown(Client.Name, function(player)
    SelectedPlayer = player
end, {}, true, true, false)

--functions

functionssection.button("Spectate", function()
    Specc(SelectedPlayer)
end, true)

functionssection.button("Kill", function()
    fireserver("ChangeParent", Players[SelectedPlayer].Character:FindFirstChild("Head"), nil)
end, true)

functionssection.button("Kick", function()
    maptexture(SelectedPlayer)
end, true)

functionssection.button("Crash", function()
Crashh(SelectedPlayer)
end, true)

functionssection.button("Bring", function()
Bringg(SelectedPlayer)
end, true)

functionssection.button("Teleport", function()
    teleport(Client.Name, Players[SelectedPlayer].Character.Torso.CFrame + Vector3.new(-3, 0, 0))
end, true)

bodysection.button("Invisible", function()
    texture(Players[SelectedPlayer].Character, "Plastic", 1) 
end, true)

bodysection.button("Visible", function()
    texture(Players[SelectedPlayer].Character, "Plastic", 0) 
end, true)


bodysection.button("ForceField", function()
    texture(Players[SelectedPlayer].Character, "ForceField", 0) 
end, true)

bodysection.button("Unforce", function()
    texture(Players[SelectedPlayer].Character, "Plastic", 0) 
end, true)


--vitals 
vitalssection.slider("Hunger", function(value)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.Hunger, value)
end, 100, 1000, 100, false)

vitalssection.slider("Thirst", function(value)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.Thirst, value)
end, 100, 1000, 100, false)

vitalssection.button("Infinite Vitals", function()
    vitals(SelectedPlayer, math.huge, math.huge)
end, true)

vitalssection.button("No Vitals", function()
    vitals(SelectedPlayer, 0, 0)
end, true)

vitalssection.button("Huge God", function()
    fireserver("Damage", Players[SelectedPlayer].Character.Humanoid, math.huge)
end, true)

vitalssection.toggle("Pk-God", function(bool)
    if bool then 
       PkGodd(SelectedPlayer)
    elseif not bool then
        UnPkGodd(SelectedPlayer)
    end
end, false)


--stats 
statssection.textbox("Player Kills", function(text)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.PlayerKill.Aggressive, tonumber(math.floor(text + .5)))
end, "Player Kills")

statssection.textbox("Zombie Kills", function(text)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.ZombieKill.Civilian, tonumber(math.floor(text + .5)))
end, "Zombie Kills")

statssection.textbox("Days Survived", function(text)
    fireserver("ChangeValue", Players[SelectedPlayer].playerstats.Days, tonumber(math.floor(text + .5)))
end, "Days Survived")

R.AddClothing:FireServer("AA", Client.playerstats.character, "", "", "")
--appearance 
local bagcolor = 1
local bagtexture = 1
local vestcolor = 1
local vesttexture = 1


local outfits = {
    ["XR HUB CAMO"] = {7338421291,7338016203},
    ["Silence Squad Camo"] = {337129807, 337130336},
    ["Big Smoke Camo"] = {593699904, 415701837},
    ["Blood Camo"] = {215316057, 215316131},
    ["Red/Black/White Camo"] = {473519774, 473519972},
    ["Red/White Camo"] = {472480924,472323288},
    ["TanqR Uniform"] = {929370461,929370906 },
    ["Mist Uniform"] = {929355529, 929356057},
    ["Oof! Uniform"] = {929349688,929350308 },
    ["Swat Uniform"] = {7216153948,7216153948 },
    ["Winter Camo"] = {4528536166, 4528536651},
    ["Canadian Armed Forces Uniform"] = {239576236, 239574835},
    ["Shenanigans Mod Camo"] = {588584241, 159218882},
    ["Apocalypse Rising Bright Pink"] = {467600288, 467600429},
    ["Apocalypse Rising Galaxy Blue"] = {510178412, 510178635},
    ["Blue/Black (Splattered paint)"] = {467173965, 467174397},
    ["Galaxy Red Camo"] = {467531032, 467531149},
    ["Green Camo"] = {593700583, 466869006},
    ["Pink Gusmanak"] = {174147656, 174147930},
    ["Yellow Zolar"] = {229993750, 222311494},
    ["Blue Zolar"] = {198624220, 198624035},
    ["Red ZolarKeth"] = {184800610, 184800783},
    ["Purple Zolar"] = {187543757, 187543760},
    ["Gusmanak Ice"] = {242698915, 242698963},
    ["Gusmanak Green/Gray"] = {233505839, 233505875},
    ["Light Blue Camo"] = {621320757, 621321071},
    ["Gusmanak Tan/Beige"] = {525673005, 525673313},
    ["Light pink Camo"] = {608942892, 608173166},
    ["DS Uniform (red space)"] = {772679941, 815303433},
    ["Vapor"] = {929357729, 929360510},
    ["Somnum"] = {929374243, 929375454},
    ["Retaliation"] = {929368028, 929368521},
    ["DS Uniform"] = {2122445354, 2122447731},
    ["Honeybager"] = {929373244, 929373657},
    ["Diaamnd Old Uniform"] = {929353581, 929354110},
    ["D-3 Uniform"] = {929345322, 929345896},
    ["Euphoric Uniform"] = {929356714, 929357125},
}

appearancesection.dropdown("Outfit Selection - Type An Outfit To Find One You Like", function(outfit)
    setoutfit(SelectedPlayer, "Shirt", outfits[outfit][1])
    setoutfit(SelectedPlayer, "Pants", outfits[outfit][2])
end, {"XR HUB CAMO","Winter Camo","Swat Uniform","Silence Squad Camo", "Big Smoke Camo", "Blood Camo", "Red/Black/White Camo","Red/White Camo","Oof! Uniform","Mist Uniform","TanqR Uniform","Canadian Armed Forces Uniform", "Shenanigans Mod Camo", "Apocalypse Rising Bright Pink", "Apocalypse Rising Galaxy Blue", "Blue/Black (Splattered paint)", "Galaxy Red Camo", "Green Camo", "Pink Gusmanak", "Yellow Zolar", "Blue Zolar", "Red Zolarketh", "Purple Zolar", "Gusmanak Ice", "Gusmanak Green/Gray", "Light Blue Camo", "Gusmanak Tan/Beige", "Light pink Camo", "DS Uniform (red space)", "Vapor", "Somnum", "Retaliation", "DS Uniform", "Honeybager", "Diaamnd Old Uniform", "D-3 Uniform", "Euphoric Uniform"}, false, true, false)

appearancesection.toggle("Vest", function(bool)
    if bool then 
        novest(SelectedPlayer)
    elseif not bool then
        vest(SelectedPlayer)
    end
end, false)







appearancesection.textbox("Shirt", function(text)
    setoutfit(SelectedPlayer, "Shirt", tonumber(text))
end, "Shirt ID")

appearancesection.textbox("Pants", function(text)
    setoutfit(SelectedPlayer, "Pants", tonumber(text))
end, "Pants ID")

appearancesection.textbox("Body Color", function(value)
    local Playertexture = 1
    colormodel(Players[SelectedPlayer].Character, tonumber(setvalue(value, 1, 65, .5)), Playertexture)
end, "Color ID")


appearancesection.textbox("Backpack Color", function(value)
    bagcolor = tonumber(setvalue(value, 1, 65, .5))

    local BackPackObject
    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            BackPackObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(BackPackObject, tonumber(setvalue(value, 1, 65, .5)), bagtexture)
end, "Color ID")

appearancesection.textbox("Backpack Texture", function(value)
    bagtexture = tonumber(setvalue(value, 1, 12, .5))


    local BackPackObject
    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            BackPackObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(BackPackObject, bagcolor, tonumber(setvalue(value, 1, 12, .5)))
end, "Texture ID")


appearancesection.textbox("Vest Color", function(value)
    vestcolor = tonumber(setvalue(value, 1, 65, .5))

    local VestObject
    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            VestObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(VestObject, tonumber(setvalue(value, 1, 65, .5)), vesttexture)
end, "Color ID")

appearancesection.textbox("Vest Texture", function(value)
    vesttexture = tonumber(setvalue(value, 1, 12, .5))

    local VestObject
    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            VestObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    colormodel(VestObject, vestcolor, tonumber(setvalue(value, 1, 12, .5)))
end, "Texture ID")

rainsection.button("R-Body", function(value)
    while wait () do
    colormodel(Players[SelectedPlayer].Character, math.random(1,65), math.random(1,1), Playertexture)
    texture(Players[SelectedPlayer].Character, "ForceField", 0.5) 
    end
end, true)

rainsection.button("R-Vest (Laggy)", function(value)

    local VestObject
    for _, v in pairs(Lighting.PlayerVests:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            VestObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    while wait () do
    colormodel(VestObject, math.random(1,65), math.random(1,1), vesttexture)
    wait ()
    fireserver("VehichleLightsSet", VestObject, "Neon", 0)
    end
end, true)

rainsection.button("R-backpack", function(value)

    local BackPackObject
    for _, v in pairs(Lighting.Backpacks:GetChildren()) do
        if Players[SelectedPlayer].Character:FindFirstChild(v.Name) then
            BackPackObject = Players[SelectedPlayer].Character[v.Name]
        end    
    end
    while wait () do
    colormodel(BackPackObject, math.random(1,65), math.random(1,1), bagtexture)
    end
end, true)

--server
local servertab = window.category("Server")
local serversection = servertab.section("Server")
local cleaningsection = servertab.section("Cleaning")

local mapsection = servertab.section("Map")

local mapcolor = 1
local maptexture = 1

--server
serversection.button("Kick Players From Groups", function()
    kickgroups()
end, true)

serversection.toggle("No Loot", function(bool)
    if bool then 
        noloot()
    elseif not bool then
        loot()
    end
end, false)





--cleaning
cleaningsection.button("Clean Loot", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if Lighting.LootDrops:FindFirstChild(v.Name) then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)

cleaningsection.button("Clean Garbage", function()
    for _, v in pairs(Workspace:GetChildren()) do
        if v.Name == "C4Placed" or v.Name == "VS50Placed" or v.Name == "TM46Placed" or v.Name == "Fireplace" or v.Name == "RoadFlareLit" or v.Name == "Animal1" or v.Name == "Animal2" or v.Name == "Animal3" or v.Name == "Animal4" or v.Name == "Animal5" or v.Name == "Animal6" then
            fireserver("ChangeParent", v, nil)
        end
    end
end, true)


cleaningsection.button("Clean Vehicles", function()
    for _, v in pairs(Workspace:FindFirstChild("Vehicles"):GetDescendants()) do
        if v.Name == "MaxSpeed" and v.Value > 115 or v.Name == "Hull" and v.Value > 5000 then
            fireserver("ChangeParent", v.Parent.Parent)
        end
    end
end, true)

cleaningsection.button("Detonate Explosives", function()
 for _, v in pairs(Workspace:GetChildren()) do
        local IsMine = v.Name == "VS50Placed" or v.Name == "TM46Placed"
        local IsC4 = v.Name == "C4Placed"
        
        if IsMine then
            fireserver("ChangeValue", v.Active, true)
        elseif IsC4 then
            R.Detonate:FireServer(v)
        end
    end
    warn("Successfully Exploded All Explosives.")
end, true)

cleaningsection.button("Clean Parts", function()
spawn(function()
		local C = 0
		for _, v in pairs(Workspace:GetDescendants()) do 
			if v.Name == "Floodlight" or v.Name == "LargeCrateOpen" or v.Name == "SmallCrateOpen" or v.Name == "Fireplace" then
				Count()
				C = C + 1
				fireserver("ChangeParent", v, nil)
			elseif (v.Name == "Part" or v.Name == "Head" or v.Name == "Truss") then
				if table.find(Vector3Objects,v.Size) then
					Count()
					C = C + 1
					fireserver("ChangeParent", v, nil)
				end
			end
		end
		warn(string.format("Cleaned %s Parts.", D))
	end)
end, true)


local BulletModstab = window.category("BulletMods")
local BulletModssection = BulletModstab.section("BulletMods")



BulletModssection.toggle("Fire Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("FireEffect") then
            fireserver("ChangeParent", Lighting:FindFirstChild("FireEffect"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("FireEffect"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("FireEffect"))
    end
end, false)

BulletModssection.toggle("Sparkle Bullets", function(bool)
   if bool then
    if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Sparkles") then
        fireserver("ChangeParent", Lighting.Materials.RoadFlareLit.Tip:FindFirstChild("Sparkles"), ReplicatedStorage.Effects.Bullet)
    end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sparkles"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sparkles"))
    end
end, false)

BulletModssection.toggle("Redlight Bullets v.2", function(bool)
   if bool then
    if not ReplicatedStorage.Effects.Bullet:FindFirstChild("PointLight") then
        fireserver("ChangeParent", Lighting.Materials.RoadFlareLit.Tip:FindFirstChild("PointLight"), ReplicatedStorage.Effects.Bullet)
    end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("PointLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("PointLight"))
    end
end, false)


BulletModssection.toggle("Snow Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets4") then
            fireserver("ChangeParent", ReplicatedStorage.Snow:FindFirstChild("Droplets4"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets4"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets4"))
    end
end, false)

BulletModssection.toggle("Tornado Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Sheets") then
            fireserver("ChangeParent", ReplicatedStorage.Rain:FindFirstChild("Sheets"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sheets"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Sheets"))
    end
end, false)



BulletModssection.toggle("Rain Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets") then
            fireserver("ChangeParent", ReplicatedStorage.Rain:FindFirstChild("Droplets"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Droplets"))
    end
end, false)

BulletModssection.toggle("Blood Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Blood") then
            fireserver("ChangeParent", ReplicatedStorage.Effects:FindFirstChild("Blood"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Blood"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Blood"))
    end
end, false)



BulletModssection.toggle("Smokey Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke") then
            fireserver("ChangeParent", ReplicatedStorage.SpawnPlate.Models.Fireplace.Thing:FindFirstChild("Smoke"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    end
end, false)

BulletModssection.toggle("Smokey.v2 Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke") then
            fireserver("ChangeParent", ReplicatedStorage..SpawnPlate.Models.Ural.NotAVehicle.Wheels.RFWheel.Wheel:FindFirstChild("Smoke"), ReplicatedStorage.Effects.Bullet)
        end
    Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("Smoke"))
    end
end, false)



BulletModssection.toggle("RedLight Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("RedLight") then
            Workspace.Remote.CreateChemlight:FireServer(3020)
            wait(.16)
            fireserver("ChangeParent", Client.Character.Head:FindFirstChild("RedLight"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("RedLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("RedLight"))
    end
end, false)

BulletModssection.toggle("BlueLight Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("BlueLight") then
            Workspace.Remote.CreateChemlight:FireServer(3022)
            wait(.16)
            fireserver("ChangeParent", Client.Character.Head:FindFirstChild("BlueLight"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("BlueLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("BlueLight"))
    end
end, false)

BulletModssection.toggle("GreenLight Bullets", function(bool)
    if bool then 
        if not ReplicatedStorage.Effects.Bullet:FindFirstChild("GreenLight") then
            Workspace.Remote.CreateChemlight:FireServer(3021)
            wait(.16)
            fireserver("ChangeParent", Client.Character.Head:FindFirstChild("GreenLight"), ReplicatedStorage.Effects.Bullet)
        end
        Workspace.Remote.SwitchEnabled:FireServer(true, ReplicatedStorage.Effects.Bullet:FindFirstChild("GreenLight"))
    elseif not bool then
        Workspace.Remote.SwitchEnabled:FireServer(false, ReplicatedStorage.Effects.Bullet:FindFirstChild("GreenLight"))
    end
end, false)

--map
mapsection.textbox("Map Color", function(value)
    mapcolor = setvalue(tonumber(value), 1, 65, .5)

	if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
		colormodel(game.Workspace["Anchored Objects"].Plates, setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
		colormodel(game.Workspace["Anchored Objects"].Plates.Plates, setvalue(tonumber(value), 1, 65, .5), maptexture)
		for _, v in pairs(game.Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
			if v:IsA("Model") then
				colormodel(v, setvalue(tonumber(value), 1, 65, .5), maptexture)
			end
		end
	end
end, "Color ID")

mapsection.textbox("Map Texture", function(value)
    maptexture = setvalue(tonumber(value), 1, 12, .5)

    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, mapcolor, setvalue(tonumber(value), 1, 12, .5))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, mapcolor, setvalue(tonumber(value), 1, 12, .5))
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, mapcolor, setvalue(tonumber(value), 1, 12, .5))
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, mapcolor, setvalue(tonumber(value), 1, 12, .5))
            end
        end
    end
end, "Texture ID")

mapsection.button("Snow Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, 21, 7)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 21, 7)
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, 21, 7)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 21, 7)
            end
        end
    end
end, true)

mapsection.button("Desert Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, 32, 6)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 32, 6)
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, 32, 6)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 32, 6)
            end
        end
    end
end, true)

mapsection.button("Reset Map", function()
    if game.PlaceId == 237590657 or game.PlaceId == 1228674372 then 
        colormodel(Workspace["Anchored Objects"].Plates, 8, 10)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 8, 10)
            end
        end
    elseif game.PlaceId == 290815963 or game.PlaceId == 1228677761 then 
        colormodel(Workspace["Anchored Objects"].Plates.Plates, 8, 10)
        for _, v in pairs(Workspace["Anchored Objects"].Plates.Hills:GetDescendants()) do
            if v:IsA("Model") then
                colormodel(v, 8, 10)
            end
        end
    end
end, true)

mapsection.toggle("No Map", function(bool)
    if bool then 
        nomap()
    elseif not bool then
        map()
    end
end, false)

mapsection.toggle("No Buildings", function(bool)
    if bool then 
        nobuildings()
    elseif not bool then
        buildings()
    end
end, false)










--vehicles


local vehiclestab = window.category("Vehicles")
local modificationsection = vehiclestab.section("Modifications")

modificationsection.label("Will apply function to current car in use")



modificationsection.textbox("Set Vehicle Speed", function(value)
    current = getcar()
    fireserver("ChangeValue", current.Stats.MaxSpeed, tonumber(value))
	fireserver("ChangeValue", current.Stats.MaxSpeed.Offroad, tonumber(value))
end, "Vehicle Speed")

modificationsection.button("Fix Vehicle", function()
    current = getcar()
    repair(current, 1000)
end, true)

modificationsection.toggle("God Vehicle", function(bool)
    current = getcar()
    if bool then 
        repair(current, 10000000000)
    elseif not bool then
        repair(current, 1000)
    end
end, false)

modificationsection.textbox("Vehicle Color", function(value)
    current = getcar()

    for _, v in pairs(current:GetDescendants()) do
        if current.Stats.Armor.Value > 0 then 
            if v.Name == "Special" or v.Name == "Color" or v.Name == "White" then 
                colormodel(v, setvalue(value, 1, 65, .5), 2)
            end
        elseif v.Name == "Special" or v.Name == "Color" or v.Name == "White" then
            colormodel(v, setvalue(value, 1, 65, .5), 1)
        end    
        if v.Name ~= "PoliceCar" and v.Name == "ArmorSkirt" then
            colormodel(v, setvalue(value, 1, 65, .5), 2)
        end
    end
end, "Color ID")

modificationsection.button("Rainbow Car (Only Works On Some Cars.)", function(value)
    current = getcar()
    for _, v in pairs(current:GetDescendants()) do
        if current.Stats.Armor.Value > 0 then 
            if v.Name == "Special" or v.Name == "Color" or v.Name == "White" then 
            while wait() do
              colormodel(v, math.random(1,65), math.random(1,1))
              fireserver("VehichleLightsSet", v, "Neon", 0)
wait (0)
            end
                end

        elseif v.Name == "Special" or v.Name == "Color" or v.Name == "White" then
                        while wait() do
              colormodel(v, math.random(1,65), math.random(1,1))
              fireserver("VehichleLightsSet", v, "Neon", 0)
              wait(0)
              end
            end
        end    
        if v.Name ~= "PoliceCar" and v.Name == "ArmorSkirt" then
                        while wait() do
              colormodel(v, math.random(1,65), math.random(1,1))
              fireserver("VehichleLightsSet", v, "Neon", 0)
              wait(0)
            end
        end
end)


modificationsection.button("ForceField Vehicle", function(bool)
    current = getcar()
    if current.Essentials.Color:FindFirstChild("ArmorSkirt") then
        fireserver("ChangeParent", current.Essentials.Color:FindFirstChild("ArmorSkirt"), current)
        fireserver("VehichleLightsSet", current.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
    end   
    for _, v in pairs(current:GetDescendants()) do
        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
            fireserver("VehichleLightsSet", v, "ForceField", 0)
        end
        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
            fireserver("VehichleLightsSet", v, "ForceField", 0)
        end
    end
    current:WaitForChild("ArmorSkirt")
    fireserver("ChangeParent", current:FindFirstChild("ArmorSkirt"), current.Essentials.Color)
end, true)


modificationsection.button("Glass Vehicle", function(bool)
    current = getcar()
    if current.Essentials.Color:FindFirstChild("ArmorSkirt") then
        fireserver("ChangeParent", current.Essentials.Color:FindFirstChild("ArmorSkirt"), current)
        fireserver("VehichleLightsSet", current.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
    end   
    for _, v in pairs(current:GetDescendants()) do
        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
            fireserver("VehichleLightsSet", v, "Glass", 0.5)
        end
        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
            fireserver("VehichleLightsSet", v, "Glass", 0)
        end
    end
    current:WaitForChild("ArmorSkirt")
    fireserver("ChangeParent", current:FindFirstChild("ArmorSkirt"), current.Essentials.Color)
end, true)


modificationsection.button("Neon Vehicle", function(bool)
    current = getcar()
    if current.Essentials.Color:FindFirstChild("ArmorSkirt") then
        fireserver("ChangeParent", current.Essentials.Color:FindFirstChild("ArmorSkirt"), current)
        fireserver("VehichleLightsSet", current.Essentials.Color:FindFirstChild("ArmorSkirt"), Material, 1, 0)
    end   
    for _, v in pairs(current:GetDescendants()) do
        if v.Name == "Special" or v.Name == "Color" or v.Name == "Black" or v.Name == "White" or v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" then
            fireserver("VehichleLightsSet", v, "Neon", 0)
        end
        if v.Name == "LMWheel" or v.Name == "LBWheel" or v.Name == "Black" or v.Name == "LFWheel" or v.Name == "RFWheel" or v.Name == "RMWheel" or v.Name == "RBWheel" then 
            fireserver("VehichleLightsSet", v, "Neon", 0)
        end
    end
    current:WaitForChild("ArmorSkirt")
    fireserver("ChangeParent", current:FindFirstChild("ArmorSkirt"), current.Essentials.Color)
end, true)

--scripts
local scriptstab = window.category("Scripts")
local scriptssection = scriptstab.section("Scripts")

scriptssection.button("Apoc X (Better Aimbot)", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ausommet/ScriptZSave/main/Universal%20Aimbot", true))()
end, true)

scriptssection.button("Apoc Hub", function(bool)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Ausommet/ScriptZSave/main/Old_Patched", true))()
end, true)

--skin
local skin = window.category("Skins")
local skingiver = skin.section("Skin Giver")

local skin_color1 = nil
local skin_color2 = nil
local skin_texture1 = nil
local skin_texture2 = nil
local slot_number = nil
local slot = nil

skingiver.dropdown(Client.Name, function(player)
    SelectedPlayer = player
end, {}, true, true, false)

skingiver.textbox("Skin Color", function(value)
    skin_color1 = setvalue(tonumber(value), 1, 65, .5)
end, 
"Color ID")

skingiver.textbox("Skin Color 2", function(value)
    skin_color2 = setvalue(tonumber(value), 0, 65, .5)
end, 
"Color ID")

skingiver.textbox("Skin Texture", function(value)
    skin_texture1 = setvalue(tonumber(value), 1, 12, .5)
end, "Texture ID")

skingiver.textbox("Skin Texture 2", function(value)
    skin_texture2 = setvalue(tonumber(value), 1, 12, .5)
end, "Texture ID")

skingiver.textbox("Skin Slot", function(value)
    slot_number = setvalue(tonumber(value), 1, 99, .5)
    slot = "skin".. tostring(slot_number)
end, "Skin Slot")

skingiver.button("Give Skin", function()
    local plr = game.Players[SelectedPlayer].playerstats.skins[slot]
    plr.Value = skin_color1
    plr.material.Value = skin_texture1
    plr.secondary.Value = skin_color2
    plr.secondary.material.Value = skin_texture2
end, true)

--ids
local mcids = skin.section("Material & Color Ids")
mcids.dropdown('Material IDs',function()
end, {'1 - Smooth Plastic','2 - Plate','3 - Marble','4 - Pebble','5 - Rusted','6 - Glitter','7 - Slate','8 - Granite','9 - Foil','10 - Grass','11 - Ice','12 - Metal',})

mcids.dropdown('Color IDs',function()
end, {'1  - Bright Red','2  - Bright Blue','3  - Bright Green','4  - Bright Orange','5  - Bright Yellow','6  - Bright Bluissh Green','7  - Bright Violet','8  - Grime','9  - Earth Green','10 - Navy Blue','11 - Dusty Rose','12 - Black','13 - Reddish Brown','14 - Nougat','15 - Brick Yellow','16 - Really Blue (Neon)','17 - Really Red (Neon)','18 - Really Yellow (Neon)','19 - Really Green (Neon)','20 - Really Pink (Neon)','21 - White','22 - Really Black','23 - Deep Orange','24 - Cyan','25 - Slime Green','26 - Alder','27 - Royal Purple','28 - CGA Brown','29 - Maroon','30 - Gold','31 - Cool Yellow','32 - Casmere','33 - Dirt Brown','34 - Crimson','35 - Institutional White','36 - Pearl','37 - Baby Blue','38 - Sea Green','39 - Salmon','40 - Light Reddish Violet','41 - Pink','42 - Pastel Violet','43 - Alder','44 - Pastel Blue-Green','45 - Persimmon','46 - Quill Grey','47 - Cool Yellow','48 - Pastel Light Blue','49 - Br. Yellowish orange','50 - Laurel Green','51 - Pastel Blue Green','52 - Khaki','53 - Cashmere','54 - Grime','55 - Toothpaste','56 - Neon orange','57 - Teal','58 - Camo','59 - Terra Cotta','60 - Eletric Blue','61 - Fog','62 - Pastel Yellow','63 - Lily White','64 - Dark Stone Grey','65 - Sand red',})


--themes 
local ThemeCategory = window.category("Themes")
local ThemeSection = ThemeCategory.section("Themes")

ThemeSection.colorpicker("Background Color", function(col)
library:SetThemeColor("BackgroundColor", col, 0)
end, Color3.fromRGB(40, 40, 40), false)

ThemeSection.colorpicker("Text Color", function(col)
library:SetThemeColor("TextColor", col, 0)
end, Color3.fromRGB(255, 255, 255), false)

ThemeSection.colorpicker("Accent Color", function(col)
library:SetThemeColor("AccentColor", col, 0)
end, Color3.fromRGB(30, 30, 30), false)

ThemeSection.colorpicker("Gray Contrast Color", function(col)
library:SetThemeColor("GrayContrastColor", col, 0)
end, Color3.fromRGB(35, 35, 35), false)

ThemeSection.colorpicker("Dark ContrastColor", function(col)
library:SetThemeColor("DarkContrastColor", col, 0)
end, Color3.fromRGB(25, 25, 25), false)
