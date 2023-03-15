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
    Players = Window:AddTab('Players'),
    Server = Window:AddTab('Server'),
    Vehicles = Window:AddTab('Vehicles'),
    Skins = Window:AddTab('Skins'),
    Clothing = Window:AddTab('Clothing'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
    
}

--Main Tab UI Setup
local Main1 = Tabs.Main:AddLeftGroupbox('LocalPlayer')
local Tab1 = Tabs.Main:AddRightTabbox()
local Tab2 = Tabs.Main:AddLeftTabbox()
local Main2 = Tab1:AddTab('Bullet Mods')
local Main3 = Tab2:AddTab('Weapon Mods')
--Main

-- God Mode 
Main1:AddToggle('G_M', {
    Text = 'God Mode',
    Default = false,})

--Infinite Vitals // Infinite Hunger / Thirst
Main1:AddToggle('I_V', {
    Text = 'Infinite Vitals',
    Default = false,})

-- Infinite Stamina 
Main1:AddToggle('I_S', {
    Text = 'Infinite Stamina',
    Default = false,})

-- TP Crates
local tpcrates = Main1:AddButton('TP Crates', function()
    print('You clicked a button!')
end)

-- TP Bodies
local tpbodies = Main1:AddButton('TP Bodies', function()
    print('You clicked a button!')
end)


--BulletMods // Why are you reading this?
-- Fire BulletMod
Main2:AddToggle('Fire', {
    Text = 'Fire',
    Default = false,})

-- Sparkle BulletMod
Main2:AddToggle('Sparkle', {
    Text = 'Sparkle',
    Default = false,})

-- RedlightV2 BulletMod
Main2:AddToggle('Redlight_V2', {
    Text = 'Redlight V2',
    Default = false,})

-- Snow BulletMod
Main2:AddToggle('Snow', {
    Text = 'Snow',
    Default = false,})

-- Tornado BulletMod
Main2:AddToggle('Tornado', {
    Text = 'Tornado',
    Default = false,})

-- Rain BulletMod
Main2:AddToggle('Rain', {
    Text = 'Rain',
    Default = false,})

-- Blood BulletMod
Main2:AddToggle('Blood', {
    Text = 'Blood',
    Default = false,})

-- Smokey BulletMod
Main2:AddToggle('Smokey', {
    Text = 'Smokey',
    Default = false,})

-- SmokeyV2 BulletMod
Main2:AddToggle('Smokey_V2', {
    Text = 'Smokey V2',
    Default = false,})

-- Redlight BulletMod
Main2:AddToggle('Redlight', {
    Text = 'Red Light',
    Default = false,})

-- Bluelight BulletMod
Main2:AddToggle('Bluelight', {
    Text = 'Blue Light',
    Default = false,})

-- Greenlight BulletMod
Main2:AddToggle('Greenlight', {
    Text = 'Green Light',
    Default = false,})

--Weapon Mods
-- Infinite Ammo // Infinite Ammo
Main3:AddToggle('I_A', {
    Text = 'Infinite Ammo',
    Default = false,})

-- Machine Gun // Shoots Really Fast
Main3:AddToggle('M_G', {
    Text = 'Machine Gun',
    Default = false,})

-- Slow Gun // Slows Really Slowly
Main3:AddToggle('S_G', {
    Text = 'Slow Gun',
    Default = false,})

-- Break Weapon // Breaks weapon
Main3:AddToggle('B_W', {
    Text = 'Break Weapon',
    Default = false,})

-- No Recoil // Self-explanatory
Main3:AddToggle('N_R', {
    Text = 'No Recoil',
    Default = false,})

-- No Spread // Self-explanatory
Main3:AddToggle('N_S', {
    Text = 'No Spread',
    Default = false,})

-- Players Tab UI Setup
local Players1 = Tabs.Players:AddLeftGroupbox('Players')
local TabP1 = Tabs.Players:AddRightTabbox()
local TabP2 = Tabs.Players:AddLeftTabbox()
local TabP3 = Tabs.Players:AddRightTabbox()
local Players2 = TabP1:AddTab('Teleport')
local Players3 = TabP2:AddTab('Stats')
local Players4 = TabP2:AddTab('Miscs')


-- Players  // Why are you even here?

