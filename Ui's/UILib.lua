 
local library = {}
	local Objects = {BackgroundColor = {}, AccentColor = {}, TextColor = {}, GrayContrastColor = {}, DarkContrastColor = {}}
	local ObjectsSearch = {}
	local Highlighted = {}
	local showsearch = true
 
	local Themes = {
		BackgroundColor = Color3.fromRGB(40, 40, 40),
		TextColor = Color3.fromRGB(255, 255, 255),
		AccentColor = Color3.fromRGB(30, 30, 30),
		GrayContrastColor = Color3.fromRGB(35, 35, 35),
		DarkContrastColor = Color3.fromRGB(25, 25, 25),
	}
 
	local ts = game:GetService("TweenService")
	local uis = game:GetService("UserInputService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local rs = game:GetService("RunService")
	local txts = game:GetService("TextService")
	local playergui = game:GetService("Players").LocalPlayer.PlayerGui
	local categoryopacity,categorytopacity = 0,0
	local textcolorsave = Color3.fromRGB(255,255,255)
 
	function library.create(what, propri)
		local instance = Instance.new(what)
 
		for i, v in next, propri do
			if instance[i] and propri ~= "Parent" then
				instance[i] = v
			end
		end
 
		return instance
	end
 
	function library.initiate(NANNA,setting)
 
		_G.OWOOWOWO = NANNA
 
		if game:GetService("CoreGui"):FindFirstChild(_G.OWOOWOWO) then
			game:GetService("CoreGui")[_G.OWOOWOWO]:Destroy()
		end
 
		local firstcategory = true
 
		local categoryopendname
 
		local main = {}
 
		main.screengui = library.create("ScreenGui" ,{
			Name = _G.OWOOWOWO,
			ZIndexBehavior = Enum.ZIndexBehavior.Global,
			ResetOnSpawn = false,
		})
 
		main.notifyframe = library.create("Frame", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderSizePixel = 0,
			Position = UDim2.new(1, -360, 0, 0),
			Size = UDim2.new(0, 360, 1, -10),
		})
 
		main.notifyframe.ClipsDescendants = true
 
		main.notifylayout = library.create("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 10),
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
		})
 
		main.notifyframe.ClipsDescendants = true
		function main.notify(NotificationType, NotificationText, Duration, CallBack)
 
			local Notifications = main.notifyframe:GetChildren()
			if #Notifications >= 5 then
				ts:Create(Notifications[2], TweenInfo.new(0.08), {Size = UDim2.new(0, 350, 0, 0)}):Play()
				wait(.09)
				Notifications[2]:Destroy()
			end
			local returnwhat = false
			local NotificationTemplate
 
			local Text = Instance.new("TextLabel")
			local Icon = Instance.new("ImageLabel")
			local Title = Instance.new("TextLabel")
 
			if not CallBack then
				NotificationTemplate = Instance.new("ImageLabel")
 
				NotificationTemplate.Name = "NotificationTemplate"
				NotificationTemplate.Parent = main.notifyframe
				NotificationTemplate.AnchorPoint = Vector2.new(0, 1)
				NotificationTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationTemplate.BackgroundTransparency = 1.000
				NotificationTemplate.ClipsDescendants = true
				NotificationTemplate.Position = UDim2.new(1, -360, 1, -10)
				NotificationTemplate.Size = UDim2.new(0, 350, 0, 0)
				NotificationTemplate.Image = "rbxassetid://3570695787"
				NotificationTemplate.ImageColor3 = Color3.fromRGB(40, 40, 40)
				NotificationTemplate.ScaleType = Enum.ScaleType.Slice
				NotificationTemplate.SliceCenter = Rect.new(100, 100, 100, 100)
				NotificationTemplate.SliceScale = 0.060
			else 
				NotificationTemplate = Instance.new("ImageButton")
 
				NotificationTemplate.Name = "NotificationTemplate"
				NotificationTemplate.Parent = main.notifyframe
				NotificationTemplate.AnchorPoint = Vector2.new(0, 1)
				NotificationTemplate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				NotificationTemplate.BackgroundTransparency = 1.000
				NotificationTemplate.ClipsDescendants = true
				NotificationTemplate.Position = UDim2.new(1, -360, 1, -10)
				NotificationTemplate.Size = UDim2.new(0, 350, 0, 0)
				NotificationTemplate.Image = "rbxassetid://3570695787"
				NotificationTemplate.ImageColor3 = Color3.fromRGB(40, 40, 40)
				NotificationTemplate.ScaleType = Enum.ScaleType.Slice
				NotificationTemplate.SliceCenter = Rect.new(100, 100, 100, 100)
				NotificationTemplate.SliceScale = 0.060
 
				NotificationTemplate.MouseEnter:Connect(function()
					ts:Create(NotificationTemplate, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(80,80,80)}):Play()
				end)
				NotificationTemplate.MouseLeave:Connect(function()
					ts:Create(NotificationTemplate, TweenInfo.new(0.1), {ImageColor3 = Color3.fromRGB(40, 40, 40)}):Play()
				end)
				NotificationTemplate.MouseButton1Click:Connect(function()
					ts:Create(NotificationTemplate, TweenInfo.new(0.08), {Size = UDim2.new(0, 350, 0, 0)}):Play()
					wait(.09)
					NotificationTemplate:Destroy()
					if CallBack then 
						CallBack(true)
					end
					returnwhat = true 
				end)
			end 
 
			Text.Name = "Text"
			Text.Parent = NotificationTemplate
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Text.BackgroundTransparency = 1.000
			Text.Position = UDim2.new(0, 8, 0, 25)
			Text.Size = UDim2.new(0, 334, 0, 40)
			Text.Font = Enum.Font.Gotham
			Text.Text = NotificationText
			Text.TextColor3 = Color3.fromRGB(255, 255, 255)
			Text.TextSize = 14.000
			Text.TextWrapped = true
			Text.TextXAlignment = Enum.TextXAlignment.Left
 
			Icon.Name = "Icon"
			Icon.Parent = NotificationTemplate
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon.BackgroundTransparency = 1.000
			Icon.Position = UDim2.new(0, 8, 0, 5)
			Icon.Size = UDim2.new(0, 23, 0, 23)
 
			Title.Name = "Title"
			Title.Parent = NotificationTemplate
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0, 40, 0, 5)
			Title.Size = UDim2.new(0, 310, 0, 23)
			Title.Font = Enum.Font.GothamBold
			Title.Text = "Notification"
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 15.000
			Title.TextWrapped = true
			Title.TextXAlignment = Enum.TextXAlignment.Left
 
			if NotificationType:lower() == "click here" or NotificationType:lower() == "click" then
				Title.Text = "Click here"
				Icon.Image = "http://www.roblox.com/asset/?id=6070014671"
			elseif NotificationType:lower() == "notify" or NotificationType:lower() == "notification" then
				Icon.Image = "http://www.roblox.com/asset/?id=6069122440"
				Title.Text = "Notification"
			elseif NotificationType:lower() == "error" then
				Icon.Image = "http://www.roblox.com/asset/?id=6069146108"
				Title.Text = "Error"
			end
			NotificationTemplate.Name = #Notifications+1
			ts:Create(NotificationTemplate, TweenInfo.new(0.08), {Size = UDim2.new(0, 350, 0, 65)}):Play()
			spawn(function()
				delay((Duration or 4),function()
					if not returnwhat then
						if CallBack then 
							CallBack(false)
						end
					end
					ts:Create(NotificationTemplate, TweenInfo.new(0.08), {Size = UDim2.new(0, 350, 0, 0)}):Play()
					wait(.09)
					NotificationTemplate:Destroy()
				end)
			end)
		end
 
		main.mainframe = library.create("ImageLabel", {
			Name = "MainFrame",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			AnchorPoint = Vector2.new(0,0),
			Position = UDim2.new(0.367, 0,0.303, 0),
			Image = "rbxassetid://3570695787",
			ImageColor3 = Themes.BackgroundColor,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(100, 100, 100, 100),
			SliceScale = 0.060,
		})
		table.insert(Objects.BackgroundColor, main.mainframe)
 
		if setting.default then 
			main.mainframe.Size = setting.default
		else 
			main.mainframe.Size = UDim2.new(0, 510, 0, 425)
		end
 
		main.backshadow = library.create("ImageLabel", {
			Name = "RoundShadow",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, -35, 0, -35),
			Size = UDim2.new(1, 70, 1, 70),
			ZIndex = 0,
			Image = "http://www.roblox.com/asset/?id=5865572413",
			ImageTransparency = 0.500,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(50, 50, 50, 50),
		})
 
		main.navbar = library.create("ImageLabel", {
			Name = "TopNavBar",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Size = UDim2.new(1, 0, 0, 38),
			Image = "http://www.roblox.com/asset/?id=5865316406",
			ImageColor3 = Themes.AccentColor,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(100, 100, 100, 100),
			SliceScale = 0.060,
		})
		main.navbar.ClipsDescendants = true
		table.insert(Objects.AccentColor, main.navbar)
 
		local function hasi(v, p)
			local x = v[p]
		end
		local function has(v, p)
			return pcall(function()
				hasi(v, p)
			end)
		end
 
		local dragInput
		local dragStart
		local startPos
 
		local function update(input)
			local delta = input.Position - dragStart
			main.mainframe:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0.01, true)
		end
 
		main.navbar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				dragStart = input.Position
				startPos = main.mainframe.Position
				repeat
					wait()
				until input.UserInputState == Enum.UserInputState.End
				dragging = false
			end
		end)
 
		main.navbar.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)
 
		uis.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
 
		main.logo = library.create("TextLabel", {
			Name = "Logo",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Position = UDim2.new(0, 8, 0, 0),
			Size = UDim2.new(0, 200, 0, 38),
			Font = Enum.Font.GothamBold,
			Text = _G.OWOOWOWO,
			TextColor3 = Themes.TextColor,
			TextSize = 20.000,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
		table.insert(Objects.TextColor, main.logo)
 
		main.categorybutton = library.create("ImageButton", {
			Name = "Button",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Position = UDim2.new(1, -35, 0, 4),
			Size = UDim2.new(0, 30, 0, 28),
			ZIndex = 2,
		})
 
		main.categorybuttonframe = library.create("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 15, 0, 14),
			Size = UDim2.new(0, 30, 0, 28),
		})
		main.categorybuttonframe.ClipsDescendants = true
 
		main.categorybuttonimagefirst = library.create("ImageLabel", {
			Name = "first",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 12, 0, 5),
			Size = UDim2.new(0, 25, 0, 3),
			Image = "rbxassetid://3570695787",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(100, 100, 100, 100),
			SliceScale = 0.050,
			ImageColor3 = Themes.TextColor,
		})	
		table.insert(Objects.TextColor, main.categorybuttonimagefirst)
 
		main.categorybuttonimagesecond = library.create("ImageLabel", {
			Name = "second",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 12, 0, 13),
			Size = UDim2.new(0, 25, 0, 3),
			Image = "rbxassetid://3570695787",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(100, 100, 100, 100),
			SliceScale = 0.050,
			ImageColor3 = Themes.TextColor,
		})	
		table.insert(Objects.TextColor, main.categorybuttonimagesecond)
 
		main.categorybuttonimagethird = library.create("ImageLabel", {
			Name = "third",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 12, 0, 21),
			Size = UDim2.new(0, 25, 0, 3),
			Image = "rbxassetid://3570695787",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(100, 100, 100, 100),
			SliceScale = 0.050,
			ImageColor3 = Themes.TextColor,
		})	
		table.insert(Objects.TextColor, main.categorybuttonimagethird)
 
		main.closebuttonmark = library.create("ImageLabel", {
			Name = "CloseMark",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0.366666704, 0, 0.464285702, 0),
			Size = UDim2.new(0, 0, 0, 0),
			Image = "http://www.roblox.com/asset/?id=5868605950",
			ImageColor3 = Themes.TextColor,
		})
		table.insert(Objects.TextColor, main.closebuttonmark)
 
		main.searchbutton = library.create("ImageButton", {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(1, -72, 0, 4),
			Size = UDim2.new(0, 26, 0, 28),
			AutoButtonColor = false,
			ImageTransparency = 1,
		})
 
		if setting.resize then 
 
			main.resizablebutton = library.create("TextButton", {
				Name = "Resizable",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				Position = UDim2.new(1, -20, 1, -20),
				Size = UDim2.new(0, 20, 0, 20),
				Font = Enum.Font.SourceSans,
				Text = "",
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 14.000,
			})
 
			main.resizablebutton.Parent = main.mainframe
 
			local min = setting.min
			local max = setting.max
			local connection
			local sP
			local MSS
			local size
 
			main.resizablebutton.MouseButton1Down:Connect(function()
				sP = Vector2.new(mouse.X, mouse.Y)
				MSS = main.mainframe.Size
				connection = rs.Heartbeat:Connect(function()
					if sP then
						local distance = Vector2.new(mouse.X, mouse.Y) - sP;
						size = (MSS + UDim2.new(0, distance.X, 0, distance.Y))
						if (MSS + UDim2.new(0, distance.X, 0, distance.Y)).X.Offset <= min.X.Offset then
							size = UDim2.new(0, min.X.Offset, 0, size.Y.Offset)
						elseif (MSS + UDim2.new(0, distance.X, 0, distance.Y)).X.Offset >= max.X.Offset then
							size = UDim2.new(0, max.X.Offset, 0, size.Y.Offset)
						end
 
						if (MSS + UDim2.new(0, distance.X, 0, distance.Y)).Y.Offset <= min.Y.Offset then
							size = UDim2.new(0, size.X.Offset, 0, min.Y.Offset)
						elseif (MSS + UDim2.new(0, distance.X, 0, distance.Y)).Y.Offset >= max.Y.Offset then
							size = UDim2.new(0, size.X.Offset, 0, max.Y.Offset)
						end
						main.mainframe.Size = size				
					end
				end)
				uis.InputEnded:Connect(function(Check)
					if Check.UserInputType == Enum.UserInputType.MouseButton1 then
						if connection then
							connection:Disconnect()
							connection = nil
						end
					end
				end)
			end)
 
		end
 
		main.categoryhandler = library.create("ImageLabel", {
			Name = "CategoryHandler",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 0, 0, 38),
			Size = UDim2.new(1, 0, 1, -38),
			ImageTransparency = 1.000,
		})
 
		main.categoryhandlerscrolling = library.create("ScrollingFrame", {
			Name = "CategoryHandlerScrolling",
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			ScrollBarThickness = 0,
		})
 
		main.categoryhandlerlayout = library.create("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
		})
 
		main.categoryhandlerpadding = library.create("UIPadding", {
			PaddingTop = UDim.new(0,8),
			PaddingBottom = UDim.new(0,8),
		})
 
		main.categories = library.create("ImageLabel", {
			Name = "Categories",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 0, 0, 38),
			Size = UDim2.new(1, 0, 1, 0),
			ImageTransparency = 1.000,
		})
 
		main.closebuttonmarksearch = library.create("ImageLabel", {
			Name = "CloseMark",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0.366666704, 0, 0.464285702, 0),
			Size = UDim2.new(0, 0, 0, 0),
			Image = "http://www.roblox.com/asset/?id=5868605950",
			ImageColor3 = Themes.TextColor,
		})
		table.insert(Objects.TextColor, main.closebuttonmarksearch)
 
		main.searchicon = library.create("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 26, 0, 28),
			Image = "http://www.roblox.com/asset/?id=6021404469",
			ImageColor3 = Themes.TextColor,
		})
		table.insert(Objects.TextColor, main.searchicon)
 
		main.searchbox = library.create("TextBox", {
			Name = "SearchBox",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 8, 0, -38),
			Size = UDim2.new(0.8, 0, 1, 0),
			PlaceholderColor3 = Color3.fromRGB(255, 255, 255),
			Text = "Search...",
			TextColor3 = Themes.TextColor,
			TextSize = 14.000,
			Font = Enum.Font.GothamBold,
			TextXAlignment = Enum.TextXAlignment.Left,
		})
		table.insert(Objects.TextColor, main.searchbox)
 
		main.searchscrollingback = library.create("ImageLabel", {
			Name = "SearchScrollingBack",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Position = UDim2.new(0, 0, 0, 38),
			Size = UDim2.new(1, 0, 1, -38),
			ImageTransparency = 1.000,
		})
 
		main.searchscrolling = library.create("ScrollingFrame", {
			Name = "CategoryHandlerScrolling",
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = false,
			CanvasSize = UDim2.new(0, 0, 0, 344),
			ScrollBarThickness = 0,
		})
 
		main.searchscrollinglayout = library.create("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8),
		})
 
		local showcategories = false
 
		main.searchbox.Focused:Connect(function()
			main.mainframe["Categories"][categoryopendname].ScrollingFrame.Visible = false
		end)
 
		main.searchbox.Changed:Connect(function()
 
			local searchtext = main.searchbox.Text:lower()
 
			if searchtext ~= "" and main.searchbox.Position == UDim2.new(0, 8, 0, 0) then 
				for i,v in pairs(main.categories:GetChildren()) do 
					v.ScrollingFrame.Visible = false
				end
				for i,v in pairs(Highlighted) do 
					v.TextColor3 = textcolorsave
				end
				for i,v in pairs(ObjectsSearch) do
					local text = v:FindFirstChildOfClass("TextLabel")
 
					if text and text.Text:gsub("%s", ""):lower():sub(1, #searchtext) == searchtext then
						if v.Name:lower():find("section") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							v.Parent.Parent.ScrollingFrame.Visible = false
							main.mainframe["Categories"][v.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("button") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("toggle") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("slider") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("textbox") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("label") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("keybind") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Parent.Name:lower():find("dropdown") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						elseif v.Name:lower():find("colorpicker") then
							text.TextColor3 = Color3.fromRGB(0,255,0)
							table.insert(Highlighted, text)
							main.mainframe["Categories"][v.Parent.Parent.Parent.Name].ScrollingFrame.Visible = true
						end
					end
				end
			elseif searchtext == "" and main.searchbox.Position == UDim2.new(0, 8, 0, 0) then 
				for i,v in pairs(Highlighted) do 
					v.TextColor3 = textcolorsave
				end 
			end
		end)
 
		main.categorybutton.MouseButton1Click:Connect(function()
			showcategories = not showcategories
			if showcategories then
				main.categoryhandlerscrolling.Visible = true
				ts:Create(main.categorybuttonframe, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 28)}):Play()
				wait(.1)
				ts:Create(main.closebuttonmark, TweenInfo.new(0.1), {Size = UDim2.new(0, 25, 0, 25)}):Play()
				for i,v in pairs(main.mainframe["Categories"]:GetChildren()) do 
					v.ScrollingFrame.Visible = false
				end
 
				for i,v in pairs(main.categoryhandlerscrolling:GetChildren()) do 
					if v:IsA("Frame") then 
						for a,b in pairs(v:GetChildren()) do 
							ts:Create(b, TweenInfo.new(0.15), {ImageTransparency = 0}):Play()
							ts:Create(b.Text, TweenInfo.new(0.15), {TextTransparency = 0}):Play()
							wait(.02)
						end
					end
				end
			else
				ts:Create(main.closebuttonmark, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				wait(.1)
				ts:Create(main.categorybuttonframe, TweenInfo.new(0.1), {Size = UDim2.new(0, 30, 0, 28)}):Play()
				for i,v in pairs(main.categoryhandlerscrolling:GetChildren()) do
					if v:IsA("Frame") then 
						for a,b in pairs(v:GetChildren()) do 
							ts:Create(b, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
							ts:Create(b.Text, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
							wait()
						end
					end
				end
				main.categoryhandlerscrolling.Visible = false 
				main.mainframe["Categories"][categoryopendname].ScrollingFrame.Visible = true
			end
		end)
 
		function main.category(name)
 
			local category = {}
 
			local searchpp = false
 
			category.categorybuttonback = library.create("Frame", {
				Name = name,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(0.951, 0, 0, 35),
			})
 
			category.categorybutton = library.create("ImageButton", {
				Name = name,
				ImageTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 35),
				Image = "rbxassetid://3570695787",
				ImageColor3 = Themes.AccentColor,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(100, 100, 100, 100),
				SliceScale = 0.060,
			})
			table.insert(Objects.AccentColor, category.categorybutton)
 
			category.text = library.create("TextLabel", {
				Name = "Text",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				TextTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Position = UDim2.new(0, 8, 0, 0),
				Size = UDim2.new(0, 200, 0, 35),
				Font = Enum.Font.GothamBold,
				Text = name,
				TextColor3 = Themes.TextColor,
				TextSize = 18.000,
				TextXAlignment = Enum.TextXAlignment.Left,
			})
			table.insert(Objects.TextColor, category.text)
 
			category.categorycontainer = library.create("ImageLabel", {
				Name = name.."Container",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, -38),
				ImageTransparency = 1.000,
			})
			category.categorycontainer.ClipsDescendants = true
 
			category.categoryscrolling = library.create("ScrollingFrame", {
				Visible = false,
				Active = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1.000,
				Size = UDim2.new(1, 0, 1, 0),
				CanvasSize = UDim2.new(0,0,0,8),
				ScrollBarThickness = 0,
			})
 
			category.categoryscrollinglayout = library.create("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8),
			})
 
			category.categoryscrollingpadding = library.create("UIPadding", {
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0,8),
			})
 
			category.categorybutton.MouseButton1Click:Connect(function()
			if _G.kfgddfgfdghgbfdhgf ~= nil then 
                ts:Create(_G.kfgddfgfdghgbfdhgf, TweenInfo.new(0.08), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end
 
            	ts:Create(category.categorybutton, TweenInfo.new(0.08), {Position = UDim2.new(0, 2, 0, 3)}):Play()
                ts:Create(category.text, TweenInfo.new(0.08), {TextColor3 = Color3.fromRGB(0,255,0)}):Play()
 
_G.kfgddfgfdghgbfdhgf = category.text
 
				wait(.09)
				ts:Create(category.categorybutton, TweenInfo.new(0.08), {Position = UDim2.new(0, 0, 0, 0)}):Play()
				showcategories = false
				ts:Create(main.closebuttonmark, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				wait(.1)
				ts:Create(main.categorybuttonframe, TweenInfo.new(0.1), {Size = UDim2.new(0, 30, 0, 28)}):Play()
				for i,v in pairs(main.categoryhandlerscrolling:GetChildren()) do
					if v:IsA("Frame") then 
						for a,b in pairs(v:GetChildren()) do
							ts:Create(b, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
							ts:Create(b.Text, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
							wait()
						end
					end
				end
				category.categoryscrolling.Visible = true
				main.categoryhandlerscrolling.Visible = false 
				categoryopendname = name.."Container"
			end)
 
			function category.section(name)
 
				local sections = {}
 
				sections.section = library.create("ImageLabel", {
					Name = name.."Section",
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1.000,
					Position = UDim2.new(0.12330097, -56, 0.0204081628, 0),
					Size = UDim2.new(0.972, 0, 0, 36),
					Image = "rbxassetid://3570695787",
					ImageColor3 = Themes.GrayContrastColor,
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(100, 100, 100, 100),
					SliceScale = 0.060,
				})
				table.insert(ObjectsSearch, sections.section)
				table.insert(Objects.GrayContrastColor, sections.section)
 
				sections.text = library.create("TextLabel", {	
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1.000,
					BorderSizePixel = 0,
					Position = UDim2.new(0.140211612, 0, 0.0627451017, 0),
					Size = UDim2.new(0.97299999, 0, 0, 28),
					Font = Enum.Font.GothamBold,
					Text = name,
					TextColor3 = Themes.TextColor,
					TextSize = 18.000,
					TextXAlignment = Enum.TextXAlignment.Left,
				})
				table.insert(Objects.TextColor, sections.text)
 
				sections.sectionlayout = library.create("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 8),
				})
 
				function sections.button(name, callback, animated)
 
					local buttons = {}
 
					buttons.buttonback = library.create("Frame", {
						Name = name.."Button",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0.0155339809, 0, 0.0204081628, 0),
						Size = UDim2.new(0.964, 0, 0, 35),
					})
 
					buttons.button = library.create("ImageButton", {
						Name = name.."Button",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Size = UDim2.new(1, 0, 0, 35),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.AccentColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.060,
					})
					table.insert(ObjectsSearch, buttons.button)
					table.insert(Objects.AccentColor, buttons.button)
 
					buttons.text = library.create("TextLabel", {
						Name = "Text",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(1, 0, 0, 35),
						Font = Enum.Font.GothamBold,
						Text = name,
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
						TextXAlignment = Enum.TextXAlignment.Center,		
					})
					table.insert(Objects.TextColor, buttons.text)
 
					buttons.button.MouseButton1Click:Connect(function()
						if animated then 
							ts:Create(buttons.button, TweenInfo.new(0.08), {Size = UDim2.new(0.96, 0, 0, 30)}):Play()
							wait(.09)
							ts:Create(buttons.button, TweenInfo.new(0.08), {Size = UDim2.new(1, 0, 0, 35)}):Play()
						end
 
						if callback then 
							callback()
						end
					end)
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 43)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
 
					buttons.buttonback.Parent = sections.section
					buttons.button.Parent = buttons.buttonback
					buttons.text.Parent = buttons.button
 
					return buttons
 
				end
 
				function sections.toggle(name, callback, default)
 
					local toggles = {}
 
					local toggled = false
 
					toggles.toggle = library.create("ImageButton", {
						Name = name.."Toggle",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.00576804997, 0, 0.055555556, 0),
						Size = UDim2.new(0.964, 0, 0, 35),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.AccentColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(ObjectsSearch, toggles.toggle)
					table.insert(Objects.AccentColor, toggles.toggle)
 
					toggles.text = library.create("TextLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.00800000038, 0, 0.057, 0),
						Size = UDim2.new(0.399576753, 0, 0.857142866, 0),
						Font = Enum.Font.GothamBold,
						Text = name,
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
					table.insert(Objects.TextColor, toggles.text)
 
					toggles.showback = library.create("ImageLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(1, -56, 0.114, 0),
						Size = UDim2.new(0, 50, 0, 26),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.DarkContrastColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.550,
					})
					table.insert(Objects.DarkContrastColor, toggles.showback)
 
					toggles.show = library.create("ImageLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0.099999994, 0, 0.115000002, 0),
						Size = UDim2.new(0, 20, 0, 20),
						Image = "rbxassetid://3570695787",
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						ImageColor3 = Themes.TextColor,
					})
					table.insert(Objects.TextColor, toggles.show)
 
					if default then 
						toggled = default 
						callback(default)
						if toggled then 
							ts:Create(toggles.show, TweenInfo.new(0.1), {
								Position = UDim2.new(0.5, 0, 0.115, 0)
							}):Play()
						else
							ts:Create(toggles.show, TweenInfo.new(0.1), {
								Position = UDim2.new(0.1, 0, 0.115, 0)
							}):Play()
						end
					end 
 
					toggles.toggle.MouseButton1Click:Connect(function()
						toggled = not toggled
 
						if toggled then 
							ts:Create(toggles.show, TweenInfo.new(0.1), {
								Position = UDim2.new(0.5, 0, 0.115, 0)
							}):Play()
						else
							ts:Create(toggles.show, TweenInfo.new(0.1), {
								Position = UDim2.new(0.1, 0, 0.115, 0)
							}):Play()
						end
 
						callback(toggled)
 
					end)
 
					function toggles:ChangeState(NewState)
						toggled = NewState
 
						if toggled then 
							ts:Create(toggles.show, TweenInfo.new(0.1), {
								Position = UDim2.new(0.5, 0, 0.115, 0)
							}):Play()
						else
							ts:Create(toggles.show, TweenInfo.new(0.1), {
								Position = UDim2.new(0.1, 0, 0.115, 0)
							}):Play()
						end
 
						callback(toggled)
					end 
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 43)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
 
					toggles.toggle.Parent = sections.section
					toggles.text.Parent = toggles.toggle
					toggles.showback.Parent = toggles.toggle 
					toggles.show.Parent = toggles.showback
 
					return toggles
 
				end 
 
				function sections.slider(name, callback, min, max, default, changablevalue, overmax)
 
					local sliders = {}
 
					local Value = 0
 
					local connection
 
					sliders.background = library.create("ImageLabel", {
						Name = name.."Slider",
						BackgroundColor3 = Color3.fromRGB(248, 248, 248),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(27, 42, 53),
						Position = UDim2.new(0, 8, 0, 91),
						Size = UDim2.new(0.964, 0, 0, 50),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.AccentColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.060,
					})
					table.insert(ObjectsSearch, sliders.background)
					table.insert(Objects.AccentColor, sliders.background)
 
					sliders.text = library.create("TextLabel", {
						Name = "Text",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 4, 0, 2),
						Size = UDim2.new(0, 150, 0, 30),
						Font = Enum.Font.GothamBold,
						Text = name,
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
					table.insert(Objects.TextColor, sliders.text)
 
					if not changablevalue then 
						sliders.value = library.create("TextLabel", {
							Name = "Value",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Position = UDim2.new(0.888000011, 0, 0, 6),
							Size = UDim2.new(0.0879999995, 0, 0, 22),
							Font = Enum.Font.GothamBold,
							Text = "0",
							TextColor3 = Themes.TextColor,
							TextSize = 18.000,
							TextXAlignment = Enum.TextXAlignment.Right,
						})
						table.insert(Objects.TextColor, sliders.value)
					else 
						sliders.value = library.create("TextBox", {
							Name = "Value",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Position = UDim2.new(0.888000011, 0, 0, 6),
							Size = UDim2.new(0.0879999995, 0, 0, 22),
							Font = Enum.Font.GothamBold,
							Text = "0",
							TextColor3 = Themes.TextColor,
							TextSize = 18.000,
							TextXAlignment = Enum.TextXAlignment.Right,
						})
						table.insert(Objects.TextColor, sliders.value)
						sliders.value.FocusLost:Connect(function()
							if sliders.value.Text == "" then 
								sliders.value.Text = Value
							end
						end)
						sliders.value:GetPropertyChangedSignal("Text"):Connect(function()
							if not connection then
								local number = tonumber(sliders.value.Text)
								if not tonumber(number) then 
									sliders.value.Text = sliders.value.Text:gsub("%D", "")
								elseif number < min then
									Value = min
									sliders.value.Text = tostring(min)
								elseif number > max and not overmax then 
									Value = max 
									sliders.value.Text = tostring(max)
								elseif number >= max and overmax then 
									Value = number
									if Value > 10000 then 
										Value = 10000
										sliders.value.Text = tonumber(10000)
									end 
									if callback then
										callback(number)
									end
									ts:Create(sliders.inner, TweenInfo.new(0.05), {Size = UDim2.new(1, 0, 0, 6)}):Play()
									ts:create(sliders.circle, TweenInfo.new(0.05), {Position = UDim2.new(1, -7, 0, -3)}):Play()
								elseif number >= min and number <= max then 
									Value = number
									if callback then
										callback(number)
									end
									local scale = (number - min) / (max - min)
									ts:Create(sliders.inner, TweenInfo.new(0.05), {Size = UDim2.new(scale, 0, 0, 6)}):Play()
									ts:create(sliders.circle, TweenInfo.new(0.05), {Position = UDim2.new(scale, -7, 0, -3)}):Play()
								end 
							end 
						end)
					end
 
					sliders.slider = library.create("ImageButton", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.011, 0, 0, 35),
						Size = UDim2.new(0.968, 0, 0, 7),
						AutoButtonColor = false,
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.DarkContrastColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.020,
					})
					table.insert(Objects.DarkContrastColor, sliders.slider)
 
					sliders.inner = library.create("ImageLabel", {			
						Name = "Inner",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(0, 0, 0, 8),
						Image = "rbxassetid://3570695787",
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.03,
						ImageColor3 = Themes.TextColor,
					})
					table.insert(Objects.TextColor, sliders.inner)
 
					sliders.circle = library.create("ImageLabel", {
						Name = "Circle",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(-0.000949703157, 0, 0, -3),
						Size = UDim2.new(0, 13, 0, 13),
						Image = "rbxassetid://3570695787",
						ScaleType = Enum.ScaleType.Slice,
						ImageColor3 = Themes.TextColor,
						SliceCenter = Rect.new(100, 100, 100, 100),
					})
					table.insert(Objects.TextColor, sliders.circle)
 
					sliders.circletransparency = library.create("ImageLabel", {	
						Name = "CircleTrasparency",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 24, 0, 24),
						Image = "rbxassetid://3570695787",
						ImageTransparency = 1,
						ZIndex = 2,
						ImageColor3 = Themes.TextColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
					})
					table.insert(Objects.TextColor, sliders.circletransparency)
 
					sliders.circle.MouseEnter:Connect(function()
						if not connection then 
							ts:create(sliders.circletransparency, TweenInfo.new(0.1), {ImageTransparency = 0.9}):Play()
						end
					end)
 
					sliders.circle.MouseLeave:Connect(function()
						if not connection then 
							ts:create(sliders.circletransparency, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
						end
					end)
 
					if tonumber(default) and not overmax then
						sliders.value.Text = tostring(default)
						if callback then
							callback(default)
						end
						local scale = (default - min) / (max - min)
						ts:Create(sliders.inner, TweenInfo.new(0.05), {Size = UDim2.new(scale, 0, 0, 6)}):Play()
						ts:create(sliders.circle, TweenInfo.new(0.05), {Position = UDim2.new(scale, -7, 0, -3)}):Play()
					elseif tonumber(default) and overmax then
						sliders.value.Text = tostring(default)
						if callback then
							callback(default)
						end
						local scale 
						if tonumber(default) >= max then 
							scale = 1
						elseif tonumber(default) < max then 
							scale = (default - min) / (max - min)
						end
						ts:Create(sliders.inner, TweenInfo.new(0.05), {Size = UDim2.new(scale, 0, 0, 6)}):Play()
						ts:create(sliders.circle, TweenInfo.new(0.05), {Position = UDim2.new(scale, -7, 0, -3)}):Play()
					end
 
					local precise = (min%1 > 0)
					sliders.slider.MouseButton1Down:Connect(function()
						ts:create(sliders.circletransparency, TweenInfo.new(0.1), {ImageTransparency = 0.7}):Play()
 
						connection = rs.Heartbeat:Connect(function()
							local scale = math.clamp(mouse.X - sliders.slider.AbsolutePosition.X, 0, sliders.slider.AbsoluteSize.X) / sliders.slider.AbsoluteSize.X
							if precise then
								Value = string.format("%.1f", min + ((max - min) * scale))
							else
								Value = math.floor(min + ((max - min) * scale))
							end
							sliders.value.Text = tostring(Value)
 
							if callback then
								callback(Value)
							end
 
							ts:Create(sliders.inner, TweenInfo.new(0.05), {Size = UDim2.new(scale, 0, 0, 6)}):Play()
							ts:create(sliders.circle, TweenInfo.new(0.05), {Position = UDim2.new(scale, -8, 0, -3)}):Play()
						end)
 
						uis.InputEnded:Connect(function(Check)
							if Check.UserInputType == Enum.UserInputType.MouseButton1 then
								if connection then
									ts:create(sliders.circletransparency, TweenInfo.new(0.1), {ImageTransparency = 1}):Play()
									connection:Disconnect()
									connection = nil
								end
							end
						end)
 
					end)
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 58)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 58)
 
					sliders.background.Parent = sections.section
					sliders.text.Parent = sliders.background
					sliders.value.Parent = sliders.background
					sliders.slider.Parent = sliders.background
					sliders.inner.Parent = sliders.slider
					sliders.circle.Parent = sliders.slider
					sliders.circletransparency.Parent = sliders.circle
 
					return sliders 
 
				end 
 
				function sections.textbox(name, callback, placeholder)
 
					local textboxes = {}
 
					textboxes.background = library.create("ImageLabel", {
						Name = name.."Textbox",
						BackgroundColor3 = Color3.fromRGB(248, 248, 248),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.0192307699, 0, 0.467741936, 0),
						Size = UDim2.new(0.964, 0, 0, 35),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.AccentColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(ObjectsSearch, textboxes.background)
					table.insert(Objects.AccentColor, textboxes.background)
 
					textboxes.text = library.create("TextLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, 4, 0, 2),
						Size = UDim2.new(0.400000006, 0, 0, 30),
						Font = Enum.Font.GothamBold,
						Text = name,
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
					table.insert(Objects.TextColor, textboxes.text)
 
					textboxes.textboxbox = library.create("ImageLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.587970376, 0, 0.114, 0),
						Size = UDim2.new(0.400000006, 0, 0, 26),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.DarkContrastColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(Objects.DarkContrastColor, textboxes.textboxbox)
 
					textboxes.textbox = library.create("TextBox", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, 0, 0.0384615399, 0),
						Size = UDim2.new(0.966, 0, 0, 23),
						Font = Enum.Font.GothamBold,
						PlaceholderText = "",
						Text = "",
						TextColor3 = Themes.TextColor,
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Right,
					})
					table.insert(Objects.TextColor, textboxes.textbox)
					textboxes.textbox.TextWrapped = true
 
					if placeholder then
						textboxes.textbox.PlaceholderText = placeholder
					end
 
					textboxes.textbox.FocusLost:Connect(function()
						local text = textboxes.textbox.Text
 
						if callback then 
							callback(text)
						end
					end)
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 43)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
 
					textboxes.background.Parent = sections.section
					textboxes.text.Parent = textboxes.background
					textboxes.textboxbox.Parent = textboxes.background
					textboxes.textbox.Parent = textboxes.textboxbox
 
					return textboxes
 
				end 
 
				function sections.label(name)
 
					local labels = {}
 
					labels.background = library.create("ImageLabel", {
						Name = name.."Label",
						BackgroundColor3 = Color3.fromRGB(248, 248, 248),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.0192307699, 0, 0.467741936, 0),
						Size = UDim2.new(0.964, 0, 0, 35),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.AccentColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(ObjectsSearch, labels.background)
					table.insert(Objects.AccentColor, labels.background)
 
					labels.text = library.create("TextLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, 4, 0, 0),
						Size = UDim2.new(0.991999984, 0, 0, 35),
						Font = Enum.Font.GothamBold,
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
						Text = name,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
					table.insert(Objects.TextColor, labels.text)
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 43)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
 
					labels.background.Parent = sections.section
					labels.text.Parent = labels.background
 
					return labels
 
				end 
 
				function sections.keybind(name, callback, default)
 
					local keybinds = {}
 
					local bind = nil
 
					local changing
 
					local inputconnection
 
					local checkconnection
					keybinds.background = library.create("ImageLabel", {
						Name = name.."KeyBind",
						BackgroundColor3 = Color3.fromRGB(248, 248, 248),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(27, 42, 53),
						Position = UDim2.new(0, 10, 0, 235),
						Size = UDim2.new(0.963999987, 0, 0, 35),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.AccentColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(ObjectsSearch, keybinds.background)
					table.insert(Objects.AccentColor, keybinds.background)
 
					keybinds.text = library.create("TextLabel", {
						Name = "Text",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.00800000038, 0, 0, 2),
						Size = UDim2.new(0.400000006, 0, 0, 30),
						Font = Enum.Font.GothamBold,
						Text = name,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 18.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
					table.insert(Objects.TextColor, keybinds.text)
 
					keybinds.keybind = library.create("ImageButton", {
						Name = "Button",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(1, -126, 0, 4),
						Size = UDim2.new(0, 120, 0, 26),
						AutoButtonColor = false,
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.DarkContrastColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(Objects.DarkContrastColor, keybinds.keybind)
 
					keybinds.key = library.create("TextLabel", {
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.639999986, -30, 0, 0),
						Size = UDim2.new(0, 30, 1, 0),
						Font = Enum.Font.GothamBold,
						Text = "None",
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
					})
					table.insert(Objects.TextColor, keybinds.key)
 
					keybinds.background.Parent = sections.section
					keybinds.keybind.Parent = keybinds.background
					keybinds.text.Parent = keybinds.background
					keybinds.key.Parent = keybinds.keybind
 
					if default then 
						bind = default 
						keybinds.key.Text = bind.Name
					end 
 
					keybinds.keybind.MouseButton1Click:Connect(function()
						changing = true
						keybinds.key.Text = "..."
						connection = uis.InputBegan:Connect(function(i)
							if i.UserInputType.Name == "Keyboard" and i.KeyCode ~= Enum.KeyCode.Backspace then
								keybinds.key.Text = i.KeyCode.Name
								bind = i.KeyCode
								if connection then
									connection:Disconnect()
									connection = nil
									wait(.1)
									changing = false
								end
							elseif i.KeyCode == Enum.KeyCode.Backspace then
								keybinds.key.Text = "None"
								bind = nil
								if connection then
									connection:Disconnect()
									connection = nil 
									wait(.1)
									changing = false
								end
							end
						end)
					end)
 
					inputconnection = uis.InputBegan:Connect(function(i, GPE)
						if bind and i.KeyCode == bind and not GPE and not connection then
							if callback and not changing then
								callback(i.KeyCode)
							end
						end
					end)
 
					checkconnection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
						if child.Name == _G.OWOOWOWO then 
							if inputconnection then
								inputconnection:Disconnect()
								inputconnection = nil
							end
							if checkconnection then 
								checkconnection:Disconnect()
								checkconnection = nil
							end 
						end 
					end)
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 43)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
 
					return keybinds
 
				end
 
				function sections.dropdown(name, callback, options, playerlist, search, beforeopen)
					if search then 
 
						local tableA = {}
 
						local dropdowns = {}
 
						local listopend = false
 
						local SearchLock = true
 
						local selectedvalue 
 
						if options and not playerlist then
							tableA = {}
							tableA = options
						elseif options and playerlist then 
							tableA = {}
							for i,v in pairs(options) do 
								table.insert(tableA, v)
							end 
							local list = game:GetService("Players")
							for a,b in pairs(list:GetChildren()) do 
								if b:IsA("Player") then
									table.insert(tableA, b.Name)
								end 
							end
						elseif not options and playerlist then 
							tableA = {}
							local list = game:GetService("Players")
							for a,b in pairs(list:GetChildren()) do 
								if b:IsA("Player") then
									table.insert(tableA, b.Name)
								end 
							end
						end
 
						dropdowns.background = library.create("ImageLabel", {
							Name = name.."DropDown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							ClipsDescendants = true,
							Position = UDim2.new(0, 11, 0, 40),
							Size = UDim2.new(0.963999987, 0, 0, 30),
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(29, 29, 35),
							ImageTransparency = 1.000,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})
						dropdowns.background.ClipsDescendants = true
 
						dropdowns.background2 = library.create("ImageLabel", {
							Name = "Background",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Size = UDim2.new(1, 0, 0, 30),
							Image = "rbxassetid://3570695787",
							ImageColor3 = Themes.AccentColor,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})
						table.insert(ObjectsSearch, dropdowns.background2)
						table.insert(Objects.AccentColor, dropdowns.background2)
 
						dropdowns.textbox = library.create("TextBox", {
							Active = false,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Position = UDim2.new(0.00800000038, 0, 0, 0),
							Selectable = false,
							Size = UDim2.new(0.9, 0, 1, 0),
							Font = Enum.Font.GothamBold,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 18.000,
							Text = name,
							TextXAlignment = Enum.TextXAlignment.Left,
						})
						table.insert(Objects.TextColor, dropdowns.textbox)
 
						dropdowns.arrow = library.create("ImageButton", {
							Name = "Arrow",
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							BorderSizePixel = 0,
							Position = UDim2.new(1, -32, 0.0333333351, 0),
							Rotation = 90.000,
							AutoButtonColor = false,
							ImageColor3 = Themes.TextColor,
							Size = UDim2.new(0, 28, 0, 28),
							Image = "http://www.roblox.com/asset/?id=5054982349",
						})
						table.insert(Objects.TextColor, dropdowns.arrow)
 
						dropdowns.backgroundlist = library.create("ImageLabel", {
							Name = "Backgroundlist",
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 0, 0, 40),
							Size = UDim2.new(1, 0, 0, 120),
							ZIndex = 2,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(math.floor(Themes.GrayContrastColor.r * 255) - 3, math.floor(Themes.GrayContrastColor.g * 255) - 3, math.floor(Themes.GrayContrastColor.b * 255) - 3),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})
						table.insert(Objects.GrayContrastColor, dropdowns.backgroundlist)
 
						dropdowns.list = library.create("ScrollingFrame", {
							BackgroundColor3 = Color3.fromRGB(29, 29, 35),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 2,
							CanvasSize = UDim2.new(0, 0, 0, 0),
							ScrollBarImageColor3 = Color3.fromRGB(35 - 5, 35 - 5, 35 - 5),
							ScrollBarThickness = 3,
						})
 
						dropdowns.listlayout = library.create("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 10),
						})
 
						dropdowns.listpadding = library.create("UIPadding", {
							PaddingBottom = UDim.new(0, 10),
							PaddingLeft = UDim.new(0, 10),
							PaddingTop = UDim.new(0, 10),						
						})
 
						local function HideShowList()
							if not listopend then
								ts:Create(dropdowns.arrow, TweenInfo.new(0.1), {Rotation = 90}):Play()
								ts:Create(sections.section, TweenInfo.new(0.1), {Size = sections.section.Size - UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(category.categoryscrolling, TweenInfo.new(0.1), {CanvasSize = category.categoryscrolling.CanvasSize - UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(dropdowns.background, TweenInfo.new(0.1), {Size = UDim2.new(0.964, 0, 0, 30)}):Play()
							else
								ts:Create(dropdowns.arrow, TweenInfo.new(0.1), {Rotation = 0}):Play()
								ts:Create(sections.section, TweenInfo.new(0.1), {Size = sections.section.Size + UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(dropdowns.list, TweenInfo.new(0.1), {CanvasSize = UDim2.new(0, 0, 0, dropdowns.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)}):Play()
								ts:Create(category.categoryscrolling, TweenInfo.new(0.1), {CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(category.categoryscrolling, TweenInfo.new(0.1), {CanvasPosition = category.categoryscrolling.CanvasPosition + Vector2.new(0, 125)}):Play()
								ts:Create(dropdowns.background, TweenInfo.new(0.1), {Size = UDim2.new(0.964, 0, 0, 154)}):Play()
							end
						end
 
						local function RefreshList()
 
							for a, b in pairs(dropdowns.list:GetChildren()) do
								if b:IsA("ImageButton") then
									b:Destroy()
								end
							end
 
							for i, v in pairs(tableA) do
								local button = library.create("ImageButton", {
									Name = string.lower(v),
									AnchorPoint = Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderColor3 = Color3.fromRGB(27, 42, 53),
									Position = UDim2.new(0, 252, 0, 0),
									Size = UDim2.new(0.98, 0, 0, 30),
									ZIndex = 2,
									AutoButtonColor = false,
									Image = "rbxassetid://3570695787",
									ImageColor3 = Themes.AccentColor,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.040,
								})
								table.insert(Objects.AccentColor, button)
 
								local buttontext = library.create("TextLabel", {
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderSizePixel = 0,
									Position = UDim2.new(0.078, 0, 0, 0),
									Size = UDim2.new(0.833, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.GothamBold,
									Text = v,
									TextColor3 = Themes.TextColor,
									TextSize = 18,
								})
								table.insert(Objects.TextColor, buttontext)
 
								button.Parent = dropdowns.list
								buttontext.Parent = button
 
								button.MouseButton1Click:Connect(function()
									if listopend then
 
										listopend = not listopend
										dropdowns.textbox.Text = v
 
										HideShowList()
 
										if callback then
											callback(v)
										end
									end
								end)
							end
						end
 
						local Found = {}
						local searchtable = {}
 
						for f,h in pairs(tableA) do
							table.insert(searchtable, string.lower(h))
						end
 
						RefreshList()
 
						dropdowns.textbox.Focused:Connect(function()
							SearchLock = false
							if not listopend then 
								if beforeopen then 
									local newtable = beforeopen()
									tableA = newtable
									for f,h in pairs(tableA) do
										table.insert(searchtable, string.lower(h))
									end
								end
								if options and playerlist then 
									tableA = {}
									for i,v in pairs(options) do 
										table.insert(tableA, v)
									end 
									local list = game:GetService("Players")
									for a,b in pairs(list:GetChildren()) do 
										if b:IsA("Player") then
											table.insert(tableA, b.Name)
										end 
									end
								elseif not options and playerlist then 
									tableA = {}
									local list = game:GetService("Players")
									for i,v in pairs(list:GetChildren()) do 
										if v:IsA("Player") then
											table.insert(tableA, v.Name)
										end
									end
								end
								listopend = not listopend
								HideShowList()
								RefreshList()
							end
						end)
 
						dropdowns.arrow.MouseButton1Click:Connect(function()
							listopend = not listopend
							if beforeopen then 
								local newtable = beforeopen()
								tableA = newtable
								for f,h in pairs(tableA) do
									table.insert(searchtable, string.lower(h))
								end
							end
							if options and playerlist then 
								tableA = {}
								for i,v in pairs(options) do 
									table.insert(tableA, v)
								end 
								local list = game:GetService("Players")
								for a,b in pairs(list:GetChildren()) do 
									if b:IsA("Player") then
										table.insert(tableA, b.Name)
									end 
								end
							elseif not options and playerlist then 
								tableA = {}
								local list = game:GetService("Players")
								for i,v in pairs(list:GetChildren()) do 
									if v:IsA("Player") then
										table.insert(tableA, v.Name)
									end
								end
							end
							HideShowList()
							RefreshList()
						end)
 
						local function Edit()
							for i in pairs(Found) do
								Found[i] = nil
							end
							for h, l in pairs(dropdowns.list:GetChildren()) do
								if not l:IsA("UIListLayout") and not l:IsA("UIPadding") then
									l.Visible = false
								end
							end
							dropdowns.textbox.Text = string.lower(dropdowns.textbox.Text)
						end
 
						local function Search()
							local Results = {}
							local num
							for i, v in pairs(searchtable) do
								if string.find(v, dropdowns.textbox.Text) then
									table.insert(Found, v)
								end
							end
							for a, b in pairs(dropdowns.list:GetChildren()) do
								for c, d in pairs(Found) do
									if d == b.Name then
										b.Visible = true
									end
								end
							end
							for p, n in pairs(dropdowns.list:GetChildren()) do
								if not n:IsA("UIListLayout") and not n:IsA("UIPadding") and n.Visible == true then
									table.insert(Results, n)
									for c, d in pairs(Results) do
										num = c
									end
								end
							end
							if num ~= nil then
								num = num * 40
								dropdowns.list.CanvasSize = UDim2.new(0, 0, 0, num) + UDim2.new(0, 0, 0, 20)
								num = 0
							end
						end
 
						local function Nil()
							for i, v in pairs(dropdowns.list:GetChildren()) do
								if not v:IsA("UIListLayout") and not v:IsA("UIPadding") and v.Visible == false then
									ts:Create(dropdowns.list, TweenInfo.new(0.1), {
										CanvasSize = UDim2.new(0, 0, 0, dropdowns.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
									}):Play()
									v.Visible = true
								end 
							end
						end
 
						dropdowns.textbox.Changed:connect(function()
							if not SearchLock then
								Edit()
								Search()
							end
							if dropdowns.textbox.Text == "" then
								Nil()
								ts:Create(dropdowns.list, TweenInfo.new(0.1), {
									CanvasSize = UDim2.new(0, 0, 0, dropdowns.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
								}):Play()
							end
						end)
 
						dropdowns.textbox.FocusLost:connect(function()
							SearchLock = true
							if dropdowns.textbox.Text == "" then
								ts:Create(dropdowns.list, TweenInfo.new(0.1), {
									CanvasSize = UDim2.new(0, 0, 0, dropdowns.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)
								}):Play()
								SearchLock = true
								Nil()
								dropdowns.textbox.Text = name
							end
						end)
 
						sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 38)
						category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 38)
 
						dropdowns.background.Parent = sections.section
						dropdowns.background2.Parent = dropdowns.background
						dropdowns.arrow.Parent = dropdowns.background2
						dropdowns.textbox.Parent = dropdowns.background2	
						dropdowns.backgroundlist.Parent = dropdowns.background
						dropdowns.list.Parent = dropdowns.backgroundlist
						dropdowns.listlayout.Parent = dropdowns.list 
						dropdowns.listpadding.Parent = dropdowns.list
 
					else
 
						local dropdowns = {}
 
						local tableA = {}
 
						local listopend = false
 
						local SearchLock = true
 
						local selectedvalue 
 
						if options and not playerlist then
							tableA = {}
							tableA = options
						elseif options and playerlist then 
							tableA = {}
							for i,v in pairs(options) do 
								table.insert(tableA, v)
							end 
							local list = game:GetService("Players")
							for a,b in pairs(list:GetChildren()) do 
								if b:IsA("Player") then
									table.insert(tableA, b.Name)
								end 
							end
						elseif not options and playerlist then 
							tableA = {}
							local list = game:GetService("Players")
							for a,b in pairs(list:GetChildren()) do 
								if b:IsA("Player") then
									table.insert(tableA, b.Name)
								end 
							end
						end
 
						dropdowns.background = library.create("ImageLabel", {
							Name = name.."DropDown",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							ClipsDescendants = true,
							Position = UDim2.new(0, 11, 0, 40),
							Size = UDim2.new(0.963999987, 0, 0, 30),
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(29, 29, 35),
							ImageTransparency = 1.000,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})
						dropdowns.background.ClipsDescendants = true
 
						dropdowns.background2 = library.create("ImageButton", {
							Name = "Background",
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Size = UDim2.new(1, 0, 0, 30),
							Image = "rbxassetid://3570695787",
							ImageColor3 = Themes.AccentColor,
							AutoButtonColor = false,
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})
						table.insert(ObjectsSearch, dropdowns.background2)
						table.insert(Objects.AccentColor, dropdowns.background2)
 
						dropdowns.textbox = library.create("TextLabel", {
							Active = false,
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Position = UDim2.new(0.00800000038, 0, 0, 0),
							Selectable = false,
							Size = UDim2.new(0.2, 0, 1, 0),
							Font = Enum.Font.GothamBold,
							TextColor3 = Themes.TextColor,
							TextSize = 18.000,
							Text = name,
							TextXAlignment = Enum.TextXAlignment.Left,
						})
						table.insert(Objects.TextColor, dropdowns.textbox)
 
						dropdowns.arrow = library.create("ImageButton", {
							Name = "Arrow",
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							BorderSizePixel = 0,
							Position = UDim2.new(1, -32, 0.0333333351, 0),
							Rotation = 90.000,
							AutoButtonColor = false,
							ImageColor3 = Themes.TextColor,
							Size = UDim2.new(0, 28, 0, 28),
							Image = "http://www.roblox.com/asset/?id=5054982349",
						})
						table.insert(Objects.TextColor, dropdowns.arrow)
 
						dropdowns.backgroundlist = library.create("ImageLabel", {
							Name = "Backgroundlist",
							BackgroundColor3 = Color3.fromRGB(248, 248, 248),
							BackgroundTransparency = 1.000,
							BorderColor3 = Color3.fromRGB(27, 42, 53),
							Position = UDim2.new(0, 0, 0, 40),
							Size = UDim2.new(1, 0, 0, 120),
							ZIndex = 2,
							Image = "rbxassetid://3570695787",
							ImageColor3 = Color3.fromRGB(math.floor(Themes.GrayContrastColor.r * 255) - 3, math.floor(Themes.GrayContrastColor.g * 255) - 3, math.floor(Themes.GrayContrastColor.b * 255) - 3),
							ScaleType = Enum.ScaleType.Slice,
							SliceCenter = Rect.new(100, 100, 100, 100),
							SliceScale = 0.040,
						})
						table.insert(Objects.GrayContrastColor, dropdowns.backgroundlist)
 
						dropdowns.list = library.create("ScrollingFrame", {
							BackgroundColor3 = Color3.fromRGB(29, 29, 35),
							BackgroundTransparency = 1.000,
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 1, 0),
							ZIndex = 2,
							CanvasSize = UDim2.new(0, 0, 0, 0),
							ScrollBarImageColor3 = Color3.fromRGB(35 - 5, 35 - 5, 35 - 5),
							ScrollBarThickness = 3,
						})
 
						dropdowns.listlayout = library.create("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 10),
						})
 
						dropdowns.listpadding = library.create("UIPadding", {
							PaddingBottom = UDim.new(0, 10),
							PaddingLeft = UDim.new(0, 10),
							PaddingTop = UDim.new(0, 10),						
						})
 
						local function HideShowList()
							if not listopend then 
								ts:Create(dropdowns.arrow, TweenInfo.new(0.1), {Rotation = 90}):Play()
								ts:Create(sections.section, TweenInfo.new(0.1), {Size = sections.section.Size - UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(category.categoryscrolling, TweenInfo.new(0.1), {CanvasSize = category.categoryscrolling.CanvasSize - UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(dropdowns.background, TweenInfo.new(0.1), {Size = UDim2.new(0.964, 0, 0, 30)}):Play()
							else
								ts:Create(dropdowns.arrow, TweenInfo.new(0.1), {Rotation = 0}):Play()
								ts:Create(sections.section, TweenInfo.new(0.1), {Size = sections.section.Size + UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(dropdowns.list, TweenInfo.new(0.1), {CanvasSize = UDim2.new(0, 0, 0, dropdowns.list["UIListLayout"].AbsoluteContentSize.Y) + UDim2.new(0, 0, 0, 26)}):Play()
								ts:Create(category.categoryscrolling, TweenInfo.new(0.1), {CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 125)}):Play()
								ts:Create(category.categoryscrolling, TweenInfo.new(0.1), {CanvasPosition = category.categoryscrolling.CanvasPosition + Vector2.new(0, 125)}):Play()
								ts:Create(dropdowns.background, TweenInfo.new(0.1), {Size = UDim2.new(0.964, 0, 0, 154)}):Play()
							end
						end
 
						local function RefreshList()
 
							for a, b in pairs(dropdowns.list:GetChildren()) do
								if b:IsA("ImageButton") then
									b:Destroy()
								end
							end
 
							for i, v in pairs(tableA) do
								local button = library.create("ImageButton", {
									Name = string.lower(v),
									AnchorPoint = Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderColor3 = Color3.fromRGB(27, 42, 53),
									Position = UDim2.new(0, 252, 0, 0),
									Size = UDim2.new(0.98, 0, 0, 30),
									ZIndex = 2,
									AutoButtonColor = false,
									Image = "rbxassetid://3570695787",
									ImageColor3 = Themes.AccentColor,
									ScaleType = Enum.ScaleType.Slice,
									SliceCenter = Rect.new(100, 100, 100, 100),
									SliceScale = 0.040,
								})
								table.insert(Objects.AccentColor, button)
 
								local buttontext = library.create("TextLabel", {
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1.000,
									BorderSizePixel = 0,
									Position = UDim2.new(0.078, 0, 0, 0),
									Size = UDim2.new(0.833, 0, 1, 0),
									ZIndex = 2,
									Font = Enum.Font.GothamBold,
									Text = v,
									TextColor3 = Themes.TextColor,
									TextSize = 18,
								})
								table.insert(Objects.TextColor, buttontext)
 
								button.Parent = dropdowns.list
								buttontext.Parent = button
 
								button.MouseButton1Click:Connect(function()
									if listopend then
 
										listopend = not listopend
										dropdowns.textbox.Text = v
 
										HideShowList()
 
										if callback then
											callback(v)
										end
									end
								end)
							end
						end
 
						RefreshList()
 
						dropdowns.arrow.MouseButton1Click:Connect(function()
							listopend = not listopend
							if beforeopen then 
								local newtable = beforeopen()
								tableA = newtable
								RefreshList()
							end
							if options and playerlist then 
								tableA = {}
								for i,v in pairs(options) do 
									table.insert(tableA, v)
								end 
								local list = game:GetService("Players")
								for a,b in pairs(list:GetChildren()) do 
									if b:IsA("Player") then
										table.insert(tableA, b.Name)
									end 
								end
							elseif not options and playerlist then 
								tableA = {}
								local list = game:GetService("Players")
								for a,b in pairs(list:GetChildren()) do 
									if b:IsA("Player") then
										table.insert(tableA, b.Name)
									end 
								end
							end
							HideShowList()
						end)
 
						dropdowns.background2.MouseButton1Click:Connect(function()
							listopend = not listopend
							if beforeopen then 
								local newtable = beforeopen()
								tableA = newtable
								RefreshList()
							end
							if options and playerlist then 
								tableA = {}
								for i,v in pairs(options) do 
									table.insert(tableA, v)
								end 
								local list = game:GetService("Players")
								for a,b in pairs(list:GetChildren()) do 
									if b:IsA("Player") then
										table.insert(tableA, b.Name)
									end 
								end
							elseif not options and playerlist then 
								tableA = {}
								local list = game:GetService("Players")
								for a,b in pairs(list:GetChildren()) do 
									if b:IsA("Player") then
										table.insert(tableA, b.Name)
									end 
								end
							end
							HideShowList()
						end)
 
						sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 38)
						category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 38)
 
						dropdowns.background.Parent = sections.section
						dropdowns.background2.Parent = dropdowns.background
						dropdowns.arrow.Parent = dropdowns.background2
						dropdowns.textbox.Parent = dropdowns.background2	
						dropdowns.backgroundlist.Parent = dropdowns.background
						dropdowns.list.Parent = dropdowns.backgroundlist
						dropdowns.listlayout.Parent = dropdowns.list 
						dropdowns.listpadding.Parent = dropdowns.list
 
					end 
 
					return dropdowns
 
				end 
 
				function sections.colorpicker(name, callback, default, opacitydefault)
 
					local colorpickers = {}
 
					local pickeropen = false
 
					colorpickers.background = library.create("ImageLabel", {
						Name = name.."ColorPicker",
						BackgroundColor3 = Color3.fromRGB(248, 248, 248),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(27, 42, 53),
						Position = UDim2.new(0, 10, 0, 235),
						Size = UDim2.new(0.963999987, 0, 0, 35),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Color3.fromRGB(30, 30, 30),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
					table.insert(Objects.AccentColor, colorpickers.background)
					table.insert(ObjectsSearch, colorpickers.background)
 
					colorpickers.text = library.create("TextLabel", {
						Name = "Text",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0.00800000038, 0, 0, 2),
						Size = UDim2.new(0.400000006, 0, 0, 30),
						Font = Enum.Font.GothamBold,
						Text = name,
						TextColor3 = Themes.TextColor,
						TextSize = 18.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
					table.insert(Objects.TextColor, colorpickers.text)
 
					colorpickers.button = library.create("ImageButton", {
						Name = "Button",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(1, -106, 0, 4),
						Size = UDim2.new(0, 100, 0, 26),
						AutoButtonColor = false,
						Image = "rbxassetid://3570695787",
						ImageColor3 = Color3.fromRGB(255,255,255),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.040,
					})
 
					colorpickers.framebackground = library.create("Frame", {
						Name = "colorframe",
						BackgroundColor3 = Color3.fromRGB(46, 46, 54),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						ClipsDescendants = true,
						Position = UDim2.new(1, 8, 0, 0),
						Size = UDim2.new(0, 0, 0, 265),
					})
					colorpickers.framebackground.ClipsDescendants = true
 
					colorpickers.frame = library.create("ImageLabel", {
						Name = "MainFrame",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Size = UDim2.new(0, 220, 0, 265),
						Image = "rbxassetid://3570695787",
						ImageColor3 = Themes.BackgroundColorColor,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(100, 100, 100, 100),
						SliceScale = 0.060,
					})
					table.insert(Objects.BackgroundColor, colorpickers.frame)
 
					colorpickers.huepicker = library.create("ImageButton", {
						Name = "HuePicker",
						BackgroundColor3 = Color3.fromRGB(46, 46, 54),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 183, 0, 20),
						Size = UDim2.new(0, 17, 0, 150),
						ZIndex = 2,
						AutoButtonColor = false,
						Image = "http://www.roblox.com/asset/?id=5118428654",
					})
 
					colorpickers.huerounder = library.create("ImageLabel", {
						Name = "HueRounder",
						BackgroundColor3 = Color3.fromRGB(46, 46, 54),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(27, 42, 53),
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						ZIndex = 2,
						Image = "rbxassetid://4695575676",
						ImageColor3 = Color3.fromRGB(40, 40, 40),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(128, 128, 128, 128),
						SliceScale = 0.080,
					})
					table.insert(Objects.BackgroundColor, colorpickers.huerounder)
 
					colorpickers.huering = library.create("ImageLabel", {
						Name = "HueRing",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0.147, 0, 0, -6),
						Size = UDim2.new(0, 12, 0, 12),
						SizeConstraint = Enum.SizeConstraint.RelativeYY,
						ZIndex = 5,
						Image = "http://www.roblox.com/asset/?id=5674514673",
					})
 
					colorpickers.darknesspicker = library.create("ImageButton", {
						Name = "DarknessPicker",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BorderColor3 = Color3.fromRGB(221, 221, 221),
						BorderSizePixel = 0,
						Position = UDim2.new(0, 20, 0, 20),
						Size = UDim2.new(0, 150, 0, 150),
						AutoButtonColor = false,
						Image = "rbxassetid://5113592272",
						ImageColor3 = Color3.fromRGB(255, 0, 0),
					})
 
					colorpickers.darknesslight = library.create("ImageLabel", {
						Name = "Light",
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						Image = "rbxassetid://5113600420",
					})
 
					colorpickers.darknessrounder = library.create("ImageLabel", {
						Name = "DarknessRounder",
						BackgroundColor3 = Color3.fromRGB(46, 46, 54),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(27, 42, 53),
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						ZIndex = 2,
						Image = "rbxassetid://4695575676",
						ImageColor3 = Color3.fromRGB(40, 40, 40),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(128, 128, 128, 128),
						SliceScale = 0.050,
					})
					table.insert(Objects.BackgroundColor, colorpickers.darknessrounder)
 
					colorpickers.darknessring = library.create("ImageLabel", {
						Name = "DarknessRing",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, -6, 0, -6),
						Size = UDim2.new(0, 12, 0, 12),
						SizeConstraint = Enum.SizeConstraint.RelativeYY,
						ZIndex = 5,
						Image = "http://www.roblox.com/asset/?id=5674514673",
					})
 
					colorpickers.alphapicker = library.create("ImageButton", {
						Name = "Alpha",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BorderSizePixel = 0,
						Position = UDim2.new(0, 20, 0, 180),
						Size = UDim2.new(0, 180, 0, 17),
						AutoButtonColor = false,
					})
 
					colorpickers.alpharounder = library.create("ImageLabel", {
						Name = "AlphaRounder",
						BackgroundColor3 = Color3.fromRGB(46, 46, 54),
						BackgroundTransparency = 1.000,
						BorderColor3 = Color3.fromRGB(27, 42, 53),
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 1, 0),
						ZIndex = 2,
						Image = "rbxassetid://4695575676",
						ImageColor3 = Color3.fromRGB(40, 40, 40),
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(128, 128, 128, 128),
						SliceScale = 0.080,
					})
					table.insert(Objects.BackgroundColor, colorpickers.alpharounder)
 
					colorpickers.alpharing = library.create("ImageLabel", {
						Name = "AlphaRing",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(1, -6, 0.125, 0),
						Size = UDim2.new(0, 12, 0, 12),
						SizeConstraint = Enum.SizeConstraint.RelativeYY,
						ZIndex = 5,
						Image = "http://www.roblox.com/asset/?id=5674514673",
					})
 
					colorpickers.alphagradient = library.create("UIGradient", {
						Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
					})
 
					colorpickers.R = library.create("Frame", {
						Name = "R",
						BackgroundColor3 = Color3.fromRGB(72, 72, 85),
						BorderSizePixel = 0,
						Position = UDim2.new(0, 20, 0, 244),
						Size = UDim2.new(0, 30, 0, 2),    
					})
 
					colorpickers.RLabel = library.create("TextLabel", {
						Name = "RLabel",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, 0, 0, -34),
						Size = UDim2.new(0, 30, 0, 15),
						Font = Enum.Font.GothamBold,
						Text = "R:",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
 
					colorpickers.RBox = library.create("TextBox", {
						Name = "RBox",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, -15),
						Size = UDim2.new(0, 30, 0, 15),
						Font = Enum.Font.GothamBold,
						Text = "255",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Left,    
					})
 
					colorpickers.G = library.create("Frame", {
						Name = "G",
						BackgroundColor3 = Color3.fromRGB(72, 72, 85),
						BorderSizePixel = 0,
						Position = UDim2.new(0, 95, 0, 244),
						Size = UDim2.new(0, 30, 0, 2),
					})
 
					colorpickers.GLabel = library.create("TextLabel", {
						Name = "GLabel",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, 0, 0, -34),
						Size = UDim2.new(0, 30, 0, 15),
						Font = Enum.Font.GothamBold,
						Text = "G:",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
 
					colorpickers.GBox = library.create("TextBox", {
						Name = "GBox",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, -15),
						Size = UDim2.new(0, 30, 0, 15),
						Font = Enum.Font.GothamBold,
						Text = "255",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
 
					colorpickers.B = library.create("Frame", {
						Name = "B",
						BackgroundColor3 = Color3.fromRGB(72, 72, 85),
						BorderSizePixel = 0,
						Position = UDim2.new(0, 171, 0, 244),
						Size = UDim2.new(0, 30, 0, 2),
					})
 
					colorpickers.BLabel = library.create("TextLabel", {
						Name = "BLabel",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						Position = UDim2.new(0, 0, 0, -34),
						Size = UDim2.new(0, 30, 0, 15),
						Font = Enum.Font.GothamBold,
						Text = "B:",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
 
					colorpickers.BBox = library.create("TextBox", {
						Name = "BBox",
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1.000,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, -15),
						Size = UDim2.new(0, 30, 0, 15),
						Font = Enum.Font.GothamBold,
						Text = "255",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14.000,
						TextXAlignment = Enum.TextXAlignment.Left,
					})
 
					colorpickers.background.Parent = sections.section
					colorpickers.text.Parent = colorpickers.background
					colorpickers.button.Parent = colorpickers.background
					colorpickers.framebackground.Parent = main.mainframe
					colorpickers.frame.Parent = colorpickers.framebackground
					colorpickers.huepicker.Parent = colorpickers.frame 
					colorpickers.huerounder.Parent = colorpickers.huepicker
					colorpickers.huering.Parent = colorpickers.huepicker
					colorpickers.darknesspicker.Parent = colorpickers.frame
					colorpickers.darknessrounder.Parent = colorpickers.darknesspicker
					colorpickers.darknessring.Parent = colorpickers.darknesspicker
					colorpickers.darknesslight.Parent = colorpickers.darknesspicker
					colorpickers.alphapicker.Parent = colorpickers.frame
					colorpickers.alpharounder.Parent = colorpickers.alphapicker
					colorpickers.alpharing.Parent = colorpickers.alphapicker
					colorpickers.alphagradient.Parent = colorpickers.alphapicker
					colorpickers.R.Parent = colorpickers.frame
					colorpickers.RLabel.Parent = colorpickers.R
					colorpickers.RBox.Parent = colorpickers.R
					colorpickers.G.Parent = colorpickers.frame
					colorpickers.GLabel.Parent = colorpickers.G
					colorpickers.GBox.Parent = colorpickers.G
					colorpickers.B.Parent = colorpickers.frame
					colorpickers.BLabel.Parent = colorpickers.B
					colorpickers.BBox.Parent = colorpickers.B
 
					colorpickers.button.MouseButton1Click:Connect(function()
						pickeropen = not pickeropen
 
						for i,v in pairs(main.mainframe:GetChildren()) do
							if v.Name == "colorframe" then
								ts:Create(v, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 265)}):Play()
							end
						end
 
						if pickeropen then 
							ts:Create(colorpickers.framebackground, TweenInfo.new(0.3), {Size = UDim2.new(0, 220, 0, 265)}):Play()
						end
					end)
 
					local h,s,v = 0,0,1
					local color = Color3.fromRGB(255,255,255)
					local r,g,b = 255,255,255
					local opacity = 1
 
					local hueconnection
					local darknessconnection
					local alphaconnection
 
					local function Update()
 
						colorpickers.RBox.Text = math.floor(r)
						colorpickers.GBox.Text = math.floor(g)
						colorpickers.BBox.Text = math.floor(b)
 
						ts:Create(colorpickers.huering, TweenInfo.new(0.12), {Position = UDim2.new(0.147, 0, h, -6)}):Play()
						ts:Create(colorpickers.darknessring, TweenInfo.new(0.12), {Position = UDim2.new(s, -6, 1 - v, -6)}):Play()
						ts:Create(colorpickers.alpharing, TweenInfo.new(0.12), {Position = UDim2.new(opacity, -6, 0.125, 0)}):Play()
 
						colorpickers.darknesspicker.ImageColor3 = Color3.fromHSV(h,1,1)
 
						colorpickers.button.ImageColor3 = Color3.fromRGB(r,g,b)
						colorpickers.button.ImageTransparency = 1 - opacity
 
						local colorvalue = Color3.fromHSV(h,s,v)
						local opacityvalue = 1 - opacity
 
						if callback then 
							callback(colorvalue, opacityvalue)
						end
					end
 
					colorpickers.huepicker.MouseButton1Down:Connect(function()
						hueconnection = rs.Heartbeat:Connect(function()
							h = 1 - math.clamp(1 - ((mouse.Y - colorpickers.huepicker.AbsolutePosition.Y) / colorpickers.huepicker.AbsoluteSize.Y), 0, 1)
							color = Color3.fromHSV(h,s,v)
 
							r,g,b = math.floor(color.r * 255), math.floor(color.g * 255), math.floor(color.b * 255)
 
							Update()
						end)
					end)
 
					colorpickers.darknesspicker.MouseButton1Down:Connect(function()
						darknessconnection = rs.Heartbeat:Connect(function()
							s = math.clamp((mouse.X - colorpickers.darknesspicker.AbsolutePosition.X) / colorpickers.darknesspicker.AbsoluteSize.X, 0, 1)
							v = 1 - math.clamp((mouse.Y - colorpickers.darknesspicker.AbsolutePosition.Y) / colorpickers.darknesspicker.AbsoluteSize.Y, 0, 1)
							color = Color3.fromHSV(h,s,v)
 
							r,g,b = math.floor(color.r * 255), math.floor(color.g * 255), math.floor(color.b * 255)
 
							Update()
						end)
					end)
 
					colorpickers.alphapicker.MouseButton1Down:Connect(function()
						alphaconnection = rs.Heartbeat:Connect(function()
							opacity = math.clamp(mouse.X - colorpickers.alphapicker.AbsolutePosition.X, 0, colorpickers.alphapicker.AbsoluteSize.X) / colorpickers.alphapicker.AbsoluteSize.X
 
							Update()
						end)
					end)
 
					colorpickers.RBox:GetPropertyChangedSignal("Text"):Connect(function()
						if not hueconnection and not darknessconnection then  
							local Text = colorpickers.RBox.Text
 
							if not tonumber(Text) then 
								colorpickers.RBox.Text = colorpickers.RBox.Text:gsub("%D", "")
							elseif tonumber(Text) > 255 then 
								colorpickers.RBox.Text = "255"
							elseif tonumber(Text) and tonumber(Text) <= 255 then 
								r = Text
								local color = Color3.fromRGB(r,g,b)
								h,s,v = Color3.toHSV(color)
								Update()
							end
						end 
					end)
 
					colorpickers.GBox:GetPropertyChangedSignal("Text"):Connect(function()
						if not hueconnection and not darknessconnection then 
							local Text = colorpickers.GBox.Text
 
							if not tonumber(Text) then 
								colorpickers.GBox.Text = colorpickers.GBox.Text:gsub("%D", "")
							elseif tonumber(Text) > 255 then 
								colorpickers.GBox.Text = "255"
							elseif tonumber(Text) and tonumber(Text) <= 255 then 
								g = Text
								local color = Color3.fromRGB(r,g,b)
								h,s,v = Color3.toHSV(color)
								Update()
							end
						end 
					end)
 
					colorpickers.BBox:GetPropertyChangedSignal("Text"):Connect(function()
						if not hueconnection and not darknessconnection then 
							local Text = colorpickers.BBox.Text
 
							if not tonumber(Text) then 
								colorpickers.BBox.Text = colorpickers.BBox.Text:gsub("%D", "")
							elseif tonumber(Text) > 255 then 
								colorpickers.BBox.Text = "255"
							elseif tonumber(Text) and tonumber(Text) <= 255 then 
								b = Text
								local color = Color3.fromRGB(r,g,b)
								h,s,v = Color3.toHSV(color)
								Update()
							end
						end 
					end)
 
					if default then 
						r,g,b = default.r * 255, default.g * 255, default.b * 255
						h,s,v = Color3.toHSV(default)
						Update()
					end
 
					if opacitydefault then 
						opacity = opacitydefault
						Update()
					end
 
					function colorpickers:SetColor(Color)
						r,g,b = Color.r * 255, Color.g * 255, Color.b * 255
						h,s,v = Color3.toHSV(Color)
						Update()
					end
 
					uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							if hueconnection then
								hueconnection:Disconnect()
								hueconnection = nil
							end
							if darknessconnection then
								darknessconnection:Disconnect()
								darknessconnection = nil
							end
							if alphaconnection then
								alphaconnection:Disconnect()
								alphaconnection = nil
							end
						end
					end)
 
					sections.section.Size = sections.section.Size + UDim2.new(0, 0, 0, 43)
					category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
					return colorpickers
 
				end 
 
				category.categoryscrolling.CanvasSize = category.categoryscrolling.CanvasSize + UDim2.new(0, 0, 0, 44)
 
				sections.section.Parent = category.categoryscrolling
				sections.text.Parent = sections.section
				sections.sectionlayout.Parent = sections.section
 
				return sections
 
			end 
 
			main.categoryhandlerscrolling.CanvasSize = main.categoryhandlerscrolling.CanvasSize + UDim2.new(0, 0, 0, 43)
 
			if firstcategory then 
				for i,v in pairs(main.categoryhandlerscrolling:GetChildren()) do
					if v:IsA("Frame") then 
						for a,b in pairs(v:GetChildren()) do
							ts:Create(b, TweenInfo.new(0.15), {ImageTransparency = 1}):Play()
							ts:Create(b.Text, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
							wait()
						end
					end
				end
				category.categoryscrolling.Visible = true
				main.categoryhandlerscrolling.Visible = false 
				categoryopendname = name.."Container"
			end
 
			category.categorybuttonback.Parent = main.categoryhandlerscrolling
			category.categorybutton.Parent = category.categorybuttonback
			category.text.Parent = category.categorybutton
			category.categorycontainer.Parent = main.categories
			category.categoryscrolling.Parent = category.categorycontainer
			category.categoryscrollinglayout.Parent = category.categoryscrolling
			category.categoryscrollingpadding.Parent = category.categoryscrolling
 
			firstcategory = false
 
			return category
 
		end
 
		main.searchbutton.MouseButton1Click:Connect(function()
			showsearch = not showsearch
 
			if not showsearch then
				ts:Create(main.categorybutton, TweenInfo.new(0), {Position = UDim2.new(1, -35, 0, -28)}):Play()
				ts:Create(main.logo, TweenInfo.new(0), {Position = UDim2.new(0, 8, 0, -28)}):Play()
				ts:Create(main.searchbutton, TweenInfo.new(0.1), {Position = UDim2.new(1, -35, 0, 4)}):Play()
				ts:Create(main.searchicon, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 28)}):Play()
				ts:Create(main.searchbox, TweenInfo.new(0), {Position = UDim2.new(0, 8, 0, 0)}):Play()
				main.mainframe["Categories"][categoryopendname].ScrollingFrame.Visible = false
				wait(.1)
				ts:Create(main.closebuttonmarksearch, TweenInfo.new(0.1), {Size = UDim2.new(0, 25, 0, 25)}):Play()
			else
				ts:Create(main.categorybutton, TweenInfo.new(0), {Position = UDim2.new(1, -35, 0, 4)}):Play()
				ts:Create(main.logo, TweenInfo.new(0), {Position = UDim2.new(0, 8, 0, 0)}):Play()
				ts:Create(main.searchbutton, TweenInfo.new(0.1), {Position = UDim2.new(1, -72, 0, 4)}):Play()
				ts:Create(main.closebuttonmarksearch, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				ts:Create(main.closebuttonmarksearch, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 0)}):Play()
				ts:Create(main.searchbox, TweenInfo.new(0), {Position = UDim2.new(0, 8, 0, -38)}):Play()
				wait(.1)
				for i,v in pairs(main.categories:GetChildren()) do 
					v.ScrollingFrame.Visible = false
				end
				for i,v in pairs(Highlighted) do 
					v.TextColor3 = textcolorsave
				end 
				main.mainframe["Categories"][categoryopendname].ScrollingFrame.Visible = true
				ts:Create(main.searchicon, TweenInfo.new(0.1), {Size = UDim2.new(0, 26, 0, 28)}):Play()
			end 
		end)		
 
		main.screengui.Parent = game:GetService("CoreGui")
		main.mainframe.Parent = main.screengui
		main.notifyframe.Parent = main.screengui
		main.notifylayout.Parent = main.notifyframe
		main.backshadow.Parent = main.mainframe
		main.navbar.Parent = main.mainframe
		main.logo.Parent = main.navbar
		main.categorybutton.Parent = main.navbar
		main.categorybuttonframe.Parent = main.categorybutton
		main.closebuttonmark.Parent = main.categorybutton
		main.searchbutton.Parent = main.navbar
		main.searchicon.Parent = main.searchbutton
		main.searchbox.Parent = main.navbar
		main.searchscrollingback.Parent = main.mainframe
		main.searchscrolling.Parent = main.searchscrollingback
		main.searchscrollinglayout.Parent = main.searchscrolling
		main.closebuttonmarksearch.Parent = main.searchbutton
		main.categorybuttonimagefirst.Parent = main.categorybuttonframe
		main.categorybuttonimagesecond.Parent = main.categorybuttonframe
		main.categorybuttonimagethird.Parent = main.categorybuttonframe
		main.categoryhandler.Parent = main.mainframe
		main.categoryhandlerscrolling.Parent = main.categoryhandler
		main.categoryhandlerlayout.Parent = main.categoryhandlerscrolling
		main.categoryhandlerpadding.Parent = main.categoryhandler
		main.categories.Parent = main.mainframe
 
		return main
 
	end
 
	function library:SetThemeColor(Theme, Color, TransparencyValue)
		Themes[Theme] = Color
 
		if Theme == "TextColor" then 
			for i,v in pairs(Objects.TextColor) do 
				if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
					textcolorsave = Color
					if v.Parent.Parent.Parent ~= nil and v.Parent.Parent.Parent.Name == "CategoryHandlerScrolling" then 
						v.TextColor3 = Color
						v.TextTransparency = TransparencyValue
						categorytopacity = TransparencyValue
					else
						v.TextColor3 = Color
						v.TextTransparency = TransparencyValue
					end 
				elseif v:IsA("ImageLabel") or v:IsA("ImageButton") then 
					v.ImageColor3 = Color
					if not v.Name == "CircleTrasparency" then 
						v.ImageTransparency = TransparencyValue
					end
				end 
			end  
		elseif Theme == "BackgroundColor" then 
			for i,v in pairs(Objects.BackgroundColor) do
				if v:IsA("Frame") or v:IsA("TextButton") or v:IsA("ScrollingFrame") then
					v.BackgroundColor3 = Color
					v.Transparency = TransparencyValue
				elseif v:IsA("ImageLabel") then 
					v.ImageColor3 = Color
					v.ImageTransparency = TransparencyValue
				end
			end
		elseif Theme == "GrayContrastColor" then 
			for i,v in pairs(Objects.GrayContrastColor) do 
				if v:IsA("ImageLabel") then
					if v.Name ~= "Backgroundlist" then 
						v.ImageColor3 = Color 
						v.ImageTransparency = TransparencyValue
					else 
						v.ImageColor3 = Color3.fromRGB(math.floor(Color.r * 255) - 3, math.floor(Color.g * 255) - 3, math.floor(Color.b * 255) - 3)
						v.ImageTransparency = TransparencyValue
					end
				end 
			end 
		elseif Theme == "DarkContrastColor" then 
			for i,v in pairs(Objects.DarkContrastColor) do
				if v:IsA("ImageLabel") or v:IsA("ImageButton") then 
					v.ImageColor3 = Color 
					v.ImageTransparency = TransparencyValue
				end 
			end
		elseif Theme == "AccentColor" then
			for i,v in pairs(Objects.AccentColor) do 
				if v:IsA("ImageLabel") or v:IsA("ImageButton") then 
					if v.Parent.Parent ~= nil and v.Parent.Parent.Name == "CategoryHandlerScrolling" then 
						v.ImageColor3 = Color
						v.ImageTransparency = TransparencyValue
						categoryopacity = TransparencyValue
					else 
						v.ImageColor3 = Color
						v.ImageTransparency = TransparencyValue
					end
				end
			end 
		end
	end
 
	return library
 
 
 
