local logs = {}

local function randomchar()
    local chars = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
    
    local String = ""
    for i = 1,8 do
        String = String..chars[math.random(1,#chars)]
    end   
    return String
end    

local function GetType(name)
    local mouse = nil 
    pcall(function()
        mouse = game:GetService("Players").LocalPlayer:GetMouse()
    end)
    if type(name) == "string" then
        return '"'..name..'"'
    end
    if typeof(name) == "Instance" then
        if mouse and name == mouse.Target and hints then
            return "(Mouse.Target) // "..tostring(name:GetFullName())
        end
        return tostring(name:GetFullName())
    end   
    if type(name) == "number" then
        if hints then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.UserId == name then
                    return "("..tostring(v)..".UserId) // "..name
                end
            end
            if name == os.time() then
                return "(os.time) // "..name
            end
        end
        return tostring(name)
    end   
    if type(name) == "boolean" then
        return tostring(name)
    end    
    if typeof(name) == "CFrame" then
        if mouse and name == mouse.Hit and hints then
            return "(Mouse.Hit) // ".."CFrame.new("..tostring(name)..")"
        end
        if cam and cam.CFrame == name and hints then
            return "(Camera.CFrame) // ".."CFrame.new("..tostring(name)..")"
        end
        return "CFrame.new("..tostring(name)..")"
    end  
    if typeof(name) == "Vector3" then
        if mouse and name == mouse.Hit.Position and hints then
            return "(Mouse.Hit.Position) // ".."Vector3.new("..tostring(name)..")"
        end
        return "Vector3.new("..tostring(name)..")"
    end    
    if typeof(name) == "Vector2" then
        return "Vector2.new("..tostring(name)..")"
    end 
    if typeof(name) == "Color3" then
        return "Color3.new("..tostring(name)..")"
    end
    if typeof(name) == "BrickColor" then
        return "BrickColor.new("..tostring(name)..")"
    end
    if typeof(name) == "EnumItem" then
        return tostring(name)
    end
    if typeof(name) == "table" then
        local to_return = "{"
        local arg = 1
        for i,v in pairs(name) do
            if arg_number then
                if spaces then
                    to_return = to_return.."\n        ".."["..arg.."] = "..tostring(GetType(v))..","
                else
                    to_return = to_return.."["..arg.."] = "..tostring(GetType(v))..","
                end
            else
                if spaces then
                    to_return = to_return.."\n        "..tostring(GetType(v))..","
                else
                    to_return = to_return..tostring(GetType(v))..","
                end
            end
            arg = arg+1
        end
        if spaces then
            return to_return:sub(1,#to_return-1).."\n    }"
        end
        return to_return:sub(1,#to_return-1).."}"
    end
end   

local filename = "ClientSpySettings.lua"

if isfile(filename) then
    loadstring(readfile(filename))()
end 

local blocked_arguments = getgenv().blockargs or {}

local blocked_remotes = getgenv().blockremotes or {} 

local function save_settings()
    local argstring = "getgenv().blockargs = {"
    for i,v in pairs(blocked_arguments) do
        argstring = argstring..'"'..tostring(v)..'"'..","
    end
    if #blocked_arguments >= 1 then
        argstring = argstring:sub(1,#argstring-1).."}"
    else
        argstring = "getgenv().blockargs = {}"
    end
    
    local remotestring = "getgenv().blockremotes = {"
    for i,v in pairs(blocked_remotes) do
        remotestring = remotestring..'"'..tostring(v)..'",'
    end
    if #blocked_remotes >= 1 then
        argstring = argstring.."\n\n"..remotestring:sub(1,#remotestring-1).."}"
    else
        argstring = argstring.."\n\n".."getgenv().blockremotes = {}"
    end
    writefile(filename,argstring)
end

local function is_blocked_argument(tvalue)
    for i,v in pairs(tvalue) do
        if table.find(blocked_arguments,v) then
            return true
        end
    end
    return false
end 

local function is_blocked_remote(remote)
    for i,v in pairs(blocked_remotes) do
        if v == remote or v == tostring(remote) then
            return true
        end
    end
    return false
end 

local function get_method(object)
    if object:IsA("RemoteEvent") then
        return "FireClient"
    end
    if object:IsA("RemoteFunction") then
        return "InvokeClient"
    end
    return nil
end

local function check_remote(remote)
    local method = get_method(remote)
    if method == "FireClient" then
        remote.OnClientEvent:Connect(function(...)
            local args = {...}
            if not is_blocked_argument(args) and not is_blocked_remote(remote) then
                local s = "game."..remote:GetFullName()..":"..method.."("
                for i,v in pairs(args) do
                    s = s..GetType(v)..","
                end
                local finale = s:sub(1,#s-1)..")"
                table.insert(logs,finale)
                warn(finale)
            end
        end)
    end
    if method == "InvokeClient" then
        remote.OnClientInvoke = function(...)
            local args = {...}
            if not is_blocked_argument(args) and not is_blocked_remote(remote) then
                local s = "game."..remote:GetFullName()..":"..method.."("
                for i,v in pairs(args) do
                    s = s..GetType(v)..","
                end
                local finale = s:sub(1,#s-1)..")"
                table.insert(logs,finale)
                warn(finale)
            end
        end
    end
end

local object_table = game:GetService("ReplicatedStorage"):GetDescendants()

table.insert(object_table,workspace:GetDescendants())

for i,v in pairs(object_table) do
    if v.ClassName == "RemoteEvent" or v.ClassName == "RemoteFunction" then
        check_remote(v)
    end
end

game.DescendantAdded:Connect(function(object)
    if object:IsA("RemoteEvent") or object:IsA("RemoteFunction") then
        check_remote(object)
    end
end)

local mt = getrawmetatable(game)
setreadonly(mt,false)

local old
old = hookmetamethod(game,"__namecall",function(object,...)
    local m = getnamecallmethod()
    local args = {...}
    if m == "FireServer" and tostring(object) == "SayMessageRequest" then
        if string.lower(args[1]:sub(1,8)) == "save/all" then
            if #logs <= 0 then
                game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {Text = "{Remote Spy}: There's nothing to save (No Remotes Were Called)",Color = Color3.fromRGB(255, 0, 0),Font = Enum.Font.SourceSansBold, TextSize = 18})
                return
            end
            local data = ""
            for i,v in pairs(logs) do
                data = data..v.."\n"
            end
            local name = randomchar()
            writefile(name..".txt",data)
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {Text = "{Remote Spy}: Successfully saved all remote logs to "..name..".txt",Color = Color3.fromRGB(0, 255, 0),Font = Enum.Font.SourceSansBold, TextSize = 18})
            return
        end
        if string.lower(args[1]:sub(1,9)) == "blockarg/" then
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {Text = "{Remote Spy}: Successfully blocked the argument "..args[1]:sub(10),Color = Color3.fromRGB(0, 255, 0),Font = Enum.Font.SourceSansBold, TextSize = 18})
            table.insert(blocked_arguments,args[1]:sub(10))
            return
        end
        if string.lower(args[1]:sub(1,12)) == "blockremote/" then
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {Text = "{Remote Spy}: Successfully blocked the remote "..args[1]:sub(10),Color = Color3.fromRGB(0, 255, 0),Font = Enum.Font.SourceSansBold, TextSize = 18})
            table.insert(blocked_remotes,args[1]:sub(13))
            return
        end
        if string.lower(args[1]) == "save/settings" then
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {Text = "{Remote Spy}: Settings successfully saved to "..filename,Color = Color3.fromRGB(0, 255, 0),Font = Enum.Font.SourceSansBold, TextSize = 18}) 
            save_settings()
            return
        end
    end
    return old(object,...)
end)