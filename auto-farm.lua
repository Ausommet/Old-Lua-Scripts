repeat wait() until game:IsLoaded()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "「SBO:R」 | By Ausommet",
    Style = 3,
    SizeX = 300,
    SizeY = 400,
    Theme = "Jester",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(9,49,69),
		Minimise = Color3.fromRGB(255,106,0),
		MinimiseAccent = Color3.fromRGB(147,59,0),
		Maximise = Color3.fromRGB(25,255,0),
		MaximiseAccent = Color3.fromRGB(0,255,110),
		NavBar = Color3.fromRGB(60,100,120),
		NavBarAccent = Color3.fromRGB(9,49,69),
		NavBarInvert = Color3.fromRGB(255,255,255),
		TitleBar = Color3.fromRGB(60,100,120),
		TitleBarAccent = Color3.fromRGB(255,255,255),
		Overlay = Color3.fromRGB(255,255,255),
		Banner = Color3.fromRGB(9,49,69),
		BannerAccent = Color3.fromRGB(255,255,255),
		Content = Color3.fromRGB(255,255,255),
		Button = Color3.fromRGB(9,49,69), 
		ButtonAccent = Color3.fromRGB(255,255,255),
		ChipSet = Color3.fromRGB(255,255,255),
		ChipSetAccent = Color3.fromRGB(9,49,69),
		DataTable = Color3.fromRGB(255,255,255),
		DataTableAccent = Color3.fromRGB(9,49,69),
		Slider = Color3.fromRGB(9,49,69),
		SliderAccent = Color3.fromRGB(255,255,255),
		Toggle = Color3.fromRGB(255,255,255),
		ToggleAccent = Color3.fromRGB(9,49,69),
		Dropdown = Color3.fromRGB(9,49,69),
		DropdownAccent = Color3.fromRGB(255,255,255),
		ColorPicker = Color3.fromRGB(9,49,69),
		ColorPickerAccent = Color3.fromRGB(255,255,255),
		TextField = Color3.fromRGB(255,255,255),
		TextFieldAccent = Color3.fromRGB(255,255,255),
    }
})

local Main = UI.New({
    Title = "Main"
})

--Builders
local Players = game:GetService("Players")
local Client = Players.LocalPlayer.Name
local RunService = game:GetService("RunService")
local Imput = game:GetService("UserInputService")
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
            RunService.Heartbeat:Wait(atkspeed / 2)
            if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') then
              if (Value['Head'].Position - workspace[Client]['Head'].Position).magnitude < (distance * 10)  then 
                game:GetService("ReplicatedStorage").ChangeWeld:FireServer("One-Handed Held", "RightLowerArm")
                game:GetService("ReplicatedStorage").DamageMob:FireServer(workspace.Mobs[Value.Name].Humanoid, false, workspace[Client].Sword.Middle)
              RunService.Heartbeat:Wait(atkspeed / 2)
              end
          end  
      end
  end
    end,
    killaura = false
  })

  Main.Slider({
    Text = "Attack Distance",
    Callback = function(Value)
            distance = Value
        end,
    Min = 10,
    Max = 25,
    Def = 10,
})

if distance == nil then
    distance = 10
end

Main.Slider({
    Text = "Attack Speed",
    Callback = function(Value)
            atkspeed = 1 / Value 
        end,
    Min = 1,
    Max = 3,
    Def = 1,
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

Main.Toggle({
    Text= 'Auto Farm',
    Callback = function(Value)
        if Value then
          autofarm = true
          Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
        else
          autofarm = false
          Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
        end
        while autofarm do
            RunService.Heartbeat:Wait(0)
            target = Closest()
            if target == nil then
                target = workspace[Client]
                newpos = workspace[Client]['HumanoidRootPart'].Position
            else
                newpos = target.HumanoidRootPart.Position + Vector3.new(0,-35,0) 
            end
        local dist = (hm.Position - target.HumanoidRootPart.Position).magnitude
        local tweenspeed = dist/tonumber(speed)
        local ti = TweenInfo.new(tonumber(tweenspeed), Enum.EasingStyle.Linear)
        local tp = {CFrame = CFrame.new(newpos)}
        local tween =  ts:Create(hm, ti, tp)
        tween:Play()
        wait(tonumber(tweenspeed))
        end
end,
autofarm = false
})

Main.Slider({
    Text = "Tween Speed",
    Callback = function(Value)
           local speed = Value
        end,
    Min = 50,
    Max = 100,
    Def = 50,
})
if speed == nil then
    speed = 50 
end

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
    
-- Staff Detection // Re-join On kick
    Players.PlayerAdded:Connect(function(Plr)
        if Plr:GetRankInGroup(5683480) > 1 then 
                        Teleport()
                    end
                end)

    Main.Toggle({
        Text= 'Staff Detection',
        Callback = function(Value)
            if Value then 
                for Index, Value in next, Players:GetPlayers() do 
                    if Value ~= Player and Value:GetRankInGroup(5683480) > 1 then 
                            Teleport()
                            end
                        end
                    end
            end,
            staffdetection = false
        })
        Main.Toggle({
            Text= 'Auto Rejoin',
            Callback = function(Value)
                if Value then 
                    getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                        if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                            game:GetService("TeleportService"):Teleport(game.PlaceId)
                        end
                    end)
                end
                end,
                autorejoin = false
            })
