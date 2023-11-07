local FishGuide2,str = GetControl("FishGuide2"),[[{"filters":{"completion":"uncaught","patch":[2,2.1,2.2,2.3,2.4,2.5,3,3.1,3.2,3.3,3.4,3.5,4,4.1,4.2,4.3,4.4,4.5,5,5.1,5.2,5.3,5.4,5.5,6,6.1,6.2,6.3,6.4,6.5],"extra":"all","hideAlwaysAvailable":false},"upcomingWindowFormat":"fromPrevClose","sortingType":"windowPeriods","theme":"dark","completed":[]] 
if not table.valid(FishGuide2) then
	ActionList:Get(10,41):Cast()
	FishGuide2 = GetControl("FishGuide2")
end 
if FishGuide2:IsOpen() then
	ml_global_information.AwaitThen(250, function()
		FishGuide2:Action("SetFishingMode")
		ml_global_information.AwaitThen(500, function()
			local data = FishGuide2:GetData()
			for _,fish in pairs(data.entries) do
				if fish.caught then
					str = str..fish.id..","
				end
			end
			FishGuide2:Action("SetSpearFishingMode")
			ml_global_information.AwaitThen(500, function()
				data = FishGuide2:GetData()
				for _,fish in pairs(data.entries) do
					if fish.caught then
						str = str..fish.id..","
					end
				end
				GUI:SetClipboardText(tostring(str:sub(1,-2)..[[],"pinned":[],"latestPatch":6.5}]]))
				FishGuide2:Close()
				io.popen([[explorer https://ffxiv.pf-n.co/ocean-fishing & explorer https://ff14fish.carbuncleplushy.com]]):close()
			end)
		end)
	end) 
end
