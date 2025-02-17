local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomExecutorGUI"
screenGui.Parent = playerGui
--------------------------------------------------------------------------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 555, 0, 305)
mainFrame.Position = UDim2.new(0.239, 0, 0.252, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true


local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

--------------------------------------------------------------------------------------------------------------------


local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Custom Executor"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.Gotham
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Parent = titleBar

-- Create the ScrollingFrame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -20, 1, -100)  -- Size of the scrolling area
scrollFrame.Position = UDim2.new(0, 10, 0, 60)  -- Position of the scroll area
scrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scrollFrame.ScrollingEnabled = true
scrollFrame.Parent = mainFrame

-- Create the TextBox inside the ScrollingFrame
local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(1, -20, 0, 680)  -- Adjust the TextBox size inside ScrollingFrame
scriptBox.Position = UDim2.new(0, 10, 0, 5)  -- Position inside ScrollingFrame
scriptBox.Text = "print('Hello world!')"
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
scriptBox.Font = Enum.Font.Gotham
scriptBox.TextSize = 16
scriptBox.ClearTextOnFocus = false
scriptBox.TextStrokeTransparency = 0.8
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.MultiLine = true  -- Allows multiline text input
scriptBox.Parent = scrollFrame

local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 30)
tabContainer.Position = UDim2.new(0, 0, 0, 30)
tabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabContainer.BorderSizePixel = 0
tabContainer.Parent = mainFrame

local newTabButton = Instance.new("TextButton")
newTabButton.Size = UDim2.new(0, 100, 1, 0)
newTabButton.Text = "Script"
newTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
newTabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
newTabButton.Font = Enum.Font.Gotham
newTabButton.TextSize = 14
newTabButton.BorderSizePixel = 0
newTabButton.Parent = tabContainer

local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1, 0, 0, 40)
buttonContainer.Position = UDim2.new(0, 0, 1, -40)
buttonContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
buttonContainer.BorderSizePixel = 0
buttonContainer.Parent = mainFrame

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(0, 100, 1, 0)
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
executeButton.Font = Enum.Font.Gotham
executeButton.TextSize = 14
executeButton.BorderSizePixel = 0
executeButton.Parent = buttonContainer


-- Apply corner radius to the buttons
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = executeButton

-- Create the Clear button
local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0, 100, 1, 0)
clearButton.Position = UDim2.new(0, 100, 0, 0)
clearButton.Text = "Clear"
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
clearButton.Font = Enum.Font.Gotham
clearButton.TextSize = 14
clearButton.BorderSizePixel = 0
clearButton.Parent = buttonContainer

clearButton.MouseButton1Click:Connect(function()
	scriptBox.Text = ""  -- Clears the text in the TextBox
end)

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0, 12)
corner2.Parent = clearButton

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 30)
closeButton.Position = UDim2.new(1, -50, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Font = Enum.Font.Gotham
closeButton.TextSize = 16
closeButton.BorderSizePixel = 0
closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()  -- Close the GUI when clicked
end)


local StarterGui = game:GetService("StarterGui")

local function SendNotification(Title, Text, Icon)
	StarterGui:SetCore("SendNotification", {
		Title = Title,
		Text = Text,
		Icon = Icon
	})
end


local safeEnvironment = {
	print = print,
	warn = warn,
	error = error,
	tonumber = tonumber,
	tostring = tostring,
	math = math,
	string = string,
	table = table,
	pairs = pairs,
	ipairs = ipairs,
	os = { time = os.time, clock = os.clock }, -- Только безопасные функции
}


closeButton.MouseEnter:Connect(function()
	closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end)
closeButton.MouseLeave:Connect(function()
	closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)

titleBar.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

titleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)






--------------------------------------------------------------------------------------------------------------------

-- Button click event handler
executeButton.MouseButton1Click:Connect(function()
	local scriptCode = scriptBox.Text
	local success, err = pcall(function()
		loadstring(scriptCode)()
	end)

	-- Send notification based on the result of script execution
	if success then
		print("The script was executed successfully!")
		SendNotification("Execution Result", "The script was executed successfully!", nil)
	else
		warn("Script execution error:", err)
		SendNotification("Execution Error", "Error: " .. err, nil)
	end
end)

local safeEnvironment = {
	print = print,
	warn = warn,
	math = math,
	string = string,
	table = table,
	pairs = pairs,
	ipairs = ipairs,
	-- И другие безопасные функции
}

executeButton.MouseButton1Click:Connect(function()
	local scriptCode = scriptBox.Text
	local func, err = loadstring(scriptCode)
	if func then
		setfenv(func, safeEnvironment)
		local success, execError = pcall(func)
		if success then
			SendNotification("Execution Result", "Script executed successfully!", nil)
		else
			SendNotification("Execution Error", "Error: " .. execError, nil)
		end
	else
		SendNotification("Error", "Invalid script: " .. err, nil)
	end
end)


scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scriptBox.TextBounds.Y + 20)
scriptBox:GetPropertyChangedSignal("Text"):Connect(function()
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scriptBox.TextBounds.Y + 20)
end)

scriptBox:GetPropertyChangedSignal("Text"):Connect(function()
	local text = scriptBox.Text
	scriptBox.Text = text:gsub("fn", "function")
end)

