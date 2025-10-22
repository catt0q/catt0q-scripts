--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 7 | Scripts: 3 | Modules: 0 | Tags: 0
local G2L = {};

-- ServerStorage.Q_UI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["DisplayOrder"] = 100;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[Q_UI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;
-- Attributes
G2L["1"]:SetAttribute([[Color]], ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(61, 255, 191)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 128, 96))});
G2L["1"]:SetAttribute([[Mode]], [[]]);


-- ServerStorage.Q_UI.booty
G2L["2"] = Instance.new("TextButton", G2L["1"]);
G2L["2"]["TextWrapped"] = true;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["TextSize"] = 14;
G2L["2"]["AutoButtonColor"] = false;
G2L["2"]["TextScaled"] = true;
G2L["2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["2"]["FontFace"] = Font.new([[rbxassetid://12187373592]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["2"]["BackgroundTransparency"] = 0.5;
G2L["2"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Text"] = [[shake for kfc]];
G2L["2"]["Name"] = [[booty]];
G2L["2"]["Position"] = UDim2.new(0.41783, 0, 0.06038, 0);


-- ServerStorage.Q_UI.booty.LocalScript
G2L["3"] = Instance.new("LocalScript", G2L["2"]);



-- ServerStorage.Q_UI.booty.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);



-- ServerStorage.Q_UI.booty.Dragify
G2L["5"] = Instance.new("LocalScript", G2L["2"]);
G2L["5"]["Name"] = [[Dragify]];


-- ServerStorage.Q_UI.booty.UIGradient
G2L["6"] = Instance.new("UIGradient", G2L["2"]);
G2L["6"]["Rotation"] = 45;
G2L["6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(51, 51, 51))};


-- ServerStorage.Q_UI.booty.UIGradient.Gradient
G2L["7"] = Instance.new("LocalScript", G2L["6"]);
G2L["7"]["Name"] = [[Gradient]];


-- ServerStorage.Q_UI.booty.LocalScript
local function C_3()
local script = G2L["3"];
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	
	local player = Players.LocalPlayer
	local button = script.Parent
	local char = player.Character or player.CharacterAdded:Wait()
	
	local function loadAnimation()
		local humanoid = char:WaitForChild("Humanoid")
		local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://136720812089001"
		return animator:LoadAnimation(anim)
	end
	
	local toggled = false
	local animTrack
	local isTweening = false
	
	local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local onColor = Color3.fromRGB(0, 255, 0)
	local offColor = Color3.fromRGB(255, 0, 0)
	
	button.BackgroundColor3 = offColor
	
	button.MouseButton1Click:Connect(function()
		toggled = not toggled
	
		if toggled then
			animTrack = loadAnimation()
			animTrack.Looped = true
			animTrack.Priority = Enum.AnimationPriority.Action
			animTrack:Play(0, 99)
			animTrack:AdjustSpeed(1)
		else
			if animTrack then
				animTrack:Stop()
				animTrack:Destroy()
				animTrack = nil
			end
		end
	
		if not isTweening then
			isTweening = true
			local tween = TweenService:Create(button, tweenInfo, {
				BackgroundColor3 = toggled and onColor or offColor
			})
			tween:Play()
			tween.Completed:Connect(function()
				isTweening = false
			end)
		end
	end)
	
end;
task.spawn(C_3);
-- ServerStorage.Q_UI.booty.Dragify
local function C_5()
local script = G2L["5"];
	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
	    dragToggle = nil
	    local dragSpeed = .4
	    dragInput = nil
	    dragStart = nil
	    local dragPos = nil
	    function updateInput(input)
	        local Delta = input.Position - dragStart
	        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
	        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.40), {Position = Position}):Play()
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
	    game:GetService("UserInputService").InputChanged:Connect(function(input)
	        if input == dragInput and dragToggle then
	            updateInput(input)
	        end
	    end)
	end
	
	dragify(script.Parent)
end;
task.spawn(C_5);
-- ServerStorage.Q_UI.booty.UIGradient.Gradient
local function C_7()
local script = G2L["7"];
	local button = script.Parent.Parent
	local gradient = button:FindFirstChildOfClass("UIGradient")
	local runService = game:GetService("RunService")
	
	if not gradient then
		warn("UIGradient not found in the button!")
		return
	end
	
	local original = gradient.Color
	local function brightenColorSequence(seq, factor)
		local newKeypoints = {}
		for _, keypoint in ipairs(seq.Keypoints) do
			local c = keypoint.Value
			local brighter = Color3.new(
				math.min(c.R * factor, 1),
				math.min(c.G * factor, 1),
				math.min(c.B * factor, 1)
			)
			table.insert(newKeypoints, ColorSequenceKeypoint.new(keypoint.Time, brighter))
		end
		return ColorSequence.new(newKeypoints)
	end
	local bright = brightenColorSequence(original, 100)
	
	-- Lerp function between two Color3s
	local function lerpColor(c1, c2, alpha)
		return Color3.new(
			c1.R + (c2.R - c1.R) * alpha,
			c1.G + (c2.G - c1.G) * alpha,
			c1.B + (c2.B - c1.B) * alpha
		)
	end
	
	-- Manual tween function for ColorSequence
	local currentTween = nil
	local function tweenGradient(fromSeq, toSeq, duration)
		if currentTween then currentTween:Disconnect() end
		local startTime = tick()
	
		currentTween = runService.RenderStepped:Connect(function()
			local now = tick()
			local alpha = math.clamp((now - startTime) / duration, 0, 1)
	
			local keypoints = {}
			for i, fromKey in ipairs(fromSeq.Keypoints) do
				local toKey = toSeq.Keypoints[i]
				if toKey then
					local newColor = lerpColor(fromKey.Value, toKey.Value, alpha)
					table.insert(keypoints, ColorSequenceKeypoint.new(fromKey.Time, newColor))
				end
			end
	
			gradient.Color = ColorSequence.new(keypoints)
	
			if alpha >= 1 then
				currentTween:Disconnect()
				currentTween = nil
			end
		end)
	end
	-- Hover events
	button.MouseEnter:Connect(function()
		tweenGradient(gradient.Color, bright, 0.4)
	end)
	
	button.MouseLeave:Connect(function()
		tweenGradient(gradient.Color, original, 0.4)
	end)
	
end;
task.spawn(C_7);

return G2L["1"], require;
