repeat
    wait()
until game:IsLoaded()
print("Game is loaded")

local function SaveSet()
    local JSON
    local HttpService = game:service('HttpService')
    JSON = HttpService:JSONEncode(getgenv().Config)
    writefile('CFrame_Hub_Save_Setting.lua',JSON)
end

local function LoadSet()
    local HttpService = game:service('HttpService')
    if isfile('CFrame_Hub_Save_Setting.lua') then
        getgenv().Config = HttpService:JSONDecode(readfile('CFrame_Hub_Save_Setting.lua'))
    end
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/CFrame3310/CFrameHub/main/HelloWorld.lua"))()
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/naypramx/Ui__Project/Script/XeNonUi",true))()
local Win = library:CreateWindow("CFrame Hub | Blox Fruit",Enum.KeyCode.RightControl)
local Main = Win:CreateTab("Main")
local Player = Win:CreateTab("Player")
local Dungeon = Win:CreateTab("Dungeon")
local ShopMain = Win:CreateTab("Shop")
local Mise = Win:CreateTab("Mise.")

local AutoFarm = Main:CreateSector("Auto Farm","Left")
local SelectSection = Main:CreateSector("Select Weapon","Right")
local Settings = Main:CreateSector("Property","Right")

local Autostats = Player:CreateSector("Auto Stats","Left")
local Lock = Player:CreateSector("Lock","Right")
local StockFruit = Player:CreateSector("Store Fruit","Right")

local Raid = Dungeon:CreateSector("Auto Dungeon","Left")
local RaidProperty = Dungeon:CreateSector("Dungeon Property","Right")

local Shop = ShopMain:CreateSector("Shop","Left")
local BuyMelee = ShopMain:CreateSector("Melee","Left")
local Haki = ShopMain:CreateSector("Haki","Right")

local Abilities = Mise:CreateSector("Abilities","Right")


local UIS = game:GetService("UserInputService")
local Mouse = game.Players.LocalPlayer:GetMouse()

Weapon = {}
Fruit= {"Bomb-Bomb","Spike-Spike","Chop-Chop","Spring-Spring","Kilo-Kilo","Smoke-Smoke","Spin-Spin","Flame-Flame","Brid-Bird: Falcon","Ice-Ice","Sand-Sand","Dark-Dark","Revive-Revive","Diamond-Diamond","Light-Light","Love-Love","Rubber-Rubber","Barrier-Barrier","Magma-Magma","Door-Door","Quake-Quake","Human-Human: Buddha","String-String","Bird-Bird: Phoenix","Rumble-Rumble","Paw-Paw","Gravity-Gravity","Dough-Dough","Shadow-Shadow","Venom-Venom","Control-Control","Soul-Soul","Dragon-Dragon"}
Melee = {"Combat","Black Leg","Electro","Fishman Karate","Dragon Claw","Superhuman","Death Step","Electric Claw","Sharkman Karate","Dragon Talon"}
Chip = {"Flame","Ice","Quake","Light","Dark","String","Rumble","Magma","Human: Buddha","Sand","Bird: Phoenix"}
BoneMob = {"Reborn Skeleton [Lv. 1975]","Living Zombie [Lv. 2000]","Demonic Soul [Lv. 2025]","Posessed Mummy [Lv. 2050]"}

function MeleeBuy(N1,N2,N3,N4)
    BuyMelee:AddButton(N1,function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(N2,N3,N4)
    end)
end

for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weapon,v.Name)
end
for x,y in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if y:IsA("Tool")then
        table.insert(Weapon,y.Name)
    end
end

AutoFarm:AddSeperator("Main")

AutoFarm:AddToggle("Auto Farm",_G.AutoFarm,function(t)
    _G.AutoFarm = t
end)

AutoFarm:AddToggle("Auto Superhuman",_G.AutoSuperhuman,function(t)
    _G.AutoSuperhuman = t
end)

AutoFarm:AddSeperator("Sea 1")

AutoFarm:AddToggle("Auto Saber",_G.AutoSaber,function(t)
    _G.AutoSaber = t
end)

AutoFarm:AddToggle("Auto Sea 2",_G.AutoSea2,function(t)
    _G.AutoSea2 = t
end)

AutoFarm:AddSeperator("Sea 2")

