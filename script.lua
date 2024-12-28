local teleportPad = script.Parent
local teleportDestination = game.Workspace:FindFirstChild("TeleportDestination")

-- Ensure the teleport destination exists
if not teleportDestination then
	warn("TeleportDestination is missing from the workspace!")
	return
end

-- Prevent the teleport destination from being affected by physics
if teleportDestination:IsA("BasePart") then
	teleportDestination.Anchored = true
	teleportDestination.CanCollide = false -- Optional: Players won't collide with it
end

teleportPad.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)

	if player then
		-- Teleport the player's character to the destination
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if humanoidRootPart then
			humanoidRootPart.CFrame = teleportDestination.CFrame + Vector3.new(0, 3, 0) -- Offset to avoid clipping
		end
	end
end)
