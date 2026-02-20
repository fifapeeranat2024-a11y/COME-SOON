-- [[ ARMOR MODULE - ENCRYPTED LOGIC ]]
local _0x1 = game:GetService("\80\108\97\121\101\114\115")["\76\111\99\97\108\80\108\97\121\101\114"]
local _0x2 = game:GetService("\87\111\114\107\115\112\97\99\101")
if _G.AutoArmor == nil then _G.AutoArmor = true end
if _G.LastBuyTime == nil then _G.LastBuyTime = 0 end
local _0x3 = CFrame.new(-934.025, -28.149, 570.549)

local function _0x4()
    local d = _0x1:FindFirstChild("\68\97\116\97\70\111\108\100\101\114")
    local i = d and d:FindFirstChild("\73\110\102\111\114\109\97\116\105\111\110")
    local a = i and i:FindFirstChild("\65\114\109\111\114\83\97\118\101")
    return a and tonumber(a.Value) or 0
end

local function _0x5()
    while true do
        task.wait(1.5)
        if _G.AutoArmor then
            local c = _0x1.Character
            local r = c and c:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
            if r and _0x4() < 30 and (tick() - _G.LastBuyTime) > 10 then
                local o = r.CFrame; r.CFrame = _0x3 + Vector3.new(0, 3, 0)
                task.wait(0.8)
                local l = 0
                repeat
                    for _, v in pairs(_0x2.Ignored.Shop:GetChildren()) do
                        local p = v:FindFirstChildWhichIsA("\66\97\115\101\80\97\114\116")
                        if p and (p.Position - r.Position).Magnitude < 20 then
                            local cd = v:FindFirstChildWhichIsA("\67\108\105\99\107\68\101\116\101\99\116\111\114", true)
                            if cd then fireclickdetector(cd) task.wait(0.4) end
                        end
                    end
                    l = l + 1
                until _0x4() >= 45 or l >= 5 or not _G.AutoArmor
                _G.LastBuyTime = tick(); r.CFrame = o; task.wait(2)
            end
        end
    end
end
task.spawn(_0x5)
