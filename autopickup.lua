local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Hitbox = Character:WaitForChild("hitbox") 
local PlayerRequest = ReplicatedStorage:WaitForChild("playerRequest")

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

while RunService.Heartbeat:Wait() do
        coroutine.wrap(AutoPickup)()
end
