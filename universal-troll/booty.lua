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

-- StarterGui.Q_UI
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


-- StarterGui.Q_UI.booty
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


-- StarterGui.Q_UI.booty.LocalScript
G2L["3"] = Instance.new("LocalScript", G2L["2"]);



-- StarterGui.Q_UI.booty.UICorner
G2L["4"] = Instance.new("UICorner", G2L["2"]);



-- StarterGui.Q_UI.booty.Dragify
G2L["5"] = Instance.new("LocalScript", G2L["2"]);
G2L["5"]["Name"] = [[Dragify]];


-- StarterGui.Q_UI.booty.UIGradient
G2L["6"] = Instance.new("UIGradient", G2L["2"]);
G2L["6"]["Rotation"] = 45;
G2L["6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(51, 51, 51))};


-- StarterGui.Q_UI.booty.UIGradient.Gradient
G2L["7"] = Instance.new("LocalScript", G2L["6"]);
G2L["7"]["Name"] = [[Gradient]];


-- StarterGui.Q_UI.booty.LocalScript
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
-- StarterGui.Q_UI.booty.Dragify
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
-- StarterGui.Q_UI.booty.UIGradient.Gradient
local function C_7()
local script = G2L["7"];
	local btn = script.Parent.Parent
	local grad = btn:FindFirstChildOfClass("UIGradient")
	local rs = game:GetService("RunService")
	
	if not grad then return end
	
	local orig = grad.Color
	
	local function brighten(seq, f)
		local k = {}
		for _, p in ipairs(seq.Keypoints) do
			local c = p.Value
			local b = Color3.new(
				math.min(c.R * f, 1),
				math.min(c.G * f, 1),
				math.min(c.B * f, 1)
			)
			k[#k+1] = ColorSequenceKeypoint.new(p.Time, b)
		end
		return ColorSequence.new(k)
	end
	
	local bright = brighten(orig, 100)
	
	local function lerp(a, b, t)
		return Color3.new(
			a.R + (b.R - a.R) * t,
			a.G + (b.G - a.G) * t,
			a.B + (b.B - a.B) * t
		)
	end
	
	local tw = nil
	local function tween(from, to, dur)
		if tw then tw:Disconnect() end
		local st = tick()
		tw = rs.RenderStepped:Connect(function()
			local a = math.clamp((tick() - st) / dur, 0, 1)
			local k = {}
			for i, fk in ipairs(from.Keypoints) do
				local tk = to.Keypoints[i]
				if tk then
					k[#k+1] = ColorSequenceKeypoint.new(fk.Time, lerp(fk.Value, tk.Value, a))
				end
			end
			grad.Color = ColorSequence.new(k)
			if a >= 1 then tw:Disconnect() tw = nil end
		end)
	end
	
	btn.MouseEnter:Connect(function() tween(grad.Color, bright, 0.4) end)
	btn.MouseLeave:Connect(function() tween(grad.Color, orig, 0.4) end)
	
end;
task.spawn(C_7);

return G2L["1"], require;
