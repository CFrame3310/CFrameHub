do  local uix =  game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer.DefaultServerPlayerModules:FindFirstChild("CloseButton")  if uix then uix:Destroy() end end
do  local ui =  game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer.DefaultServerPlayerModules:FindFirstChild("CFrameHUB")  if ui then ui:Destroy() end end
local CloseScreen = Instance.new("ScreenGui")
local CloseButton = Instance.new("TextButton")

CloseScreen.Name = "CloseButton"
CloseScreen.Parent = game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer.DefaultServerPlayerModules
CloseScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

CloseButton.Name = "CloseButton"
CloseButton.Parent = CloseScreen
CloseButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
CloseButton.BorderSizePixel = 3
CloseButton.Position = UDim2.new(0.75, 0, 0.05, 0)
CloseButton.Size = UDim2.new(0,25,0,25)
CloseButton.Font = Enum.Font.DenkOne
CloseButton.Text = ''
CloseButton.TextColor3 = Color3.fromRGB(255,255,255)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextWrapped = true
CloseButton.MouseButton1Click:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true,"RightControl",false,game)
	game:GetService("VirtualInputManager"):SendKeyEvent(false,"RightControl",false,game)
end)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Local Main --
_G.ColorMain = Color3.fromRGB(40, 45, 50)
_G.ColorItem = Color3.fromRGB(40, 45, 60)
_G.ColorHub = Color3.fromRGB(105, 35, 255)

-- BackgroundColor3 = Color3.fromRGB(50, 55, 75)
-- TextColor3 = Color3.fromRGB(75, 85, 115)

local CFrameHUB = Instance.new("ScreenGui")
CFrameHUB.Name = "CFrameHUB"
CFrameHUB.Parent = game:GetService("CoreGui").RobloxGui.Modules.Server.ServerPlayer.DefaultServerPlayerModules
CFrameHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function tablefound(ta, object)
	for i,v in pairs(ta) do
		if v == object then
			return true
		end
	end
	return false
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local Create = {}
    function Create:CreateWindow(Icon)
        local FocusUI = false ; -- tap

        if Icon == nil then
            Icon = 12869780066
        end

        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = CFrameHUB
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.BackgroundColor3 = Color3.fromRGB(25, 255, 255)
        Main.BackgroundTransparency = 1
        Main.BorderSizePixel = 0
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Main.Size = UDim2.new(0, 560, 0, 390) -- Change Here

        local PageTab = Instance.new("Frame")
        PageTab.Name = "PageTab"
        PageTab.Parent = Main
        PageTab.BackgroundColor3 = _G.ColorMain
        PageTab.BorderSizePixel = 0
        PageTab.Size = UDim2.new(0, 560, 0, 60)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = PageTab

        local Frame_Logo = Instance.new("Frame")
        Frame_Logo.Name = "Frame_Logo"
        Frame_Logo.Parent = PageTab
        Frame_Logo.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
        Frame_Logo.BorderSizePixel = 0
        Frame_Logo.Size = UDim2.new(0, 60, 0, 60)
        Frame_Logo.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_Logo.Position = UDim2.new(0.067, 0, 0.5, 0)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = Frame_Logo

        local Frame_Logo1 = Instance.new("Frame")
        Frame_Logo1.Name = "Frame_Logo"
        Frame_Logo1.Parent = Frame_Logo
        Frame_Logo1.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
        Frame_Logo1.BorderSizePixel = 0
        Frame_Logo1.Size = UDim2.new(0, 30, 0, 60)
        Frame_Logo1.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame_Logo1.Position = UDim2.new(0.77, 0, 0.5, 0)

        local Logo = Instance.new("ImageButton")
        Logo.Name = "Logo"
        Logo.Parent = Frame_Logo
        Logo.AnchorPoint = Vector2.new(0.5, 0.5)
        Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Logo.BackgroundTransparency = 1
        Logo.BorderSizePixel = 0
        Logo.Position = UDim2.new(0.5, 0, 0.5, 0)
        Logo.Size = UDim2.new(0, 40, 0, 40)
        Logo.Image = "http://www.roblox.com/asset/?id="..tostring(Icon)

        local Scrolling_PageTab = Instance.new("ScrollingFrame")
        Scrolling_PageTab.Name = "Scrolling_PageMain"
        Scrolling_PageTab.Parent = PageTab
        Scrolling_PageTab.Active = true
        Scrolling_PageTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrolling_PageTab.BackgroundTransparency = 1
        Scrolling_PageTab.BorderSizePixel = 0
        Scrolling_PageTab.Position = UDim2.new(0.135, 0, -0.005, 0)
        Scrolling_PageTab.Size = UDim2.new(0, 500, 0, 65) -- Here (Only X)
        Scrolling_PageTab.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
        Scrolling_PageTab.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Scrolling_PageTab.CanvasSize = UDim2.new(2, 0, 0, 0)
        Scrolling_PageTab.ScrollBarThickness = 4
        Scrolling_PageTab.ScrollBarImageTransparency = 0
        Scrolling_PageTab.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Scrolling_PageTab.Visible = true

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Scrolling_PageTab
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, -5)

		local UIPaddingPage = Instance.new("UIPadding")
		UIPaddingPage.Parent = Scrolling_PageTab
		UIPaddingPage.PaddingTop = UDim.new(0, 1)

		Scrolling_PageTab.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Scrolling_PageTab.CanvasSize =  UDim2.new(0,UIListLayout.AbsoluteContentSize.Y +20,0,0)
		end);

		local PageOrders = -1

		local Container_Page = Instance.new("Frame",Main)
		Container_Page.Name = ""
		Container_Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Container_Page.Size = UDim2.new(0, 560, 0, 310) -- Here
		Container_Page.BackgroundTransparency = 1
		Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)
        Container_Page.Position = UDim2.new(0.5, 0, 0.6, 0)
		Container_Page.ClipsDescendants = true
		
		local PageFolder = Instance.new("Folder")
		PageFolder.Parent = Container_Page

		local UIPage = Instance.new('UIPageLayout',PageFolder)
		UIPage.SortOrder = Enum.SortOrder.LayoutOrder
		UIPage.EasingDirection = Enum.EasingDirection.In
		UIPage.EasingStyle = Enum.EasingStyle.Back
        UIPage.FillDirection = Enum.FillDirection.Vertical
		UIPage.Padding = UDim.new(0, 0)
		UIPage.TweenTime = 0	

		local Notification_Page = Instance.new("Frame")
		Notification_Page.Parent = CFrameHUB
		Notification_Page.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Notification_Page.BackgroundTransparency = 1
		Notification_Page.BorderSizePixel = 0
		Notification_Page.AnchorPoint = Vector2.new(0.5,0.5)
		Notification_Page.Position = UDim2.new(0.1, 0, 0.225, 0)
		Notification_Page.Size = UDim2.new(0, 300, 0, 400)
		Notification_Page.Visible = true

		local Notification_Layout = Instance.new("UIListLayout")
		Notification_Layout.Name = "Notilistlayout"
		Notification_Layout.Parent = Notification_Page
		Notification_Layout.SortOrder = Enum.SortOrder.LayoutOrder
		Notification_Layout.Padding = UDim.new(0, 10)