AutoFarm:AddToggle("Auto Bartilo",_G.AutoBartilo,function(t)
    _G.AutoBartilo = t
end)

AutoFarm:AddToggle("Auto Race V2",_G.AutoBartilo,function(t)
    _G.AutoRaceV2 = t
end)

AutoFarm:AddSeperator("Sea 3")

AutoFarm:AddToggle("Auto Farm Bone",_G.AutoBartilo,function(t)
    _G.AutoFarmBone = t
end)

local SelectWeapon = SelectSection:AddDropdown("Select Weapon",Weapon,_G.SelectWeapon,false,function(t)
    _G.SelectWeapon = t
end)

SelectSection:AddButton("Refresh Weapon",function()
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Inventory.Container.Stored.ScrollingFrame.Frame:GetChildren()) do
        SelectWeapon:Remove(v.Name)
    end
    for i,v in pairs(Fruit) do
        SelectWeapon:Remove(v)
    end
    for i,v in pairs(Melee) do
        SelectWeapon:Remove(v)
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        SelectWeapon:Remove(v.Name)
        wait(.1)
        SelectWeapon:Add(v.Name)
    end
end)

Settings:AddToggle("Auto Equip",true,function(t)
    _G.AutoEquip = t
end)

Settings:AddToggle("Auto Buso",true,function(t)
    _G.AutoBuso = t
end)
Settings:AddToggle("Auto Ken",true,function(t)
    _G.AutoKen = t 
end)
Settings:AddToggle("Auto Set Spawn",true,function(t)
    _G.AutoSetSpawn = t
end)

Settings:AddToggle("Fast Attack",true,function(t)
    _G.FastAttack = t
end)

Settings:AddToggle("Bring Mob",true,function(t)
    _G.BringMob = t
end)

Autostats:AddToggle("Auto Melee",_G.Melee,function(t)
    _G.Melee = t
end)

Autostats:AddToggle("Auto Defense",_G.Def,function(t)
    _G.Def = t
end)
Autostats:AddToggle("Auto Sword",_G.Sword,function(t)
    _G.Sword = t
end)
Autostats:AddToggle("Auto Gun",_G.Gun,function(t)
    _G.Gun = t
end)
Autostats:AddToggle("Auto Blox Fruit",_G.BF,function(t)
    _G.BF = t
end)

Lock:AddToggle("Lock Beli",_G.LockBeli,function(t)
    _G.LockBeli = t
end)
Lock:AddTextbox("Lock Beli Value",_G.BeliValue,function(t)
    _G.BeliValue = tonumber(t)
end)

Lock:AddToggle("Lock Fragment",_G.LockFragment,function(t)
    _G.LockFragment = t
end)
Lock:AddTextbox("Lock Fragment Value",_G.FragmentValue,function(t)
    _G.FragmentValue = tonumber(t)
end)

Lock:AddToggle("Lock Level",_G.LockLevel,function(t)
    _G.LockLevel = t
end)
Lock:AddTextbox("Lock Level Value",_G.LevelValue,function(t)
    _G.LevelValue = tonumber(t)
end)

StockFruit:AddToggle("Store Fruit",_G.StoreFruit,function(t)
    _G.StoreFruit = t
end)


Raid:AddToggle("Auto Raid",_G.AutoRaid,function(t)
    _G.AutoRaid = t
end)

local RaidsChip = RaidProperty:AddDropdown("Select Raid Chip",Chip,_G.DunChip,false,function(t)
    _G.DunChip = t
end)
RaidProperty:AddToggle("Auto Buy Chip",_G.BuyChip,function(t)
    _G.BuyChip = t
end)
RaidProperty:AddToggle("Auto Next Island",_G.AutoNextIsland,function(t)
    _G.AutoNextIsland = t
end)
RaidProperty:AddToggle("Kill Aura",_G.Killaura,function(t)
    _G.Killaura = t
end)

Shop:AddToggle("Auto Random Fruit",_G.AutoRandom,function(t)
    _G.AutoRandom = t
end)
Shop:AddButton("Random Fruit",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin" , "Buy")
end)

MeleeBuy("Black Leg","BuyBlackLeg")
MeleeBuy("Electro","BuyElectro")
MeleeBuy("Fishman Karate","BuyFishmanKarate")
MeleeBuy("Dragon Claw","BlackbeardReward","DragonClaw","2")
MeleeBuy("Superhuman","BuySuperhuman")
MeleeBuy("Death Step","BuyDeathStep")
MeleeBuy("Sharkman Karate","BuySharkmanKarate")
MeleeBuy("Electric Claw","BuyElectricClaw")
MeleeBuy("Dragon Talon","BuyDragonTalon")

