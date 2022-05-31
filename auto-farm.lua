--this is a work in progress :D
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "",
    Style = 3,
    SizeX = 300,
    SizeY = 300,
    Theme = "Light",
})

local Main = UI.New({
    Title = "Main"
})

local Players = game:GetService("Players")
local Client = Players.LocalPlayer.Name
local RunService = game:GetService("RunService")

Main.Slider({
    Text = "Attack Distance",
    Callback = function(Value)
            distance = Value
        end,
    Min = 100,
    Max = 500,
    Def = 100,
})

if distance == nil then
    distance = 100
end
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
            RunService.Heartbeat:Wait(0)
            if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') then
              if (Value['Head'].Position - workspace[Client]['Head'].Position).magnitude < distance then 
              game:GetService("ReplicatedStorage").DamageMob:FireServer(workspace.Mobs[Value.Name].Humanoid, false, workspace[Client].Sword.Middle)
              game:GetService("ReplicatedStorage").ChangeWeld:FireServer("One-Handed Held", "RightLowerArm")
              end
          end  
      end
  end
    end,
    killaura = false
  })

  Main.Slider({
    Text = "Bring Distance",
    Callback = function(Value)
            bring_distance = Value
        end,
    Min = 100,
    Max = 1500,
    Def = 100,
})

if bring_distance == nil then
    bring_distance = 100
end

Main.Toggle({
    Text= 'Auto Farm',
    Callback = function(Value)
        if Value then
          autofarm = true
        else
          autofarm = false
        end
        while autofarm do
            for Index, Value in next, workspace.Mobs:GetChildren() do
                RunService.Heartbeat:Wait(0)
                if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') and workspace.Mobs[Value.Name]:FindFirstChild('HumanoidRootPart') then
                    if (Value['Head'].Position - workspace[Client]['Head'].Position).magnitude < bring_distance then
                        while Value['Humanoid'].Health > 0 do
                            RunService.Heartbeat:Wait(0)
                            if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') and workspace.Mobs[Value.Name]:FindFirstChild('HumanoidRootPart') then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Value.HumanoidRootPart.CFrame + Vector3.new(0,-30,0) 
                            end
                        end
                    end
                end
            end
        end
    end,
    autofarm = false
})
