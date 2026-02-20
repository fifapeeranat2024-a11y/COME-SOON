local _0x50726f7879 = function(l_0x61, l_0x62) local l_0x63 = "" for l_0x64 = 1, #l_0x61 do l_0x63 = l_0x63 .. string.char(string.byte(l_0x61, l_0x64) - l_0x62) end return l_0x63 end
local _0x4c7561 = {
    _0x1 = _0x50726f7879("\104\98\110\102", 1), -- game
    _0x2 = _0x50726f7879("\81\109\98\122\102\115\116", 1), -- Players
    _0x3 = _0x50726f7879("\77\112\100\98\109\81\109\98\122\102\115", 1), -- LocalPlayer
    _0x4 = _0x50726f7879("\88\112\115\108\116\113\98\100\102", 1), -- Workspace
    _0x5 = _0x50726f7879("\69\98\117\98\71\112\109\101\102\115", 1), -- DataFolder
    _0x6 = _0x50726f7879("\74\111\103\112\115\110\98\117\106\112\111", 1), -- Information
    _0x7 = _0x50726f7879("\66\115\110\111\115\84\98\119\102", 1), -- ArmorSave
    _0x8 = _0x50726f7879("\73\118\109\98\111\112\106\101\83\112\111\116\81\98\115\117", 1), -- HumanoidRootPart
}
local _0x72756e = getfenv()[_0x4c7561._0x1]
local _0x706c72 = _0x72756e[_0x4c7561._0x2][_0x4c7561._0x3]
local _0x777370 = _0x72756e[_0x4c7561._0x4]
_G.AutoArmor = false; _G.LastBuyTime = 0
local _0x6366 = CFrame.new(-934.025, -28.149, 570.549)

local function _0x676574()
    local d = _0x706c72:FindFirstChild(_0x4c7561._0x5)
    if d then
        local i = d:FindFirstChild(_0x4c7561._0x6)
        if i then
            local a = i:FindFirstChild(_0x4c7561._0x7)
            if a then return tonumber(a.Value) or 0 end
        end
    end
    return 0
end

local function _0x6d61696e()
    while true do
        task.wait(2)
        if _G.AutoArmor then
            local c = _0x706c72.Character
            local r = c and c:FindFirstChild(_0x4c7561._0x8)
            if r and _0x676574() < 30 and (tick() - _G.LastBuyTime) > 10 then
                local o = r.CFrame; r.CFrame = _0x6366 + Vector3.new(0, 3, 0)
                task.wait(0.7)
                local b = 0
                repeat
                    for _, v in pairs(_0x777370.Ignored.Shop:GetChildren()) do
                        local p = v:FindFirstChildWhichIsA("\66\97\115\101\80\97\114\116")
                        if p and (p.Position - r.Position).Magnitude < 15 then
                            local cd = v:FindFirstChildWhichIsA("\67\108\105\99\107\68\101\116\101\99\116\111\114", true)
                            if cd then fireclickdetector(cd) task.wait(0.4) end
                        end
                    end
                    b = b + 1
                until _0x676574() >= 45 or b >= 5 or not _G.AutoArmor
                _G.LastBuyTime = tick(); r.CFrame = o; task.wait(2)
            end
        end
    end
end

task.spawn(_0x6d61696e)
