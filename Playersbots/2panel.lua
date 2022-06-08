--1 frame
local panel = CreateFrame("Frame", "panel2", UIParent)
panel:RegisterEvent("PLAYER_ENTERING_WORLD")
panel:RegisterEvent("PLAYER_LEAVING_WORLD")
panel:RegisterEvent("PLAYER_LOGIN")
panel:RegisterEvent("PLAYER_LOGOUT")

panel:SetSize(160, 140) -- width, height
panel:SetPoint("CENTER", 0, 0)
panel:SetMovable(true) -- make it movable
panel:EnableMouse(true) -- make it draggable
panel:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    tile = false,
    tileSize = 0,
    edgeSize = 1,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
})
panel:SetBackdropColor(0, 0, 0, 0.5)
panel:SetBackdropBorderColor(0, 0, 0, 1)
panel:Hide()
--dragframe
local dragframe = CreateFrame("Button", nil, panel)
dragframe:SetSize(160, 16)
dragframe:SetPoint("TOPLEFT", panel, "TOPLEFT", 0, 15)
dragframe:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    tile = false,
    tileSize = 0,
    edgeSize = 1,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
})
dragframe:SetBackdropColor(0, 0, 0, 0.8)
dragframe:SetBackdropBorderColor(0, 0, 0, 1)
dragframe:SetFrameStrata("HIGH")
dragframe:SetFrameLevel(1)
dragframe:SetScript("OnMouseDown", function(self, button) --move
    if button == "LeftButton" then
        panel:StartMoving()
    end
end)
dragframe:SetScript("OnMouseUp", function(self, button) -- stop moving 
    if button == "LeftButton" then
        panel:StopMovingOrSizing()
    end
end)
dragframe:SetScript("OnHide", function(self)
    panel:StopMovingOrSizing()
end)
--add text green "Server :"
local textServer = dragframe:CreateFontString(nil, "OVERLAY")
textServer:SetFont("Fonts\\FRIZQT__.TTF", 10)
textServer:SetPoint("LEFT", dragframe, "LEFT", 0, 0)
textServer:SetTextColor(0, 1, 0)
textServer:SetText(" Server : ")
--add realm name
local realmName = dragframe:CreateFontString(nil, "OVERLAY")
realmName:SetFont("Fonts\\FRIZQT__.TTF", 10)
realmName:SetPoint("LEFT", textServer, "RIGHT", 0, 0)
realmName:SetTextColor(1, 1, 1)
realmName:SetText(GetRealmName())

--lock/unlock on button click
local lockbutton = CreateFrame("Button", nil, panel)
lockbutton:SetSize(16, 16)
lockbutton:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -0, -0)
lockbutton:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    tile = false,
    tileSize = 0,
    edgeSize = 1,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
})
lockbutton:SetBackdropColor(0, 0, 0, 0.5)
lockbutton:SetBackdropBorderColor(0, 0, 0, 0)
lockbutton:SetFrameStrata("HIGH")
lockbutton:SetFrameLevel(1)
--add text green "Lock"
local textLock = lockbutton:CreateFontString(nil, "OVERLAY")
textLock:SetFont("Fonts\\FRIZQT__.TTF", 10)
textLock:SetPoint("CENTER", lockbutton, "CENTER", 0, 0)
textLock:SetTextColor(0, 1, 0)
textLock:SetText("L")
--add text green "Unlock"
local textUnlock = lockbutton:CreateFontString(nil, "OVERLAY")
textUnlock:SetFont("Fonts\\FRIZQT__.TTF", 10)
textUnlock:SetPoint("CENTER", lockbutton, "CENTER", 0, 0)
textUnlock:SetTextColor(0, 1, 0)
textUnlock:SetText("U")
textUnlock:Hide()
--lock/unlock on button click
lockbutton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
        if panel:IsMovable() then
            panel:SetMovable(false)
            panel:EnableMouse(false)
            lockbutton:SetBackdropBorderColor(0, 0, 0, 0)
            lockbutton:SetBackdropColor(0, 0, 0, 0.5)
            dragframe:Hide()
            lockbutton:SetBackdropColor(0.8, 0, 0, 0.5)
            lockbutton:SetBackdropBorderColor(0, 0, 0, 1)
            textLock:Hide()
            textUnlock:Show()
        else
            panel:SetMovable(true)
            panel:EnableMouse(true)
            dragframe:Show()
            lockbutton:SetBackdropBorderColor(0, 0, 0, 1)
            lockbutton:SetBackdropColor(0, 0, 0, 0.5)
            textUnlock:Hide()
            textLock:Show()
        end
    end
