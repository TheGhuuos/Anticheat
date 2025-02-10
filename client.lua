local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.CharacterAdded:Connect(function(character)
	local Humanoid = character:WaitForChild("Humanoid")

	Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if Humanoid.WalkSpeed > 16 then
			LocalPlayer:Kick()
		end
	end)
	
	Humanoid:GetPropertyChangedSignal("JumpHeight"):Connect(function()
		if Humanoid.JumpHeight > 8 then
			LocalPlayer:Kick()
		end
	end)
    
	Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
		if Humanoid.JumpPower > 50 then
			LocalPlayer:Kick()
		end
	end)
    
end)
