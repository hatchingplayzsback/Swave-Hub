--// Instances
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local ButtonHolder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

--// Properties
ScreenGui.Name = "ExecutorGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.100, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 436)
MainFrame.ClipsDescendants = true

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 30)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.0
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.ArialBold
Title.Text = "SwaveHub"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, -30, 0, 5)
Close.Size = UDim2.new(0,25, 0, 20)
Close.Font = Enum.Font.ArialBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 20

ButtonHolder.Name = "ButtonHolder"
ButtonHolder.Parent = MainFrame
ButtonHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonHolder.BackgroundTransparency = 1.0
ButtonHolder.Position = UDim2.new(0, 15, 0, 45)
ButtonHolder.Size = UDim2.new(1, -30, 1, -60)

UIListLayout.Parent = ButtonHolder
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

--// Drag Functionality
local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

--// Close Button
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

--// Button Data - Fixed syntax
local buttonFunctions = {
    ["nameless"] = "https://raw.githubusercontent.com/ily123950/Vulkan/refs/heads/main/Tr",
    ["chilli"] = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua",
    ["tp block"] = "https://raw.githubusercontent.com/hatchingplayzsback/kanye-carpet-tp-block-crack/refs/heads/main/kanye.lua",
    ["kdml block (DETECTED)"] = "https://raw.githubusercontent.com/sabscripts063-cloud/Kdml-Not-Me/refs/heads/main/BlockPlayer",
    ["FrostHub AP Spam"] = "https://api.luarmor.net/files/v4/loaders/7547d2fa667dcb231dd4fcec2b9a733b.lua",
    ["Auto Collect"] = "https://raw.githubusercontent.com/hatchingplayzsback/sab-auto-collect-using-path/refs/heads/main/autocollect.lua",
    ["Swave Tp (WORKING)"] = "https://raw.githubusercontent.com/hatchingplayzsback/swave-tp/refs/heads/main/swavetp.lua"
}

local buttonNames = {"nameless", "chilli", "tp block", "kdml block (DETECTED)", "FrostHub AP Spam", "Auto Collect", "Swave Tp (WORKING)"}

--// Button Creation and Animation
for i, name in ipairs(buttonNames) do
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")

    Button.Name = name
    Button.Parent = ButtonHolder
    Button.BackgroundColor3 = Color3.fromRGB(65, 65, 85)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(1, 0, 0, 45)
    Button.AutoButtonColor = false
    Button.Font = Enum.Font.GothamSemibold
    Button.Text = name:upper()
    Button.TextColor3 = Color3.fromRGB(240, 240, 240)
    Button.TextSize = 16
    Button.ClipsDescendants = true

    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button

    -- Hover Animation
    Button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 105)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(65, 65, 85)}):Play()
    end)

    -- Click Animation & Execution
    Button.MouseButton1Click:Connect(function()
        -- Click Effect
        local ClickEffect = Instance.new("Frame")
        ClickEffect.Parent = Button
        ClickEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickEffect.BackgroundTransparency = 0.7
        ClickEffect.Size = UDim2.new(0, 0, 0, 0)
        ClickEffect.Position = UDim2.new(0.5, 0, 0.5, 0)
        ClickEffect.AnchorPoint = Vector2.new(0.5, 0.5)
        local Corner = Instance.new("UICorner")
        Corner.Parent = ClickEffect
        Corner.CornerRadius = UDim.new(1,0)

        game:GetService("TweenService"):Create(ClickEffect, TweenInfo.new(0.4), {Size = UDim2.new(1.5,0,1.5,0), BackgroundTransparency = 1}):Play()
        game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(0.98, 0, 0, 43)}):Play()
        wait(0.1)
        game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 45)}):Play()
        wait(0.4)
        ClickEffect:Destroy()

        -- Execute the linked script
        local url = buttonFunctions[name]
        if url then
            pcall(function()
                local script = loadstring(game:HttpGet(url))()
                if script then script() end
            end)
        end
    end)
end

--// Make sure GUI is on top
ScreenGui.DisplayOrder = 9999999999999999999999999
