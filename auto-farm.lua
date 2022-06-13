repeat wait() until game:IsLoaded()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
--Ui
local UI = Material.Load({
	Title = "「SBO:R Killer」 | By Ausommet",
	Style = 3,
	SizeX = 300,
	SizeY = 260,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(200,162,200),
		Minimise = Color3.fromRGB(0,255,0),
		MinimiseAccent = Color3.fromRGB(255,255,255),
		Maximise = Color3.fromRGB(255,0,0),
		MaximiseAccent = Color3.fromRGB(255,255,255),
		NavBar = Color3.fromRGB(255,255,255),
		NavBarAccent = Color3.fromRGB(255,0,150),
		NavBarInvert = Color3.fromRGB(255,255,255),
		TitleBar = Color3.fromRGB(255,0,150),
		TitleBarAccent = Color3.fromRGB(255,255,255),
		Overlay = Color3.fromRGB(255,255,255),
		Banner = Color3.fromRGB(255,0,150),
		BannerAccent = Color3.fromRGB(255,255,255),
		Content = Color3.fromRGB(255,255,255),
		Button = Color3.fromRGB(255,0,150), 
		ButtonAccent = Color3.fromRGB(255,255,255),
		ChipSet = Color3.fromRGB(255,255,255),
		ChipSetAccent = Color3.fromRGB(9,49,69),
		DataTable = Color3.fromRGB(255,0,150),
		DataTableAccent = Color3.fromRGB(255,255,255),
		Slider = Color3.fromRGB(255,0,150),
		SliderAccent = Color3.fromRGB(255,255,255),
		Toggle = Color3.fromRGB(255,0,150),
		ToggleAccent = Color3.fromRGB(255,255,255),
		Dropdown = Color3.fromRGB(255,0,150),
		DropdownAccent = Color3.fromRGB(255,255,255),
		ColorPicker = Color3.fromRGB(0,0,0),
		ColorPickerAccent = Color3.fromRGB(0,0,0),
		TextField = Color3.fromRGB(255,0,150),
		TextFieldAccent = Color3.fromRGB(255,255,255),
	}
})
--Pages
local Main = UI.New({
	Title = "Main"
})

