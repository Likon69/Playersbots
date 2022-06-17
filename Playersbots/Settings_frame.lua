-- new settings frame

local settings = CreateFrame("Frame", "panel2_settings", UIParent)
settings:SetSize(600, 300) -- width, height
settings:SetPoint("TOPLEFT", 0, 0)
settings:SetMovable(true) -- make it movable
settings:EnableMouse(true) -- make it draggable
-- settings show next to panel
settings:SetUserPlaced(true)
settings:SetClampedToScreen(true)
settings:SetClampRectInsets(0, 0, 0, 0)
settings:SetFrameStrata("HIGH")
settings:SetFrameLevel(1)
-- settings backdrop
settings:SetBackdrop({
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
settings:SetBackdropColor(0, 0, 0, 0.5)
settings:SetBackdropBorderColor(0, 0, 0, 1)
--settings move
settings:SetScript("OnMouseDown", function(self, button) --move
    if button == "LeftButton" then
        self:StartMoving()
    end
end)
settings:SetScript("OnMouseUp", function(self, button) -- stop moving
    if button == "LeftButton" then
        self:StopMovingOrSizing()
    end
end)
settings:SetScript("OnHide", function(self)
    self:StopMovingOrSizing()
end)
    settings:Hide()
---------------------------
--Text Paths
local textPaths = settings:CreateFontString(nil, "OVERLAY")
textPaths:SetFont("Fonts\\FRIZQT__.TTF", 10)
textPaths:SetPoint("TOPLEFT", settings, "TOPLEFT", 20, -30)
textPaths:SetText("Paths")



--add Close button
local close = CreateFrame("Button", "2panel_settings_close", settings, "UIPanelButtonTemplate")
close:SetSize(20, 20)
close:SetPoint("TOPRIGHT", 0, 1)
close:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\x]])
close:SetScript("OnEnter", function(self)
    self:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\x-red]])
end)
close:SetScript("OnLeave", function(self)
    self:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\x]])
end)
close:SetScript("OnClick", function(self)
    settings:Hide()
end)
--Close button SetBackdrop
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
close:SetBackdropColor(0, 0, 0, 1)
close:SetBackdropBorderColor(0, 0, 0, 1)
--add NormalTexture
local normal = CreateFrame("Button", "2panel_settings_normal", settings, "UIPanelButtonTemplate")
normal:SetSize(20, 20)
normal:SetPoint("TOPRIGHT", -25, 0)
normal:SetNormalTexture ([[Interface\AddOns\Playersbots\Icons\EC128]])
--settings title2
local title2 = CreateFrame("Frame", "panel2_settings_title2", settings)
title2:SetSize(600, 20)
title2:SetPoint("TOP", 0, 0)
title2:SetBackdrop({
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
title2:SetBackdropColor(0, 0, 0, 0.8)
title2:SetBackdropBorderColor(0, 0, 0, 1)
--settings title2 text
local title2_text = title2:CreateFontString(nil, "OVERLAY")
title2_text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
title2_text:SetPoint("CENTER", 0, 0)
title2_text:SetText("SQL(Farmer)")
title2_text:SetTextColor(0.39, 0.58, 0.93)
--------------------------------------------------------------------------
--add button .bots farmer addPoint
local buttonFarmerAddPoint = CreateFrame("Button", "2panel_settings_buttonFarmerAddPoint" , settings)
buttonFarmerAddPoint:SetSize(110, 25)
buttonFarmerAddPoint:SetPoint("TOPLEFT", settings, "TOPLEFT", 10, -40)
buttonFarmerAddPoint:SetText("Add path point")
local setFont = buttonFarmerAddPoint:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerAddPoint:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerAddPoint:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerAddPoint:SetBackdropBorderColor(0, 0, 0, 1)

buttonFarmerAddPoint:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerAddPoint:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.4)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerAddPoint:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer addPoint")
end)
--button .bots farmer finishPathZone
local buttonFarmerFinishPathZone = CreateFrame("Button", "2panel_settings_buttonFarmerFinishPathZone", settings)
buttonFarmerFinishPathZone:SetSize(110, 25)
buttonFarmerFinishPathZone:SetPoint("TOPLEFT", settings, "TOPLEFT", 120, -40)
buttonFarmerFinishPathZone:SetText("Finish zone path")
local setFont = buttonFarmerFinishPathZone:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerFinishPathZone:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerFinishPathZone:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerFinishPathZone:SetBackdropBorderColor(0, 0, 0, 1)
buttonFarmerFinishPathZone:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerFinishPathZone:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerFinishPathZone:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer finishPathZone")
end)
--button .bots farmer finishPathConnection
local buttonFarmerFinishPathConnection = CreateFrame("Button", "2panel_settings_buttonFarmerFinishPathConnection", settings)
buttonFarmerFinishPathConnection:SetSize(140, 25)
buttonFarmerFinishPathConnection:SetPoint("TOPLEFT", settings, "TOPLEFT", 245, -40)
buttonFarmerFinishPathConnection:SetText("Finish connection path")
local setFont = buttonFarmerFinishPathConnection:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerFinishPathConnection:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerFinishPathConnection:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerFinishPathConnection:SetBackdropBorderColor(0, 0, 0, 1)
--Textbox
local textbox = CreateFrame("EditBox", "2panel_settings_textbox", settings, "InputBoxTemplate")
textbox:SetSize(90, 25)
textbox:SetPoint("TOPLEFT", settings, "TOPLEFT", 400, -40)
textbox:SetAutoFocus(false)
textbox:SetText("")
--texbox text
local textbox_text = textbox:CreateFontString(nil, "OVERLAY")
textbox_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textbox_text:SetPoint("CENTER", -5, 20)
textbox_text:SetText("Start zone id")
--Texbox2
local textbox2 = CreateFrame("EditBox", "2panel_settings_textbox2", settings, "InputBoxTemplate")
textbox2:SetSize(90, 25)
textbox2:SetPoint("TOPLEFT", settings, "TOPLEFT", 510, -40)
textbox2:SetAutoFocus(false)
textbox2:SetText("")
--texbox text2
local textbox2_text = textbox2:CreateFontString(nil, "OVERLAY")
textbox2_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textbox2_text:SetPoint("CENTER", -5, 20)
textbox2_text:SetText("End zone id")
buttonFarmerFinishPathConnection:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Add you zone id to the end of the path", 1, 1, 1, 1, true)
end)
buttonFarmerFinishPathConnection:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.4)
    self:SetBackdropBorderColor(0, 0, 0, 1)
    GameTooltip:Hide()
