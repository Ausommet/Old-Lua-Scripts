--this is a work in progress :D
repeat wait() until game:IsLoaded()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "SBO:R | Ausommet",
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
local Imput = game:GetService("UserInputService")
local Plr = game.Players.LocalPlayer

--Kill Aura Section
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
            RunService.Heartbeat:Wait(atkspeed / 2)
            if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') then
              if (Value['Head'].Position - workspace[Client]['Head'].Position).magnitude < distance then 
              game:GetService("ReplicatedStorage").DamageMob:FireServer(workspace.Mobs[Value.Name].Humanoid, false, workspace[Client].Sword.Middle)
              game:GetService("ReplicatedStorage").ChangeWeld:FireServer("One-Handed Held", "RightLowerArm")
              RunService.Heartbeat:Wait(atkspeed / 2)
              end
          end  
      end
  end
    end,
    killaura = false
  })

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

Main.Slider({
    Text = "Attack Speed",
    Callback = function(Value)
            atkspeed = 1 / Value 
        end,
    Min = 1,
    Max = 5,
    Def = 1,
})
if atkspeed == nil then
    atkspeed = 1 
end

--Auto Farm Section
local speed = 100
local bodyvelocityenabled = true -- set this to false if you are getting kicked

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
                    if (Value['HumanoidRootPart'].Position - workspace[Client]['HumanoidRootPart'].Position).magnitude < tpd then
                        while workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') and workspace.Mobs[Value.Name]:FindFirstChild('HumanoidRootPart') and Value['Humanoid'].Health > 0  do
                            RunService.Heartbeat:Wait(0)
                            newpos = Value.HumanoidRootPart.Position + Vector3.new(0,-40,0) 
                            local Chr = Plr.Character
                            if Chr ~= nil then
                                local ts = game:GetService("TweenService")
                                local char = game.Players.LocalPlayer.Character
                                local hm = char.HumanoidRootPart
                                local dist = (hm.Position - Value.HumanoidRootPart.Position).magnitude
                                local tweenspeed = dist/tonumber(speed)
                                local ti = TweenInfo.new(tonumber(tweenspeed), Enum.EasingStyle.Linear)
                               local tp = {CFrame = CFrame.new(newpos)}
                               local tween =  ts:Create(hm, ti, tp)
                               tween:Play()
                                if bodyvelocityenabled == true then
                                    local bv = Instance.new("BodyVelocity")
                                    bv.MaxForce = Vector3.new(100000,100000,100000)
                                    bv.Velocity = Vector3.new(0,0,0)
                                    bv.Parent = hm
                                    bv:Destroy()
                                    wait(tonumber(tweenspeed))
                                    tween:Cancel()
                                end
                            end
                            end
                        end
                    end
                end
            end
        end,
    autofarm = false
})

Main.Slider({
    Text = "Teleport Distance",
    Callback = function(Value)
            tpd = Value
        end,
    Min = 100,
    Max = 1500,
    Def = 100,
})

if tpd == nil then
    tpd = 100
end

--the end :D
