
-- Water UI Library for Roblox
-- Made to be GitHub-hostable and returnable via loadstring
-- Usage: local Water = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourname/yourrepo/main/sigma.lua"))()

local Water = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

function Water:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "WaterUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 450, 0, 300)
    Main.Position = UDim2.new(0.5, -225, 0.5, -150)
    Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Main.Parent = ScreenGui
    Main.Active = true
    Main.Draggable = true

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Text = title or "Water UI"
    Title.Parent = Main

    local Tabs = {}
    local function CreateTab(name)
        local Tab = Instance.new("Frame")
        Tab.Name = name
        Tab.Size = UDim2.new(1, 0, 1, -30)
        Tab.Position = UDim2.new(0, 0, 0, 30)
        Tab.BackgroundTransparency = 1
        Tab.Visible = false
        Tab.Parent = Main
        Tabs[name] = Tab
        return Tab
    end

    function Water:CreateTab(tabName)
        local TabFrame = CreateTab(tabName)

        return TabFrame, TabFrame
    end

    return Water
end

function Water:CreateToggle(text, parent, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(1, -20, 0, 30)
    Toggle.Position = UDim2.new(0, 10, 0, 10 + (#parent:GetChildren() * 35))
    Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.Text = "[ OFF ] " .. text
    Toggle.Parent = parent

    local state = false
    Toggle.MouseButton1Click:Connect(function()
        state = not state
        Toggle.Text = (state and "[ ON  ] " or "[ OFF ] ") .. text
        if callback then
            callback(state)
        end
    end)
end

function Water:CreateSlider(text, parent, min, max, step, callback)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, 10 + (#parent:GetChildren() * 35))
    Label.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Text = text .. ": " .. tostring(min)
    Label.Parent = parent

    local SliderButton = Instance.new("TextButton")
    SliderButton.Size = UDim2.new(1, -20, 0, 30)
    SliderButton.Position = UDim2.new(0, 10, 0, Label.Position.Y.Offset + 35)
    SliderButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    SliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.Text = "Click to increase"
    SliderButton.Parent = parent

    local current = min
    SliderButton.MouseButton1Click:Connect(function()
        current = math.clamp(current + step, min, max)
        Label.Text = text .. ": " .. tostring(current)
        if callback then
            callback(current)
        end
    end)
end

return Water