-- Select Player For Giving stuff / stats 
Players1:AddDropdown('Select_Player_G', {
    Values = { 'This', 'is', 'a', 'All' },
    Default = 1, 
    Multi = false, 
    Text = 'Select Player',
})

-- For Selected Player Give:  God Mode
Players1:AddToggle('S_G_M', {
    Text = 'Give God Mode',
    Default = false,})

-- For Selected Player Give: Infinite Vitals // Infinite Hunger / Thirst
Players1:AddToggle('S_I_V', {
    Text = 'Give Infinite Vitals',
    Default = false,})

-- For Selected Player Give: Infinite Stamina
Players1:AddToggle('S_I_S', {
    Text = 'Give Infinite Stamina',
    Default = false,})

-- Punish Player
local punishplr = Players1:AddButton('Punish Player', function()
    print('You clicked a button!')
end)

-- Unpunish Player
local unpunishplr = Players1:AddButton('Unpunish Player', function()
    print('You clicked a button!')
end)

-- Rocket Player
local rocketplr = Players4:AddButton('Rocket Player', function()
    print('You clicked a button!')
end)

-- OpenInventory Player
local openinvplr = Players4:AddButton('Open Inventory', function()
    print('You clicked a button!')
end)

-- Invisible Player
local invisibleplr = Players1:AddButton('Invisible Player', function()
    print('You clicked a button!')
end)

-- Visible Player
local visibleplr = Players1:AddButton('Visible Player', function()
    print('You clicked a button!')
end)

-- Lag Player
local lagplr = Players4:AddButton('Lag Player', function()
    print('You clicked a button!')
end)

-- Blind Zombies
local blindzombies = Players4:AddButton('Blind Zombies', function()
    print('You clicked a button!')
end)

-- Nuke Player
local nukeplr = Players4:AddButton('Nuke Player', function()
    print('You clicked a button!')
end)

-- Kick Player
local kickplr = Players1:AddButton('Kick Player', function()
    print('You clicked a button!')
end)

-- Ban Player
local banplr = Players1:AddButton('Ban Player', function()
    print('You clicked a button!')
end)

-- Select Player For Teleporting
Players2:AddDropdown('Select_Player_T', {
    Values = { 'This', 'is', 'a', 'All' },
    Default = 1, 
    Multi = false, 
    Text = 'Select Player',
})

-- Bring Player

local bringplr = Players2:AddButton('Bring Player', function()
    print('You clicked a button!')
end)

-- Goto Player Player

local gotoplr = Players2:AddButton('Goto Player', function()
    print('You clicked a button!')
end)

-- Bring All
local bringall = Players2:AddButton('Bring All', function()
    print('You clicked a button!')
end)


-- Select Place For Teleporting
Players2:AddDropdown('Select_Place', {
    Values = { 'This', 'is', 'a', 'All' },
    Default = 1, 
    Multi = false, 
    Text = 'Select Place',
})

-- Goto Place

local gotoplace = Players2:AddButton('Goto', function()
    print('You clicked a button!')
end)

-- Set Days Survived
Players3:AddInput('set_DS', {
    Default = ' ',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Days Survived',

    Placeholder = 'Enter Days', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.set_DS:OnChanged(function()
    print('Days Survived: ', Options.set_DS.Value)
end)

--Set Zombie Kills

Players3:AddInput('set_ZK', {
    Default = ' ',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Zombie Kills',

    Placeholder = 'Enter Days', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.set_ZK:OnChanged(function()
    print('Zombie Kills:', Options.set_ZK.Value)
end)

--Set Player Kills

Players3:AddInput('set_PK', {
    Default = ' ',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Player Kills',

    Placeholder = 'Enter Days', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.set_PK:OnChanged(function()
    print('Player Kills:', Options.set_PK.Value)
end)











--[[

    local MyButton2 = MyButton:AddButton('Sub button', function()
    print('You clicked a sub button!')  end)
--]]






-- Players Section
-- Server Section
-- Vehicles Section
-- Skins Section 
-- Clothing Section

--UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')


--NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!

-- Set Watermark
Library:SetWatermarkVisibility(true)

-- Sets the watermark text
Library:SetWatermark('Made with ❤ by Ausommet')

--Hides Watermark after 10s
Wait(5)
Library:SetWatermarkVisibility(false)