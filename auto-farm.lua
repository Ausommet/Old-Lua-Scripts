repeat wait() until game:IsLoaded()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
    Title = "SBO:R | By Ausommet",
    Style = 3,
    SizeX = 300,
    SizeY = 300,
    Theme = "Jester",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(9,49,69),
		Minimise = Color3.fromRGB(255,106,0),
		MinimiseAccent = Color3.fromRGB(147,59,0),
		Maximise = Color3.fromRGB(25,255,0),
		MaximiseAccent = Color3.fromRGB(0,255,110),
		NavBar = Color3.fromRGB(60,100,120),
		NavBarAccent = Color3.fromRGB(9,49,69),
		NavBarInvert = Color3.fromRGB(255,255,255),
		TitleBar = Color3.fromRGB(60,100,120),
		TitleBarAccent = Color3.fromRGB(255,255,255),
		Overlay = Color3.fromRGB(255,255,255),
		Banner = Color3.fromRGB(9,49,69),
		BannerAccent = Color3.fromRGB(255,255,255),
		Content = Color3.fromRGB(255,255,255),
		Button = Color3.fromRGB(9,49,69), 
		ButtonAccent = Color3.fromRGB(255,255,255),
		ChipSet = Color3.fromRGB(255,255,255),
		ChipSetAccent = Color3.fromRGB(9,49,69),
		DataTable = Color3.fromRGB(255,255,255),
		DataTableAccent = Color3.fromRGB(9,49,69),
		Slider = Color3.fromRGB(9,49,69),
		SliderAccent = Color3.fromRGB(255,255,255),
		Toggle = Color3.fromRGB(255,255,255),
		ToggleAccent = Color3.fromRGB(9,49,69),
		Dropdown = Color3.fromRGB(9,49,69),
		DropdownAccent = Color3.fromRGB(255,255,255),
		ColorPicker = Color3.fromRGB(9,49,69),
		ColorPickerAccent = Color3.fromRGB(255,255,255),
		TextField = Color3.fromRGB(255,255,255),
		TextFieldAccent = Color3.fromRGB(255,255,255),
    }
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
              if (Value['Head'].Position - workspace[Client]['Head'].Position).magnitude < (distance *10) then 
                game:GetService("ReplicatedStorage").ChangeWeld:FireServer("One-Handed Held", "RightLowerArm")
                game:GetService("ReplicatedStorage").DamageMob:FireServer(workspace.Mobs[Value.Name].Humanoid, false, workspace[Client].Sword.Middle)
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
    Min = 10,
    Max = 25,
    Def = 10,
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
    Max = 3,
    Def = 1,
})
if atkspeed == nil then
    atkspeed = 1 
end

--Auto Farm Section
local speed = 100
local bodyvelocityenabled = true
local Chr = Plr.Character
local ts = game:GetService("TweenService")
local char = game.Players.LocalPlayer.Character
local hm = char.HumanoidRootPart
local lc = game.Players.LocalPlayer.Character
local hm = lc.HumanoidRootPart
local Mobs = {}

local function Mob_Update()
    for i, v in pairs(workspace.Mobs:GetChildren()) do
        if workspace.Mobs[v.Name]:FindFirstChild('MOBBEBEB')  and not table.find(Mobs, v['MOBBEBEB'].Value) then
            table.insert(Mobs, v['MOBBEBEB'].Value)
        end
    end
end

local function Closest() 
    local Closest = {math.huge} 
        for Index, Value in next, workspace.Mobs:GetChildren() do 
            if workspace.Mobs:FindFirstChild(Value.Name) and workspace.Mobs[Value.Name]:FindFirstChild('Head') and workspace.Mobs[Value.Name]:FindFirstChild('HumanoidRootPart') and Value['MOBBEBEB'].Value == Mob and Value['Humanoid'].Health > 0  then 
                local Distance = (hm.Position - Value.HumanoidRootPart.Position).magnitude
                if Distance < Closest[1] then 
                    Closest = {Distance, Value} 
                end
            end
        end
    return Closest[2]   
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
            RunService.Heartbeat:Wait(0)
            target = Closest()
            if target == nil then
                target = hm.Position
            else
            newpos = target.HumanoidRootPart.Position + Vector3.new(0,-40,0) 
        end
        local dist = (hm.Position - target.HumanoidRootPart.Position).magnitude
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
end,
autofarm = false
})
local Select = Main.Dropdown({
    Text = "Select Mob",
    Callback = function(Value)
            Mob = Value
        end,
        Options = {}
    })

    Main.Button({
        Text = 'Refresh Mobs List',
        Callback = function()
            Mob_Update()
            Select:SetOptions(Mobs)
        end,
    })