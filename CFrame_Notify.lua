local Gui = game:GetService("Players").LocalPlayer.PlayerGui;
local Function = {}
if not Gui:FindFirstChild('CFrame_Notify') then
    getgenv().ScreenUi = Instance.new('ScreenGui',Gui)
    ScreenUi.Name = 'CFrame_Notify'
end

if not Gui:FindFirstChild('CFrame_Notify'):FindFirstChild('CFrame_Frame') then
    getgenv().Frame = Instance.new('Frame',ScreenUi)
    Frame.Name = 'CFrame_Frame'
    Frame.Size = UDim2.new(1,0,1,0)
    Frame.BackgroundTransparency = 1
end

if not Gui:FindFirstChild('CFrame_Notify'):FindFirstChild('CFrame_Frame'):FindFirstChild('UIListLayout') then
    getgenv().UiList = Instance.new('UIListLayout',Frame)
    UiList.HorizontalAlignment = 'Center'
    UiList.VerticalAlignment = 'Top'
    UiList.UiList = 'LayoutOrder'
end

function Function:newText(P)
    local Text = Instance.new('TextLabel',Frame)
    local Stroke = Instance.new('UIStroke',Text)
	Text.Name = tostring(CurrentText)
    Text.Size = UDim2.new(0,0,0,35)
    Text.BackgroundTransparency = 1
    Text.TextSize = 30
    Text.Font = 'SourceSansBold'
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)
	Text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	Text.TextStrokeTransparency = 0
    Text.Text = tostring(P)
    Stroke.Thickness = 2
	task.wait(3)
    Text:Destroy()
end
return Function
