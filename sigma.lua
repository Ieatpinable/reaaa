local Water = {}

function Water:CreateWindow(title)
	local UI = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local UICorner = Instance.new("UICorner")
	local TopBar = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Icon = Instance.new("ImageLabel")
	local ExitButton = Instance.new("ImageButton")
	local Line = Instance.new("Frame")
	local Navigation = Instance.new("Frame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")
	local Line_2 = Instance.new("Frame")
	local Content = Instance.new("Frame")

	UI.Name = "UI"
	UI.Parent = game:GetService("Players").LocalPlayer.PlayerGui or game:GetService("CoreGui")
	UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	UI.ResetOnSpawn = false

	Main.Name = "Main"
	Main.Parent = UI
	Main.BackgroundColor3 = Color3.fromRGB(122, 122, 122)
	Main.Size = UDim2.new(0, 508, 0, 329)
	Main.Position = UDim2.new(0, 378, 0, 142)

	UIGradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 85, 255)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))
	}
	UIGradient.Rotation = 90
	UIGradient.Parent = Main

	UICorner.Parent = Main

	-- Additional setup (TopBar, Icon, Title, etc.)
	-- Navigation + Tabs would be added here dynamically

	return Water
end
