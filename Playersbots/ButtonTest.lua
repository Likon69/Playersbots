
local roundButton = CreateFrame("Button", "roundButton", UIParent, "SecureActionButtonTemplate")
roundButton:SetWidth(42)
roundButton:SetHeight(42)
roundButton:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
roundButton:SetMovable(true)
roundButton:EnableMouse(true)
roundButton:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\Normal")
roundButton:SetPushedTexture("Interface\\AddOns\\Playersbots\\Icons\\BigPushed")
roundButton:SetHighlightTexture("Interface\\AddOns\\Playersbots\\Icons\\BigHilite")
roundButton:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then
        if panel2:IsShown() then
            self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\Normal")
            panel2:Hide()
            panel3_mini:Hide()
            panel2_settings:Hide()
        else
            self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigShadow")
            panel2:Show()
        end
    end
end)

roundButton:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("Playersbots", "CENTER", 1, 1, 1, 1, 1, 1)
    GameTooltip:AddLine("Left click to show/hide Playersbots", 1, 1, 1, 1, true)
    GameTooltip:AddLine("Right click to drag", 1, 1, 1, 1, true)
    GameTooltip:Show()
end)

--roundButton SetNormalTexture and draggable
roundButton:RegisterForDrag("RightButton")
roundButton:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
roundButton:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)
roundButton:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)
-- roundButton:SetScript("OnMouseDown", function(self, button)
--     if button == "LeftButton" then
--         self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigShadow")
--     else
--         self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigPushed")
--     end
-- end)
roundButton:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" then
        self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\Normal")
    else
        self:SetNormalTexture("Interface\\AddOns\\Playersbots\\Icons\\BigPushed")
    end
end)
--Texture EC128.blp
local texture = roundButton:CreateTexture(nil, "OVERLAY")
texture:SetTexture("Interface\\AddOns\\Playersbots\\Icons\\EC128.blp")
texture:SetPoint("CENTER", roundButton, "CENTER", 0, 2)
texture:SetWidth(25)
texture:SetHeight(25)
texture:SetBlendMode("ADD")
texture:SetAlpha(1)
roundButton:SetScript("OnUpdate", function(self, elapsed)
    if self:GetButtonState() == "PUSHED" then
        texture:SetAlpha(0.5)
    else
        texture:SetAlpha(1)
    end
end)
-- Texture PetRingMask.blp
local texture3 = roundButton:CreateTexture(nil, "OVERLAY")
texture3:SetTexture("Interface\\AddOns\\Playersbots\\Icons\\Spinner.blp")
texture3:SetPoint("CENTER", roundButton, "CENTER", 0, 0)
texture3:SetWidth(65)
texture3:SetHeight(65)
texture3:SetBlendMode("ADD")
texture3:SetAlpha(1)
roundButton:SetScript("OnUpdate", function(self, elapsed) --Hide texture3
    if panel2:IsShown() then

        texture3:SetAlpha(0)
    else
        texture3:SetAlpha(1)
    end
end)






--create animation for roundButton left
local anim = CreateFrame("Frame", "anim", roundButton)
anim:SetAllPoints(roundButton)
local animation = CreateFrame("Frame", nil, roundButton)
animation:SetAllPoints(roundButton)
animation:SetFrameStrata("HIGH")
animation:SetScript("OnUpdate", function(self, elapsed)
    local angle = self.angle + elapsed * self.speed
    if angle > 360 then
        angle = angle - 360
    end
    self.angle = angle
    self.texture:SetRotation(angle)
end)
animation.texture = texture
animation.speed = 0.5
animation.angle = 0

--play animation if panel2 is shown
roundButton:SetScript("OnHide", function(self)
    animation:Show()
end)


--create rotation for texture3 left
local animationGroup3 = texture3:CreateAnimationGroup()
local animation3 = animationGroup3:CreateAnimation("Rotation")
animation3:SetDuration(1)
animation3:SetDegrees(180)
animation3:SetOrigin("CENTER", 0, 0)
animationGroup3:SetLooping("REPEAT")
animationGroup3:Play()
