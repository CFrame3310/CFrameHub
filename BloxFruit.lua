loadstring(game:HttpGet("https://raw.githubusercontent.com/CFrame3310/CFrameHub/main/HelloWorld.lua"))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/naypramx/Ui__Project/Script/XeNonUi", true))()
local Win = library:CreateWindow("CFrame Hub | Blox Fruit",Enum.KeyCode.RightControl)
--game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Buso")
local Main = Win:CreateTab("Main")
local Player = Win:CreateTab("Player")

local AutoFarm = Main:CreateSector("Auto Farm","Left")
local SelectSection = Main:CreateSector("Select Weapon","Right")
local Settings = Main:CreateSector("Settings","Right")

local Autostats = Player:CreateSector("Auto Stats","Left")

Weapon = {}
Fruit= {"Bomb-Bomb","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Smoke-Smoke","Spin-Spin","Flame-Flame","Brid-Bird: Falcon","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Diamond-Diamond","Light-Light","Love-Love","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Door-Door","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Shadow-Shadow","Venom-Venom","Control-Control","Soul-Soul","Dragon-Dragon"}
Melee = {"Combat","Black Leg","Electro","Fishman Karate","Dragon Claw","Superhuman","Death Step","Sharkman Karate","Dragon Talon"}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weapon,v.Name)
end

AutoFarm:AddToggle("Auto Farm",false,function(t)
    _G.AutoFarm = t
end)

AutoFarm:AddToggle("Auto Superhuman",false,function(t)
    _G.AutoSuperhuman = t
end)

local SelectWeapon = SelectSection:AddDropdown("Select Weapon",Weapon,"",false,function(t)
    _G.SelectWeapon = t
end)

SelectSection:AddButton("Refresh Weapon",function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        for x,y in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Container.Stored.ScrollingFrame.Frame:GetChildren()) do
            for o,p in pairs(Fruit) do
                for n,m in pairs(Melee) do
                    SelectWeapon:Remove(m)
                    SelectWeapon:Remove(p)
                    SelectWeapon:Remove(v.Name)
                    SelectWeapon:Remove(y.Name)
                end
            end
        end
        SelectWeapon:Add(v.Name)
    end
end)

Settings:AddToggle("Auto Equip",true,function(t)
    _G.AutoEquip = t
end)

Settings:AddToggle("Auto Buso",true,function(t)
    _G.AutoBuso = t
end)

Settings:AddToggle("Auto Set Spawn",true,function(t)
    _G.AutoSetSpawn = t
end)

Settings:AddToggle("Auto Attack",true,function(t)
    _G.AutoAttack = t
end)

Settings:AddToggle("Fast Attack",true,function(t)
    _G.FastAttack = t
end)

Settings:AddToggle("Bring Mob",true,function(t)
    _G.BringMob = t
end)



Autostats:AddToggle("Auto Melee",false,function(t)
    _G.Melee = t
end)

Autostats:AddToggle("Auto Defense",false,function(t)
    _G.Def = t
end)
Autostats:AddToggle("Auto Sword",false,function(t)
    _G.Sword = t
end)
Autostats:AddToggle("Auto Gun",false,function(t)
    _G.Gun = t
end)
Autostats:AddToggle("Auto Blox Fruit",false,function(t)
    _G.BF = t
end)


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoSuperhuman then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                wait()
                _G.SelectWeapon = "Black Leg"
                if game:GetService("Players").LocalPlayer.Characters["Black Leg"].Level.Value >= 300 or game:GetService("Players").LocalPlayer.Backpack["Black Leg"].Level.Value >= 300 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                    wait()
                    _G.SelectWeapon = "Electro"
                end
            end
        end)
    end
end)

