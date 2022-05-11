local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Hitbox = Character:WaitForChild("hitbox") 
local PlayerRequest = ReplicatedStorage:WaitForChild("playerRequest")

local function bqK3Lc76(Item) 
    PlayerRequest:InvokeServer("pickUpItemRequest", Item)
end

local function bqK3Lc()
    if not Hitbox then
        return 
    end

    for Index, Value in next, workspace.placeFolders.items:GetChildren() do 
        RunService.Heartbeat:Wait()
        if (Value.Position - Hitbox.Position).Magnitude < 10 then 
            bqK3Lc76(Value)
        end
    end
end

while RunService.Heartbeat:Wait() do
        coroutine.wrap(bqK3Lc)()
end