end)


-- lockbutton:SetScript("OnMouseDown", function(self, button) --lock
--     if button == "LeftButton" then

--         dragframe:SetMovable(false)
--         dragframe:EnableMouse(false)
--         dragframe:Hide()
--         lockbutton:SetBackdropColor(0.8, 0, 0, 0.5)
--         lockbutton:SetBackdropBorderColor(0, 0, 0, 1)
--     else
--         dragframe:SetMovable(true)
--         dragframe:EnableMouse(true)
--         dragframe:Show()
--         lockbutton:SetBackdropColor(0, 0, 0, 0.5)
--         lockbutton:SetBackdropBorderColor(0, 0, 0, 0)
--     end
-- end)
--GameTooltip for lockbutton
lockbutton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Lock/Unlock", 1, 1, 1, 1, true)
end)
lockbutton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)




-- --text "Multi add"
-- local text = panel:CreateFontString(nil, "OVERLAY")
-- text:SetFont("Fonts\\FRIZQT__.TTF", 8)
-- text:SetPoint("TOPRIGHT", -5, -20)
-- text:SetText("Multi add")

--add Close button in dragframe
local close = CreateFrame("Button", nil, dragframe)
close:SetSize(15, 15)
close:SetPoint("TOPRIGHT", dragframe, "TOPRIGHT", 0, 0)
close:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\x]])
close:SetScript("OnEnter", function(self)
    self:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\x-red]])
end)
close:SetScript("OnLeave", function(self)
    self:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\x]])
end)
close:SetScript("OnClick", function(self)
    panel:Hide()
end)

--!!!!!!!!!!!!!!!
--add Close button SetBackdrop
close:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = false,
    tileSize = 0,
    edgeSize = 1,
    insets = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
    }
})
close:SetBackdropColor(0, 0, 0, 5)
close:SetBackdropBorderColor(0, 0, 0, 1)







--!!!!!!!!!!!!!! Start minimapIcon
-- local minimapIcon = CreateFrame("Button", "panel_minimapIcon", Minimap)
-- minimapIcon:EnableMouseWheel(true)
-- minimapIcon:SetMovable(true)
-- minimapIcon:SetSize(22, 20)
-- minimapIcon:SetPoint("TOPLEFT", 0, 0)
-- minimapIcon:SetFrameStrata("MEDIUM")
-- minimapIcon:SetFrameLevel(8)
-- minimapIcon:SetBackdropColor(0, 0, 0, 0.5)
-- minimapIcon:SetBackdropBorderColor(0, 0, 0, 1)

-- local myIconPos = 0
 
-- -- Control movement of minimapIcon
-- local function UpdateMapBtn()
--     local Xpoa, Ypoa = GetCursorPosition()
--     local Xmin, Ymin = Minimap:GetLeft(), Minimap:GetBottom()
--     Xpoa = Xmin - Xpoa / Minimap:GetEffectiveScale() + 70
--     Ypoa = Ypoa / Minimap:GetEffectiveScale() - Ymin - 70
--     myIconPos = math.deg(math.atan2(Ypoa, Xpoa))
--     minimapIcon:ClearAllPoints()
--     minimapIcon:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)), (80 * sin(myIconPos)) - 52)
-- end
-- minimapIcon:RegisterForDrag("LeftButton")
-- minimapIcon:SetScript("OnDragStart", function()
--     minimapIcon:StartMoving()
--     minimapIcon:SetScript("OnUpdate", UpdateMapBtn)
-- end)
 
-- minimapIcon:SetScript("OnDragStop", function()
--     minimapIcon:StopMovingOrSizing();
--     minimapIcon:SetScript("OnUpdate", nil)
--     UpdateMapBtn();
-- end)
-- minimapIcon:ClearAllPoints();
-- minimapIcon:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(myIconPos)),(80 * sin(myIconPos)) - 52)

-- -- Click show AddOns
-- minimapIcon:SetScript("OnClick", function(self)
--     if panel:IsShown() then
--         panel:Hide()
--     else
--         panel:Show()
--     end
-- end)