local Misc= UI.New({
	Title = "Misc"
})
--Setup
local Players = game:GetService("Players")
local Client = Players.LocalPlayer.Name
local RunService = game:GetService("RunService")
local Plr = game.Players.LocalPlayer
local Chr = Plr.Character
local ts = game:GetService("TweenService")
local lc = game.Players.LocalPlayer.Character
local hm = lc.HumanoidRootPart
local Player = Players.LocalPlayer
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local Mobs = {}
local WEPAnimations = {}
--Server Hop Section
local File = pcall(function()
	AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

function TPReturner()
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i,v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile("NotSameServers.json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				wait()
				pcall(function()
					writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					wait()
					game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
				end)
				wait(4)
			end
		end
	end
end

function Teleport()
	while wait() do
		pcall(function()
			TPReturner()
			if foundAnything ~= "" then
				TPReturner()
			end
		end)
	end
end
--Kill Aura Section
Main.Toggle({
	Text = 'Kill Aura',
	Callback = function(Value)
		if Value then
			killaura = true
		else
			killaura = false
		end
		while killaura do
			for Index, Value in next, workspace.Mobs:GetChildren() do
				if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') then
					if (Value['Head'].Position - workspace[Client]['Head'].Position).magnitude < 50  then 
						game:GetService("ReplicatedStorage").ChangeWeld:FireServer("One-Handed Held", "RightLowerArm")
						game:GetService("ReplicatedStorage").DamageMob:FireServer(workspace.Mobs[Value.Name].Humanoid, false, workspace[Client].Sword.Middle)
						if Swing then 
							local W3P = Players.LocalPlayer.PlayerGui.GameGui.MenuGui.InfoImage.WeaponType
							local CW = (W3P.Text:gsub('Active Weapon: ', ''))
							table.clear(WEPAnimations)
							for _,v in pairs(Players.LocalPlayer.PlayerGui.CLIENT.SwordSlashes[CW]:GetChildren()) do
								table.insert(WEPAnimations, v)
							end
							local AnID = Players.LocalPlayer.PlayerGui.CLIENT.SwordSlashes[CW][tostring(WEPAnimations[math.random(#WEPAnimations)])].AnimationId
							local Anim = Instance.new("Animation")
							Anim.AnimationId = AnID
							local k = game.Players[Client].Character.Humanoid:LoadAnimation(Anim)
							k:Play()
							k:AdjustSpeed(atkspeed)
							wait(1 / atkspeed)
							k:Stop()
						end
					end
				end
			end
			Wait(1/ atkspeed)
		end
	end,
	killaura = false
})

Main.Slider({
	Text = "Attack Speed",
	Callback = function(Value)
		atkspeed = Value
	end,
	Min = 1,
	Max = 4,
	Def = 1,
	Menu = {
		Info = function(self)
			UI.Banner({
				Text = "Higher attack speed might lead to ban (If you get [Exploit][Excess][Error Code: 267] then lower it as this gets logged and leads to a ban) "})end}
})

if atkspeed == nil then
	atkspeed = 1
end
--Auto Farm Section
local function Mob_Update()
	for i, v in pairs(workspace.Mobs:GetChildren()) do
		if workspace.Mobs[v.Name]:FindFirstChild('MOBBEBEB')  and not table.find(Mobs, v['MOBBEBEB'].Value) then
			table.insert(Mobs, v['MOBBEBEB'].Value)
		end
	end
end

local function Closest() 
	local Closest = {math.huge} 
	for Index, Value in next, workspace.Mobs:GetChildren() do 
		if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') and workspace.Mobs[Value.Name]:FindFirstChild('HumanoidRootPart') and Value['MOBBEBEB'].Value == Mob and Value['Humanoid'].Health > 0  then 
			local Distance = (hm.Position - Value.HumanoidRootPart.Position).magnitude
			if Distance < Closest[1] then 
				Closest = {Distance, Value} 
			end
		end
	end
	return Closest[2]   
end

local function to(newpos)
	local Chr = Plr.Character
	if Chr ~= nil then
		local ts = game:GetService("TweenService")
		local dist = (hm.Position - target.HumanoidRootPart.Position).magnitude
		local tweenspeed = dist / 50
		local ti = TweenInfo.new(tonumber(tweenspeed), Enum.EasingStyle.Linear)
		local tp = {CFrame = CFrame.new(newpos)}
		local tween =  ts:Create(hm, ti, tp)
		tween:Play()
		local bv = Instance.new("BodyVelocity")
		bv.MaxForce = Vector3.new(100000,100000,100000)
		bv.Velocity = Vector3.new(0,0,0)
		bv.Parent = hm
		bv:Destroy()
		wait(tonumber(tweenspeed))
	end
end

ff = Instance.new("Part", game.Workspace)
function Float()
	ff.CFrame = hm.CFrame + Vector3.new(0,-3,0)
	ff.Anchored = true
	ff.Size = Vector3.new(2.5,.01,2.5)
	ff.Transparency = 1
end

Main.Toggle({
	Text= 'Auto Farm',
	Callback = function(Value)
		if Value then
			autofarm = true
		else
			autofarm = false
		end
		while autofarm do
			RunService.Heartbeat:Wait(0)
			target = Closest()
			if target ~= nil then
				newpos = target.HumanoidRootPart.Position+ Vector3.new(0,-30,0) 
				pcall(function() to(newpos) end)
			end
			Float()
		end
	end,
	autofarm = false
})

local Select = Main.Dropdown({
	Text = "Select Mob",
	Callback = function(Value)
		Mob = Value
	end,
	Options = {}
})

Main.Button({
	Text = 'Refresh Mobs List',
	Callback = function()
		Mob_Update()
		Select:SetOptions(Mobs)
	end,
}) 

--//Misc
Misc.Toggle({
	Text = "Material Auto-Farm",
	Callback = function(value)
		if value then 
			for i, v in pairs(workspace.Materials:GetChildren()) do
				pcall(function()game.ReplicatedStorage.ClaimMaterial:InvokeServer(v.Id.Value)end)
			end
		end
	end,
	Menu = {
		Info = function(self)
			UI.Banner({
				Text = "You wont be able to move while it is on, might also have to wait a bit until you can move again"})end}
})
--respawn where died
local staff =  Misc.Toggle({
	Text= 'Respawn Same Place',
	Callback = function(Value)
		while Value do
			wait(1)
			repeat wait() until Plr.Character
			local function Main()
				local Humanoid = Player.Character:WaitForChild("Humanoid")
				local ripfunction = false
				Humanoid.Died:Connect(function()
					local DeathLocation = Player.Character:WaitForChild("HumanoidRootPart").CFrame
					workspace.ChildAdded:Connect(function(Object)
						if not ripfunction and Object.Name == Player.Name then
							wait()
							Player.Character:WaitForChild("HumanoidRootPart").CFrame = DeathLocation
							ripfunction = true
							Main()
						end
					end)
				end)
			end
			Main()
		end
	end,
	Value = true
})
--Animation Requests ??? idk bro
Misc.Toggle({
	Text= 'Legit Kill-Aura',
	Callback = function(Value)
		if Value then
			Swing = true
		else
			Swing = false
		end
	end,
	Value = false
})
--Invisibility
Misc.Button({
	Text = 'Invisibility',
	Callback = function()  
		local Character = game:GetService('Players').LocalPlayer.Character
		local Clone = Character.LowerTorso.Root:Clone()
		Character.LowerTorso.Root:Destroy()
		Clone.Parent = Character.LowerTorso
		game.Players.LocalPlayer.CharacterAdded:Connect(function()
			wait(4)
			local Character = game:GetService('Players').LocalPlayer.Character
			local Clone = Character.LowerTorso.Root:Clone()
			Character.LowerTorso.Root:Destroy()
			Clone.Parent = Character.LowerTorso end)
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character.Humanoid
		humanoid.Seated:Connect(function(active, seat)
			humanoid:ChangeState(Enum.HumanoidStateType.Running)        
		end)
	end,
	Menu = {
		Info = function(self)
			UI.Banner({
				Text = "Only detected by spectate tools. Moreover mobs dont spawn when using this (they fall when spawned)"})end}
})

--God-Mode Respawn
Misc.Button({
	Text = "God-Mode Respawn",
	Callback = function()
		game.workspace.GameLoader.CharLoadEvent:FireServer()
	end,
	Menu = {
		Info = function(self)
			UI.Banner({
				Text = "This respawns your entire character, only needed if your character falls to pieces(when using god-mode) "})end}
})

-- Staff Detection // Re-join On kick
Players.PlayerAdded:Connect(function(Plr)
	if Plr:GetRankInGroup(5683480) > 1 or Plr:GetRankInGroup(7171494) > 0 or Plr:GetRankInGroup(5928691) > 0 or Plr:GetRankInGroup(5754032) > 5 then 
		Teleport()
	end
end)

local staff =  Misc.Toggle({
	Text= 'Staff Detection',
	Callback = function(Value)
		if Value == true then
			SD = true
		else
			SD = false
		end
		while SD do
			wait()
			for Index, Value in next, Players:GetPlayers() do 
				if Value ~= Player and Value:GetRankInGroup(5683480) > 1 or Value:GetRankInGroup(7171494) > 0 or Value:GetRankInGroup(5928691) > 0 or Value:GetRankInGroup(5754032) > 5 then
					Teleport()
				end
			end
		end
	end,
	Value = true
})
staff:SetState(true)