Haki:AddButton("Buy Geppo",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Geppo")
end)

Haki:AddButton("Buy Buso",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Buso")
end)

Haki:AddButton("Buy Soru",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki" , "Soru")
end)
Haki:AddButton("Buy Ken",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
end)

Abilities:AddToggle("Tween to mouse",false,function(t)
    _G.TweenMouse = t
end)
Abilities:AddToggle("Players ESP",false,function(t)
    _G.PlyEsp = t
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSuperhuman then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
                    _G.SelectWeapon = "Combat"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") then
                    _G.SelectWeapon = "Black Leg"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") then
                    _G.SelectWeapon = "Electro"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") then
                    _G.SelectWeapon = "Fishman Karate"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") then
                    _G.SelectWeapon = "Dragon Claw"
                elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                    _G.SelectWeapon = "Superhuman"
                end
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                for x,y in pairs(Melee) do
                    if v.Name == y then
                        if v:FindFirstChild("Level") then
                            if v.Name == Melee[1] then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                            end
                            if v.Name == Melee[2] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                                end
                            elseif v.Name == Melee[3] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                                end
                            elseif v.Name == Melee[4] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                                end
                            elseif v.Name == Melee[5] then
                                if v.Level.Value >= 300 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                                end
                            end
                        end
                    end
                end
                end
            end
        end)
    end
end)