newTabButton.MouseButton1Click:Connect(function()
	-- Create a new tab
	local newTab = Instance.new("Frame")
	newTab.Size = UDim2.new(1, 0, 1, -30)
	newTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	newTab.Parent = mainFrame

	-- Add a TextBox or any other elements to the new tab
	local newTabBox = scriptBox:Clone()  -- Example: clone the original script box
	newTabBox.Parent = newTab
end)

scriptBox.Focused:Connect(function()
	scriptBox.BorderColor3 = Color3.fromRGB(31, 33, 30)  -- Green border on focus
end)

scriptBox.FocusLost:Connect(function()
	scriptBox.BorderColor3 = Color3.fromRGB(30, 30, 30)  -- Default border color when focus is lost
end)


-- Function to make the frame draggable
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

function dragify(Frame)
	local dragToggle = false
	local dragInput = nil
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		local tween = TweenService:Create(Frame, TweenInfo.new(0.30, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = newPosition})
		tween:Play()
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local tabs = {}  -- Список вкладок

local function createNewTab()
	local tab = Instance.new("Frame")
	tab.Size = UDim2.new(1, 0, 1, 0)
	tab.BackgroundTransparency = 1
	tab.Visible = false
	tab.Parent = scrollFrame

	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(1, -20, 0, 680)
	textBox.Position = UDim2.new(0, 10, 0, 5)
	textBox.Text = ""
	textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	textBox.Font = Enum.Font.Gotham
	textBox.TextSize = 16
	textBox.ClearTextOnFocus = false
	textBox.TextStrokeTransparency = 0.8
	textBox.TextXAlignment = Enum.TextXAlignment.Left
	textBox.TextYAlignment = Enum.TextYAlignment.Top
	textBox.MultiLine = true
	textBox.Parent = tab

	table.insert(tabs, tab)

	for _, t in ipairs(tabs) do
		t.Visible = false
	end
	tab.Visible = true
end

newTabButton.MouseButton1Click:Connect(createNewTab)
--------------------------------------------------------------------------------------------------------------------
scrollFrame.ScrollBarThickness = 8
scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
scrollFrame.ScrollBarImageTransparency = 0.5  -- Можно настроить прозрачность


scriptBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
	scrollFrame.CanvasSize = UDim2.new(0, scriptBox.TextBounds.X + 20, 0, scriptBox.TextBounds.Y + 20)
end)


if scriptBox.TextBounds.Y < scrollFrame.AbsoluteSize.Y then
	scrollFrame.ScrollBarThickness = 0  -- Скрывает полосу
else
	scrollFrame.ScrollBarThickness = 8  -- Показывает полосу
end

scriptBox.Size = UDim2.new(1, -20, 0, math.max(scriptBox.TextBounds.Y, 680))

local keywords = {
	["print"] = "blue",
	["function"] = "green",
	["end"] = "red",
	["local"] = "purple",
}

local function highlightSyntax(text)
	for word, color in pairs(keywords) do
		text = text:gsub(word, string.format('<font color="%s">%s</font>', color, word))
	end
	return text
end


scriptBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
	scrollFrame.CanvasSize = UDim2.new(0, scriptBox.TextBounds.X + 20, 0, scriptBox.TextBounds.Y + 20)
end)

local function checkForErrors(code)
	local success, err = pcall(function()
		loadstring(code)()
	end)
	if not success then
		SendNotification("Execution Error", "Error: " .. err, nil)
		return err  -- Возвращаем ошибку
	end
	return nil  -- Ошибок нет
end

local languages = {
	lua = {"print", "function", "local", "end"},
	python = {"print", "def", "if", "else"},
	javascript = {"console.log", "function", "var", "let"}
}

local function formatCode(code)
	-- Например, просто убираем лишние пробелы и добавляем отступы
	return code:gsub("\n", "\n\t")
end

formatCode(scriptBox.Text)


local function switchToDarkMode()
	scriptBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
end

local function switchToLightMode()
	scriptBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	scriptBox.TextColor3 = Color3.fromRGB(0, 0, 0)
end

local history = {}
local currentIndex = 0

local function addToHistory(text)
	table.insert(history, text)
	currentIndex = #history
end

local function undo()
	if currentIndex > 1 then
		currentIndex = currentIndex - 1
		scriptBox.Text = history[currentIndex]
	end
end

local function redo()
	if currentIndex < #history then
		currentIndex = currentIndex + 1
		scriptBox.Text = history[currentIndex]
	end
end

local function showTooltip(word)
	-- Отображение описания для функции
end
 

scriptBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
	local contentHeight = scriptBox.TextBounds.Y
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentHeight + 20)

	
	scrollFrame.ScrollBarThickness = contentHeight < scrollFrame.AbsoluteSize.Y and 0 or 8
end)

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.Z and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			undo() -- функция для отмены действия
		elseif input.KeyCode == Enum.KeyCode.Y and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
			redo() -- функция для повтора действия
		end
	end
end)


local fontSize = 18
scriptBox:GetPropertyChangedSignal("Text"):Connect(function()
	if #scriptBox.Text > 500 then
		fontSize = 14 -- Уменьшаем шрифт для длинного текста
	else
		fontSize = 18
	end
	scriptBox.TextSize = fontSize
end)





--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


-- Apply the drag functionality to the mainFrame
dragify(mainFrame)
