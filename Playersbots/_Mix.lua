-- Кружое возле миникарты (как в моих ротациях)
local p = CreateFrame("ScrollingMessageFrame", "PLAYER_BOT_TEXY", UIParent)
p:SetFontObject("CombatLogFont")
p:SetSize(150, 230)
p:SetPoint("CENTER", 0, 0)

-- 1
-- p:SetBackdrop({
-- bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32})

-- 2
-- p:SetBackdrop({
	-- bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
	-- edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
	-- tile     = true,
	-- tileSize = 32,
	-- edgeSize = 32,
	-- insets   = { left = 8, right = 8, top = 8, bottom = 8 }
-- })

-- 3
p:SetBackdrop({
bgFile = "Interface/Tooltips/UI-Tooltip-Background",
edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
tile = true,
tileSize = 32,
edgeSize = 16, --15

insets = {
left = 4, --5
right = 4,  --5
top = 4,  --5
bottom = 4, --5
}
})

p:SetBackdropColor(0, 0, 0, 1)
p:SetMaxLines(15)
p:SetFading(false)
p:Show();


--Передвигать мышью
PLAYER_BOT_TEXY:EnableMouse(true)
PLAYER_BOT_TEXY:SetMovable(true)
PLAYER_BOT_TEXY:SetUserPlaced(enable)
PLAYER_BOT_TEXY:SetClampedToScreen(true)
PLAYER_BOT_TEXY:SetScript("OnMouseDown", function(self) self:StartMoving() end)
PLAYER_BOT_TEXY:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
PLAYER_BOT_TEXY:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)














--Крестик
-- p.Close = CreateFrame("Button", nil, p, "SecureActionButtonTemplate");
-- p.Close:SetParent(p)
-- p.Close:SetPoint("TOPRIGHT", p, -4, -3);
-- p.Close:SetFrameStrata("HIGH");
-- p.Close:SetSize(16, 16)
-- local icon = p.Close:CreateTexture("roll_dice")
-- icon:SetAllPoints(true)
-- icon:SetTexture([[Interface\AddOns\Playersbots\Icons\x]]) 
-- p.Close.icon = icon
-- p.Close:SetScript("OnClick", function(self)
	-- p.Close:GetParent():Hide()
-- end);
-- p.Close:SetScript("OnUpdate", function(self) 
	-- if (MouseIsOver(icon)) then
		-- icon:SetTexture([[Interface\AddOns\Playersbots\Icons\x-red]])
	-- else
		-- icon:SetTexture([[Interface\AddOns\Playersbots\Icons\x]]) 
	-- end
-- end)
--02 - Menu 2.lua









local realmName = GetRealmName()

local f = CreateFrame("Frame")
local a
function a(self, event, ...) 
if not PLAYER_BOT_TEXYchat then


local function create_button(x, y, parent, text, scriptik)

local x = x or -10
local y = y or -41
local text = text or "text"
local parent = parent or UIParent
local scriptik = scriptik or "/run print(123)"

if realmName == "WoW Circle 3.3.5a Fun" then
f = CreateFrame("Button", nil, parent, "SecureActionButtonTemplate, ActionButtonTemplate, UIPanelButtonTemplate")
else
f = CreateFrame("Button", nil, parent, "SecureActionButtonTemplate, ActionButtonTemplate, UIGoldBorderButtonTemplate") -- !!!!
end
-- local f = CreateFrame("Button", nil, parent, "UIPanelButtonGrayTemplate")
f:SetPoint("TOP", x, y)
f:RegisterForClicks("AnyDown")
f:SetSize(65, 20)
f:SetNormalTexture(nil)
f:SetText("|cFF00FF00"..text.."|r") 
f:SetAttribute("type", "macro")
f:SetAttribute("macrotext", scriptik)

end;

local function create_line(x, y, parent)

local x = x or -10
local y = y or -41
local text = text or "text"
local parent = parent or UIParent
local scriptik = scriptik or "/run print(123)"

-- local f = CreateFrame("Button", nil, Minimap, "SecureActionButtonTemplate, ActionButtonTemplate, UIPanelButtonTemplate")
local f = CreateFrame("Button", nil, parent, "SecureActionButtonTemplate") -- !!!!
-- local f = CreateFrame("Button", nil, parent, "UIPanelButtonGrayTemplate")
f:SetPoint("TOP", x, y)
f:RegisterForClicks("AnyDown")
f:SetSize(140, 0.8)

local icon = f:CreateTexture("mop_icon")
icon:SetAllPoints(true)
icon:SetTexture([[Interface\AddOns\Playersbots\Icons\line]])
f.icon = icon

end



local x = -0
local y = -17

create_button(x, y*1, PLAYER_BOT_TEXY, "|t|cffff0000Attack", [[.bots attack]])

create_button(x, y*3, PLAYER_BOT_TEXY, "|t|cFFFFFF00Leave", [[/script LeaveParty()]])
create_button(x, y*4, PLAYER_BOT_TEXY, "|t|cFFFFFF00Uninvite", [[/uninvite]])

create_button(x, y*6, PLAYER_BOT_TEXY, "|t|cFFADFF2FHeal", [[.bot add 1]])
create_button(x, y*7, PLAYER_BOT_TEXY, "|t|cFFEE82EEDPS", [[.bot add 2]])
create_button(x, y*8, PLAYER_BOT_TEXY, "|t|cffC69B6DTank", [[.bot add 3]])

create_button(x, y*10, PLAYER_BOT_TEXY, "|t|cFFADFF2FRole heal", [[.bot role 1]])
create_button(x, y*11, PLAYER_BOT_TEXY, "|t|cFFEE82EERole dps", [[.bot role 2]])
create_button(x, y*12, PLAYER_BOT_TEXY, "|t|cffC69B6DRole tank", [[.bot role 3]])
create_button(x, y*13, PLAYER_BOT_TEXY, "|t|cff0000ffFollow", [[.bot follow]])--new command follow 
create_button(x, y*14, PLAYER_BOT_TEXY, "|t|cffff0000Bot aggress..", [[.bot aggressive]])--new command aggressive

PLAYER_BOT_TEXY:SetSize(85, 270)


PLAYER_BOT_TEXYchat = true end
end
f:SetScript("OnEvent", a) 
-- f:RegisterEvent("CURSOR_UPDATE")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
--04 - Создание.lua
 
