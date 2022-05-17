local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ausommet/ZZZZ/main/3kPVP3Us")) ()

local window = library.initiate("Skin Giver By Z44_X", {
    default = UDim2.new(0, 500, 0, 380),
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

local Players = game:GetService("Players")

local Client = Players.LocalPlayer

local playerstab = window.category("Players")
local playerssection = playerstab.section("Players")
local skin_color1 = nil
local skin_color2 = nil
local skin_texture1 = nil
local skin_texture2 = nil
local slot_number = nil
local slot = nil
local SelectedPlayer = Client.Name

function setvalue(Value, Min, Max, Clamp)
    if not Clamp then 
        Value = math.clamp(Value, Min, Max)
        return Value
    end
    Value = math.floor(Value + Clamp)
	Value = math.clamp(Value, Min, Max)
	return Value
end

playerssection.dropdown(Client.Name, function(player)
    SelectedPlayer = player
end, {}, true, true, false)

playerssection.textbox("Skin Color", function(value)
    skin_color1 = setvalue(tonumber(value), 1, 65, .5)
end, 
"Color ID")

playerssection.textbox("Skin Color 2", function(value)
    skin_color2 = setvalue(tonumber(value), 1, 65, .5)
end, 
"Color ID")

playerssection.textbox("Skin Texture", function(value)
    skin_texture1 = setvalue(tonumber(value), 1, 12, .5)
end, "Texture ID")

playerssection.textbox("Skin Texture 2", function(value)
    skin_texture2 = setvalue(tonumber(value), 1, 12, .5)
end, "Texture ID")

playerssection.textbox("Skin Slot", function(value)
    slot_number = setvalue(tonumber(value), 1, 99, .5)
    slot = "skin".. tostring(slot_number)
end, "Skin Slot")

playerssection.button("Give Skin", function()
    local plr = game.Players[SelectedPlayer].playerstats.skins[slot]
    plr.Value = skin_color1
    plr.material.Value = skin_texture1
    plr.secondary.Value = skin_color2
    plr.secondary.material.Value = skin_texture2
end, true)