-- local minimapIcon_icon = minimapIcon:CreateTexture("minimapIcon_icon")
-- minimapIcon_icon:SetAllPoints(true)
-- minimapIcon_icon:SetTexture([[Interface\AddOns\Playersbots\Icons\EC128]]) --"Interface\Minimap\Tracking\None"
-- --GameTooltip
-- minimapIcon:SetScript("OnEnter", function(self)
--     GameTooltip:SetOwner(self, "ANCHOR_LEFT")
--     GameTooltip:SetText("Playersbots")
--     GameTooltip:AddLine("Left click to show/hide Playersbots")
--     GameTooltip:AddLine("Right click to drag")
--     GameTooltip:Show()
-- end)
-- minimapIcon:SetScript("OnLeave", function(self)
--     GameTooltip:Hide()
-- end)


--!!!!!!!!!!!!!!!!!!! END minimapIcon








--!!!!!!!!!!!!!!!!
--Button Settings
local button = CreateFrame("Button", "ButtonSettings", panel) -- create a button
button:SetSize(50, 20)
button:SetPoint("BOTTOMLEFT", 5, 5)
button:SetText("Settings")
button:SetNormalTexture([[Interface\AddOns\Playersbots\Icons\Square_Normal]])
button:SetPushedTexture([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
button:SetHighlightTexture([[Interface\AddOns\Playersbots\Icons\Square_Hilite]])
local setFont = button:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 10)
--Color CornflowerBlue
setFont:SetTextColor(0.39, 0.58, 0.93)
-- button SetBackdrop
button:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
button:SetBackdropColor(0, 0, 0, 0.1)
button:SetBackdropBorderColor(0, 0, 0, 5)
button:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("The advanced settings are for people who participates in the improvement of the Playerbots involving the navigation of the bots (pathing)", 1, 1, 1, 1, true)
end)
button:SetScript("OnLeave", function(self)


    self:SetBackdropColor(0, 0, 0, 0.1)
    GameTooltip:Hide()

end)

--button SetScript newFrame settings
button:SetScript("OnClick", function(self)
	panel2_settings:Show()
end)


--buttonLeave
local buttonLeave = CreateFrame("Button", "Leave", panel) --Created a button
buttonLeave:SetSize(50, 30)
buttonLeave:SetPoint("TOPLEFT", 5, -45)
buttonLeave:SetText("Leave")
buttonLeave:SetNormalTexture([[Interface\AddOns\Playersbots\Icons\Square_Normal]])
buttonLeave:SetPushedTexture([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
buttonLeave:SetHighlightTexture([[Interface\AddOns\Playersbots\Icons\Square_Hilite]])
local setFont = buttonLeave:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 10)
setFont:SetTextColor(1, 1, 0)
buttonLeave:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonLeave:SetBackdropColor(0, 0, 0, 0.1)
buttonLeave:SetBackdropBorderColor(0, 0, 0, 1)
buttonLeave:SetScript("OnClick", function(self)
        LeaveParty()
end)
buttonLeave:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(1, 1, 0, 1)
end)
buttonLeave:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)


--ButtonUninvite
local buttonUninvite = CreateFrame("Button", "Uninvite", panel) --Created a button
buttonUninvite:SetSize(50, 30)
buttonUninvite:SetPoint("TOPLEFT", 5, -10)
buttonUninvite:SetText("Uninvite")
buttonUninvite:SetNormalTexture([[Interface\AddOns\Playersbots\Icons\Square_Normal]])
buttonUninvite:SetPushedTexture([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
buttonUninvite:SetHighlightTexture([[Interface\AddOns\Playersbots\Icons\Square_Hilite]])
local setFont = buttonUninvite:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 10)
setFont:SetTextColor(1, 0, 0)
setFont:SetShadowColor(0, 0, 0)

-- button SetBackdrop
buttonUninvite:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonUninvite:SetBackdropColor(0, 0, 0, 0.1)
buttonUninvite:SetBackdropBorderColor(0, 0, 0, 1)
buttonUninvite:SetScript("OnClick", function(self)
    if (IsInGroup()) then
        UninviteUnit(UnitName("target"))
    else
        print("Select a player")
    end
end)
buttonUninvite:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
buttonUninvite:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
end)

