-- Made with ❤ by Ausommet
local repo = 'https://raw.githubusercontent.com/Ausommet/Lua-Scripts/main/AR1/Ui/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'AR1 - Winter',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Local'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

--Main Tab UI Setup
local Main1 = Tabs.Main:AddLeftGroupbox('Spam Abilities')


--imports
local RunService = game:GetService("RunService")

Main1:AddToggle('SA', {
    Text = 'Spam Ability 1',
    Default = false,})

    Toggles.SA:OnChanged(function()
            while Toggles.SA.Value do
                wait(0.1)
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].CastSkill:FireServer(1)
            end
    end)
Main1:AddToggle('SA2', {
    Text = 'Spam Ability 2',
    Default = false,})

    Toggles.SA2:OnChanged(function()
            while Toggles.SA2.Value do
                wait(0.1)
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].CastSkill:FireServer(2)
            end
    end)
Main1:AddToggle('SA3', {
    Text = 'Spam Ability 3',
    Default = false,})

    Toggles.SA3:OnChanged(function()
            while Toggles.SA3.Value do
                wait(0.1)
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].CastSkill:FireServer(3)
            end
    end)
Main1:AddToggle('SA4', {
    Text = 'Spam Ability 4',
    Default = false,})

    Toggles.SA4:OnChanged(function()
            while Toggles.SA4.Value do
                wait(0.1)
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].CastSkill:FireServer(4)
            end
    end)

Main1:AddToggle('SA5', {
    Text = 'Spam Ability 5',
    Default = false,})

    Toggles.SA5:OnChanged(function()
            while Toggles.SA5.Value do
                wait(0.1)
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].CastSkill:FireServer(5)
            end
    end)
Main1:AddToggle('SA6', {
    Text = 'Spam Ability 6',
    Default = false,})

    Toggles.SA6:OnChanged(function()
            while Toggles.SA6.Value do
                wait(0.1)
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].CastSkill:FireServer(6)
            end
    end)

Main1:AddToggle('G_M', {
    Text = 'Give Money',
    Default = false,})

    Toggles.G_M:OnChanged(function()
            while Toggles.G_M.Value do
                RunService.Heartbeat:Wait()
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].STLevelModify:FireServer(3, "Sword", 60)
            end
    end)
Main1:AddToggle('AA', {
    Text = 'Auto Attack',
    Default = false,})

    Toggles.AA:OnChanged(function()
            while Toggles.AA.Value do
                RunService.Heartbeat:Wait()
                game:GetService("ReplicatedStorage").RmEvent["Status/Data"].Attack:FireServer()
            end
    end)
local GB = Main1:AddButton('Give Best Sword', function()
    game:GetService("ReplicatedStorage").RmEvent["Status/Data"].STLevelModify:FireServer(2, "Sword", 59)
    end)

local GB2 = Main1:AddButton('Give Best Hammer', function()
    game:GetService("ReplicatedStorage").RmEvent["Status/Data"].STLevelModify:FireServer(2, "Hammer", 59)
    end)

local GINF = Main1:AddButton('Give INF Stats', function()
game:GetService("ReplicatedStorage").RmEvent["Status/Data"].Absorb:FireServer(1.e+999, 1.e+999, 1.e+999, "xD")
    game:GetService("ReplicatedStorage").RmEvent["Status/Data"].STLevelModify:FireServer(2, "Sword", 59)
    end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])