end)
buttonFarmerFinishPathConnection:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer finishPathConnection "..textbox:GetText().." "..textbox2:GetText())
    textbox:ClearFocus()
    textbox2:ClearFocus()

end)
-------------------------------------------------------------------
--textboxMinlevel
local textboxMinlevel = CreateFrame("EditBox", "2panel_settings_textboxMinlevel", settings, "InputBoxTemplate")
textboxMinlevel:SetSize(90, 25)
textboxMinlevel:SetPoint("TOPLEFT", settings, "TOPLEFT", 10, -120)
textboxMinlevel:SetAutoFocus(false)
textboxMinlevel:SetText("")
--texbox text
local textboxMinlevel_text = textboxMinlevel:CreateFontString(nil, "OVERLAY")
textboxMinlevel_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxMinlevel_text:SetPoint("CENTER", -5, 20)
textboxMinlevel_text:SetText("Minlevel")
--texboxMaxlevel
local textboxMaxlevel = CreateFrame("EditBox", "2panel_settings_textboxMaxlevel", settings, "InputBoxTemplate")
textboxMaxlevel:SetSize(90, 25)
textboxMaxlevel:SetPoint("TOPLEFT", settings, "TOPLEFT", 110, -120)
textboxMaxlevel:SetAutoFocus(false)
textboxMaxlevel:SetText("")
--texbox text
local textboxMaxlevel_text = textboxMaxlevel:CreateFontString(nil, "OVERLAY")
textboxMaxlevel_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxMaxlevel_text:SetPoint("CENTER", -5, 20)
textboxMaxlevel_text:SetText("Maxlevel")
-- texbox Team disable ID
local textboxTeamDisableID = CreateFrame("EditBox", "2panel_settings_textboxTeamDisableID", settings, "InputBoxTemplate")
textboxTeamDisableID:SetSize(90, 25)
textboxTeamDisableID:SetPoint("TOPLEFT", settings, "TOPLEFT", 310, -120)
textboxTeamDisableID:SetAutoFocus(false)
textboxTeamDisableID:SetText("")
-- --texbox text
local textboxTeamDisableID_text = textboxTeamDisableID:CreateFontString(nil, "OVERLAY")
textboxTeamDisableID_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxTeamDisableID_text:SetPoint("CENTER", 0, 20)
textboxTeamDisableID_text:SetText("Team disable ID")




