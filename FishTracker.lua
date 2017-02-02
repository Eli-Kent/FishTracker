FishTracker_Data = {
		["Firefin Snapper"] = 0,
		["Raw Spotted Yellowtail"] = 0,
		["Raw Summer Bass"] = 0,
		["Rumsey Rum Black Label"] = 0,
		["Stranglekelp"] = 0,
		["Stonescale Eel"] = 0
}

function FishLootOpen()
	if (IsFishingLoot()) then
		local colorList={"9d9d9d","ffffff","1eff00","0070dd","a335ee","ff8000","e6cc80"}
		NumItems = GetNumLootItems()
		for i = 1,NumItems do 
			local FishTexture, FishItem, Quatity, Quality, Locked;
			FishTexture, FishItem, Quatity, Quality, Locked = GetLootSlotInfo(i)
			--SendChatMessage("\124cff"..colorList[quality+1].."\124Hitem:"..i..":0:0:0:0:0:0:0\124h"..item.."\124h\124r", PARTY)
			FishLink = GetLootSlotLink(i)
			SendChatMessage(FishLink, PARTY)
			if FishTracker_Data[FishItem] then
				for key,value in pairs(FishTracker_Data) do
					if(key == FishItem) then
						NewSum = value + 1
						FishTracker_Data[FishItem] = NewSum
					end
				end
			else
				FishTracker_Data[FishItem] = 1
			end
		end
	end
end

local Frame_Fish_Track = CreateFrame("Frame")
	Frame_Fish_Track:RegisterEvent("LOOT_OPENED")
	Frame_Fish_Track:SetScript("OnEvent", FishLootOpen)

local Frame_Fish_Parent = CreateFrame("Frame", "Fish_Parent_Frame", UIParent, "GameMenuButtonTemplate")
	Frame_Fish_Parent:SetWidth(224)
	Frame_Fish_Parent:SetHeight(204)
	Frame_Fish_Parent:SetPoint("CENTER",0,0)
	Frame_Fish_Parent:EnableMouse(true)
	Frame_Fish_Parent:SetMovable(true)
	Frame_Fish_Parent:RegisterForDrag("LeftButton")
	Frame_Fish_Parent:SetScript("OnDragStart", function(self) Frame_Fish_Parent:StartMoving() end)
	Frame_Fish_Parent:SetScript("OnDragStop", function(self) Frame_Fish_Parent:StopMovingOrSizing() end)
	Frame_Fish_Parent:SetBackdrop({bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
			edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
			edgeSize = 10,
			tileSize = 32,
			insets = {
				left = 2,
				right = 2,
				top = 2,
				bottom = 2,
				}
			})
	Frame_Fish_Parent:Hide()