--button add alt
local buttonAddAlt = CreateFrame("Button", "AddAlt", panel) --Created a button
buttonAddAlt:SetSize(50, 20)
buttonAddAlt:SetPoint("TOPLEFT", 5, -80)
buttonAddAlt:SetNormalTexture([[Interface\AddOns\Playersbots\Icons\Square_Normal]])
buttonAddAlt:SetPushedTexture([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
buttonAddAlt:SetHighlightTexture([[Interface\AddOns\Playersbots\Icons\Square_Hilite]])
buttonAddAlt:SetText("Add Alt")
--text button add alt
local setFont = buttonAddAlt:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 10)

-- button SetBackdrop buttonAddAlt
buttonAddAlt:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonAddAlt:SetBackdropColor(0, 0, 0, 0.1)
buttonAddAlt:SetBackdropBorderColor(0, 0, 0, 1)
buttonAddAlt:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
buttonAddAlt:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
end)
--buttonAddAlt textbox
local textboxAddAlt = CreateFrame("EditBox", "textboxAddAlt", panel)
textboxAddAlt:SetSize(50, 15)
textboxAddAlt:SetPoint("TOPLEFT", 5, -100)
textboxAddAlt:SetFont("Fonts/FRIZQT__.ttf", 10)
textboxAddAlt:SetAutoFocus(false)
textboxAddAlt:SetText("")
textboxAddAlt:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
textboxAddAlt:SetBackdropColor(0, 0, 0, 0.1)
textboxAddAlt:SetBackdropBorderColor(0, 0, 0, 1)
textboxAddAlt:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("add your alt", 1, 1, 1, 1, true)
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
textboxAddAlt:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:ClearFocus()
    self:SetBackdropColor(0, 0, 0, 0.1)
end)
buttonAddAlt:SetScript("OnClick", function(self)
    SendChatMessage(".bots login "..textboxAddAlt:GetText())
    textboxAddAlt:SetText("")
    textboxAddAlt:ClearFocus()
end)







--button Heal .bot add 1
local buttonHeal = CreateFrame("Button", "Heal", panel) --Created a button
buttonHeal:SetSize(35, 35)
buttonHeal:SetPoint("TOP", 0, -12)
buttonHeal:SetText("")
buttonHeal:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\IconHealRole]])
buttonHeal:SetPushedTexture ([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
-- add button SetBackdrop buttonHeal
buttonHeal:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonHeal:SetBackdropColor(0, 0, 0, 0.1)
buttonHeal:SetBackdropBorderColor(0, 0, 0, 1)
buttonHeal:SetScript("OnClick", function(self)
    SendChatMessage(".bot add 1")
end)
buttonHeal:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 1, 0, 1)
end)
buttonHeal:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)

--button DPS .bot add 2
local buttonDPS = CreateFrame("Button", "DPS", panel) --Created a button
buttonDPS:SetSize(35, 35)
buttonDPS:SetPoint("CENTER", 0, -5)
buttonDPS:SetText("")
buttonDPS:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\IconDPSRole]])
buttonDPS:SetPushedTexture ([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
-- button SetBackdrop buttonDPS
buttonDPS:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonDPS:SetBackdropColor(0, 0, 0, 0.1)
buttonDPS:SetBackdropBorderColor(0, 0, 0, 1)
buttonDPS:SetScript("OnClick", function(self)
    SendChatMessage(".bot add 2")
end)
buttonDPS:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 1, 0, 1)
end)
buttonDPS:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
--add button Tank .bot add 3
local buttonTank = CreateFrame("Button", "Tank", panel) --Created a button
buttonTank:SetSize(35, 35)
buttonTank:SetPoint("BOTTOM", 0, 5)
buttonTank:SetText("")
buttonTank:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\IconTankRole]])
buttonTank:SetPushedTexture ([[Interface\AddOns\Playersbots\Icons\Square_Pushed]])
-- button SetBackdrop buttonTank
buttonTank:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonTank:SetBackdropColor(0, 0, 0, 0.1)
buttonTank:SetBackdropBorderColor(0, 0, 0, 1)
buttonTank:SetScript("OnClick", function(self)
    SendChatMessage(".bot add 3")
end)
buttonTank:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 1, 0, 1)
end)
buttonTank:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)



