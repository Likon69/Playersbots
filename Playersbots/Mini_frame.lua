--creat panel3_mini and dragframe
local panel3_mini = CreateFrame("Frame", "panel3_mini", UIParent)
panel3_mini:SetSize(140, 60) -- width, height
panel3_mini:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
panel3_mini:SetMovable(true)
panel3_mini:EnableMouse(true)
panel3_mini:SetBackdrop({
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
panel3_mini:SetBackdropColor(0, 0, 0, 0.1)
panel3_mini:SetBackdropBorderColor(0, 0, 0, 0.5)
panel3_mini:Hide()
--add label
local label = panel3_mini:CreateFontString(nil, "OVERLAY")
--green
label:SetFont("Fonts\\ARIALN.ttf", 9, "OUTLINE")
label:SetTextColor(0, 1, 0)
label:SetPoint("CENTER", panel3_mini, "CENTER", -50, -23)
label:SetText("Follow")
--add label2
local label2 = panel3_mini:CreateFontString(nil, "OVERLAY")
--Yellow
label2:SetFont("Fonts\\ARIALN.ttf", 9, "OUTLINE")
label2:SetTextColor(1, 1, 0)
label2:SetPoint("CENTER", panel3_mini, "CENTER", 50, -23)
label2:SetText("Aggress")


--dragframe2
local dragframe2 = CreateFrame("Frame", "nil", panel3_mini)
dragframe2:SetSize(200, 10) -- width, height
dragframe2:SetPoint("BOTTOM", panel3_mini, "BOTTOM", 0, -20)
dragframe2:SetBackdrop({
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
dragframe2:SetBackdropColor(0, 0, 0, 0)
dragframe2:SetBackdropBorderColor(0, 0, 0, 0)
dragframe2:SetFrameStrata("HIGH")
dragframe2:SetFrameLevel(1)
dragframe2:SetScript("OnMouseDown", function(self, button) --move
    if button == "LeftButton" and not self.isMoving then
        self:GetParent():StartMoving();
        self.isMoving = true;
    end
end)
dragframe2:SetScript("OnMouseUp", function(self, button) --stop move
    if button == "LeftButton" and self.isMoving then
        self:GetParent():StopMovingOrSizing();
        self.isMoving = false;
    end
end)
--add texture List_Button_Hilite.blp
local texture = dragframe2:CreateTexture(nil, "OVERLAY")
texture:SetTexture("Interface\\AddOns\\Playersbots\\Icons\\List_Button_Hilite.blp")
texture:SetPoint("BOTTOM", dragframe2, "BOTTOM", 0, 5)
texture:SetWidth(200)
texture:SetHeight(50)
--MousseOver change texture
dragframe2:SetScript("OnEnter", function(self)
    texture:SetTexture("Interface\\AddOns\\Playersbots\\Icons\\greyList_Button_HiliteBlack.blp")
end)
dragframe2:SetScript("OnLeave", function(self)
    texture:SetTexture("Interface\\AddOns\\Playersbots\\Icons\\List_Button_Hilite.blp")
end)



--add buttonAttackMini
local buttonAttackMini = CreateFrame("Button", "buttonAttackMini", panel3_mini)
buttonAttackMini:SetSize(55, 55) -- width, height
buttonAttackMini:SetPoint("CENTER", panel3_mini, "CENTER", 0, 0)
buttonAttackMini:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\SwipeSmall")
buttonAttackMini:SetPushedTexture("Interface\\AddOns\\Playersbots\\Icons\\SmallNormal")
buttonAttackMini:SetHighlightTexture("Interface\\AddOns\\Playersbots\\Icons\\SmallHilite")
buttonAttackMini:SetBackdrop ({
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
buttonAttackMini:SetBackdropColor(0, 0, 0, 0)
buttonAttackMini:SetBackdropBorderColor(0, 0, 0, 0)
buttonAttackMini:SetScript("OnClick", function(self)
    if (IsInGroup()) then
        SendChatMessage(".bots attack")
    else
        print("You are not in group")
    end
end)
    
--add text A
local textA = buttonAttackMini:CreateFontString(nil, "OVERLAY")
textA:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
textA:SetTextColor(1, 0, 0)
textA:SetPoint("CENTER", buttonAttackMini, "CENTER", 1, 0)
textA:SetText("A")


--add roundbutton Follow
local roundbuttonFollow = CreateFrame("Button", "roundbuttonFollow", panel3_mini)
roundbuttonFollow:SetWidth(34)
roundbuttonFollow:SetHeight(34)
--add text OFF/ON
local textF = roundbuttonFollow:CreateFontString(nil, "OVERLAY")
textF:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
textF:SetTextColor(0, 1, 0)
textF:SetPoint("CENTER", roundbuttonFollow, "CENTER", 0, 0)
textF:SetText("ON")
roundbuttonFollow:SetPoint("CENTER", panel3_mini, "CENTER", -50,  0)
roundbuttonFollow:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigNormal")
roundbuttonFollow:SetPushedTexture("Interface\\AddOns\\Playersbots\\Icons\\BigPushed")
roundbuttonFollow:SetHighlightTexture("Interface\\AddOns\\Playersbots\\Icons\\Green")
roundbuttonFollow:SetScript("OnClick", function(self)
    if (IsInGroup()) then
        if (textF:GetText() == "ON") then
            textF:SetText("OFF")
            textF:SetTextColor(1, 0, 0)
            SendChatMessage(".bots follow 0")
            self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\Shadow")
            label:Hide()
        else
            textF:SetText("ON")
            textF:SetTextColor(0, 1, 0)
            SendChatMessage(".bots follow 1")
            self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigNormal")
            label:Show()
        end
    end
end)




--add roundbutton Aggressive
local roundbuttonAggressive = CreateFrame("Button", "roundbuttonAggressive", panel3_mini)
roundbuttonAggressive:SetWidth(34)
roundbuttonAggressive:SetHeight(34)
--add label1
local label1 = roundbuttonAggressive:CreateFontString(nil, "OVERLAY")
--Yellow
label1:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
label1:SetTextColor(1, 1, 0)
label1:SetPoint("CENTER", roundbuttonAggressive, "CENTER", 0, 0)
label1:SetText("ON")
roundbuttonAggressive:SetPoint("CENTER", panel3_mini, "CENTER", 50, 0)
roundbuttonAggressive:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigNormal")
roundbuttonAggressive:SetPushedTexture("Interface\\AddOns\\Playersbots\\Icons\\BigPushed")
roundbuttonAggressive:SetHighlightTexture("Interface\\AddOns\\Playersbots\\Icons\\Yellow")
roundbuttonAggressive:SetScript("OnClick", function(self)
    if (IsInGroup()) then
        if (label1:GetText() == "ON") then
            label1:SetText("OFF")
            label1:SetTextColor(1, 0, 0)
            SendChatMessage(".bots aggressive 0")
            self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\Shadow")
            label2:Hide()
        else
            label1:SetText("ON")
            label1:SetTextColor(1, 1, 0)
            SendChatMessage(".bots aggressive 1")
            self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigNormal")
            label2:Show()
        end
end
end)