function FishSort()
	if(FishTracker_Data) then
		NumFrames = 0
		for keytwo,valuetwo in pairs(FishTracker_Data) do
			if (keytwo == "Firefin Snapper") then
				Frame_Fish_Parent:CreateFontString("Firefin_Snapper","","GameFontNormal")
				Firefin_Snapper:SetText(keytwo)
				Firefin_Snapper:SetPoint("TOPLEFT",5,-5+(NumFrames * -15))
				Frame_Fish_Parent:CreateFontString("Firefin_Snapper_Count","","GameFontNormal")
				Firefin_Snapper_Count:SetText(valuetwo)
				Firefin_Snapper_Count:SetPoint("TOPRIGHT",-5,-5+(NumFrames * -15))
				NumFrames = NumFrames + 1
			elseif (keytwo == "Raw Spotted Yellowtail") then
				Frame_Fish_Parent:CreateFontString("Raw_Spotted_Yellowtail","","GameFontNormal")
				Raw_Spotted_Yellowtail:SetText(keytwo)
				Raw_Spotted_Yellowtail:SetPoint("TOPLEFT",5,-5+(NumFrames * -15))
				Frame_Fish_Parent:CreateFontString("Raw_Spotted_Yellowtail_Count","","GameFontNormal")
				Raw_Spotted_Yellowtail_Count:SetText(valuetwo)
				Raw_Spotted_Yellowtail_Count:SetPoint("TOPRIGHT",-5,-5+(NumFrames * -15))
				NumFrames = NumFrames + 1
			elseif (keytwo == "Raw Summer Bass") then
				Frame_Fish_Parent:CreateFontString("Raw_Summer_Bass","","GameFontNormal")
				Raw_Summer_Bass:SetText(keytwo)
				Raw_Summer_Bass:SetPoint("TOPLEFT",5,-5+(NumFrames * -15))
				Frame_Fish_Parent:CreateFontString("Raw_Summer_Bass_Count","","GameFontNormal")
				Raw_Summer_Bass_Count:SetText(valuetwo)
				Raw_Summer_Bass_Count:SetPoint("TOPRIGHT",-5,-5+(NumFrames * -15))
				NumFrames = NumFrames + 1
			elseif (keytwo == "Rumsey Rum Black Label") then
				Frame_Fish_Parent:CreateFontString("Rumsey_Rum_Black_Label","","GameFontNormal")
				Rumsey_Rum_Black_Label:SetText(keytwo)
				Rumsey_Rum_Black_Label:SetPoint("TOPLEFT",5,-5+(NumFrames * -15))
				Frame_Fish_Parent:CreateFontString("Rumsey_Rum_Black_Label_Count","","GameFontNormal")
				Rumsey_Rum_Black_Label_Count:SetText(valuetwo)
				Rumsey_Rum_Black_Label_Count:SetPoint("TOPRIGHT",-5,-5+(NumFrames * -15))
				NumFrames = NumFrames + 1
			elseif (keytwo == "Stonescale Eel") then
				Frame_Fish_Parent:CreateFontString("Stonescale_Eel","","GameFontNormal")
				Stonescale_Eel:SetText(keytwo)
				Stonescale_Eel:SetPoint("TOPLEFT",5,-5+(NumFrames * -15))
				Frame_Fish_Parent:CreateFontString("Stonescale_Eel_Count","","GameFontNormal")
				Stonescale_Eel_Count:SetText(valuetwo)
				Stonescale_Eel_Count:SetPoint("TOPRIGHT",-5,-5+(NumFrames * -15))
				NumFrames = NumFrames + 1		
			elseif (keytwo == "Stranglekelp") then
				Frame_Fish_Parent:CreateFontString("Stranglekelp","","GameFontNormal")
				Stranglekelp:SetText(keytwo)
				Stranglekelp:SetPoint("TOPLEFT",5,-5+(NumFrames * -15))
				Frame_Fish_Parent:CreateFontString("Stranglekelp_Count","","GameFontNormal")
				Stranglekelp_Count:SetText(valuetwo)
				Stranglekelp_Count:SetPoint("TOPRIGHT",-5,-5+(NumFrames * -15))
				NumFrames = NumFrames + 1
			end
		end
	else
		FishTracker_Data = {
		["Firefin Snapper"] = 0,
		["Raw Spotted Yellowtail"] = 0,
		["Raw Summer Bass"] = 0,
		["Rumsey Rum Black Label"] = 0,
		["Stranglekelp"] = 0,
		["Stonescale Eel"] = 0
}
	end
end
function SlashCmdList.FISHFRAME(msg, editbox)
	if (Frame_Fish_Parent) then
		if (Frame_Fish_Parent:IsVisible()) then
			Frame_Fish_Parent:Hide();
		else
			Frame_Fish_Parent:Show();
		end
		FishSort()
	end
end
if (Frame_Fish_Parent) then
	FishSort()
end

function SlashCmdList.FISHREMOVE(msg, editbox)
	for uno,duos in pairs(FishTracker_Data) do
		FishTracker_Data = nil
	end
end

SLASH_FISHFRAME1 = '/fishdata'
SLASH_FISHREMOVE1 = '/fishremove'