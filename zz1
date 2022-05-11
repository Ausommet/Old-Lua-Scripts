local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ZZZZ = getgenv()

ZZZZ.Settings = { 
    ["Godmode"] = true,
    ["KillAura"] = true,
}

for Index, ServiceInstance in next, game:GetChildren() do
    local ServiceName = ServiceInstance.Name:gsub("%s+", "")
    local Service = select(2, pcall(game.GetService, game, ServiceName))

    if typeof(Service) == "Instance" then 
        ZZZZ[ServiceName] = Service 
    end
end

for Index, Function in next, math do
    ZZZZ[Index] = Function
end

ZZZZ.PathfindingService = game:GetService("PathfindingService")
ZZZZ.MarketplaceService = game:GetService("MarketplaceService")

ZZZZ.set_thread_context = set_thread_context or setthreadcontext or syn.set_thread_identity
ZZZZ.getscriptclosure = getscriptclosure or getscriptfunction or get_script_function
ZZZZ.getprotos = getprotos or debug.getprotos 
ZZZZ.getconstants = getconstants or debug.getconstants
ZZZZ.getupvalues = getupvalues or debug.getupvalues

ZZZZ.hookmetamethod = hookmetamethod or function(Table, Method, Callback)
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

local oldNamecall 
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}

    if Settings.Godmode and getnamecallmethod() == "FireServer" and args[4] == "monster" then 
        return
    end

    return oldNamecall(self, ...)
end)


local function inPvp(Enemy) 
    if not Enemy then return end 
    for Index, Value in next, workspace.placeFolders.pvpZoneCollection:GetChildren() do 
        if Value.ClassName == "Model" then 
            for Index2, Value2 in next, Value:GetChildren() do 
                local Region = Region3.new(Value2.Position - (Value2.Size / 2), Value2.Position + (Value2.Size / 2))
                for Index3, Value3 in next, workspace:FindPartsInRegion3(Region, nil, huge) do 
                    if Value3.Parent == Enemy then 
                        return true 
                    end
                    
                end
            end
        end
    end
    return false
end

local function GetAttackable(Attacking)
    if not Hitbox then
        return 
    end
    local Attackable = {} 
    if not Attacking then 
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
    else 
        for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do 
            if Value.Name ~= Player.Name and Players:FindFirstChild(Value.Name) and Value.PrimaryPart and inPvp(Value) then 
                local Distance = (Value.PrimaryPart.Position - Hitbox.Position).Magnitude
                if Distance < 15 then 
                    table.insert(Attackable, Value.PrimaryPart)
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

local function GetClosest(AttackkingPlayers) 
    if not Hitbox then
        return 
    end

    local Closest = {huge, nil} 
    if not AttackkingPlayers then
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
    else 
        for Index, Value in next, workspace.placeFolders.entityManifestCollection:GetChildren() do 
            if Value.Name ~= Player.Name and Players:FindFirstChild(Value.Name) and Value.PrimaryPart and inPvp(Value) then 
                local Distance = (Value.PrimaryPart.Position - Hitbox.Position).Magnitude
                if Distance < Closest[1] then 
                    Closest = {Distance, Value.PrimaryPart}
                end
            end
        end
    end
        
    return Closest[2]
end

local function Attack(Enemy,AttackingPlayers)
    repeat 
        if Hitbox then
            Signal:FireServer("fireEvent", "playerWillUseBasicAttack", Player)
            RunService.Heartbeat:Wait()
            local AttackableEnemies = GetAttackable(AttackingPlayers)

            for Index = 1, 3 do 
                Signal:FireServer("replicatePlayerAnimationSequence", "swordAnimations", "strike" .. tostring(Index), {attackSpeed = -1})

                for Index, Value in next, AttackableEnemies do 
                    Signal:FireServer("playerRequest_damageEntity", Value, Hitbox.Position, "equipment")
                    Signal:FireServer("attackInteractionAttackableAttacked", Value, Hitbox.Position)
                end
            end
        end
        RunService.Heartbeat:Wait()
    until not Enemy:FindFirstChild("health") or Enemy.health.Value <= 0 or not Hitbox
    if Hitbox then 
        Hitbox.CanCollide = true
    end
end

while RunService.Heartbeat:Wait() do
    if Settings.KillAura then
        local Closest = GetClosest(Settings.AttackPlayers)
        if Closest then 
            Attack(Closest, Settings.AttackPlayers)   
        end
    end
end
