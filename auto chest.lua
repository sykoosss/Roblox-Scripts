-- Services
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Player
local LocalPlayer = Players.LocalPlayer

-- Default Configuration (can be overridden by _G.Config)
local DefaultConfig = {
    StopOnRareItem = true,
    StartDelay = 5, -- Increased to 5 seconds permanent delay
    TeleportDelay = 1.2,
    ChestScanDelay = 0.3,
    Team = "Pirates", -- Default team (can be "Marines" or "Pirates")
    RareItems = {
        ["God's Chalice"] = true,
        ["Fist Of Darkness"] = true
    }
}

-- Merge _G.Config with DefaultConfig
local Config = setmetatable(_G.Config or {}, {
    __index = DefaultConfig
})

-- Ensure RareItems exists
Config.RareItems = Config.RareItems or DefaultConfig.RareItems

-- State Management
local State = {
    Farming = false, -- Start disabled to allow team selection
    Active = true,
    Initialized = false
}

-- Set Team Function
local function SetTeam(team)
    Config.Team = team
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", team)
    game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", team)
    end)
end

-- GUI Creation
local function CreateGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ChestFarmer"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "Main"
    MainFrame.Size = UDim2.new(0, 200, 0, 230) -- Increased height for delay display
    MainFrame.Position = UDim2.new(0.8, 0, 0.3, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = "CHEST FARMER"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Parent = MainFrame

    -- Delay Countdown
    local DelayFrame = Instance.new("Frame")
    DelayFrame.Name = "Delay"
    DelayFrame.BackgroundTransparency = 1
    DelayFrame.Size = UDim2.new(1, -20, 0, 30)
    DelayFrame.Position = UDim2.new(0, 10, 0, 40)
    DelayFrame.Parent = MainFrame

    local DelayLabel = Instance.new("TextLabel")
    DelayLabel.Name = "Label"
    DelayLabel.Text = "Starting in: 5"
    DelayLabel.Font = Enum.Font.Gotham
    DelayLabel.TextSize = 14
    DelayLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    DelayLabel.BackgroundTransparency = 1
    DelayLabel.Size = UDim2.new(1, 0, 1, 0)
    DelayLabel.TextXAlignment = Enum.TextXAlignment.Center
    DelayLabel.Parent = DelayFrame

    -- Team Selection
    local TeamFrame = Instance.new("Frame")
    TeamFrame.Name = "Team"
    TeamFrame.BackgroundTransparency = 1
    TeamFrame.Size = UDim2.new(1, -20, 0, 30)
    TeamFrame.Position = UDim2.new(0, 10, 0, 80)
    TeamFrame.Parent = MainFrame

    local TeamLabel = Instance.new("TextLabel")
    TeamLabel.Name = "Label"
    TeamLabel.Text = "Team:"
    TeamLabel.Font = Enum.Font.Gotham
    TeamLabel.TextSize = 14
    TeamLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    TeamLabel.BackgroundTransparency = 1
    TeamLabel.Size = UDim2.new(0.5, 0, 1, 0)
    TeamLabel.TextXAlignment = Enum.TextXAlignment.Left
    TeamLabel.Parent = TeamFrame

    local TeamButton = Instance.new("TextButton")
    TeamButton.Name = "Button"
    TeamButton.Text = Config.Team
    TeamButton.BackgroundColor3 = Config.Team == "Pirates" and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(50, 50, 200)
    TeamButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TeamButton.Font = Enum.Font.GothamBold
    TeamButton.TextSize = 14
    TeamButton.Size = UDim2.new(0.4, 0, 0.8, 0)
    TeamButton.Position = UDim2.new(0.6, 0, 0.1, 0)
    TeamButton.Parent = TeamFrame

    local TeamCorner = Instance.new("UICorner")
    TeamCorner.CornerRadius = UDim.new(0, 4)
    TeamCorner.Parent = TeamButton

    -- Toggle
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = "Toggle"
    ToggleFrame.BackgroundTransparency = 1
    ToggleFrame.Size = UDim2.new(1, -20, 0, 30)
    ToggleFrame.Position = UDim2.new(0, 10, 0, 120)
    ToggleFrame.Parent = MainFrame

    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Name = "Label"
    ToggleLabel.Text = "Enabled:"
    ToggleLabel.Font = Enum.Font.Gotham
    ToggleLabel.TextSize = 14
    ToggleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Size = UDim2.new(0.5, 0, 1, 0)
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ToggleFrame

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "Button"
    ToggleButton.Text = State.Farming and "ON" or "OFF"
    ToggleButton.BackgroundColor3 = State.Farming and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 14
    ToggleButton.Size = UDim2.new(0.4, 0, 0.8, 0)
    ToggleButton.Position = UDim2.new(0.6, 0, 0.1, 0)
    ToggleButton.Parent = ToggleFrame

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 4)
    ToggleCorner.Parent = ToggleButton

    -- Config Button
    local ConfigFrame = Instance.new("Frame")
    ConfigFrame.Name = "Config"
    ConfigFrame.BackgroundTransparency = 1
    ConfigFrame.Size = UDim2.new(1, -20, 0, 30)
    ConfigFrame.Position = UDim2.new(0, 10, 0, 160)
    ConfigFrame.Parent = MainFrame

    local ConfigLabel = Instance.new("TextLabel")
    ConfigLabel.Name = "Label"
    ConfigLabel.Text = "Stop on Rare:"
    ConfigLabel.Font = Enum.Font.Gotham
    ConfigLabel.TextSize = 14
    ConfigLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    ConfigLabel.BackgroundTransparency = 1
    ConfigLabel.Size = UDim2.new(0.5, 0, 1, 0)
    ConfigLabel.TextXAlignment = Enum.TextXAlignment.Left
    ConfigLabel.Parent = ConfigFrame

    local ConfigButton = Instance.new("TextButton")
    ConfigButton.Name = "Button"
    ConfigButton.Text = Config.StopOnRareItem and "ON" or "OFF"
    ConfigButton.BackgroundColor3 = Config.StopOnRareItem and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    ConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ConfigButton.Font = Enum.Font.GothamBold
    ConfigButton.TextSize = 14
    ConfigButton.Size = UDim2.new(0.4, 0, 0.8, 0)
    ConfigButton.Position = UDim2.new(0.6, 0, 0.1, 0)
    ConfigButton.Parent = ConfigFrame

    local ConfigCorner = Instance.new("UICorner")
    ConfigCorner.CornerRadius = UDim.new(0, 4)
    ConfigCorner.Parent = ConfigButton

    -- Hop Button
    local HopButton = Instance.new("TextButton")
    HopButton.Name = "Hop"
    HopButton.Text = "SERVER HOP"
    HopButton.BackgroundColor3 = Color3.fromRGB(70, 70, 200)
    HopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    HopButton.Font = Enum.Font.GothamBold
    HopButton.TextSize = 16
    HopButton.Size = UDim2.new(1, -20, 0, 35)
    HopButton.Position = UDim2.new(0, 10, 0, 190)
    HopButton.Parent = MainFrame

    local HopCorner = Instance.new("UICorner")
    HopCorner.CornerRadius = UDim.new(0, 6)
    HopCorner.Parent = HopButton

    -- Draggable
    local dragging, dragInput, dragStart, startPos
    MainFrame.InputBegan:Connect(function(input)
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

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Team Functionality
    TeamButton.MouseButton1Click:Connect(function()
        if Config.Team == "Pirates" then
            Config.Team = "Marines"
            TeamButton.Text = "Marines"
            TeamButton.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
        else
            Config.Team = "Pirates"
            TeamButton.Text = "Pirates"
            TeamButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        end
        SetTeam(Config.Team)
    end)

    -- Toggle Functionality
    ToggleButton.MouseButton1Click:Connect(function()
        State.Farming = not State.Farming
        ToggleButton.Text = State.Farming and "ON" or "OFF"
        ToggleButton.BackgroundColor3 = State.Farming and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    end)

    -- Config Functionality
    ConfigButton.MouseButton1Click:Connect(function()
        Config.StopOnRareItem = not Config.StopOnRareItem
        ConfigButton.Text = Config.StopOnRareItem and "ON" or "OFF"
        ConfigButton.BackgroundColor3 = Config.StopOnRareItem and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    end)

    -- Hop Functionality
    HopButton.MouseButton1Click:Connect(function()
        TeleportService:Teleport(game.PlaceId)
    end)

    -- Countdown timer
    local countdown = Config.StartDelay
    local timer = coroutine.create(function()
        while countdown > 0 do
            DelayLabel.Text = "Starting in: " .. countdown
            countdown = countdown - 1
            task.wait(1)
        end
        DelayLabel.Text = "Ready to farm!"
        State.Farming = true
        ToggleButton.Text = "ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        State.Initialized = true
    end)
    coroutine.resume(timer)

    return ScreenGui
end

-- Core Functions
local function HasRareItem()
    for _, container in pairs({LocalPlayer.Backpack, LocalPlayer:FindFirstChild("StarterGear")}) do
        if container then
            for _, item in pairs(container:GetChildren()) do
                if Config.RareItems[item.Name] then
                    return true
                end
            end
        end
    end
    return false
end

local function GetHumanoidRootPart()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    repeat RunService.Heartbeat:Wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    return LocalPlayer.Character.HumanoidRootPart
end

local function TeleportToChest(part)
    local hrp = GetHumanoidRootPart()
    if part and hrp then
        hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 3, 0))
        task.wait(Config.TeleportDelay)
    end
end

local function FindAndTeleportToChests()
    local chestContainers = {"ChestModels", "Chests"}
    
    for _, containerName in pairs(chestContainers) do
        local container = workspace:FindFirstChild(containerName)
        if container then
            for _, chest in pairs(container:GetChildren()) do
                if not State.Farming then break end
                if Config.StopOnRareItem and HasRareItem() then
                    State.Farming = false
                    return true -- Found rare item
                end
                
                local part = chest:FindFirstChild("Chest") or chest:FindFirstChildWhichIsA("BasePart", true)
                if part then
                    pcall(TeleportToChest, part)
                end
                task.wait(Config.ChestScanDelay)
            end
        end
    end
    return false
end

-- Main Loop
local function Main()
    -- Set initial team
    SetTeam(Config.Team)
    
    CreateGUI()
    
    -- Wait for initialization
    repeat task.wait() until State.Initialized
    
    while State.Active do
        if State.Farming then
            local foundRare = FindAndTeleportToChests()
            if foundRare then break end
            
            -- Server hop if still farming
            if State.Farming then
                TeleportService:Teleport(game.PlaceId)
                task.wait(5) -- Wait to prevent rapid hopping
            end
        else
            task.wait(1)
        end
    end
end

-- Start
Main()
 