function CheckQuest()
    local Id = game.PlaceId
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Id == 2753915549 then
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
    elseif Id == 4442272183 then
        if Level == 700 or Level <= 724 then
            Mon = "Raider [Lv. 700]"
            LQuest = 1
            NQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        elseif Level == 725 or Level <= 774 then
            Mon = "Mercenary [Lv. 725]"
            LQuest = 2
            NQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
        elseif Level == 775 or Level <= 799 then
            Mon = "Swan Pirate [Lv. 775]"
            LQuest = 1
            NQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
        elseif Level == 800 or Level <= 874 then
            Mon = "Factory Staff [Lv. 800]"
            NQuest = "Area2Quest"
            LQuest = 2
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        elseif Level == 875 or Level <= 899 then
            Mon = "Marine Lieutenant [Lv. 875]"
            LQuest = 1
            NQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 900 or Level <= 949 then
            Mon = "Marine Captain [Lv. 900]"
            LQuest = 2
            NQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
        elseif Level == 950 or Level <= 974 then
            Mon = "Zombie [Lv. 950]"
            LQuest = 1
            NQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        elseif Level == 975 or Level <= 999 then
            Mon = "Vampire [Lv. 975]"
            LQuest = 2
            NQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
        elseif Level == 1000 or Level <= 1049 then
            Mon = "Snow Trooper [Lv. 1000]"
            LQuest = 1
            NQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        elseif Level == 1050 or Level <= 1099 then
            Mon = "Winter Warrior [Lv. 1050]"
            LQuest = 2
            NQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
        elseif Level == 1100 or Level <= 1124 then
            Mon = "Lab Subordinate [Lv. 1100]"
            LQuest = 1
            NQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        elseif Level == 1125 or Level <= 1174 then
            Mon = "Horned Warrior [Lv. 1125]"
            LQuest = 2
            NQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
        elseif Level == 1175 or Level <= 1199 then
            Mon = "Magma Ninja [Lv. 1175]"
            LQuest = 1
            NQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        elseif Level == 1200 or Level <= 1249 then
            Mon = "Lava Pirate [Lv. 1200]"
            LQuest = 2
            NQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
        elseif Level == 1250 or Level <= 1274 then
            Mon = "Ship Deckhand [Lv. 1250]"
            LQuest = 1
            NQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)         
        elseif Level == 1275 or Level <= 1299 then
            Mon = "Ship Engineer [Lv. 1275]"
            LQuest = 2
            NQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
        elseif Level == 1300 or Level <= 1324 then
            Mon = "Ship Steward [Lv. 1300]"
            LQuest = 1
            NQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
        elseif Level == 1325 or Level <= 1349 then
            Mon = "Ship Officer [Lv. 1325]"
            LQuest = 2
            NQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
        elseif Level == 1350 or Level <= 1374 then
            Mon = "Arctic Warrior [Lv. 1350]"
            LQuest = 1
            NQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        elseif Level == 1375 or Level <= 1424 then
            Mon = "Snow Lurker [Lv. 1375]"
            LQuest = 2
            NQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
        elseif Level == 1425 or Level <= 1449 then
            Mon = "Sea Soldier [Lv. 1425]"
            LQuest = 1
            NQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        elseif Level >= 1450 then
            Mon = "Water Fighter [Lv. 1450]"
            LQuest = 2
            NQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
        end
    elseif Id == 7449423635 then
        if Level == 1500 or Level <= 1524 then
            Mon = "Pirate Millionaire [Lv. 1500]"
            LQuest = 1
            NQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 1525 or Level <= 1574 then
            Mon = "Pistol Billionaire [Lv. 1525]"
            LQuest = 2
            NQuest = "PiratePortQuest"
            NameMon = "Pistol Billionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
        elseif Level == 1575 or Level <= 1599 then
            Mon = "Dragon Crew Warrior [Lv. 1575]"
            LQuest = 1
            NQuest = "AmazonQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
        elseif Level == 1600 or Level <= 1624 then 
            Mon = "Dragon Crew Archer [Lv. 1600]"
            NQuest = "AmazonQuest"
            LQuest = 2
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
        elseif Level == 1625 or Level <= 1649 then
            Mon = "Female Islander [Lv. 1625]"
            NQuest = "AmazonQuest2"
            LQuest = 1
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        elseif Level == 1650 or Level <= 1699 then 
            Mon = "Giant Islander [Lv. 1650]"
            NQuest = "AmazonQuest2"
            LQuest = 2
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
        elseif Level == 1700 or Level <= 1724 then
            Mon = "Marine Commodore [Lv. 1700]"
            LQuest = 1
            NQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
        elseif Level == 1725 or Level <= 1774 then
            Mon = "Marine Rear Admiral [Lv. 1725]"
            NameMon = "Marine Rear Admiral"
            NQuest = "MarineTreeIsland"
            LQuest = 2
            CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
        elseif Level == 1775 or Level <= 1799 then
            Mon = "Fishman Raider [Lv. 1775]"
            LQuest = 1
            NQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        elseif Level == 1800 or Level <= 1824 then
            Mon = "Fishman Captain [Lv. 1800]"
            LQuest = 2
            NQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)   
        elseif Level == 1825 or Level <= 1849 then
            Mon = "Forest Pirate [Lv. 1825]"
            LQuest = 1
            NQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
        elseif Level == 1850 or Level <= 1899 then
            Mon = "Mythological Pirate [Lv. 1850]"
            LQuest = 2
            NQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)   
        elseif Level == 1900 or Level <= 1924 then
            Mon = "Jungle Pirate [Lv. 1900]"
            LQuest = 1
            NQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        elseif Level == 1925 or Level <= 1974 then
            Mon = "Musketeer Pirate [Lv. 1925]"
            LQuest = 2
            NQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
        elseif Level == 1975 or Level <= 1999 then
            Mon = "Reborn Skeleton [Lv. 1975]"
            LQuest = 1
            NQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 2000 or Level <= 2024 then
            Mon = "Living Zombie [Lv. 2000]"
            LQuest = 2
            NQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif Level == 2025 or Level <= 2049 then
            Mon = "Demonic Soul [Lv. 2025]"
            LQuest = 1
            NQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0) 
        elseif Level == 2050 or Level <= 2074 then
            Mon = "Posessed Mummy [Lv. 2050]"
            LQuest = 2
            NQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2075 or Level <= 2099 then
            Mon = "Peanut Scout [Lv. 2075]"
            LQuest = 1
            NQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2100 or Level <= 2124 then
            Mon = "Peanut President [Lv. 2100]"
            LQuest = 2
            NQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2125 or Level <= 2149 then
            Mon = "Ice Cream Chef [Lv. 2125]"
            LQuest = 1
            NQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2150 or Level <= 2199 then
            Mon = "Ice Cream Commander [Lv. 2150]"
            LQuest = 2
            NQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        elseif Level == 2200 or Level <= 2224 then
            Mon = "Cookie Crafter [Lv. 2200]"
            LQuest = 1
            NQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        elseif Level == 2225 or Level <= 2249 then
            Mon = "Cake Guard [Lv. 2225]"
            LQuest = 2
            NQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
        elseif Level == 2250 or Level <= 2274 then
            Mon = "Baking Staff [Lv. 2250]"
            LQuest = 1
            NQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        elseif Level >= 2275  then
            Mon = "Head Baker [Lv. 2275]"
            LQuest = 2
            NQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
        end
    end
