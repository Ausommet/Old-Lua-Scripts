-- Updated with ❤ by Ausommet
repeat wait() until game:IsLoaded()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ausommet/Lua-Scripts/main/Ui's/Module.lua"))()

local UI = Material.Load({
    Title = 'X',
    Style = 3,
    SizeX = 300,
    SizeY = 150,
    Theme = "Light"
})
--Pages
local main = UI.New({
    Title = "Main"
})

--Godmode
main.Button({
    Text = "God Mode",
    Callback = function()
        local oldNamecall 
        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
            local args = {...}
            if getnamecallmethod() == "FireServer" and args[4] == "monster" then 
                return
            end

        return oldNamecall(self, ...)
    end)
end
})

--KillAura

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local genv2 = getgenv()

for Index, ServiceInstance in next, game:GetChildren() do
    local ServiceName = ServiceInstance.Name:gsub("%s+", "")
    local Service = select(2, pcall(game.GetService, game, ServiceName))

    if typeof(Service) == "Instance" then 
        genv2[ServiceName] = Service 
    end
end

for Index, Function in next, math do
    genv2[Index] = Function
end

genv2.PathfindingService = game:GetService("PathfindingService")
genv2.MarketplaceService = game:GetService("MarketplaceService")

genv2.set_thread_context = set_thread_context or setthreadcontext or syn.set_thread_identity
genv2.getscriptclosure = getscriptclosure or getscriptfunction or get_script_function
genv2.getprotos = getprotos or debug.getprotos 
genv2.getconstants = getconstants or debug.getconstants
genv2.getupvalues = getupvalues or debug.getupvalues

genv2.hookmetamethod = hookmetamethod or function(Table, Method, Callback)
    local mt = getrawmetatable(Table)
    local oldMethod 

    spawn(function()
        RunService.Heartbeat:Wait()
        oldMethod = hookfunction(mt[Method], Callback)
    end)

    return oldMethod
end


local Character = Player.Character or Player.CharacterAdded:Wait()
local Hitbox = Character:WaitForChild("hitbox") 
local Signal = ReplicatedStorage:WaitForChild("signal") 


local function GetAttackable()
    if not Hitbox then
        return 
    end
    local Attackable = {} 
        for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do 
            if Value.ClassName ~= "Model" and Value.Name ~= "Hitbox" and Value:FindFirstChild("health") and Value.health.Value > 0 and not Value:FindFirstChild("pet") then 
                local Distance = (Value.Position - Hitbox.Position).Magnitude
                if Distance < 15 then 
                    table.insert(Attackable, Value)
                end
            end
        end
        if #Attackable == 0 then
            for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do 
                if Value.ClassName ~= "Model" and Value:FindFirstChild("health") and Value.Name ~= "Hitbox" and Value.health.Value > 0 and not Value:FindFirstChild("pet") then 
                    local Distance = (Value.Position - Hitbox.Position).Magnitude
                    if Distance < 15 then 
                        table.insert(Attackable, Value)
                    end
                end
            end
        end
    return Attackable
end

local Mobs = {}
for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do
    if not table.find(Mobs,Value.Name) and Value.ClassName ~= "Model" and Value.Name ~= "Hitbox" and not Value:FindFirstChild("pet") then 
        table.insert(Mobs,Value.Name)
    end
end

local function GetClosest() 
    if not Hitbox then
        return 
    end
    local Closest = {huge, nil} 
        for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do 
            if Value.ClassName ~= "Model" and Value.Name ~= "Hitbox" and Value:FindFirstChild("health") and Value.health.Value > 0 and not Value:FindFirstChild("pet") then 
                local Distance = (Value.Position - Hitbox.Position).Magnitude

                if Distance < Closest[1] then 
                    Closest = {Distance, Value} 
                end
            end
        end 
            for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do 
                if Value.ClassName ~= "Model" and Value.Name ~= "Hitbox" and Value:FindFirstChild("health") and Value.health.Value > 0 and not Value:FindFirstChild("pet") then 
                    local Distance = (Value.Position - Hitbox.Position).Magnitude
        
                    if Distance < Closest[1] then 
                        Closest = {Distance, Value}
                    end
                end
            end   
    return Closest[2]
end

local function Attack(Enemy)
    repeat 
        if Hitbox then
            Signal:FireServer("fireEvent", "playerWillUseBasicAttack", Player)
            RunService.Heartbeat:Wait()
            local AttackableEnemies = GetAttackable()

            for Index = 1, 3 do 
                Signal:FireServer("replicatePlayerAnimationSequence", "swordAnimations", "strike" .. tostring(Index), {attackSpeed = -1})

                for Index, Value in next, AttackableEnemies do 
                    Signal:FireServer("playerRequest_damageEntity", Value, Hitbox.Position, "equipment")
                    Signal:FireServer("attackInteractionAttackableAttacked", Value, Hitbox.Position)
                end
            end
        end
    until not Enemy:FindFirstChild("health") or Enemy.health.Value <= 0 or not Hitbox
    if Hitbox then 
        Hitbox.CanCollide = true
    end
end


main.Button({
    Text = "Kill Aura",
    Callback = function()
        while RunService.Heartbeat:Wait() do
                local Closest = GetClosest()
                if Closest then 
                    Attack(Closest)   
                end
        end
    end
})


--Autopickup

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Hitbox = Character:WaitForChild("hitbox") 
local PlayerRequest = game:GetService("ReplicatedStorage").playerRequest

local function PickupItem(Item) 
    PlayerRequest:InvokeServer("pickUpItemRequest", Item)
end

local function AutoPickup()
    if not Hitbox then
        return 
    end

    for Index, Value in next, workspace.placeFolders.items:GetChildren() do 
        RunService.Heartbeat:Wait()
        if (Value.Position - Hitbox.Position).Magnitude < 10 then 
            PickupItem(Value)
        end
    end
end


main.Button({
    Text = 'Auto Pickup',
    Callback = function()
            while RunService.Heartbeat:Wait() do
            coroutine.wrap(AutoPickup)()
            end
    end
})