local comboboxTeamDisableID = CreateFrame("Frame", "2panel_settings_comboboxTeamDisableID", settings, "UIDropDownMenuTemplate")
comboboxTeamDisableID:SetSize(75, 25)
comboboxTeamDisableID:SetPoint("TOPLEFT", settings, "TOPLEFT", 400, -120)
local function OnClick(self)
    --selected on
    UIDropDownMenu_SetSelectedID(comboboxTeamDisableID, self:GetID())
    --set value
    local value = self:GetID()
    if value == 1 then
        value = "0"
    elseif value == 2 then
        value = "67"
    elseif value == 3 then
        value = "469"
    end
    --put value in textbox
    textboxTeamDisableID:SetText(value)
end
local function initialize(self, level)
    local info = UIDropDownMenu_CreateInfo()
 --selected on option
    if UIDropDownMenu_GetSelectedID(comboboxTeamDisableID) == 1 then
        info.checked = true
    else
        info.checked = false
    end
    info.text = "None"
    info.value = 0
    info.func = OnClick
    UIDropDownMenu_AddButton(info, level)
    --selected on option
    if UIDropDownMenu_GetSelectedID(comboboxTeamDisableID) == 2 then
        info.checked = true
    else
        info.checked = false
    end
    info.text = "Horde"
    info.value = 67
    info.func = OnClick
    UIDropDownMenu_AddButton(info, level)
    if UIDropDownMenu_GetSelectedID(comboboxTeamDisableID) == 3 then
        info.checked = true
    else
        info.checked = false
    end
    info.text = "Alliance"
    info.value = 469
    info.func = OnClick
    UIDropDownMenu_AddButton(info, level)
    
end
UIDropDownMenu_Initialize(comboboxTeamDisableID, initialize)
UIDropDownMenu_SetWidth(comboboxTeamDisableID, 75)
UIDropDownMenu_SetButtonWidth(comboboxTeamDisableID, 30)
    --OnEnter GameTooltip
    comboboxTeamDisableID:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Select the team disable", 1, 1, 1, 1, true)
    end)
    --OnLeave GameTooltip
    comboboxTeamDisableID:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
-- UIDropDownMenu_SetSelectedValue(comboboxTeamDisableID, 1)
-- UIDropDownMenu_JustifyText(comboboxTeamDisableID, "LEFT")
--textbox Radius
local textboxRadius = CreateFrame("EditBox", "2panel_settings_textboxRadius", settings, "InputBoxTemplate")
textboxRadius:SetSize(90, 25)
textboxRadius:SetPoint("TOPLEFT", settings, "TOPLEFT", 210, -120)
textboxRadius:SetAutoFocus(false)
textboxRadius:SetText("")
--texbox text
local textboxRadius_text = textboxRadius:CreateFontString(nil, "OVERLAY")
textboxRadius_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxRadius_text:SetPoint("CENTER", -5, 20)
textboxRadius_text:SetText("Radius")
--Button .bots farmer writeFarmingSpot
local buttonFarmerWriteFarmingSpot = CreateFrame("Button", "2panel_settings_buttonFarmerWriteFarmingSpot", settings)
buttonFarmerWriteFarmingSpot:SetSize(150, 25)
buttonFarmerWriteFarmingSpot:SetPoint("TOPLEFT", settings, "TOPLEFT", 10, -160)
buttonFarmerWriteFarmingSpot:SetText("Write farming spot")
local setFont = buttonFarmerWriteFarmingSpot:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerWriteFarmingSpot:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerWriteFarmingSpot:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerWriteFarmingSpot:SetBackdropBorderColor(0, 0, 0, 1)

buttonFarmerWriteFarmingSpot:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerWriteFarmingSpot:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerWriteFarmingSpot:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer writeFarmingSpot "..textboxMinlevel:GetText().." "..textboxMaxlevel:GetText().." "..textboxTeamDisableID:GetText().." "..textboxRadius:GetText())	
    textboxMinlevel:ClearFocus()
    textboxMaxlevel:ClearFocus()
    textboxTeamDisableID:ClearFocus()
    textboxRadius:ClearFocus()
end)
--button .bots farmer writeCity
local buttonFarmerWriteCity = CreateFrame("Button", "2panel_settings_buttonFarmerWriteCity", settings)
buttonFarmerWriteCity:SetSize(150, 25)
buttonFarmerWriteCity:SetPoint("TOPLEFT", settings, "TOPLEFT", 170, -160)
buttonFarmerWriteCity:SetText("Write city")
local setFont = buttonFarmerWriteCity:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerWriteCity:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerWriteCity:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerWriteCity:SetBackdropBorderColor(0, 0, 0, 1)
buttonFarmerWriteCity:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerWriteCity:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerWriteCity:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer writeCity "..textboxMinlevel:GetText().." "..textboxMaxlevel:GetText().." "..textboxTeamDisableID:GetText().." "..textboxRadius:GetText())	
    textboxMinlevel:ClearFocus()
    textboxMaxlevel:ClearFocus()
    textboxTeamDisableID:ClearFocus()
    textboxRadius:ClearFocus()