local Tab = {}
    function Tab:CreateTab(text,Icon)
        PageOrders = PageOrders + 1
        local name = tostring(text) or tostring(math.random(1,5000))

        if Icon == nil then
            Icon = 11095032777
        end
        local TabFrame = Instance.new("Frame")
        TabFrame.Name = "Frame_Logo"
        TabFrame.Parent = Scrolling_PageTab
        TabFrame.BackgroundColor3 = Color3.fromRGB(255,255,255)
        TabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        TabFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.BorderSizePixel = 0
        TabFrame.Size = UDim2.new(0, 60, 0, 60)

        local TabFrame_Icon = Instance.new("Frame")
        TabFrame_Icon.Name = "Frame_Logo"
        TabFrame_Icon.Parent = TabFrame
        TabFrame_Icon.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
        TabFrame_Icon.AnchorPoint = Vector2.new(0.5, 0.5)
        TabFrame_Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
        TabFrame_Icon.BackgroundTransparency = 1
        TabFrame_Icon.BorderSizePixel = 0
        TabFrame_Icon.Size = UDim2.new(0, 40, 0, 40)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = TabFrame_Icon

		local Stroke = Instance.new("UIStroke")
		Stroke.Parent = TabFrame_Icon
		Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		Stroke.Color = Color3.fromRGB(55, 65, 70)
		Stroke.Thickness = 1.6
		Stroke.Transparency = 1

        local TabFrame_Icon1 = Instance.new("Frame")
        TabFrame_Icon1.Name = "Frame_Logo"
        TabFrame_Icon1.Parent = TabFrame
        TabFrame_Icon1.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
        TabFrame_Icon1.AnchorPoint = Vector2.new(0.5, 0.5)
        TabFrame_Icon1.Position = UDim2.new(0.5, 0, 0.5, 0)
        TabFrame_Icon1.BackgroundTransparency = 1
        TabFrame_Icon1.BorderSizePixel = 0
        TabFrame_Icon1.Size = UDim2.new(0, 40, 0, 40)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = TabFrame_Icon1

        local Icon_Tab = Instance.new("ImageButton")
        Icon_Tab.Name = text.."Server"
        Icon_Tab.Parent = TabFrame_Icon1
        Icon_Tab.AnchorPoint = Vector2.new(0.5, 0.5)
        Icon_Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon_Tab.BackgroundTransparency = 1
        Icon_Tab.BorderSizePixel = 0
        Icon_Tab.Position = UDim2.new(0.5, 0, 0.5, 0)
        Icon_Tab.Size = UDim2.new(0, 20, 0, 20)
        Icon_Tab.Image = "http://www.roblox.com/asset/?id="..tostring(Icon)
        Icon_Tab.ImageColor3 = _G.ColorHub

        local TextLabel_Tap = Instance.new("TextLabel")
        TextLabel_Tap.Name = "TextLabel_Tap"
        TextLabel_Tap.Parent = TabFrame_Icon1
        TextLabel_Tap.BackgroundColor3 = _G.ColorHub
        TextLabel_Tap.BackgroundTransparency = 1
        TextLabel_Tap.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel_Tap.Position = UDim2.new(0.5, 0, 1, 0)
        TextLabel_Tap.Size = UDim2.new(0,50,0,14)
        TextLabel_Tap.Font = Enum.Font.GothamBold
        TextLabel_Tap.Text = text
        TextLabel_Tap.Size = UDim2.new(0,15+ TextLabel_Tap.TextBounds.X ,0,14)
        TextLabel_Tap.TextTransparency = 1
        TextLabel_Tap.TextColor3 = Color3.fromRGB(255,255,255)
        TextLabel_Tap.TextSize = 10

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = TextLabel_Tap

        local PageMain = Instance.new("Frame")
        PageMain.Name = name.."_PageMain"
        PageMain.Parent = PageFolder
        PageMain.BackgroundColor3 = _G.ColorMain
        PageMain.BackgroundTransparency = 0
        PageMain.BorderSizePixel = 0
        PageMain.Position = UDim2.new(0, 0, 0.14, 0)
        PageMain.Size = UDim2.new(0, 560, 0, 390) -- here
        PageMain.Visible = true
		PageMain.ClipsDescendants = true
		PageMain.LayoutOrder = PageOrders
        
        local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 10)
		UICorner.Parent = PageMain

        local Scrolling_PageMain = Instance.new("ScrollingFrame")
        Scrolling_PageMain.Name = "Scrolling_PageMain"
        Scrolling_PageMain.Parent = PageMain
        Scrolling_PageMain.Active = true
        Scrolling_PageMain.AnchorPoint = Vector2.new(0.5, 0.5)
        Scrolling_PageMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrolling_PageMain.BackgroundTransparency = 1
        Scrolling_PageMain.BorderSizePixel = 0
        Scrolling_PageMain.Position = UDim2.new(0.5, 0, 0.45, 0)
        Scrolling_PageMain.Size = UDim2.new(0, 560, 0, 300) -- here
        Scrolling_PageMain.ScrollBarImageColor3 = Color3.fromRGB(70, 80, 120)
        Scrolling_PageMain.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Scrolling_PageMain.CanvasSize = UDim2.new(0, 0, 0, 2)
        Scrolling_PageMain.ScrollBarThickness = 4
        Scrolling_PageMain.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Scrolling_PageMain.Visible = true

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Scrolling_PageMain
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)

        local UIPadding = Instance.new("UIPadding")
        UIPadding.Parent = Scrolling_PageMain
        UIPadding.PaddingLeft = UDim.new(0, 25)
        UIPadding.PaddingTop = UDim.new(0, 5)

        local PageLeft = Instance.new("Frame")
        PageLeft.Parent = Scrolling_PageMain
        PageLeft.BackgroundColor3 = Color3.fromRGB(255, 25, 255)
        PageLeft.BackgroundTransparency = 1
        PageLeft.BorderSizePixel = 0
        PageLeft.Size = UDim2.new(0,250, 0,225)
		--PageLeft.Position = UDim2.new(0,0,100,0)
    
        local UIListLayout_Pageleft = Instance.new("UIListLayout")
        UIListLayout_Pageleft.Parent = PageLeft
        UIListLayout_Pageleft.FillDirection = Enum.FillDirection.Vertical
        UIListLayout_Pageleft.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_Pageleft.Padding = UDim.new(0, 10)

        local PageRight = Instance.new("Frame")
        PageRight.Parent = Scrolling_PageMain
        PageRight.BackgroundColor3 = Color3.fromRGB(25, 255, 255)
        PageRight.BackgroundTransparency = 1
        PageRight.BorderSizePixel = 0
        PageRight.Size = UDim2.new(0,250, 0,225)

        local UIListLayout_Pageright = Instance.new("UIListLayout")
        UIListLayout_Pageright.Parent = PageRight
        UIListLayout_Pageright.FillDirection = Enum.FillDirection.Vertical
        UIListLayout_Pageright.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_Pageright.Padding = UDim.new(0, 10)

        UIListLayout_Pageleft:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if UIListLayout_Pageleft.AbsoluteContentSize.Y > UIListLayout_Pageright.AbsoluteContentSize.Y then
                Scrolling_PageMain.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_Pageleft.AbsoluteContentSize.Y + 20)
            end
        end)
        UIListLayout_Pageright:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if UIListLayout_Pageright.AbsoluteContentSize.Y > UIListLayout_Pageleft.AbsoluteContentSize.Y then
                Scrolling_PageMain.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_Pageright.AbsoluteContentSize.Y + 20)
            end
        end)

        TweenService:Create(
            PageMain,
            TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 560, 0, 390)}
        ):Play()

		Icon_Tab.MouseButton1Click:connect(function()

            Scrolling_PageMain.Visible = false -- 

			if PageMain.Name == text.."_PageMain" then
                task.wait(.25)
				UIPage:JumpToIndex(PageMain.LayoutOrder)
                task.wait(.25)
                Scrolling_PageMain.Visible = true
                --[[ TweenService:Create(
                    PageMain,
                    TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 560, 0, 0)} -- Here X
                ):Play()

                task.wait(0.25)

                TweenService:Create(
                    PageMain,
                    TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 560, 0, 390)} -- Here X,Y
                ):Play()
                
                task.wait(0.25)
                
                TweenService:Create(
                    Scrolling_PageMain,
                    TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                    {Visible = true}
                ):Play() ]]
			end

			for i ,v in next , Scrolling_PageTab:GetChildren() do
				if v:IsA("Frame") then
                    for o,p in pairs(v:GetChildren()) do
                        for c,x in pairs(p:GetChildren()) do
                            if x:IsA("UIStroke") then
                                TweenService:Create(
                                    p,
                                    TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                                    {BackgroundTransparency = 1}
                                ):Play()
                                TweenService:Create(
                                    x,
                                    TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                                    {Transparency = 1}
                                ):Play()
                            end
                        end
                    end
				end
                TweenService:Create(
                    TabFrame_Icon,
                    TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0}
                ):Play()
                TweenService:Create(
                    Stroke,
                    TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                    {Transparency = 0}
                ):Play()
                TabFrame_Icon.BackgroundTransparency = 0
                Stroke.Transparency = 0
			end
		end)
		if FocusUI == false then
            TweenService:Create(
                TabFrame_Icon,
                TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
                {BackgroundTransparency = 0}
            ):Play()
            TweenService:Create(
				Stroke,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Transparency = 0}
			):Play()

			PageMain.Visible = true
			Icon_Tab.Name = text .. "Server"
			FocusUI  = true
		end

        Icon_Tab.MouseEnter:Connect(function()
            TweenService:Create(
				TextLabel_Tap,
				TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{TextTransparency = 0}
			):Play()
            TweenService:Create(
				TextLabel_Tap,
				TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
            TweenService:Create(
				TabFrame_Icon1,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
            TweenService:Create(
				TabFrame_Icon1,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 45, 0, 45)}
			):Play()
            TweenService:Create(
				TabFrame_Icon,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 45, 0, 45)}
			):Play()
			TweenService:Create(
				Icon_Tab,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 30, 0, 30)}
			):Play()
		end)
		Icon_Tab.MouseLeave:Connect(function()
            TweenService:Create(
				TabFrame_Icon1,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 40, 0, 40)}
			):Play()
            TweenService:Create(
				TabFrame_Icon,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 40, 0, 40)}
			):Play()
			TweenService:Create(
				Icon_Tab,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 20, 0, 20)}
			):Play()
            TweenService:Create(
				TabFrame_Icon1,
				TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
            TweenService:Create(
				TextLabel_Tap,
				TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{BackgroundTransparency = 1}
			):Play()
            TweenService:Create(
				TextLabel_Tap,
				TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
        end)

		MakeDraggable(PageTab,Main)
        MakeDraggable(Logo,Main)
		local tween = game:GetService("TweenService")
		local library = {currenttab = '',toggledui = false}
		tween:Create(Main,TweenInfo.new(1,Enum.EasingStyle.Circular),{Size = UDim2.new(0, 560, 0, 390)}):Play() -- here

        _G.ToogleUI = true

		game:GetService("UserInputService").InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.RightControl then
                print('Input :'..tostring(input.KeyCode))
				if library.toggledui == false then
                    --Scrolling_PageMain.Visible == true and
                    if  _G.ToogleUI == true then
                        --[[ Scrolling_PageMain.Visible = false -- 

                        TweenService:Create(
                            PageMain,
                            TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 560, 0, 0)} -- here
                        ):Play()
                        
                        task.wait(0.25)
                        
                        Scrolling_PageTab.Visible = false

						task.wait(0.25)

                        Frame_Logo.Visible = false --

                        TweenService:Create(
                            PageTab,
                            TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 0, 0, 60)}
                        ):Play()
                        
                        task.wait(0.25) ]]

                        Scrolling_PageMain.Visible = false
                        task.wait(.1)
                        Scrolling_PageTab.Visible = false
                        task.wait(.1)
                        Frame_Logo.Visible = false
                        task.wait(.1)
                        _G.ToogleUI = false
						Main.Visible = false
                    end
                else
                    if _G.ToogleUI == false then
						--[[ Main.Visible = true

                        TweenService:Create(
                            PageTab,
                            TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 560, 0, 60)} -- here
                        ):Play() 
                        
                        task.wait(0.25)
    
                        Frame_Logo.Visible = true
						
                        task.wait(0.25)
                        
                        Scrolling_PageTab.Visible = true --
    
                        TweenService:Create(
                            PageMain,
                            TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, 560, 0, 390)} -- here
                        ):Play()

						task.wait(0.25)

                        Scrolling_PageMain.Visible = true --
 ]]
                        Main.Visible = true
                        task.wait(.1)
                        Frame_Logo.Visible = true
                        task.wait(.1)
                        Scrolling_PageTab.Visible = true
                        task.wait(.1)
                        Scrolling_PageMain.Visible = true
                        _G.ToogleUI = true

                    end
				end
                library.toggledui = not library.toggledui
			end
		end)

