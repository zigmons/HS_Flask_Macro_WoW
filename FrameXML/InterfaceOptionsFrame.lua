local addonName, ham = ...
local defaults = {
	renewal = true,
	exhilaration = true,
	bitterImmunity = true,
	crimsonVial = false,
	desperatePrayer = true,
	verdantEmbrace = true,
}

local panel = CreateFrame("Frame")

function panel:OnEvent(event, addOnName)
	if addOnName == "InstahealAutoMacro" then
		HAMDB = HAMDB or CopyTable(defaults)
		self.db = HAMDB
		self:InitializeOptions()
	end
end

panel:RegisterEvent("ADDON_LOADED")
panel:SetScript("OnEvent", panel.OnEvent)

function panel:InitializeOptions()
	self.panel = CreateFrame("Frame")
	self.panel.name = "Instaheal Auto Macro"

	local title = self.panel:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
	title:SetPoint("TOP")
	title:SetText("InstaHeal Auto Macro Settings")
	
	local subtitle = self.panel:CreateFontString("ARTWORK", nil, "GameFontNormal")
	subtitle:SetPoint("TOPLEFT", 20, -30)
	subtitle:SetText("Here you can configure if you want to include class spells")


	local renewalButton = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	renewalButton:SetPoint("TOPLEFT", subtitle, 20, -30)
	renewalButton.Text:SetText("Druid - Use Renewal")
	renewalButton:HookScript("OnClick", function(_, btn, down)
		self.db.renewal = renewalButton:GetChecked()
	end)
	renewalButton:HookScript("OnEnter", function(_, btn, down)
		GameTooltip:SetOwner(renewalButton, "ANCHOR_TOPRIGHT")
		GameTooltip:SetSpellByID(ham.renewal);
		GameTooltip:Show()
	end)
	renewalButton:HookScript("OnLeave", function(_, btn, down)
		GameTooltip:Hide()
	end)
	renewalButton:SetChecked(self.db.renewal)

	local exhilarationButton = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	exhilarationButton:SetPoint("TOPLEFT", renewalButton, 0, -30)
	exhilarationButton.Text:SetText("Hunter - Use Exhilaration")
	exhilarationButton:HookScript("OnClick", function(_, btn, down)
		self.db.exhilaration = exhilarationButton:GetChecked()
	end)
	exhilarationButton:HookScript("OnEnter", function(_, btn, down)
		GameTooltip:SetOwner(exhilarationButton, "ANCHOR_TOPRIGHT")
		GameTooltip:SetSpellByID(ham.exhilaration);
		GameTooltip:Show()
	end)
	exhilarationButton:HookScript("OnLeave", function(_, btn, down)
		GameTooltip:Hide()
	end)
	exhilarationButton:SetChecked(self.db.exhilaration)

	local bitterImmunityButton = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	bitterImmunityButton:SetPoint("TOPLEFT", exhilarationButton, 0, -30)
	bitterImmunityButton.Text:SetText("Warrior - Use Bitter Immunity")
	bitterImmunityButton:HookScript("OnClick", function(_, btn, down)
		self.db.bitterImmunity = bitterImmunityButton:GetChecked()
	end)
	bitterImmunityButton:HookScript("OnEnter", function(_, btn, down)
		GameTooltip:SetOwner(bitterImmunityButton, "ANCHOR_TOPRIGHT")
		GameTooltip:SetSpellByID(ham.bitterImmunity);
		GameTooltip:Show()
	end)
	bitterImmunityButton:HookScript("OnLeave", function(_, btn, down)
		GameTooltip:Hide()
	end)
	bitterImmunityButton:SetChecked(self.db.bitterImmunity)

	local crimsonVialButton = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	crimsonVialButton:SetPoint("TOPLEFT", bitterImmunityButton, 0, -30)
	crimsonVialButton.Text:SetText("Rogue - Use Crimson Vial")
	crimsonVialButton:HookScript("OnClick", function(_, btn, down)
		self.db.crimsonVial = crimsonVialButton:GetChecked()
	end)
	crimsonVialButton:HookScript("OnEnter", function(_, btn, down)
		GameTooltip:SetOwner(crimsonVialButton, "ANCHOR_TOPRIGHT")
		GameTooltip:SetSpellByID(ham.crimsonVialSpell);
		GameTooltip:Show()
	end)
	crimsonVialButton:HookScript("OnLeave", function(_, btn, down)
		GameTooltip:Hide()
	end)
	crimsonVialButton:SetChecked(self.db.crimsonVial)

	local desperatePrayerButton = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	desperatePrayerButton:SetPoint("TOPLEFT", crimsonVialButton, 0, -30)
	desperatePrayerButton.Text:SetText("Priest - Use Desperate Prayer")
	desperatePrayerButton:HookScript("OnClick", function(_, btn, down)
		self.db.desperatePrayer = desperatePrayerButton:GetChecked()
	end)
	desperatePrayerButton:HookScript("OnEnter", function(_, btn, down)
		GameTooltip:SetOwner(desperatePrayerButton, "ANCHOR_TOPRIGHT")
		GameTooltip:SetSpellByID(ham.desperatePrayer);
		GameTooltip:Show()
	end)
	desperatePrayerButton:HookScript("OnLeave", function(_, btn, down)
		GameTooltip:Hide()
	end)
	desperatePrayerButton:SetChecked(self.db.desperatePrayer)

	local verdantEmbraceButton = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
	verdantEmbraceButton:SetPoint("TOPLEFT", desperatePrayerButton, 0, -30)
	verdantEmbraceButton.Text:SetText("Evoker - Use Verdant Embrace")
	verdantEmbraceButton:HookScript("OnClick", function(_, btn, down)
		self.db.verdantEmbrace = verdantEmbraceButton:GetChecked()
	end)
	verdantEmbraceButton:HookScript("OnEnter", function(_, btn, down)
		GameTooltip:SetOwner(verdantEmbraceButton, "ANCHOR_TOPRIGHT")
		GameTooltip:SetSpellByID(ham.verdantEmbrace);
		GameTooltip:Show()
	end)
	verdantEmbraceButton:HookScript("OnLeave", function(_, btn, down)
		GameTooltip:Hide()
	end)
	verdantEmbraceButton:SetChecked(self.db.verdantEmbrace)

	local btn = CreateFrame("Button", nil, self.panel, "UIPanelButtonTemplate")
	btn:SetPoint("TOPLEFT", verdantEmbraceButton, 0, -40)
	btn:SetText("Reset to Default")
	btn:SetWidth(120)
	btn:SetScript("OnClick", function()
		HAMDB = CopyTable(defaults)
		self.db = HAMDB
		renewalButton:SetChecked(self.db.renewal)
		exhilarationButton:SetChecked(self.db.exhilaration)
		bitterImmunityButton:SetChecked(self.db.bitterImmunity)
		crimsonVialButton:SetChecked(self.db.crimsonVial)
		desperatePrayerButton:SetChecked(self.db.desperatePrayer)
		verdantEmbraceButton:SetChecked(self.db.verdantEmbrace)
		print("Reset successful!")
	end)

	InterfaceOptions_AddCategory(self.panel)
end

SLASH_HAM1 = "/isth"
SLASH_HAM2 = "/instahealautomacro"

SlashCmdList.HAM = function(msg, editBox)
	InterfaceOptionsFrame_OpenToCategory(panel.panel)
end