end

spawn(function()
    while task.wait() do
        if _G.BringMob and _G.AutoBartilo or _G.AutoFarmBone then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == y.Name then
                        v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                        v.HumanoidRootPart.CanCollide = false
                        y.HumanoidRootPart.CanCollide = false
                        v.Humanoid.WalkSpeed = 0
                        y.Humanoid.WalkSpeed = 0
                        v.Humanoid:ChangeState(2)
                        y.Humanoid:ChangeState(2)
                        v.Humanoid.JumpPower = 0
                        y.Humanoid.JumpPower = 0
                        if sethiddenproperty then
                            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                        end
                    end
                end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.BringMob and _G.AutoFarm then
            pcall(function()
                CheckQuest()
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                for x,y in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == Mon and y.Name == Mon then
                        v.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                        v.HumanoidRootPart.CanCollide = false
                        y.HumanoidRootPart.CanCollide = false
                        v.Humanoid.WalkSpeed = 0
                        y.Humanoid.WalkSpeed = 0
                        v.Humanoid:ChangeState(2)
                        y.Humanoid:ChangeState(2)
                        v.Humanoid.JumpPower = 0
                        y.Humanoid.JumpPower = 0
                        if sethiddenproperty then
                            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                        end
                    end
                end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.AutoFarm or _G.AutoBartilo or _G.AutoFarmBone or _G.AutoSez2 or _G.AutoRaceV2 then
            pcall(function()
                local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
                local CombatFramework = debug.getupvalues(Module)[2]
                local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
                CamShake:Stop()
                CombatFramework.activeController.attacking = false
                CombatFramework.activeController.hitboxMagnitude = 100
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            end)
        end
    end
end)


function EquipTool(Tool)
    if _G.AutoEquip then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(Tool))
        end)
    end
end

function Tween(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 300
    elseif Dis >= 100 then
        Speed = 200
    end
    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Linear),{CFrame = P1})
    tween:Play()
end

function MouseTween(P1)
    local Dis = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Dis < 1000 then
        Speed = 300
    elseif Dis >= 100 then
        Speed = 200
    end
    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        local Noclip = Instance.new("BodyVelocity")
        Noclip.Name = "BodyClip"
        Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        Noclip.MaxForce = Vector3.new(100000,100000,100000)
        Noclip.Velocity = Vector3.new(0,0,0)
    end
    local tween = game:GetService("TweenService"):Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,TweenInfo.new(Dis/Speed,Enum.EasingStyle.Linear),{CFrame = P1})
    tween:Play()
    if tween.Completed then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
    else
        return
    end
end

