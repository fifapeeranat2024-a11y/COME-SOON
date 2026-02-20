-- [[ ARMOR MODULE - FIXED VERSION ]]
local player = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")

-- กำหนดค่าเริ่มต้นถ้ายังไม่มีการตั้งค่า
if _G.AutoArmor == nil then _G.AutoArmor = true end 
if _G.LastBuyTime == nil then _G.LastBuyTime = 0 end

local ArmorPos = CFrame.new(-934.025, -28.149, 570.549)

local function getArmorValue()
    local df = player:FindFirstChild("DataFolder")
    local info = df and df:FindFirstChild("Information")
    local armor = info and info:FindFirstChild("ArmorSave")
    return armor and tonumber(armor.Value) or 0
end

local function mainLoop()
    print("Module Loaded & Running...")
    while true do
        task.wait(2)
        if _G.AutoArmor == true then
            local char = player.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local currentArmor = getArmorValue()
            
            if root and currentArmor < 30 and (tick() - _G.LastBuyTime) > 10 then
                print("Armor Low (" .. currentArmor .. ") - Teleporting to Shop")
                local oldPos = root.CFrame
                root.CFrame = ArmorPos + Vector3.new(0, 3, 0)
                
                task.wait(0.8)
                local buyCount = 0
                repeat
                    for _, shopItem in pairs(workspace.Ignored.Shop:GetChildren()) do
                        local part = shopItem:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position - root.Position).Magnitude < 15 then
                            local cd = shopItem:FindFirstChildWhichIsA("ClickDetector", true)
                            if cd then 
                                fireclickdetector(cd)
                                task.wait(0.4)
                            end
                        end
                    end
                    buyCount = buyCount + 1
                until getArmorValue() >= 45 or buyCount >= 5 or _G.AutoArmor == false
                
                _G.LastBuyTime = tick()
                root.CFrame = oldPos
                print("Armor Refilled! Returning...")
            end
        end
    end
end

task.spawn(mainLoop)
