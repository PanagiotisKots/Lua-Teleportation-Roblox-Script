# Roblox Lua Teleportation Script

A simple teleportation script for **Roblox Studio** that teleports players to a designated destination when they touch a pad. This script is easy to set up and can be customized to fit your game's needs.

---

## Features
- **Player Teleportation**: Moves players to a specific location in the game when they touch the teleportation pad.
- **Error Handling**: Warns if the destination object is missing.
- **Smooth Placement**: Spawns players slightly above the destination to avoid clipping issues.
- **Physics-Safe**: Ensures the destination remains fixed by anchoring it.

---

## Setup Instructions

### 1. Create the Teleportation Pad
1. Open Roblox Studio and insert a **Part** into the workspace.
2. Rename the part to `TeleportPad` (or any name you prefer).

### 2. Create the Teleport Destination
1. Insert another **Part** into the workspace.
2. Place it where you want players to be teleported.
3. Rename this part to `TeleportDestination`.

### 3. Add the Script
1. Right-click the `TeleportPad` in the **Explorer** panel.
2. Select **Insert Object** → **Script**.
3. Copy and paste the following script into the new script:

```lua
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
```


### Customization Offset Adjustment

- Modify this line to change how high above the destination players spawn:

**humanoidRootPart.CFrame = teleportDestination.CFrame + Vector3.new(0, 3, 0)**

    Replace 3 with your desired height.

### Teleport Pad Appearance

- You can change the appearance of the TeleportPad (e.g., color, material) to match your game theme.
Troubleshooting

    **Destination Not Found**: Ensure the TeleportDestination part is named correctly and placed in the Workspace.
    **Player Clipping Issues**: Adjust the spawn offset (Vector3.new(0, 3, 0)) to prevent players from spawning inside objects.