end)    
------------------------------------------------------------------------------
--button .bots farmer reloadFarmingData
local buttonFarmerReloadFarmingData = CreateFrame("Button", "2panel_settings_buttonFarmerReloadFarmingData", settings)
buttonFarmerReloadFarmingData:SetSize(150, 25)
buttonFarmerReloadFarmingData:SetPoint("TOPLEFT", settings, "TOPLEFT", 10, -230)
buttonFarmerReloadFarmingData:SetText("Reload farming data")
local setFont = buttonFarmerReloadFarmingData:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerReloadFarmingData:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerReloadFarmingData:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerReloadFarmingData:SetBackdropBorderColor(0, 0, 0, 1)
buttonFarmerReloadFarmingData:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerReloadFarmingData:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerReloadFarmingData:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer reloadFarmingData")
end)
--button .bots farmer showZonePaths
local buttonFarmerShowZonePaths = CreateFrame("Button", "2panel_settings_buttonFarmerShowZonePaths", settings)
buttonFarmerShowZonePaths:SetSize(150, 25)
buttonFarmerShowZonePaths:SetPoint("TOPLEFT", settings, "TOPLEFT", 170, -230)
buttonFarmerShowZonePaths:SetText("Show zone paths")
local setFont = buttonFarmerShowZonePaths:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonFarmerShowZonePaths:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonFarmerShowZonePaths:SetBackdropColor(0, 0, 0, 0.4)
buttonFarmerShowZonePaths:SetBackdropBorderColor(0, 0, 0, 1)
--TextboxZoneID
local textboxZoneID = CreateFrame("EditBox", "2panel_settings_textboxZoneID", settings, "InputBoxTemplate")
textboxZoneID:SetSize(90, 25)
textboxZoneID:SetPoint("TOPLEFT", settings, "TOPLEFT", 350, -230)
textboxZoneID:SetAutoFocus(false)
textboxZoneID:SetText("")
--TextboxZoneID text
local textboxZoneID_text = textboxZoneID:CreateFontString(nil, "OVERLAY")
textboxZoneID_text:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
textboxZoneID_text:SetPoint("CENTER", -5, 20)
textboxZoneID_text:SetText("Zone ID")
buttonFarmerShowZonePaths:SetScript("OnEnter", function(self)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerShowZonePaths:SetScript("OnLeave", function(self)
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonFarmerShowZonePaths:SetScript("OnClick", function(self)
    SendChatMessage(".bots farmer showZonePaths "..textboxZoneID:GetText())
    textboxZoneID:ClearFocus()
end)
------------------------------------------------------------------------------
--Button .GPS
local buttonGPS = CreateFrame("Button", "2panel_settings_buttonGPS", settings)
buttonGPS:SetSize(55, 45)
buttonGPS:SetPoint("TOPLEFT", settings, "TOPLEFT", 540, -250)
buttonGPS:SetText("GPS")
local setFont = buttonGPS:GetFontString()
setFont:SetFont("Fonts\\FRIZQT__.TTF", 10)
setFont:SetPoint("CENTER", 0, 0)
buttonGPS:SetBackdrop ({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Buttons/WHITE8x8",
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
buttonGPS:SetBackdropColor(0, 0, 0, 0.4)
buttonGPS:SetBackdropBorderColor(0, 0, 0, 1)
buttonGPS:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("Shows all the data you need in chat. (.gps)", 1, 1, 1, 1, true)
    self:SetBackdropColor(0, 0, 0, 0.8)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonGPS:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
    self:SetBackdropColor(0, 0, 0, 0.5)
    self:SetBackdropBorderColor(0, 0, 0, 1)
end)
buttonGPS:SetScript("OnClick", function(self)
    SendChatMessage(".gps")
end)
--use TAB for ALL textboxes
textbox:SetScript("OnTabPressed", function(self)
    textbox2:SetFocus()
end)
textbox2:SetScript("OnTabPressed", function(self)
    textboxMinlevel:SetFocus()
end)
textboxMinlevel:SetScript("OnTabPressed", function(self)
    textboxMaxlevel:SetFocus()
end)
textboxMaxlevel:SetScript("OnTabPressed", function(self)
    textboxRadius:SetFocus()
end)
textboxRadius:SetScript("OnTabPressed", function(self)
    textboxTeamDisableID:SetFocus()
end)
textboxTeamDisableID:SetScript("OnTabPressed", function(self)
    textboxZoneID:SetFocus()
end)
textboxZoneID:SetScript("OnTabPressed", function(self)
    textbox:SetFocus()
end)