function TP(Point)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Point
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
                            if v:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 400 then
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        EquipTool(_G.SelectWeapon)
                                    else
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    end
                                until not _G.AutoFarm or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                    for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                        if y.Name == Mon then
                            if y:FindFirstChild("HumanoidRootPart") then
                                repeat task.wait()
                                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 400 then
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    else
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    end
                                until not _G.AutoFarm or not y.Parent or y.Humanoid.Health <= 0
                            end
                        end
                    end
                else
                    Tween(CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
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
            if _G.AutoBartilo then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledBandits == false then
                    if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Swan Pirates") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Swan Pirate [Lv. 775]" then
                                repeat task.wait()
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        Attack()
                                        EquipTool(_G.SelectWeapon)
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Swan Pirate [Lv. 775]" then
                                repeat task.wait()
                                    if y:FindFirstChild("HumanoidRootPart") then
                                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - y.HumanoidRootPart.Position).Magnitude >= 100 then
                                            Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        end
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                    else
                        Tween(CFrame.new(-461.06024169921875, 73.02008056640625, 300.6614074707031))
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(-461.06024169921875, 73.02008056640625, 300.6614074707031).Position).Magnitude <= 20 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest","BartiloQuest",1)
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledBandits == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Jeremy [Lv. 850] [Boss]" then
                                repeat task.wait()
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        EquipTool(_G.SelectWeapon)
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Jeremy [Lv. 850] [Boss]" then
                                repeat task.wait()
                                    if y:FindFirstChild("HumanoidRootPart") then
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    end
                                until not _G.AutoBartilo
                            end
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").KilledSpring == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress").DidPlates == false then
                        local Plates = game:GetService("Workspace").Map.Dressrosa.BartiloPlates
                        if Plates:FindFirstChild("Plate1").BrickColor ~= BrickColor.new("Olivine") then
                            Tween(Plates:FindFirstChild("Plate1").CFrame)
                        elseif Plates:FindFirstChild("Plate2").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate2").CFrame)
                        elseif Plates:FindFirstChild("Plate3").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate3").CFrame)
                        elseif Plates:FindFirstChild("Plate4").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate4").CFrame)
                        elseif Plates:FindFirstChild("Plate5").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate5").CFrame)
                        elseif Plates:FindFirstChild("Plate6").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate6").CFrame)
                        elseif Plates:FindFirstChild("Plate7").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate7").CFrame)
                        elseif Plates:FindFirstChild("Plate8").BrickColor ~= BrickColor.new("Olivine") then
                            TP(Plates:FindFirstChild("Plate8").CFrame)
                        end 
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRaceV2 then
                local Back = game.Players.LocalPlayer.Backpack
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","2")
                if not Back:FindFirstChild("Flower 2") then
                    Tween(game.Workspace["Flower2"].CFrame)
                end
                if not Back:FindFirstChild("Flower 1") and Back:FindFirstChild("Flower 2") then
                    Tween(game.Workspace["Flower1"].CFrame)
                end
                if not Back:FindFirstChild("Flower 3") and Back:FindFirstChild("Flower 1") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Zombie [Lv. 950]" then
                            repeat task.wait()
                                if v:FindFirstChild("HumanoidRootPart") then
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    EquipTool(_G.SelectWeapon)
                                end
                            until Back:FindFirstChild("Flower 3")
                        end
                    end
                    for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                        if y.Name == "Zombie [Lv. 950]" then
                            repeat task.wait()
                                if y:FindFirstChild("HumanoidRootPart") then
                                    Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                end
                            until Back:FindFirstChild("Flower 3")
                        end
                    end 
                end
                if Back:FindFirstChild("Flower 1") and Back:FindFirstChild("Flower 2") and Back:FindFirstChild("Flower 3") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
                end
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Flower1" or v.Name == "Flower2" then
                        v.Size = Vector3.new(20,20,20)
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSea2 then
                while task.wait() do
                    if _G.AutoSea2 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == false then
                            if not game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
                            end
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                                EquipTool("Key")
                                Tween(CFrame.new(1349.697265625, 37.34928512573242, -1328.8309326171875))
                                game:GetService("Workspace").Map.Ice.Door.Size = Vector3.new(30,30,30)
                            end
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").UsedKey == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == false then
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                    if v:FindFirstChild("HumanoidRootPart") then
                                        repeat task.wait()
                                            EquipTool(_G.SelectWeapon)
                                            Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        until not _G.AutoSea2
                                    end
                                end
                            end
                            for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                                if y.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                    if y:FindFirstChild("HumanoidRootPart") then
                                        repeat task.wait()
                                            Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        until not _G.AutoSea2
                                    end
                                end
                            end
                        end
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress").KilledIceBoss == true then
                            if game.PlaceId ~= 4442272183 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoSaber then
                if game.Players.LocalPlayer.Data.Level.Value >= 200 then
                    local QPlates = game:GetService("Workspace").Map.Jungle.QuestPlates
                    if QPlates["Plate1"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate1"].Button.CFrame)
                    elseif QPlates["Plate2"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate2"].Button.CFrame)
                    elseif QPlates["Plate3"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate3"].Button.CFrame)
                    elseif QPlates["Plate4"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate4"].Button.CFrame)
                    elseif QPlates["Plate5"].Button.BrickColor ~= BrickColor.new("Camo") then
                        Tween(QPlates["Plate5"].Button.CFrame)
                    end
                    if game:GetService("Workspace").Map.Jungle.QuestPlates.Door.CanCollide == false and game:GetService("Workspace").Map.Desert.Burn.Part.CanCollide == true then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            Tween(CFrame.new(-1610.025634765625, 12.177388191223145, 162.5987091064453))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            EquipTool("Torch")
                            game:GetService("Workspace").Map.Desert.Burn.Fire.Size = Vector3.new(10,10,10)
                            game:GetService("Workspace").Map.Desert.Burn.Fire.CanCollide = false
                            Tween(CFrame.new(1113.6805419921875, 5.046795845031738, 4349.96484375))
                        end
                    end
                    if game:GetService("Workspace").Map.Desert.Burn.Part.CanCollide == false and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                            Tween(CFrame.new(1113.9412841796875, 7.207527160644531, 4365.94921875))
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
                            EquipTool("Cup")
                            game:GetService("Workspace").Map.Ice.ParticleDrop.Water.Size = Vector3.new(40,40,40)
                            game:GetService("Workspace").Map.Ice.ParticleDrop.Water.Transparency = 0
                            Tween(CFrame.new(1397.471435546875, 37.47333908081055, -1321.564208984375))
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedCup == false then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                    end 
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").TalkedSon == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        EquipTool(_G.SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        v.HumanoidRootPart.Transparency = 0.5
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                        if sethiddenproperty then
                                            sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                        end
                                    until not _G.AutoSaber
                                end
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Mob Leader [Lv. 120] [Boss]" then
                                if y:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    until not _G.AutoSaber
                                end
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == false and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledMob == true then
                        if not game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon")
                            wait(.1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")
                        end
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                            EquipTool("Relic")
                            game:GetService("Workspace").Map.Jungle.Final.Invis.Size = Vector3.new(20,20,20)
                            game:GetService("Workspace").Map.Jungle.Final.Invis.CanCollide = false
                            Tween(CFrame.new(-1407.0384521484375, 29.977327346801758, 4.923530578613281))
                        end
                    end
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").UsedRelic == true and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress").KilledShanks == false then
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Humanoid") then
                                    repeat task.wait()
                                        EquipTool(_G.SelectWeapon)
                                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                        v.HumanoidRootPart.Transparency = 0.5
                                        v.Humanoid.WalkSpeed = 0
                                        v.Humanoid.JumpPower = 0
                                    until not _G.AutoSaber
                                    if sethiddenproperty then
                                        sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
                                    end
                                end
                            end
                        end
                        for x,y in pairs(game.ReplicatedStorage:GetChildren()) do
                            if y.Name == "Saber Expert [Lv. 200] [Boss]" then
                                if y:FindFirstChild("HumanoidRootPart") then
                                    repeat task.wait()
                                        Tween(y.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                    until not _G.AutoSaber
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarmBone then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                for x,y in pairs(BoneMob) do
                    if v.Name == y then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 400 then
                                    EquipTool(_G.SelectWeapon)
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                else
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                end
                            until not _G.AutoFarmBone or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
                end
                for i,v in pairs(game.ReplicatedStorage:GetChildren()) do
                for x,y in pairs(BoneMob) do
                    if v.Name == y then
                        if v:FindFirstChild("HumanoidRootPart") then
                            repeat task.wait()
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 400 then
                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                else
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                                end
                            until not _G.AutoFarmBone or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
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
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",true)
            else
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken",false)
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
        if _G.LockBeli and _G.BeliValue then
           pcall(function()
                if game.Players.LocalPlayer.Data.Beli.value >= _G.BeliValue then
                    game.Players.LocalPlayer:Kick("Lock Beli Kick")
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if _G.LockFragment and _G.FragmentValue then
            pcall(function()
                if game.Players.LocalPlayer.Data.Beli.value >= _G.FragmentValue then
                    game.Players.LocalPlayer:Kick("Lock Fragments Kick")
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        if _G.LockLevel and _G.LevelValue then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.value >= _G.LevelValue then
                    game.Players.LocalPlayer:Kick("Lock Level Kick")
                end
            end)
        end
    end
end)


spawn(function()
    while task.wait() do
        if _G.StoreFruit then
            pcall(function()
                for i,v in pairs(Fruit) do
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v)
                end
            end)
        end
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BuyChip then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",_G.DunChip)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Killaura then
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        pcall(function()
                            repeat task.wait()
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                v.Humanoid.Health = 0
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(100,100,100)
                                v.HumanoidRootPart.Transparency = 0.8
                            until not _G.Killaura or not v.Parent or v.Humanoid.Health <= 0
                        end)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRaid then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                    if not game.Workspace._WorldOrigin.Locations:FindFirstChild("Island 1") then
                        if game.PlaceId == 4442272183 then
                        	fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoNextIsland then
                if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    local Island = game.Workspace._WorldOrigin.Locations
                    if Island:FindFirstChild("Island 5") then
                        Tween(Island["Island 5"].CFrame * CFrame.new(0,35,0))
                    elseif Island:FindFirstChild("Island 4") then
                        Tween(Island["Island 4"].CFrame * CFrame.new(0,35,0))
                    elseif Island:FindFirstChild("Island 3") then
                        Tween(Island["Island 3"].CFrame * CFrame.new(0,35,0))
                    elseif Island:FindFirstChild("Island 2") then
                        Tween(Island["Island 2"].CFrame * CFrame.new(0,35,0))
                    elseif Island:FindFirstChild("Island 1") then
                        Tween(Island["Island 1"].CFrame * CFrame.new(0,35,0))
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoRandom then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin" , "Buy")
            end
        end)
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if _G.TweenMouse then
                UIS.InputBegan:Connect(function(input, process)
                    if not process then
                        if UIS:IsKeyDown(Enum.KeyCode.LeftAlt) and input.UserInputType == Enum.UserInputType.MouseButton1 then
                            MouseTween(CFrame.new(Mouse.Hit.p))
                        end
                    end
                end)
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        if _G.PlyEsp then
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        if not v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp") then
                            local BillboardGui = Instance.new("BillboardGui")
                            local TextLabel = Instance.new("TextLabel")
                            BillboardGui.Parent = v.Character.HumanoidRootPart
                            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            BillboardGui.Active = true
                            BillboardGui.Name = "PlayersEsp"
                            BillboardGui.AlwaysOnTop = true
                            BillboardGui.LightInfluence = 1.000
                            BillboardGui.Size = UDim2.new(0, 200, 0, 50)
                            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
                            TextLabel.Parent = BillboardGui
                            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.BackgroundTransparency = 1.000
                            TextLabel.Size = UDim2.new(0, 200, 0, 50)
                            TextLabel.Font = Enum.Font.GothamBold
                            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel.TextScaled = true
                            TextLabel.TextSize = 14.000
                            TextLabel.TextStrokeTransparency = 0.000
                            TextLabel.TextWrapped = true
                        end
                        local Dis = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude)
                        v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.Text = v.Name.."\n\n"..Dis.." m."
                        if v.Team == game.Players.LocalPlayer.Team then
                            v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 = Color3.new(255,0,0)
                        else
                            v.Character.HumanoidRootPart:FindFirstChild("PlayersEsp").TextLabel.TextStrokeColor3 = Color3.new(0,255,255)
                        end
                    end
                end
            end)
        end
    end
end)
local Module = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
local CamShake = require(game.ReplicatedStorage.Util.CameraShaker)
spawn(function()
while task.wait() do
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
    while task.wait() do
        pcall(function()
            for i,v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                if v:IsA("Part") or v:IsA("MeshPart") then
                    v:Destroy() 
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone or _G.AutoRaceV2 then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            else
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(18)
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone then
                for i,v in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.Main.Dialogue.Option1.MouseButton1Click)) do
                    v:Fire()
                end
            end
        end)
    end
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoFarm or _G.AutoNextIsland or _G.AutoSaber or _G.AutoSea2 or _G.AutoBartilo or _G.AutoFarmBone or _G.StoreFruit then
                for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Notifications:GetChildren()) do
                    v:Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") then
                    if v.Humanoid.Health <= 0 then
                        v.Parent = game.Workspace
                    end
                end
            end
        end)
    end
end)
pcall(function()
    while task.wait() do
        if _G.AutoRaceV2 then
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Flower1" or v.Name == "Flower2" then
                        v.Size = Vector3.new(20,20,20)
                        if v:FindFirstChild("Mesh") then
                            v.Mesh.Scale = Vector3.new(20,20,20)
                        end
                    end
                end
            end)
        end
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