--button .bots addRoleBotsToGroup 1 
local buttonAddRoleBotsToGroup1 = CreateFrame("Button", "AddRoleBotsToGroup1", panel) --Created a button
buttonAddRoleBotsToGroup1:SetSize(20, 20)
buttonAddRoleBotsToGroup1:SetPoint("TOPRIGHT", -35, -28)
buttonAddRoleBotsToGroup1:SetText("+")
--text button add RoleBotsToGroup1
local setFont = buttonAddRoleBotsToGroup1:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 25)
-- button SetBackdrop buttonAddRoleBotsToGroup1
buttonAddRoleBotsToGroup1:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonAddRoleBotsToGroup1:SetBackdropColor(0, 0, 0, 0.1)
buttonAddRoleBotsToGroup1:SetBackdropBorderColor(0, 0, 0, 1)
buttonAddRoleBotsToGroup1:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
buttonAddRoleBotsToGroup1:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
end)

--textbox addRoleBotsToGroup1
local textboxAddRoleBotsToGroup1 = CreateFrame("EditBox", "textboxAddRoleBotsToGroup1", panel)
textboxAddRoleBotsToGroup1:SetSize(30, 20)
textboxAddRoleBotsToGroup1:SetPoint("TOPRIGHT", 0, -28)
textboxAddRoleBotsToGroup1:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxAddRoleBotsToGroup1:SetAutoFocus(false)
textboxAddRoleBotsToGroup1:SetText("")
textboxAddRoleBotsToGroup1:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
textboxAddRoleBotsToGroup1:SetBackdropColor(0, 0, 0, 0.1)
textboxAddRoleBotsToGroup1:SetBackdropBorderColor(0, 0, 0, 1)
textboxAddRoleBotsToGroup1:SetScript("OnEnter", function(self)
    self:SetFocus()
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
textboxAddRoleBotsToGroup1:SetScript("OnLeave", function(self)
    self:ClearFocus()
    self:SetBackdropColor(0, 0, 0, 0.1)
end)
buttonAddRoleBotsToGroup1:SetScript("OnClick", function(self)

    SendChatMessage(".bots addRoleBotsToGroup 1 " .. textboxAddRoleBotsToGroup1:GetText())
    textboxAddRoleBotsToGroup1:SetText("")
    textboxAddRoleBotsToGroup1:ClearFocus()
end)
--button .bots addRoleBotsToGroup 2
local buttonAddRoleBotsToGroup2 = CreateFrame("Button", "AddRoleBotsToGroup2", panel) --Created a button
buttonAddRoleBotsToGroup2:SetSize(20, 20)
buttonAddRoleBotsToGroup2:SetPoint("TOPRIGHT", -35, -72)
buttonAddRoleBotsToGroup2:SetText("+")
--text button add RoleBotsToGroup2
local setFont = buttonAddRoleBotsToGroup2:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 25)
-- button SetBackdrop buttonAddRoleBotsToGroup2
buttonAddRoleBotsToGroup2:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonAddRoleBotsToGroup2:SetBackdropColor(0, 0, 0, 0.1)
buttonAddRoleBotsToGroup2:SetBackdropBorderColor(0, 0, 0, 1)
buttonAddRoleBotsToGroup2:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
buttonAddRoleBotsToGroup2:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
end)

