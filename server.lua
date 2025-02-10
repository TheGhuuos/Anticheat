--[[

Flaws:
 - Could be easily bypassed by someone that knows what they are doing

]]

-- // services
local Players = game:GetService("Players")

-- // function: AntiSpeed/AntiTP
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local Humanoid = character:WaitForChild("Humanoid")
		
		local CurrentPosition = HumanoidRootPart.Position;
		local PreviousPosition = HumanoidRootPart.Position;
		
		local IsFreeFalling = false
		
		Humanoid.StateChanged:Connect(function(_, state)
			if state == Enum.HumanoidStateType.Freefall then
				IsFreeFalling = true
			else
				IsFreeFalling = false
			end
		end)
		
		task.spawn(function()
			while task.wait(0.1) do
				CurrentPosition = HumanoidRootPart.Position
				local Magnitude = (CurrentPosition - PreviousPosition).Magnitude
				
				if Magnitude >= 30 then
					if not IsFreeFalling then 
						warn(player.Name.. " has teleported")
					end
				end
				PreviousPosition = HumanoidRootPart.Position
			end
		end)
		
	end)
end)