local Page = {}
    function Page:CreateSector(text,Type)
        local function GetType(value)
            if value == 'Left' then
                return PageLeft
            elseif value == 'Right' then
                return PageRight
            else
                return PageLeft
            end
        end

        local Page = Instance.new("Frame")
        Page.Parent = GetType(Type)
        Page.BackgroundColor3 = Color3.fromRGB(30, 35, 40)
        Page.BackgroundTransparency = 0
        Page.BorderSizePixel = 0
        Page.AnchorPoint = Vector2.new(0.5,0.5)
        Page.Position = UDim2.new(0.5, 0, 0.5, 0)
        Page.Size = UDim2.new(0, 215, 0, 210)
        Page.Visible = true
        Page.ClipsDescendants = true 

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = Page

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = Page
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		local UIPaddingPage = Instance.new("UIPadding")
		UIPaddingPage.Parent = Page
		UIPaddingPage.PaddingLeft = UDim.new(0, 20)
		UIPaddingPage.PaddingTop = UDim.new(0, 5)

        local PageFrame = Instance.new("Frame")
        PageFrame.Parent = Page
        PageFrame.BackgroundColor3 = Color3.fromRGB(30, 50, 100)
        PageFrame.BackgroundTransparency = 1
        PageFrame.BorderSizePixel = 0
        PageFrame.AnchorPoint = Vector2.new(0.5,0.5)
        PageFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        PageFrame.Size = UDim2.new(0, 205, 0, 20)
        PageFrame.Visible = true
        PageFrame.ClipsDescendants = true 

		local Name_Page = Instance.new("TextLabel")
		Name_Page.Parent = PageFrame
		Name_Page.BackgroundColor3 = Color3.fromRGB(10,140,255)
		Name_Page.BackgroundTransparency = 1
		Name_Page.BorderSizePixel = 0
		Name_Page.Size = UDim2.new(0, 250, 0, 20)
        Name_Page.AnchorPoint = Vector2.new(0.5,0.5)
		Name_Page.Position = UDim2.new(0.5, 0, 0.4, 0)
		Name_Page.Font = Enum.Font.GothamBold
		Name_Page.TextColor3 = Color3.fromRGB(255,255,255)
		Name_Page.Text = tostring(text)
		Name_Page.TextSize = 12
		Name_Page.TextXAlignment = Enum.TextXAlignment.Center

        local PageLine = Instance.new("Frame")
		PageLine.Parent = PageFrame
		PageLine.BackgroundColor3 = _G.ColorHub
		PageLine.BackgroundTransparency = 0
		PageLine.BorderSizePixel = 0
        PageLine.AnchorPoint = Vector2.new(0.5,0.5)
		PageLine.Position = UDim2.new(0.5, 0, 0.9, 0)
        PageLine.Size = UDim2.new(0, 250, 0, 2)

		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Page.Size =  UDim2.new(0, 250, 0,UIListLayout.AbsoluteContentSize.Y + 12)
		end);