--textbox addRoleBotsToGroup2
local textboxAddRoleBotsToGroup2 = CreateFrame("EditBox", "textboxAddRoleBotsToGroup2", panel)
textboxAddRoleBotsToGroup2:SetSize(30, 20)
textboxAddRoleBotsToGroup2:SetPoint("TOPRIGHT", 0, -72)
textboxAddRoleBotsToGroup2:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxAddRoleBotsToGroup2:SetAutoFocus(false)
textboxAddRoleBotsToGroup2:SetText("")
textboxAddRoleBotsToGroup2:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
textboxAddRoleBotsToGroup2:SetBackdropColor(0, 0, 0, 0.1)
textboxAddRoleBotsToGroup2:SetBackdropBorderColor(0, 0, 0, 1)
textboxAddRoleBotsToGroup2:SetScript("OnEnter", function(self)
    self:SetFocus()
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
textboxAddRoleBotsToGroup2:SetScript("OnLeave", function(self)
    self:ClearFocus()
    self:SetBackdropColor(0, 0, 0, 0.1)
end)
buttonAddRoleBotsToGroup2:SetScript("OnClick", function(self)
    SendChatMessage(".bots addRoleBotsToGroup 2 " .. textboxAddRoleBotsToGroup2:GetText())
    textboxAddRoleBotsToGroup2:SetText("")
    textboxAddRoleBotsToGroup2:ClearFocus()
end)
--button .bots addRoleBotsToGroup 3
local buttonAddRoleBotsToGroup3 = CreateFrame("Button", "AddRoleBotsToGroup3", panel) --Created a button
buttonAddRoleBotsToGroup3:SetSize(20, 20)
buttonAddRoleBotsToGroup3:SetPoint("TOPRIGHT", -35, -115)
buttonAddRoleBotsToGroup3:SetText("+")
--text button add RoleBotsToGroup3
local setFont = buttonAddRoleBotsToGroup3:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 25)
-- button SetBackdrop buttonAddRoleBotsToGroup3
buttonAddRoleBotsToGroup3:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonAddRoleBotsToGroup3:SetBackdropColor(0, 0, 0, 0.1)
buttonAddRoleBotsToGroup3:SetBackdropBorderColor(0, 0, 0, 1)
buttonAddRoleBotsToGroup3:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
buttonAddRoleBotsToGroup3:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.1)
end)
--textbox addRoleBotsToGroup3
local textboxAddRoleBotsToGroup3 = CreateFrame("EditBox", "textboxAddRoleBotsToGroup3", panel)
textboxAddRoleBotsToGroup3:SetSize(30, 20)
textboxAddRoleBotsToGroup3:SetPoint("TOPRIGHT", 0, -115)
textboxAddRoleBotsToGroup3:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxAddRoleBotsToGroup3:SetAutoFocus(false)
textboxAddRoleBotsToGroup3:SetText("")
textboxAddRoleBotsToGroup3:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
textboxAddRoleBotsToGroup3:SetBackdropColor(0, 0, 0, 0.1)
textboxAddRoleBotsToGroup3:SetBackdropBorderColor(0, 0, 0, 1)
textboxAddRoleBotsToGroup3:SetScript("OnEnter", function(self)
    self:SetFocus()
    self:SetBackdropColor(0, 0, 0, 0.5)
end)
textboxAddRoleBotsToGroup3:SetScript("OnLeave", function(self)
    self:ClearFocus()
    self:SetBackdropColor(0, 0, 0, 0.1)
end)
buttonAddRoleBotsToGroup3:SetScript("OnClick", function(self)
    SendChatMessage(".bots addRoleBotsToGroup 3 " .. textboxAddRoleBotsToGroup3:GetText())
    textboxAddRoleBotsToGroup3:SetText("")
    textboxAddRoleBotsToGroup3:ClearFocus()
end)
--Use TAB to switch TextBox
textboxAddRoleBotsToGroup1:SetScript("OnTabPressed", function(self)
    textboxAddRoleBotsToGroup2:SetFocus()
end)
textboxAddRoleBotsToGroup2:SetScript("OnTabPressed", function(self)
    textboxAddRoleBotsToGroup3:SetFocus()
end)
textboxAddRoleBotsToGroup3:SetScript("OnTabPressed", function(self)
    textboxAddRoleBotsToGroup1:SetFocus()
end)
--button MiniframeAttack
local buttonMiniframeAttack = CreateFrame("Button", "MiniframeAttack", panel) --Created a button
buttonMiniframeAttack:SetSize(36, 16)
buttonMiniframeAttack:SetPoint("TOPRIGHT", -17, -0)
buttonMiniframeAttack:SetText("Mini")
--text button MiniframeAttack
local setFont = buttonMiniframeAttack:GetFontString()
setFont:SetFont("Fonts/FRIZQT__.ttf", 10)
-- button SetBackdrop buttonMiniframeAttack
buttonMiniframeAttack:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8x8",
    edgeFile = "Interface\\Buttons\\WHITE8x8",
                tile = false,
                tileSize = 0,
                edgeSize = 1,
                insets = {left = 0, right = 0, top = 0, bottom = 0
                }
})
buttonMiniframeAttack:SetBackdropColor(0, 0, 0, 0.1)
buttonMiniframeAttack:SetBackdropBorderColor(0, 0, 0, 1)
--OnClick show/hide miniframe
buttonMiniframeAttack:SetScript("OnClick", function(self)
    if panel3_mini:IsShown() then
        panel3_mini:Hide()
    else
        panel3_mini:Show()
    end
end)
--if panel3_mini shown change SetBackdropColor red
panel3_mini:SetScript("OnShow", function(self)
    buttonMiniframeAttack:SetBackdropColor(1, 0, 0, 0.5)
end)
--if panel3_mini hidden change SetBackdropColor black
panel3_mini:SetScript("OnHide", function(self)
    buttonMiniframeAttack:SetBackdropColor(0, 0, 0, 0.1)
end)

