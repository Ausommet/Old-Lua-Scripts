repeat wait() until game:IsLoaded()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "Budokai | By Ausommet",
    Style = 3,
    SizeX = 300,
    SizeY = 300,
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
local Mobs = {}
local Quests = {}
local Players = game:GetService("Players")
local Client = Players.LocalPlayer.Name
local RunService = game:GetService("RunService")


--// Functions
local function Mob_Update()
    for i, v in pairs(workspace.SpawnedCharacters:GetChildren()) do
        if v.name ~= Client and not table.find(Mobs, v.Name)  then
       table.insert(Mobs, v.Name)
        end
    end
end

local function Quest()
    for i, V in pairs(workspace.Core.InteractZones:GetChildren()) do
        if string.find(V.Name, 'QuestBoard') then
            table.insert(Quests, V.Name)
        end
    end
end

--// autopunch :D
Main.Toggle({
    Text = 'Auto Punch',
    Callback = function(Value)
        if Value then 
            auto_punch = true
    else
        auto_punch = false
    end
        while auto_punch do
            game:GetService("ReplicatedStorage").Core.Events.CombatEvents.Attack.BasicAttack:FireServer('RegularAttack')
            RunService.Heartbeat:Wait()
        end

    end,
    auto_punch = false
})

Main.Toggle({
    Text= 'Auto Farm',
    Callback = function(Value)
        if Value then
            autofarm = true
            game:GetService("ReplicatedStorage").Core.Events.CombatEvents.Other.LockOnEvent:FireServer(workspace.SpawnedCharacters[Mob])
          else
            autofarm = false
          end
        while autofarm do
            RunService.Heartbeat:Wait()
            game.workspace.SpawnedCharacters[Client].HumanoidRootPart.CFrame = game.workspace.SpawnedCharacters[Mob].HumanoidRootPart.CFrame + Vector3.new(0,0,-5)
        end
end,
autofarm = false
})


local Select_mob = Main.Dropdown({
    Text = "Select Mob",
    Callback = function(Value)
            Mob = Value
        end,
        Options = {}
    })

    Main.Button({
        Text = 'Refresh Mob List',
        Callback = function()
            Mob_Update()
            Select_mob:SetOptions(Mobs)
        end,
    })


 Main.Toggle({
        Text = 'Auto Quest',
        Callback = function(Value)
            if Value then 
                auto_quest = true
        else
            auto_quest = false
        end
            while auto_quest do
                game:GetService("ReplicatedStorage").Core.Events.InteractEvents.Select:FireServer(workspace.Core.InteractZones[Quest], 'Yes')
                Wait(5)
            end
    
        end,
        auto_quest = false
    })

local quests = Main.Dropdown({
        Text = "Select Quest",
        Callback = function(Value)
                Quest = Value
                print(Quest)
            end,
            Options = {}
        })


--// Bullshit trash :D
Quest()
quests:SetOptions(Quests)
