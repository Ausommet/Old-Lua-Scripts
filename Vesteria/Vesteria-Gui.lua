local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "ZZZZ Vesteria | by Z44_X",
    Style = 3,
    SizeX = 300,
    SizeY = 115,
    Theme = "Light"
})

local Page = UI.New({
    Title = "Main"
})

Page.Button({
    Text = "Kill Aura & Godmode",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Ausommet/Lua-Scripts/main/5cc4ecdcce1f0d196a225bc96dd6a3cc30313ab5.lua'))()
    end,
    Menu = {
        Info = function(self)
            UI.Banner({
                Text = "Press everytime you spawn!"            
            })
        end,
    }
})

Page.Button({
    Text = "Auto Pickup",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Ausommet/Lua-Scripts/main/4fc6c3b0420bf3558138ef3f61473b2d8e3a55b8.lua'))()
    end,
    Menu = {
        Info = function(self)
            UI.Banner({
                Text = "Press everytime you spawn!"            
            })
        end,
    }
})