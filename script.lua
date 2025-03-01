local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MessageGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local message = Instance.new("TextLabel")
message.Name = "message"
message.Size = UDim2.new(1, 0, 1, 0)
message.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
message.BackgroundTransparency = 0.5
message.BorderSizePixel = 0
message.Text = "Message"
message.TextColor3 = Color3.new(1, 1, 1)
message.TextSize = 14
message.TextTransparency = 0
message.Parent = screenGui
