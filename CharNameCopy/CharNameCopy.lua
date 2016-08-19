StaticPopupDialogs["CHARNAMECOPY"] = {
    text = "Press CTRL+C to copy character name",
    button1 = "Close",
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    hasEditBox = true,
    OnShow = function(self, data)
        local name = GetUnitName("target", false)
        if name == nil then
            name = "NoTarget"
        end
        self.editBox:SetText(name)
        self.editBox:HighlightText()
        self.editBox:SetScript("OnEnterPressed", function(self)
            self:ClearFocus()
            StaticPopup_Hide("CHARNAMECOPY")
        end)
        self.editBox:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
            StaticPopup_Hide("CHARNAMECOPY")
        end)
    end,
}
SLASH_CHARNAMECOPY1 = "/cnc"
function SlashCmdList.CHARNAMECOPY(msg, editbox)
    if msg == "show" then
        StaticPopup_Show("CHARNAMECOPY")
        return
    end
    if msg == "hide" then
        StaticPopup_Hide("CHARNAMECOPY")
        return
    end
    print("|cFF33FF99CharNameCopy|cFFFFFFFF: /cnc show")
    print("|cFF33FF99CharNameCopy|cFFFFFFFF: /cnc hide")
end