local Items = {}
    function Items:AddLine()

        local Line_Frame = Instance.new("Frame")
        Line_Frame.Parent = Page
        Line_Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Line_Frame.BackgroundTransparency = 1
        Line_Frame.BorderSizePixel = 0
        Line_Frame.AnchorPoint = Vector2.new(0.5,0.5)
        Line_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Line_Frame.Size = UDim2.new(0, 205, 0, 5)

        local Line_Main = Instance.new("Frame")
        Line_Main.Parent = Line_Frame
        Line_Main.BackgroundColor3 = Color3.fromRGB(70, 75, 80)
        Line_Main.BackgroundTransparency = 0.5
        Line_Main.BorderSizePixel = 0
        Line_Main.AnchorPoint = Vector2.new(0.5,0.5)
        Line_Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Line_Main.Size = UDim2.new(0, 230, 0, 2)

        end

    function Items:AddLabel(text)
		value = 1
        local Label_Frame = Instance.new("Frame")
        Label_Frame.Parent = Page
        Label_Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
        Label_Frame.BackgroundTransparency = 1
        Label_Frame.BorderSizePixel = 0
        Label_Frame.AnchorPoint = Vector2.new(0.5,0.5)
        Label_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Label_Frame.Size = UDim2.new(0, 205, 0, 15)

        if value == 1 then
            local Labelfuc1 = {}
            local Label_Main1 = Instance.new("TextLabel")
            Label_Main1.Parent = Label_Frame
            Label_Main1.BackgroundColor3 = Color3.fromRGB(10,140,255)
            Label_Main1.BackgroundTransparency = 1
            Label_Main1.BorderSizePixel = 0
            Label_Main1.AnchorPoint = Vector2.new(0.5,0.5)
            Label_Main1.Position = UDim2.new(0.5, 0, 0.5, 0)
            Label_Main1.Size = UDim2.new(0, 180, 0, 15)
            Label_Main1.Font = Enum.Font.GothamMedium
            Label_Main1.TextColor3 = Color3.fromRGB(255,255,255)
            Label_Main1.Text = tostring(text)
            Label_Main1.TextSize = 13
            Label_Main1.TextXAlignment = Enum.TextXAlignment.Center
            function  Labelfuc1:Set(text)
                Label_Main1.Text = tostring(text)
            end
			function Labelfuc1:Delete()
				Labelfuc1:Destroy()
			end
                return Labelfuc1
            end

        if value == 2 then
            local Labelfuc2 = {}
            local Label_Main2 = Instance.new("TextLabel")
            Label_Main2.Parent = Label_Frame
            Label_Main2.BackgroundColor3 = Color3.fromRGB(10,140,255)
            Label_Main2.BackgroundTransparency = 1
            Label_Main2.BorderSizePixel = 0
            Label_Main2.AnchorPoint = Vector2.new(0.5,0.5)
            Label_Main2.Position = UDim2.new(0.5, 0, 0.5, 0)
            Label_Main2.Size = UDim2.new(0, 180, 0, 15)
            Label_Main2.Font = Enum.Font.GothamMedium
            Label_Main2.TextColor3 = Color3.fromRGB(255,255,255)
            Label_Main2.Text = tostring(text)
            Label_Main2.TextSize = 13
            Label_Main2.TextXAlignment = Enum.TextXAlignment.Left
			function  Labelfuc2:Set(text)
				Label_Main.Text = tostring(text)
			end
			function Labelfuc2:Delete()
				Labelfuc2:Destroy()
			end
                return Labelfuc2
            end
        end

	function Items:AddButton(text,callback)
		local Button_Frame = Instance.new("TextButton")
		Button_Frame.Parent = Page
		Button_Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
		Button_Frame.BackgroundTransparency = 1
		Button_Frame.BorderSizePixel = 0
		Button_Frame.AnchorPoint = Vector2.new(0.5,0.5)
		Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Button_Frame.Size = UDim2.new(0, 205, 0, 20)
		Button_Frame.Font = Enum.Font.GothamMedium
		Button_Frame.TextColor3 = Color3.fromRGB(255,255,255)
		Button_Frame.Text = ""
		Button_Frame.TextSize = 14.000

		local Button_Main = Instance.new("TextButton")
		Button_Main.Parent = Button_Frame
		Button_Main.BackgroundColor3 = _G.ColorHub
		Button_Main.BackgroundTransparency = 0.5
		Button_Main.BorderSizePixel = 0
		Button_Main.AnchorPoint = Vector2.new(0.5,0.5)
		Button_Main.Position = UDim2.new(0.5, 0, 0.5, 0)
		Button_Main.Size = UDim2.new(0, 205, 0, 20)
		Button_Main.Font = Enum.Font.GothamMedium
		Button_Main.TextColor3 = Color3.fromRGB(255,255,255)
		Button_Main.Text = tostring(text)
		Button_Main.TextSize = 13
        Button_Main.AutoButtonColor = false

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Name = ""
		UICorner.Parent = Button_Main

		Button_Main.MouseButton1Click:Connect(function()
			TweenService:Create(
				Button_Main,
				TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 175, 0, 20)}
			):Play() wait(0.1)
			TweenService:Create(
				Button_Main,
				TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
				{Size = UDim2.new(0, 205, 0, 20)}
			):Play()
			TweenService:Create(
				Button_Main,
				TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
				{TextSize = 12}
			):Play() wait(0.1)
			TweenService:Create(
				Button_Main,
				TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
				{TextSize = 13}
			):Play()
			callback()
		end)

		Button_Main.MouseEnter:Connect(function()
			TweenService:Create(
				Button_Main,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0}
			):Play()
		end)
		Button_Main.MouseLeave:Connect(function()
			TweenService:Create(
				Button_Main,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0.5}
			):Play()
		end)
		end

	function Items:AddToggle(text,Stats,callback)
		local Toggle_Main = Instance.new("Frame")
		Toggle_Main.Parent = Page
		Toggle_Main.BackgroundColor3 = _G.ColorItem
        Toggle_Main.BackgroundTransparency = 0
		Toggle_Main.BorderSizePixel = 0
		Toggle_Main.AnchorPoint = Vector2.new(0.5,0.5)
		Toggle_Main.Position = UDim2.new(0.5, 0, 5, 0)
		Toggle_Main.Size = UDim2.new(0, 205, 0, 28)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Name = ""
		UICorner.Parent = Toggle_Main

		local TextButton_Toggle = Instance.new("TextButton")
		TextButton_Toggle.Parent = Toggle_Main
		TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
		TextButton_Toggle.BackgroundTransparency = 1
		TextButton_Toggle.BorderSizePixel = 0
		TextButton_Toggle.AnchorPoint = Vector2.new(0.5,0.5)
		TextButton_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton_Toggle.Size = UDim2.new(0, 190, 0, 28)
		TextButton_Toggle.Font = Enum.Font.GothamMedium
		TextButton_Toggle.TextColor3 = Color3.fromRGB(75, 85, 115)
		TextButton_Toggle.Text = tostring(text)
		TextButton_Toggle.TextSize = 14
		TextButton_Toggle.TextXAlignment = Enum.TextXAlignment.Left
		
		local Toggle_Frame = Instance.new("Frame")
		Toggle_Frame.Parent = TextButton_Toggle
		Toggle_Frame.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
		Toggle_Frame.AnchorPoint = Vector2.new(0.5,0.5)
		Toggle_Frame.Position = UDim2.new(0.95, 0, 0.5, 0)
		Toggle_Frame.Size = UDim2.new(0, 18, 0, 18)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 360)
		UICorner.Name = ""
		UICorner.Parent = Toggle_Frame

		local Toggle1 = Instance.new("Frame")
		Toggle1.Parent = TextButton_Toggle
		Toggle1.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
		Toggle1.AnchorPoint = Vector2.new(0.5,0.5)
		Toggle1.Position = UDim2.new(0.95, 0, 0.5, 0)
		Toggle1.Size = UDim2.new(0, 14, 0, 14)
        
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 360)
		UICorner.Name = ""
		UICorner.Parent = Toggle1
		-- Lock Function
		local lockerframe = Instance.new("Frame")
		lockerframe.Name = "lockerframe"
		lockerframe.Parent = Toggle_Main
		lockerframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		lockerframe.BackgroundTransparency = 1
		lockerframe.Size = UDim2.new(0, 205, 0, 28)
		lockerframe.Position = UDim2.new(0.5, 0, 0.5, 0)
		lockerframe.AnchorPoint = Vector2.new(0.5, 0.5)

		local UICorner_Toggle = Instance.new("UICorner")
		UICorner_Toggle.CornerRadius = UDim.new(0, 5)
		UICorner_Toggle.Parent = lockerframe

		local LockerImage = Instance.new("ImageLabel")
		LockerImage.Parent = lockerframe
		LockerImage.BackgroundTransparency = 1.000
		LockerImage.BorderSizePixel = 0
		LockerImage.Position = UDim2.new(0.5, 0, 0.5, 0)
		LockerImage.AnchorPoint = Vector2.new(0.5, 0.5)
		LockerImage.Size = UDim2.new(0, 0, 0, 0)
		LockerImage.Image = "http://www.roblox.com/asset/?id=7072718362"
		LockerImage.ImageColor3 = _G.ColorHub
		--
		local check = {Toggle = false ; lock = true ; togglefunction = {}; }
		TextButton_Toggle.MouseButton1Down:Connect(function()
			if check.Toggle == false  and check.lock == true  then ------- true
				TweenService:Create(
					TextButton_Toggle,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255,255,255)}
				):Play()
				TweenService:Create(
					Toggle1,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = _G.ColorHub}
				):Play()
			elseif check.lock == true then
				TweenService:Create(
					TextButton_Toggle,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(75, 85, 115)}
				):Play()
				TweenService:Create(
					Toggle1,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(50, 55, 75)}
				):Play()
			end
			if check.lock == true then
				check.Toggle = not check.Toggle
				pcall(callback,check.Toggle)
			end
		end)
		TextButton_Toggle.MouseEnter:Connect(function()
			if check.Toggle == false and check.lock == true then

			end
		end)
		TextButton_Toggle.MouseLeave:Connect(function()
			if check.Toggle == false then

			end
		end)
		if Stats == true then
			TweenService:Create(
				TextButton_Toggle,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255,255,255)}
			):Play()
			TweenService:Create(
				Toggle1,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundColor3 = _G.ColorHub}
			):Play()
			check.Toggle = not check.Toggle
			pcall(callback,check.Toggle)
		end
		-- Function Lock
		function check.togglefunction:lock()
			TweenService:Create(
				lockerframe,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{BackgroundTransparency = 0.5}
			):Play() wait(0.2)
			--
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{Size = UDim2.new(0, 15, 0, 15)}
			):Play()
			-- Tween Lock
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = -50}
			):Play() wait(0.3)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 50}
			):Play() wait(0.2)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = -30}
			):Play() wait(0.2)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 30}
			):Play() wait(0.2)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 0}
			):Play() wait(0.1)
			check.lock  = false
		end
		function check.togglefunction:unlock()
			TweenService:Create(
				lockerframe,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{BackgroundTransparency = 1}
			):Play() wait(0.2)
			-- Tween UnLock
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = -30}
			):Play() wait(0.3)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 30}
			):Play() wait(0.2)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = -50}
			):Play() wait(0.2)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 50}
			):Play() wait(0.2)
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Rotation = 0}
			):Play() wait(0.1)
			--
			TweenService:Create(
				LockerImage,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
				{Size = UDim2.new(0, 0, 0, 0)}
			):Play()
			check.lock  = true
		end
		-- Tween
		Toggle_Main.MouseEnter:Connect(function()
			if check.lock == false then
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = -50}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 50}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = -70}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 70}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = -30}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 30}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 0}
				):Play()
			end
		end)
		Toggle_Main.MouseLeave:Connect(function()
			if check.lock == false then
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 50}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = -50}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 70}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = -70}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 30}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = -30}
				):Play() wait(0.3)
				TweenService:Create(
					LockerImage,
					TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Rotation = 0}
				):Play()
			end
			--
		end)
		    return  check.togglefunction
		end

	function Items:AddDropdown(text,option,default,idk,callback)
		local defaultt = default or ""

		local Drop_Frame = Instance.new("Frame")
		Drop_Frame.Name = "DropFrame"
		Drop_Frame.Parent = Page
		Drop_Frame.BackgroundColor3 = _G.ColorItem
		Drop_Frame.BackgroundTransparency = 0
		Drop_Frame.BorderSizePixel = 0
		Drop_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Drop_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Drop_Frame.Size = UDim2.new(0, 205, 0, 28)
		Drop_Frame.ClipsDescendants = true

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Name = ""
		UICorner.Parent = Drop_Frame

		local TextLabe_DropDown = Instance.new("TextLabel")
		TextLabe_DropDown.Name = "LabelFrameDrop"
		TextLabe_DropDown.Parent = Drop_Frame
		TextLabe_DropDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabe_DropDown.BackgroundTransparency = 1
		TextLabe_DropDown.Position = UDim2.new(0.05, 0, 0.025, 0)
		TextLabe_DropDown.Size = UDim2.new(0, 190, 0, 28)
		TextLabe_DropDown.Font = Enum.Font.GothamMedium
		TextLabe_DropDown.TextColor3 = Color3.fromRGB(75, 85, 115)
		TextLabe_DropDown.TextSize = 14
		TextLabe_DropDown.TextWrapped = true
		TextLabe_DropDown.TextXAlignment = Enum.TextXAlignment.Left
		TextLabe_DropDown.Text = tostring(text).." :"

		local Icon = Instance.new("ImageLabel")
		Icon.Name = "Icon"
		Icon.Parent = TextLabe_DropDown
		Icon.BackgroundColor3 = Color3.fromRGB(25, 35, 60)
		Icon.BackgroundTransparency = 1
		Icon.AnchorPoint = Vector2.new(0.5,0.5)
		Icon.Position = UDim2.new(0.935, 0, 0.5, 0)
		Icon.Rotation = 0
		Icon.Size = UDim2.new(0, 18, 0, 18)
		Icon.Image = "http://www.roblox.com/asset/?id=11318419925"
		Icon.ImageColor3 = Color3.fromRGB(75, 85, 115)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Name = ""
		UICorner.Parent = Icon

		local Scrolling_Drop = Instance.new("ScrollingFrame")
		Scrolling_Drop.Name = "Scrolling_Drop"
		Scrolling_Drop.Parent = TextLabe_DropDown
		Scrolling_Drop.Active = true
		Scrolling_Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Scrolling_Drop.BackgroundTransparency = 1
		Scrolling_Drop.BorderSizePixel = 0
		Scrolling_Drop.AnchorPoint = Vector2.new(0.5,0.5)
		Scrolling_Drop.Position = UDim2.new(0.475, 0, 3.15, 0)
		Scrolling_Drop.Size = UDim2.new(0, 195, 0, 125)
		Scrolling_Drop.CanvasSize = UDim2.new(0, 0, 0, 2)
		Scrolling_Drop.ScrollBarThickness = 4
		Scrolling_Drop.ScrollBarImageTransparency = 0

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Name = "UIListLayout"
		UIListLayout.Parent = Scrolling_Drop
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 7)

		local UIPaddinglist = Instance.new("UIPadding")
		UIPaddinglist.Name = "UIPaddinglist"
		UIPaddinglist.Parent = Scrolling_Drop
		UIPaddinglist.PaddingTop = UDim.new(0, 10)

		local Button_Drop = Instance.new("TextButton")
		Button_Drop.Name = "ButtonDrop"
		Button_Drop.Parent = Drop_Frame
		Button_Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_Drop.BackgroundTransparency = 1
		Button_Drop.ClipsDescendants = true
		Button_Drop.Size = UDim2.new(0, 195, 0, 35)
		Button_Drop.Font = Enum.Font.SourceSans
		Button_Drop.Text = ""
		Button_Drop.TextColor3 = Color3.fromRGB(0, 0, 0)
		Button_Drop.TextSize = 14.000
		
		local dog = false
		local droptween = true
		local FrameSize = 130
		local cout = 0
		for i , v in pairs(option) do
			cout =cout + 1
			if cout == 1 then
				FrameSize = 130
			elseif cout == 2 then
				FrameSize = 130
			elseif cout >= 3 then
				FrameSize = 130
			end

		local Button_Frame = Instance.new("Frame")
		Button_Frame.Name = "ListFrame"
		Button_Frame.Parent = Scrolling_Drop
		Button_Frame.BackgroundColor3 = Color3.fromRGB(115,15,15)
		Button_Frame.BackgroundTransparency = 1
		Button_Frame.BorderSizePixel = 0
		Button_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Button_Frame.Size = UDim2.new(0, 195, 0, 23)

		local Dropdown_Button = Instance.new("TextButton")
		Dropdown_Button.Name = "Dropdwon_Button"
		Dropdown_Button.Parent = Button_Frame
		Dropdown_Button.AnchorPoint = Vector2.new(0.5, 0.5)
		Dropdown_Button.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
		Dropdown_Button.BackgroundTransparency = 0
		Dropdown_Button.BorderSizePixel = 0
		Dropdown_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
		Dropdown_Button.Size = UDim2.new(0, 175, 0, 23)
		Dropdown_Button.Font = Enum.Font.GothamSemibold
		Dropdown_Button.TextColor3 = Color3.fromRGB(75, 85, 115)
		Dropdown_Button.TextSize = 14
		Dropdown_Button.TextXAlignment = Enum.TextXAlignment.Left
		Dropdown_Button.Text = ""

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Name = ""
		UICorner.Parent = Dropdown_Button

		local TextLabel_Button = Instance.new("TextLabel")
		TextLabel_Button.Name = "TextLabel_TapDro2p"
		TextLabel_Button.Parent = Dropdown_Button
		TextLabel_Button.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_Button.BackgroundTransparency = 1
		TextLabel_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_Button.Size = UDim2.new(0, 175, 0, 23)
		TextLabel_Button.Font = Enum.Font.GothamSemibold
		TextLabel_Button.TextColor3 = Color3.fromRGB(75, 85, 115)
		TextLabel_Button.TextSize = 14
		TextLabel_Button.TextXAlignment = Enum.TextXAlignment.Center
		TextLabel_Button.Text = tostring(v)

		Dropdown_Button.MouseButton1Click:Connect(function()
			TweenService:Create(
				TextLabe_DropDown,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255,255,255)}
			):Play()
			TweenService:Create(
				Icon,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(255,255,255)}
			):Play()
			TweenService:Create(
				Drop_Frame,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 205, 0, 28)}
			):Play()
			TweenService:Create(
				Icon,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{Rotation = 0}
			):Play()
				TextLabe_DropDown.Text =  text.." : "..tostring(v)
				pcall(callback,v)
				dog = not dog
				droptween = false
			end)
			Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 40 )
		end
		Button_Drop.MouseButton1Click:Connect(function()
			if dog == false then
				TweenService:Create(
					Drop_Frame,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 205, 0, FrameSize)}
				):Play()
				TweenService:Create(
					Icon,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
					{Rotation = 90}
				):Play()
				Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 40  )
			else
				TweenService:Create(
					Drop_Frame,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 205, 0, 28)}
				):Play()
				TweenService:Create(
					Icon,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
					{Rotation = 0}
				):Play()
				Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 40  )
			end
			dog = not dog
		end)
		Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 40  )
		local dropfunc = {}
		-- Tween
		Drop_Frame.MouseEnter:Connect(function()
			if droptween == true then
				TweenService:Create(
					TextLabe_DropDown,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0.1),
					{TextColor3 = Color3.fromRGB(255,255,255)}
				):Play()
				TweenService:Create(
					Icon,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(255,255,255)}
				):Play()
			end
		end)
		Drop_Frame.MouseLeave:Connect(function()
			if droptween == true then
				TweenService:Create(
					TextLabe_DropDown,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0.1),
					{TextColor3 = Color3.fromRGB(75, 85, 115)}
				):Play()
				TweenService:Create(
					Icon,
					TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(75, 85, 115)}
				):Play()
			end
		end)
		function dropfunc:Clear()
			TextLabe_DropDown.Text = tostring(text).." :"
			TweenService:Create(
				TextLabe_DropDown,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(75, 85, 115)}
			):Play()
			TweenService:Create(
				Icon,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{ImageColor3 = Color3.fromRGB(75, 85, 115)}
			):Play()
			TweenService:Create(
				Drop_Frame,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 205, 0, 28)}
			):Play()
			TweenService:Create(
				Icon,
				TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
				{Rotation = 0}
			):Play()
			dog = not dog
			droptween = true
			for i, v in next, Scrolling_Drop:GetChildren() do
				if v:IsA("Frame") then
					v:Destroy()
				end
			end
		end
		function dropfunc:Add(table)
			if (typeof(table) == 'table') then
				for i,t in pairs(table) do
					local Button_Frame = Instance.new("Frame")
					Button_Frame.Name = "ListFrame"
					Button_Frame.Parent = Scrolling_Drop
					Button_Frame.BackgroundColor3 = Color3.fromRGB(115,15,15)
					Button_Frame.BackgroundTransparency = 1
					Button_Frame.BorderSizePixel = 0
					Button_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
					Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
					Button_Frame.Size = UDim2.new(0, 195, 0, 23)
			
					local Dropdown_Button = Instance.new("TextButton")
					Dropdown_Button.Name = "Dropdwon_Button"
					Dropdown_Button.Parent = Button_Frame
					Dropdown_Button.AnchorPoint = Vector2.new(0.5, 0.5)
					Dropdown_Button.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
					Dropdown_Button.BackgroundTransparency = 0
					Dropdown_Button.BorderSizePixel = 0
					Dropdown_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
					Dropdown_Button.Size = UDim2.new(0, 175, 0, 23)
					Dropdown_Button.Font = Enum.Font.GothamSemibold
					Dropdown_Button.TextColor3 = Color3.fromRGB(75, 85, 115)
					Dropdown_Button.TextSize = 14
					Dropdown_Button.TextXAlignment = Enum.TextXAlignment.Left
					Dropdown_Button.Text = ""
			
					local UICorner = Instance.new("UICorner")
					UICorner.CornerRadius = UDim.new(0, 5)
					UICorner.Name = ""
					UICorner.Parent = Dropdown_Button
			
					local TextLabel_Button = Instance.new("TextLabel")
					TextLabel_Button.Name = "TextLabel_TapDro2p"
					TextLabel_Button.Parent = Dropdown_Button
					TextLabel_Button.AnchorPoint = Vector2.new(0.5, 0.5)
					TextLabel_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_Button.BackgroundTransparency = 1
					TextLabel_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
					TextLabel_Button.Size = UDim2.new(0, 175, 0, 23)
					TextLabel_Button.Font = Enum.Font.GothamSemibold
					TextLabel_Button.TextColor3 = Color3.fromRGB(75, 85, 115)
					TextLabel_Button.TextSize = 14
					TextLabel_Button.TextXAlignment = Enum.TextXAlignment.Center
					TextLabel_Button.Text = tostring(t)

					Dropdown_Button.MouseButton1Click:Connect(function()
						TweenService:Create(
							TextLabe_DropDown,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TweenService:Create(
							Icon,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{ImageColor3 = Color3.fromRGB(255,255,255)}
						):Play()
						TweenService:Create(
							Drop_Frame,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 205, 0, 28)}
						):Play()
						TweenService:Create(
							Icon,
							TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
							{Rotation = 0}
						):Play()
						TextLabe_DropDown.Text =  text.." : "..tostring(t)
						dog = not dog
						pcall(callback,t)
						droptween = false
					end)
					Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 40)
				end
			else
				local Button_Frame = Instance.new("Frame")
				Button_Frame.Name = "ListFrame"
				Button_Frame.Parent = Scrolling_Drop
				Button_Frame.BackgroundColor3 = Color3.fromRGB(115,15,15)
				Button_Frame.BackgroundTransparency = 1
				Button_Frame.BorderSizePixel = 0
				Button_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				Button_Frame.Size = UDim2.new(0, 195, 0, 23)
			
				local Dropdown_Button = Instance.new("TextButton")
				Dropdown_Button.Name = "Dropdwon_Button"
				Dropdown_Button.Parent = Button_Frame
				Dropdown_Button.AnchorPoint = Vector2.new(0.5, 0.5)
				Dropdown_Button.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
				Dropdown_Button.BackgroundTransparency = 0
				Dropdown_Button.BorderSizePixel = 0
				Dropdown_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
				Dropdown_Button.Size = UDim2.new(0, 175, 0, 23)
				Dropdown_Button.Font = Enum.Font.GothamSemibold
				Dropdown_Button.TextColor3 = Color3.fromRGB(75, 85, 115)
				Dropdown_Button.TextSize = 14
				Dropdown_Button.TextXAlignment = Enum.TextXAlignment.Left
				Dropdown_Button.Text = ""
			
				local UICorner = Instance.new("UICorner")
				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Name = ""
				UICorner.Parent = Dropdown_Button
		
				local TextLabel_Button = Instance.new("TextLabel")
				TextLabel_Button.Name = "TextLabel_TapDro2p"
				TextLabel_Button.Parent = Dropdown_Button
				TextLabel_Button.AnchorPoint = Vector2.new(0.5, 0.5)
				TextLabel_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_Button.BackgroundTransparency = 1
				TextLabel_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
				TextLabel_Button.Size = UDim2.new(0, 175, 0, 23)
				TextLabel_Button.Font = Enum.Font.GothamSemibold
				TextLabel_Button.TextColor3 = Color3.fromRGB(75, 85, 115)
				TextLabel_Button.TextSize = 14
				TextLabel_Button.TextXAlignment = Enum.TextXAlignment.Center
				TextLabel_Button.Text = tostring(table)

				Dropdown_Button.MouseButton1Click:Connect(function()
					TweenService:Create(
						TextLabe_DropDown,
						TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						Icon,
						TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(255,255,255)}
					):Play()
					TweenService:Create(
						Drop_Frame,
						TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 205, 0, 28)}
					):Play()
					TweenService:Create(
						Icon,
						TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
						TextLabe_DropDown.Text =  text.." : "..tostring(t)
					dog = not dog
					pcall(callback,table)
					droptween = false
				end)
				Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 40)
			end
		end
		if defaultt ~= "" and tablefound(option,defaultt) then
            callback(defaultt)
        end
			return dropfunc
		end

		function Items:AddSlider(text,min,de,max,de2,callback)
			local sliderfunc = {}
			local SliderFrame = Instance.new("Frame")
			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Page
			SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			SliderFrame.BackgroundColor3 = _G.ColorItem
			SliderFrame.BackgroundTransparency = 0
			SliderFrame.ClipsDescendants = true
			SliderFrame.Position = UDim2.new(0.5, 0, 0.457317084, 0)
			SliderFrame.Size = UDim2.new(0, 205, 0, 38)
	
			local SliderFrame_UICorner = Instance.new("UICorner")
			SliderFrame_UICorner.Name = "SliderFrame_UICorner"
			SliderFrame_UICorner.Parent = SliderFrame
			SliderFrame_UICorner.CornerRadius = UDim.new(0, 5)
	
			local LabelNameSlider = Instance.new("TextLabel")
			LabelNameSlider.Name = "LabelNameSlider"
			LabelNameSlider.Parent = SliderFrame
			LabelNameSlider.AnchorPoint = Vector2.new(0.5, 0.5)
			LabelNameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelNameSlider.BackgroundTransparency = 1
			LabelNameSlider.BorderSizePixel = 0
			LabelNameSlider.Position = UDim2.new(0.5, 0, 0.35, 0)
			LabelNameSlider.Size = UDim2.new(0, 190, 0, 20)
			LabelNameSlider.Font = Enum.Font.GothamMedium
			LabelNameSlider.TextColor3 = Color3.fromRGB(75, 85, 115)
			LabelNameSlider.Text = tostring(text)
			LabelNameSlider.TextSize = 14
			LabelNameSlider.TextWrapped = true
			LabelNameSlider.TextXAlignment = Enum.TextXAlignment.Left
	
			local ShowValueFrame = Instance.new("Frame")
			ShowValueFrame.Name = "ShowValueFrame"
			ShowValueFrame.Parent = SliderFrame
			ShowValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ShowValueFrame.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
			ShowValueFrame.BorderSizePixel = 0
			ShowValueFrame.Position = UDim2.new(0.865, 0, 0.35, 0)
			ShowValueFrame.Size = UDim2.new(0, 44, 0, 16)
	
			local ShowValueFrameUICorner = Instance.new("UICorner")
			ShowValueFrameUICorner.CornerRadius = UDim.new(0, 4)
			ShowValueFrameUICorner.Name = "ShowValueFrameUICorner"
			ShowValueFrameUICorner.Parent = ShowValueFrame
	
			local CustomValue = Instance.new("TextBox")
			CustomValue.Name = "CustomValue"
			CustomValue.Parent = ShowValueFrame
			CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
			CustomValue.BackgroundColor3 = Color3.fromRGB(10,10,10)
			CustomValue.BackgroundTransparency = 1
			CustomValue.ClipsDescendants = true
			CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
			CustomValue.Size = UDim2.new(0, 44, 0, 16)
			CustomValue.Font = Enum.Font.GothamMedium
			CustomValue.PlaceholderColor3 = Color3.fromRGB(75, 85, 115)
			CustomValue.TextSize = 13
			CustomValue.TextColor3 = Color3.fromRGB(100,100,100)
			CustomValue.Text =  tostring(de or 0)
	
			local ValueFrame = Instance.new("Frame")
			ValueFrame.Name = "ValueFrame"
			ValueFrame.Parent = SliderFrame
			ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ValueFrame.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
			ValueFrame.BorderSizePixel = 0
			ValueFrame.Position = UDim2.new(0.499824077, 0, 0.800000012, 0)
			ValueFrame.Size = UDim2.new(0, 195, 0, 4)
	
			local Main_UiStroke = Instance.new("UIStroke")
			Main_UiStroke.Thickness = 1
			Main_UiStroke.Name = ""
			Main_UiStroke.Parent = ValueFrame
			Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
			Main_UiStroke.Color = Color3.fromRGB(50, 55, 75)
			Main_UiStroke.Transparency = 0
	
			local ValueFrameUICorner = Instance.new("UICorner")
			ValueFrameUICorner.CornerRadius = UDim.new(0, 10)
			ValueFrameUICorner.Name = "ShowValueFrameUICorner"
			ValueFrameUICorner.Parent = ValueFrame
	
			local PartValue = Instance.new("Frame")
			PartValue.Name = "PartValue"
			PartValue.Parent = ValueFrame
			PartValue.Active = true
			PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
			PartValue.BackgroundColor3 = Color3.fromRGB(50, 55, 75)
			PartValue.BackgroundTransparency = 1.000
			PartValue.Position = UDim2.new(0.498982757, 0, 0.300000012, 0)
			PartValue.Size = UDim2.new(0, 195, 0, 4)
	
			local MainValue = Instance.new("Frame")
			MainValue.Name = "MainValue"
			MainValue.Parent = PartValue
			MainValue.BackgroundColor3 = _G.ColorHub
			MainValue.Position = UDim2.new(0.00101725257, 0, 0.200000003, 0)
			MainValue.Size = UDim2.new((1 - ((max - CustomValue.Text) / (max - min)) or 0), 0, 0, 4)
			MainValue.BorderSizePixel = 0
	
			local MainValueUICorner = Instance.new("UICorner")
			MainValueUICorner.CornerRadius = UDim.new(0, 10)
			MainValueUICorner.Name = "a"
			MainValueUICorner.Parent = MainValue
	
			local ConneValue = Instance.new("Frame")
			ConneValue.Name = "ConneValue"
			ConneValue.Parent = PartValue
			ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
			ConneValue.BackgroundColor3 = Color3.fromRGB(10,10,10)
			ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.6,0, 0)
			ConneValue.Size = UDim2.new(0, 0, 0, 0)
			ConneValue.BorderSizePixel = 0
	
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0, 300)
			UICorner.Parent = ConneValue
	

	
			local function move(input)
				local pos =
					UDim2.new(
						math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
						0,
						0.6,
						0
					)
				local pos1 =
					UDim2.new(
						math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
						0,
						0,
						4
					)
				MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)
				ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
				local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
				CustomValue.Text = tostring(value)
				callback(value)
			end
			local dragging = false
			ConneValue.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end)
			ConneValue.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			SliderFrame.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end)
			SliderFrame.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			ValueFrame.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end)
			ValueFrame.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
					warn('Input | '..tostring(input.Position.X))
				end
			end)
			CustomValue.FocusLost:Connect(function()
				local Result = 1 - ((max - CustomValue.Text) / (max - min))
				MainValue:TweenSize(UDim2.new(Result, 0, 0, 4), "Out", "Sine", 0.2, true)
				ConneValue:TweenPosition(UDim2.new(Result, 0,0.6, 0) , "Out", "Sine", 0.2, true)
				CustomValue.Text = tostring(CustomValue.Text) -- and math.floor( (CustomValue.Text / max) * (max - min) + min) 
				pcall(callback, CustomValue.Text)
			end)
			-- Tween
			SliderFrame.MouseEnter:Connect(function()
				TweenService:Create(
					LabelNameSlider,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
					{TextColor3 = Color3.fromRGB(255,255,255)}
				):Play()
				TweenService:Create(
					CustomValue,
					TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255,255,255)}
				):Play()
			end)
			SliderFrame.MouseLeave:Connect(function()
				TweenService:Create(
					LabelNameSlider,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
					{TextColor3 = Color3.fromRGB(75, 85, 115)}
				):Play()
				TweenService:Create(
					CustomValue,
					TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(75, 85, 115)}
				):Play()
			end)
			function sliderfunc:Update(value)
				MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 4), "Out", "Sine", 0.2, true)
				CustomValue.Text = value
				pcall(function()
					callback(value)
				end)
			end
			return sliderfunc
		end 

    function Items:AddTextbox(text,text2,callback)
		local TextBox_Frame = Instance.new("Frame")
		TextBox_Frame.Name = "TextFrame"
		TextBox_Frame.Parent = Page
		TextBox_Frame.Active = true
		TextBox_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		TextBox_Frame.BackgroundColor3 = Color3.fromRGB(111,111,111)
		TextBox_Frame.BackgroundTransparency = 1
		TextBox_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextBox_Frame.Size = UDim2.new(0, 205, 0, 48)
		TextBox_Frame.ClipsDescendants = true

		local Label_Name = Instance.new("TextLabel")
		Label_Name.Name = "LabelNameSliderxd"
		Label_Name.Parent = TextBox_Frame
		Label_Name.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Label_Name.AnchorPoint = Vector2.new(0.5, 0.5)
		Label_Name.Position = UDim2.new(0.5, 0, 0.25, 0)
		Label_Name.BackgroundTransparency = 1
		Label_Name.BorderSizePixel = 0
		Label_Name.Size = UDim2.new(0, 190, 0, 28)
		Label_Name.Font = Enum.Font.GothamMedium
		Label_Name.TextColor3 = Color3.fromRGB(255,255,255)
		Label_Name.TextSize = 14
		Label_Name.TextTransparency = 0
		Label_Name.Text = tostring(text)
		Label_Name.TextXAlignment = Enum.TextXAlignment.Left

		local UiConer = Instance.new("UICorner")
		UiConer.CornerRadius = UDim.new(0, 4)
		UiConer.Name = "ConerTextBox"
		UiConer.Parent = TextBox_Frame

		local Frame_Box = Instance.new("Frame")
		Frame_Box.Name = "FrameBox"
		Frame_Box.Parent = TextBox_Frame
		Frame_Box.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_Box.BackgroundColor3 = _G.ColorItem
		Frame_Box.BackgroundTransparency = 0
		Frame_Box.BorderSizePixel = 1
		Frame_Box.ClipsDescendants = true
		Frame_Box.Position = UDim2.new(0.5, 0, 0.725, 0)
		Frame_Box.Size = UDim2.new(0, 205, 0, 28)

		local UiConer = Instance.new("UICorner")
		UiConer.CornerRadius = UDim.new(0, 5)
		UiConer.Name = "ConerTextBox2"
		UiConer.Parent = Frame_Box

		local TextFrame2 = Instance.new("TextBox")
		TextFrame2.Name = "TextFrame2"
		TextFrame2.Parent = TextBox_Frame
		TextFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextFrame2.BackgroundTransparency = 1
		TextFrame2.BorderSizePixel = 0
		TextFrame2.ClipsDescendants = true
		TextFrame2.Position = UDim2.new(0.5, 0, 0.725, 0)
		TextFrame2.Size = UDim2.new(0, 195, 0, 25)
		TextFrame2.Font = Enum.Font.GothamMedium
		TextFrame2.PlaceholderText = text2
        TextFrame2.Text = text2
		TextFrame2.PlaceholderColor3 = Color3.fromRGB(75, 85, 115)
		TextFrame2.TextColor3 = Color3.fromRGB(75, 85, 115)
		TextFrame2.TextSize = 14
		TextFrame2.TextXAlignment = Enum.TextXAlignment.Left
		
		Frame_Box.MouseEnter:Connect(function()
			TweenService:Create(
				TextFrame2,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255,255,255)}
			):Play()
			TweenService:Create(
				TextFrame2,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{PlaceholderColor3 = Color3.fromRGB(255,255,255)}
			):Play()
		end)
		Frame_Box.MouseLeave:Connect(function()
			TweenService:Create(
				TextFrame2,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(75, 85, 115)}
			):Play()
			TweenService:Create(
				TextFrame2,
				TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{PlaceholderColor3 = Color3.fromRGB(75, 85, 115)}
			):Play()
		end)

		TextFrame2.FocusLost:Connect(function()
			if #TextFrame2.Text > 0 then
				pcall(callback,TextFrame2.Text)
				end
			end)
		end

	function Items:AddKeyBind(text,Key,callback)
		local BindKey = Key.Name

		local KeyBindFrame = Instance.new("Frame")
		KeyBindFrame.Name = "KeyBindFrame"
		KeyBindFrame.Parent = Page
		KeyBindFrame.Active = true
		KeyBindFrame.BackgroundColor3 = _G.ColorItem
		KeyBindFrame.BackgroundTransparency = 0
		KeyBindFrame.BorderSizePixel = 0
		KeyBindFrame.Size = UDim2.new(0, 205, 0, 28)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = KeyBindFrame

		local TextLabel_Key = Instance.new("TextLabel")
		TextLabel_Key.Name = "TextLabel_Key"
		TextLabel_Key.Parent = KeyBindFrame
		TextLabel_Key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_Key.BackgroundTransparency = 1.000
		TextLabel_Key.AnchorPoint = Vector2.new(0.5,0.5)
		TextLabel_Key.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_Key.Size = UDim2.new(0, 190, 0, 28)
		TextLabel_Key.Font = Enum.Font.GothamMedium
		TextLabel_Key.TextColor3 = Color3.fromRGB(75, 85, 115)
		TextLabel_Key.TextSize = 14
		TextLabel_Key.Text = tostring(text)
		TextLabel_Key.TextXAlignment = Enum.TextXAlignment.Left

		local Button_Frame = Instance.new("TextButton")
		Button_Frame.Name = "Button_Frame"
		Button_Frame.Parent = KeyBindFrame
		Button_Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_Frame.BackgroundTransparency = 1.000
		Button_Frame.Size = UDim2.new(0, 195, 0, 25)
		Button_Frame.Font = Enum.Font.GothamMedium
		Button_Frame.Text = ""
		Button_Frame.TextColor3 = Color3.fromRGB(10, 10, 10)
		Button_Frame.TextSize = 14.000
		Button_Frame.ClipsDescendants = true

		local Bind_Frame = Instance.new("Frame")
		Bind_Frame.Name = "Bind_Frame"
		Bind_Frame.Parent = KeyBindFrame
		Bind_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
		Bind_Frame.BackgroundColor3 = Color3.fromRGB(25, 35, 60)
		Bind_Frame.BackgroundTransparency = 1
		Bind_Frame.BorderSizePixel = 0
		Bind_Frame.ClipsDescendants = true
		Bind_Frame.Position = UDim2.new(0.65, 0, 0.5, 0)
		Bind_Frame.Size = UDim2.new(0, 150, 0, 16)

		local Text = Instance.new("TextLabel")
		Text.Name = "Text"
		Text.Parent = Bind_Frame
		Text.BackgroundColor3 = Color3.fromRGB(25, 35, 60)
		Text.BackgroundTransparency = 1
		Text.AnchorPoint = Vector2.new(0.5,0.5)
		Text.Position = UDim2.new(0.8, 0, 0.5, 0)
		Text.Font = Enum.Font.GothamMedium
		Text.Text = "["..tostring(BindKey).."]"
        Text.Size = UDim2.new(0,15+ Text.TextBounds.X ,0,16)
		Text.TextColor3 = Color3.fromRGB(255,255,255)
		Text.TextSize = 12
		Text.TextTransparency = 0
        Text.TextXAlignment = Enum.TextXAlignment.Right

		Button_Frame.MouseButton1Click:Connect(function ()

			Text.Text = "..."
			local input = game:GetService("UserInputService").InputBegan:wait()
			local KeyBind = input.KeyCode == Enum.KeyCode.Unknown and input.UserInputType or input.KeyCode
			if
				KeyBind.Name ~= "Focus" and KeyBind.Name ~= "MouseMovement"
			then
				Text.Text =  "[ "..KeyBind.Name.." ]"
				BindKey = KeyBind.Name
			end
		end)
            game:GetService("UserInputService").InputBegan:connect(function(current)
                local KeyBind = current.KeyCode == Enum.KeyCode.Unknown and current.UserInputType or current.KeyCode

                if KeyBind.Name == BindKey then
                    callback(BindKey)
                end
            end)
		end

	function Items:AddNotification(text1,text2,Icon,delays)
        if Icon == nil then
            Icon = 12869780066
        end

		local Notification_Frame = Instance.new("Frame")
		Notification_Frame.Name = "Notification_Frame"
		Notification_Frame.Parent = Notification_Page
		Notification_Frame.BackgroundColor3 = _G.ColorMain
		Notification_Frame.BorderSizePixel = 0
		Notification_Frame.AnchorPoint = Vector2.new(0.5,0.5)
		Notification_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
		Notification_Frame.Size = UDim2.new(0, 0, 0, 70) -- UDim2.new(0, 295, 0, 70)

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0,100)
		UICorner.Name = ""
		UICorner.Parent = Notification_Frame

		local Notification_Frame1 = Instance.new("Frame")
		Notification_Frame1.Name = "Notification_Frame"
		Notification_Frame1.Parent = Notification_Frame
		Notification_Frame1.BackgroundColor3 = _G.ColorMain
		Notification_Frame1.BorderSizePixel = 0
		Notification_Frame1.AnchorPoint = Vector2.new(0.5,0.5)
		Notification_Frame1.Position = UDim2.new(0.115, 0, 0.5, 0)
		Notification_Frame1.Size = UDim2.new(0, 70, 0, 70)
		Notification_Frame1.Visible = true

		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(0,10)
		UICorner.Name = ""
		UICorner.Parent = Notification_Frame1

        local Icon_Img = Instance.new("ImageLabel")
        Icon_Img.Name = "Icon"
        Icon_Img.Parent = Notification_Frame
        Icon_Img.AnchorPoint = Vector2.new(0.5, 0.5)
        Icon_Img.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon_Img.BackgroundTransparency = 1
        Icon_Img.BorderSizePixel = 0
        Icon_Img.Position = UDim2.new(0.875, 0, 0.5, 0)
        Icon_Img.Size = UDim2.new(0, 35, 0, 35)
        Icon_Img.Image = "rbxassetid://"..tostring(Icon)
		Icon_Img.Visible = false

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Name = "Label"
		TextLabel.Parent = Notification_Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.Position = UDim2.new(0.385, 0, 0.325, 0)
		TextLabel.Size = UDim2.new(0, 200, 0, 30)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
		TextLabel.Text = tostring(text1)
		TextLabel.TextSize = 16
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Visible = false

		local TextLabel_1 = Instance.new("TextLabel")
		TextLabel_1.Name = "Label"
		TextLabel_1.Parent = Notification_Frame
		TextLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_1.BackgroundTransparency = 1
		TextLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_1.Position = UDim2.new(0.385, 0, 0.625, 0)
		TextLabel_1.Size = UDim2.new(0, 200, 0, 30)
		TextLabel_1.Font = Enum.Font.GothamMedium
		TextLabel_1.TextColor3 = Color3.fromRGB(115, 125, 155)
		TextLabel_1.Text = tostring(text2)
		TextLabel_1.TextSize = 14
		TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_1.Visible = false

		-- Open
		TweenService:Create(
			Notification_Frame,
			TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 295, 0, 70)}
		):Play() wait(0.75)
		TweenService:Create(
			TextLabel,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = true}
		):Play()
		TweenService:Create(
			TextLabel_1,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = true}
		):Play()
		TweenService:Create(
			Icon_Img,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = true}
		):Play()
		-- Close

		wait(delays)

		TweenService:Create(
			Icon_Img,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = false}
		):Play()
		TweenService:Create(
			TextLabel,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = false}
		):Play()
		TweenService:Create(
			TextLabel_1,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = false}
		):Play()
		TweenService:Create(
			Notification_Frame,
			TweenInfo.new(1.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 0, 0, 70)}
		):Play() wait(0.75)
		TweenService:Create(
			Notification_Frame1,
			TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
			{Visible = false}
		):Play()
		Notification_Frame:Destroy()

		Notification_Frame.MouseEnter:connect(function()
			TweenService:Create(
				TextLabel_1,
				TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{TextColor3 = Color3.fromRGB(210,210,210)}
			):Play()
		end)
		Notification_Frame.MouseLeave:connect(function()
			TweenService:Create(
				TextLabel_1,
				TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
				{TextColor3 = Color3.fromRGB(115, 125, 155)}
			):Play()
		end)
		end
------------------------

			return Items
		end
		return Page
	end
    return Tab
end
return Create
--[[
Test function
local win = Create:CreateWindow(nil)
local tab = win:CreateTab('Tab1',nil)
local tab2 = win:CreateTab('Tab2',nil)
local sec1 = tab:CreateSector('Sec1','Left')
sec1:AddToggle('Toggle1',true,function()

end)
local sec2 = tab:CreateSector('Sec2','Right')
sec2:AddToggle('Toggle2',false,function()

end)

local sec3 = tab2:CreateSector('Sec3','Left')
sec3:AddToggle('Toggle4',false,function()

end)
local sec4 = tab2:CreateSector('Sec4','Right')
sec4:AddToggle('Toggle4',true,function()

end) ]]
------------------------