function CheckQuest() 
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Level == 1 or Level <= 9 then
        Mon = "Bandit [Lv. 5]"
        LQuest = 1
        NQuest = "BanditQuest1"
        NameMon = "Bandit"
        CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
    elseif Level == 10 or Level <= 14 then
        Mon = "Monkey [Lv. 14]"
        LQuest = 1
        NQuest = "JungleQuest"
        NameMon = "Monkey"
        CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    elseif Level == 15 or Level <= 29 then
        Mon = "Gorilla [Lv. 20]"
        LQuest = 2
        NQuest = "JungleQuest"
        NameMon = "Gorilla"
        CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    elseif Level == 30 or Level <= 39 then
        Mon = "Pirate [Lv. 35]"
        LQuest = 1
        NQuest = "BuggyQuest1"
        NameMon = "Pirate"
        CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
    elseif Level == 40 or Level <= 59 then
        Mon = "Brute [Lv. 45]"
        LQuest = 2
        NQuest = "BuggyQuest1"
        NameMon = "Brute"
        CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
    elseif Level == 60 or Level <= 74 then
        Mon = "Desert Bandit [Lv. 60]"
        LQuest = 1
        NQuest = "DesertQuest"
        NameMon = "Desert Bandit"
        CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
    elseif Level == 75 or Level <= 89 then
        Mon = "Desert Officer [Lv. 70]"
        LQuest = 2
        NQuest = "DesertQuest"
        NameMon = "Desert Officer"
        CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
    elseif Level == 90 or Level <= 99 then
        Mon = "Snow Bandit [Lv. 90]"
        LQuest = 1
        NQuest = "SnowQuest"
        NameMon = "Snow Bandit"
        CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
    elseif Level == 100 or Level <= 119 then
        Mon = "Snowman [Lv. 100]"
        LQuest = 2
        NQuest = "SnowQuest"
        NameMon = "Snowman"
        CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
    elseif Level == 120 or Level <= 149 then
        Mon = "Chief Petty Officer [Lv. 120]"
        LQuest = 1
        NQuest = "MarineQuest2"
        NameMon = "Chief Petty Officer"
        CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif Level == 150 or Level <= 174 then
        Mon = "Sky Bandit [Lv. 150]"
        LQuest = 1
        NQuest = "SkyQuest"
        NameMon = "Sky Bandit"
        CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
    elseif Level == 175 or Level <= 189 then
        Mon = "Dark Master [Lv. 175]"
        LQuest = 2
        NQuest = "SkyQuest"
        NameMon = "Dark Master"
        CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
    elseif Level == 190 or Level <= 209 then
        Mon = "Prisoner [Lv. 190]"
        LQuest = 1
        NQuest = "PrisonerQuest"
        NameMon = "Prisoner"
        CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
    elseif Level == 210 or Level <= 249 then
        Mon = "Dangerous Prisoner [Lv. 210]"
        LQuest = 2
        NQuest = "PrisonerQuest"
        NameMon = "Dangerous Prisoner"
        CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
    elseif Level == 250 or Level <= 274 then
        Mon = "Toga Warrior [Lv. 250]"
        LQuest = 1
        NQuest = "ColosseumQuest"
        NameMon = "Toga Warrior"
        CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
    elseif Level == 275 or Level <= 299 then
        Mon = "Gladiator [Lv. 275]"
        LQuest = 2
        NQuest = "ColosseumQuest"
        NameMon = "Gladiator"
        CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
    elseif Level == 300 or Level <= 324 then
        Mon = "Military Soldier [Lv. 300]"
        LQuest = 1
        NQuest = "MagmaQuest"
        NameMon = "Military Soldier"
        CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
    elseif Level == 325 or Level <= 449 then
        Mon = "Military Spy [Lv. 325]"
        LQuest = 2
        NQuest = "MagmaQuest"
        NameMon = "Military Spy"
        CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
    elseif Level == 450 or Level <= 474 then
        Mon = "God's Guard [Lv. 450]"
        LQuest = 1
        NQuest = "SkyExp1Quest"
        NameMon = "God's Guard"
        CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
    elseif Level == 475 or Level <= 524 then
        Mon = "Shanda [Lv. 475]"
        LQuest = 2
        NQuest = "SkyExp1Quest"
        NameMon = "Shanda"
        CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
    elseif Level == 525 or Level <= 549 then
        Mon = "Royal Squad [Lv. 525]"
        LQuest = 1
        NQuest = "SkyExp2Quest"
        NameMon = "Royal Squad"
        CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif Level == 550 or Level <= 624 then
        Mon = "Royal Soldier [Lv. 550]"
        LQuest = 2
        NQuest = "SkyExp2Quest"
        NameMon = "Royal Soldier"
        CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
    elseif Level == 625 or Level <= 649 then
        Mon = "Galley Pirate [Lv. 625]"
        LQuest = 1
        NQuest = "FountainQuest"
        NameMon = "Galley Pirate"
        CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
    elseif Level >= 650 then
        Mon = "Galley Captain [Lv. 650]"
        LQuest = 2
        NQuest = "FountainQuest"
        NameMon = "Galley Captain"
        CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
    end
end

spawn(function()
while wait() do
    if _G.AutoEquip then
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(_G.SelectWeapon))
    end)
    end
end
end)

function Tween(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 300
    elseif Dis >= 100 then
        Speed = 200
    end

    function DoAfter()
       game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true

    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Quad),{CFrame = P1})
    tween:Play()
    tween.Completed:Connect(DoAfter)
end
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm then
                CheckQuest()
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == Mon then
                            if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -  v.HumanoidRootPart.Position).Magnitude <= 500 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(20,0,0)
                                else 
                                    Tween(v.HumanoidRootPart.CFrame)
                                end
                            end
                        end
                    end
                else
                    Tween(CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -  CFrameQuest.Position).Magnitude <= 20 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NQuest,LQuest)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSetSpawn then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
            end
        end)
    end
end)

local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
spawn(function() --Fast Attack
while wait() do
    if _G.FastAttack then
    pcall(function()
        CamShake:Stop()
        CombatFramework.activeController.attacking = false
        CombatFramework.activeController.timeToNextAttack = 0
        CombatFramework.activeController.increment = 3
        CombatFramework.activeController.hitboxMagnitude = 100
        CombatFramework.activeController.blocking = false
        CombatFramework.activeController.timeToNextBlock = 0
        CombatFramework.activeController.focusStart = 0
    end)
    end
    task.wait()
end
end)

spawn(function()
while wait() do
    pcall(function()
    if _G.BringMob then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
        for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == y.Name then
                v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                y.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                v.HumanoidRootPart.Transparency = 0.5
                y.HumanoidRootPart.Transparency = 0.5
                v.Humanoid.WalkSpeed = 0
                y.Humanoid.WalkSpeed = 0
                v.Humanoid.JumpPower = 0
                y.Humanoid.JumpPower = 0
                if sethiddenproperty then
                    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                end
            end
        end
        end
    end
    end)
end
end)

spawn(function() -- Auto Attack
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AutoAttack then
    pcall(function()
        game:GetService'VirtualUser':CaptureController()
        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
    end)
    end
end) 
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoBuso then
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Melee then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",1)
            end
            if _G.Def then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",1)
            end
            if _G.Sword then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Sword",1)
            end
            if _G.Gun then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Gun",1)
            end
            if _G.BF then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Blox Fruit",1)
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
        end)
    end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
