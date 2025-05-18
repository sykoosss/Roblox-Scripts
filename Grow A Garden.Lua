--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = game:GetService("Players");
local v1 = game:GetService("ReplicatedStorage");
local v2 = game:GetService("RunService");
local v3 = game:GetService("TweenService");
local v4 = v0.LocalPlayer;
local v5 = v4.Name;
local v6 = v4:WaitForChild("Backpack");
local v7 = workspace:WaitForChild("Farm");
local v8 = v1:WaitForChild("GameEvents"):WaitForChild("Sell_Inventory");
local v9 = false;
local v10 = 736.4 - (397 + 339);
local v11 = false;
local v12 = false;
local v13 = false;
local v14 = 538 - (262 + 176);
local v15 = 0;
local v16 = 1723 - (345 + 1376);
local v17 = false;
local v18;
local v19;
local v20 = {};
local v21 = 688 - (198 + 490);
local v22 = 4 - 3;
local v23 = 0.05;
local v24 = 0 - 0;
local v25 = 1206 - (696 + 510);
local v26 = 0.5 - 0;
local function v27()
	local FlatIdent_378D0 = 0;
	while true do
		if (FlatIdent_378D0 == 0) then
			for v206, v207 in ipairs(v7:GetChildren()) do
				local FlatIdent_2953F = 0;
				local v208;
				local v209;
				while true do
					if (FlatIdent_2953F == 0) then
						v208 = 1262 - (1091 + 171);
						v209 = nil;
						FlatIdent_2953F = 1;
					end
					if (FlatIdent_2953F == 1) then
						while true do
							if (v208 == 0) then
								v209 = v207:FindFirstChild("Important");
								if v209 then
									local FlatIdent_8D83D = 0;
									local v320;
									while true do
										if (FlatIdent_8D83D == 0) then
											v320 = v209:FindFirstChild("Data");
											if v320 then
												local FlatIdent_1743D = 0;
												local v342;
												local v343;
												while true do
													if (FlatIdent_1743D == 0) then
														v342 = 0 + 0;
														v343 = nil;
														FlatIdent_1743D = 1;
													end
													if (FlatIdent_1743D == 1) then
														while true do
															if (v342 == (0 - 0)) then
																v343 = v320:FindFirstChild("Owner");
																if (v343 and (v343.Value == v5)) then
																	v18 = v207;
																	v19 = v209:FindFirstChild("Plants_Physical");
																	return;
																end
																break;
															end
														end
														break;
													end
												end
											end
											break;
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
			end
			v18, v19 = nil, nil;
			break;
		end
	end
end
v27();
v7.ChildAdded:Connect(v27);
v7.ChildRemoved:Connect(v27);
local function v28()
	if not v19 then
		return;
	end
	table.clear(v20);
	local function v71(v210)
		for v259, v260 in ipairs(v210:GetChildren()) do
			local FlatIdent_43862 = 0;
			local v261;
			while true do
				if (0 == FlatIdent_43862) then
					if v260:FindFirstChild("Fruits") then
						v71(v260.Fruits);
					end
					v261 = v260:FindFirstChildWhichIsA("ProximityPrompt", true);
					FlatIdent_43862 = 1;
				end
				if (FlatIdent_43862 == 1) then
					if (v261 and v261.Enabled) then
						table.insert(v20, v260);
					end
					break;
				end
			end
		end
	end
	v71(v19);
end
local function v29()
	local FlatIdent_781F8 = 0;
	local v72;
	local v73;
	local v74;
	while true do
		if (2 == FlatIdent_781F8) then
			for v211, v212 in ipairs(v20) do
				local v213 = v212:FindFirstChildWhichIsA("BasePart");
				if v213 then
					local FlatIdent_7F35E = 0;
					local v278;
					local v279;
					while true do
						if (1 == FlatIdent_7F35E) then
							while true do
								if (v278 == (374 - (123 + 251))) then
									v279 = (v72.Position - v213.Position).Magnitude;
									if (not v74 or (v279 < v74)) then
										local FlatIdent_455BF = 0;
										while true do
											if (FlatIdent_455BF == 0) then
												v73 = v213;
												v74 = v279;
												break;
											end
										end
									end
									break;
								end
							end
							break;
						end
						if (FlatIdent_7F35E == 0) then
							v278 = 0 - 0;
							v279 = nil;
							FlatIdent_7F35E = 1;
						end
					end
				end
			end
			if v73 then
				local v262 = v73.Position + Vector3.new(0 - 0, 5, 0);
				local v263 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
				local v264 = v3:Create(v72, v263, {CFrame=CFrame.new(v262)});
				v264:Play();
				local v265 = workspace.CurrentCamera;
				if (v265.CameraSubject ~= v4.Character:FindFirstChild("Humanoid")) then
					v265.CameraSubject = v4.Character:FindFirstChild("Humanoid");
				end
			end
			break;
		end
		if (1 == FlatIdent_781F8) then
			if not v72 then
				return;
			end
			v73, v74 = nil;
			FlatIdent_781F8 = 2;
		end
		if (FlatIdent_781F8 == 0) then
			if v17 then
				return;
			end
			v72 = v4.Character and v4.Character:FindFirstChild("HumanoidRootPart");
			FlatIdent_781F8 = 1;
		end
	end
end
local function v30()
	if v17 then
		return;
	end
	local v75 = v4.Character and v4.Character:FindFirstChild("HumanoidRootPart");
	if not v75 then
		return;
	end
	local v76, v77;
	for v214, v215 in ipairs(v20) do
		local v216 = v215:FindFirstChildWhichIsA("BasePart");
		if v216 then
			local FlatIdent_9147D = 0;
			local v280;
			while true do
				if (FlatIdent_9147D == 0) then
					v280 = (v75.Position - v216.Position).Magnitude;
					if (not v77 or (v280 < v77)) then
						local FlatIdent_6A83E = 0;
						while true do
							if (FlatIdent_6A83E == 0) then
								v76 = v216;
								v77 = v280;
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
	if v76 then
		local FlatIdent_2D2B8 = 0;
		local v266;
		local v267;
		while true do
			if (FlatIdent_2D2B8 == 1) then
				while true do
					if (v266 == (0 + 0)) then
						v267 = v76.Parent:FindFirstChildWhichIsA("ProximityPrompt", true);
						if (v267 and v267.Enabled) then
							fireproximityprompt(v267);
						end
						break;
					end
				end
				break;
			end
			if (FlatIdent_2D2B8 == 0) then
				v266 = 698 - (208 + 490);
				v267 = nil;
				FlatIdent_2D2B8 = 1;
			end
		end
	end
end
local function v31()
	local FlatIdent_8DCA9 = 0;
	local v78;
	local v79;
	local v80;
	local v81;
	while true do
		if (FlatIdent_8DCA9 == 0) then
			v78 = 0 + 0;
			v79 = nil;
			FlatIdent_8DCA9 = 1;
		end
		if (FlatIdent_8DCA9 == 2) then
			while true do
				local FlatIdent_324DE = 0;
				while true do
					if (FlatIdent_324DE == 1) then
						if (v78 == (678 - (534 + 141))) then
							if (v4.Character and v4.Character:FindFirstChild("HumanoidRootPart")) then
								local v302 = v81.CFrame.LookVector * 3;
								local v303 = v81.Position + v302 + Vector3.new(0 + 0, 1, 0);
								v4.Character.HumanoidRootPart.CFrame = CFrame.new(v303, v81.Position);
								return true;
							end
							return false;
						end
						if (v78 == (1 + 0)) then
							local FlatIdent_207CC = 0;
							while true do
								if (FlatIdent_207CC == 1) then
									v78 = 2 + 0;
									break;
								end
								if (FlatIdent_207CC == 0) then
									v80 = v79:FindFirstChild("Steven");
									if not v80 then
										local FlatIdent_AC2F = 0;
										while true do
											if (FlatIdent_AC2F == 0) then
												warn("Steven not found.");
												return false;
											end
										end
									end
									FlatIdent_207CC = 1;
								end
							end
						end
						break;
					end
					if (0 == FlatIdent_324DE) then
						if (v78 == 2) then
							local FlatIdent_7909D = 0;
							while true do
								if (FlatIdent_7909D == 1) then
									v78 = 839 - (660 + 176);
									break;
								end
								if (FlatIdent_7909D == 0) then
									v81 = v80:FindFirstChildWhichIsA("BasePart");
									if not v81 then
										warn("Steven has no BasePart.");
										return false;
									end
									FlatIdent_7909D = 1;
								end
							end
						end
						if (v78 == (0 + 0)) then
							v79 = workspace:FindFirstChild("NPCS");
							if not v79 then
								local FlatIdent_4CC24 = 0;
								while true do
									if (FlatIdent_4CC24 == 0) then
										warn("NPCS folder not found.");
										return false;
									end
								end
							end
							v78 = 203 - (14 + 188);
						end
						FlatIdent_324DE = 1;
					end
				end
			end
			break;
		end
		if (FlatIdent_8DCA9 == 1) then
			v80 = nil;
			v81 = nil;
			FlatIdent_8DCA9 = 2;
		end
	end
end
v2.Heartbeat:Connect(function(v82)
	local v83 = 0 - 0;
	while true do
		if (v83 == 1) then
			v24 = v24 + v82;
			v25 = v25 + v82;
			v83 = 2 - 0;
		end
		if (v83 == 2) then
			local FlatIdent_89237 = 0;
			while true do
				if (FlatIdent_89237 == 0) then
					if (v21 >= v22) then
						local v305 = 0 - 0;
						while true do
							if (v305 == 0) then
								v28();
								v21 = 0 + 0;
								break;
							end
						end
					end
					if (v13 and (v25 >= v26)) then
						local FlatIdent_7F121 = 0;
						local v306;
						local v307;
						while true do
							if (FlatIdent_7F121 == 0) then
								v306 = 0 + 0;
								v307 = nil;
								FlatIdent_7F121 = 1;
							end
							if (FlatIdent_7F121 == 1) then
								while true do
									if (v306 == 1) then
										v25 = 396 - (115 + 281);
										break;
									end
									if (v306 == (0 - 0)) then
										local FlatIdent_47ABB = 0;
										while true do
											if (FlatIdent_47ABB == 1) then
												v306 = 1 - 0;
												break;
											end
											if (FlatIdent_47ABB == 0) then
												v307 = #v6:GetChildren();
												if ((v307 >= v14) and ((time() - v15) >= v16)) then
													local FlatIdent_45D37 = 0;
													while true do
														if (FlatIdent_45D37 == 1) then
															v17 = false;
															break;
														end
														if (FlatIdent_45D37 == 0) then
															v17 = true;
															if v31() then
																local v353 = 0 + 0;
																while true do
																	if (v353 == 1) then
																		v15 = time();
																		task.wait(0 - 0);
																		break;
																	end
																	if (v353 == 0) then
																		local FlatIdent_494F6 = 0;
																		while true do
																			if (FlatIdent_494F6 == 0) then
																				task.wait(0.1 - 0);
																				pcall(function()
																					v8:FireServer();
																				end);
																				FlatIdent_494F6 = 1;
																			end
																			if (FlatIdent_494F6 == 1) then
																				v353 = 868 - (550 + 317);
																				break;
																			end
																		end
																	end
																end
															end
															FlatIdent_45D37 = 1;
														end
													end
												end
												FlatIdent_47ABB = 1;
											end
										end
									end
								end
								break;
							end
						end
					end
					FlatIdent_89237 = 1;
				end
				if (FlatIdent_89237 == 1) then
					v83 = 3;
					break;
				end
			end
		end
		if (v83 == 3) then
			if ((v12 or v11) and (v24 >= v23) and not v17) then
				local v308 = v4.Character and v4.Character:FindFirstChild("HumanoidRootPart");
				if (v308 and (#v20 > (0 - 0))) then
					local v334 = 0;
					local v335;
					local v336;
					local v337;
					while true do
						if (v334 == 1) then
							if (v335 and v336) then
								local FlatIdent_21DDC = 0;
								local v354;
								while true do
									if (FlatIdent_21DDC == 0) then
										v354 = 0 - 0;
										while true do
											if (v354 == 0) then
												if (v12 and (v337 > (290 - (134 + 151)))) then
													local v361 = v335.Size.Y;
													local v362 = 1671 - (970 + 695);
													local v363 = v335.Position + Vector3.new(0 - 0, v361 + v362, 1990 - (582 + 1408));
													local v364 = TweenInfo.new(0.2 - 0, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
													local v365 = v3:Create(v308, v364, {CFrame=CFrame.new(v363)});
													v365:Play();
													v365.Completed:Wait();
													local v366 = workspace.CurrentCamera;
													if (v366.CameraSubject ~= v4.Character:FindFirstChild("Humanoid")) then
														v366.CameraSubject = v4.Character:FindFirstChild("Humanoid");
													end
													task.wait(0 - 0);
												end
												if v11 then
													local FlatIdent_FA88 = 0;
													local v367;
													while true do
														if (FlatIdent_FA88 == 0) then
															v367 = 0;
															while true do
																if (v367 == (0 - 0)) then
																	task.wait(0);
																	fireproximityprompt(v336);
																	break;
																end
															end
															break;
														end
													end
												end
												break;
											end
										end
										break;
									end
								end
							end
							break;
						end
						if (v334 == (1824 - (1195 + 629))) then
							local FlatIdent_691EB = 0;
							while true do
								if (FlatIdent_691EB == 1) then
									v334 = 1 + 0;
									break;
								end
								if (FlatIdent_691EB == 0) then
									v335, v336, v337 = nil;
									for v348, v349 in ipairs(v20) do
										local FlatIdent_578E3 = 0;
										local v350;
										local v351;
										local v352;
										while true do
											if (FlatIdent_578E3 == 0) then
												v350 = 0 - 0;
												v351 = nil;
												FlatIdent_578E3 = 1;
											end
											if (FlatIdent_578E3 == 1) then
												v352 = nil;
												while true do
													if (v350 == (241 - (187 + 54))) then
														local FlatIdent_40070 = 0;
														while true do
															if (FlatIdent_40070 == 0) then
																v351 = v349:FindFirstChildWhichIsA("BasePart");
																v352 = v349:FindFirstChildWhichIsA("ProximityPrompt", true);
																FlatIdent_40070 = 1;
															end
															if (1 == FlatIdent_40070) then
																v350 = 1;
																break;
															end
														end
													end
													if (v350 == (781 - (162 + 618))) then
														if (v351 and v352 and v352.Enabled) then
															local FlatIdent_81225 = 0;
															local v359;
															local v360;
															while true do
																if (FlatIdent_81225 == 1) then
																	while true do
																		if (v359 == 0) then
																			v360 = (v308.Position - v351.Position).Magnitude;
																			if (not v337 or (v360 < v337)) then
																				local FlatIdent_42BD8 = 0;
																				local v372;
																				while true do
																					if (FlatIdent_42BD8 == 0) then
																						v372 = 0;
																						while true do
																							if (v372 == (0 + 0)) then
																								v335, v336 = v351, v352;
																								v337 = v360;
																								break;
																							end
																						end
																						break;
																					end
																				end
																			end
																			break;
																		end
																	end
																	break;
																end
																if (FlatIdent_81225 == 0) then
																	v359 = 0;
																	v360 = nil;
																	FlatIdent_81225 = 1;
																end
															end
														end
														break;
													end
												end
												break;
											end
										end
									end
									FlatIdent_691EB = 1;
								end
							end
						end
					end
				end
				v24 = 0;
			end
			break;
		end
		if (v83 == (0 - 0)) then
			if (not v11 and not v12 and not v13) then
				return;
			end
			v21 = v21 + v82;
			v83 = 1 - 0;
		end
	end
end);
local v32 = Instance.new("Sound");
v32.SoundId = "rbxassetid://18908611063";
v32.Volume = 1;
v32.Name = "StartupSound";
v32.Parent = game:GetService("SoundService");
v32:Play();
local v37 = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))();
local v38 = v37.CreateLib("Quantum|Hub", "Ocean");
local v39 = v38:NewTab("Main");
local v40 = v39:NewSection("Auto Farm");
v40:NewToggle("Collect Near", "Collects Fruits Near You!", function(v84)
	v11 = v84;
end);
v40:NewToggle("Teleport To Fruit", "Teleports You To Your Fruits!", function(v85)
	v12 = v85;
end);
v40:NewToggle("Reduce Lag", "Hides Your Trees!", function(v86)
	local FlatIdent_28855 = 0;
	local v87;
	while true do
		if (FlatIdent_28855 == 0) then
			v87 = game.Players.LocalPlayer;
			for v217, v218 in ipairs(workspace.Farm:GetChildren()) do
				local FlatIdent_331F0 = 0;
				local v219;
				local v220;
				while true do
					if (FlatIdent_331F0 == 0) then
						v219 = 0 + 0;
						v220 = nil;
						FlatIdent_331F0 = 1;
					end
					if (FlatIdent_331F0 == 1) then
						while true do
							if (v219 == (1636 - (1373 + 263))) then
								v220 = v218:FindFirstChild("Important");
								if v220 then
									local FlatIdent_6D68E = 0;
									local v322;
									local v323;
									while true do
										if (FlatIdent_6D68E == 0) then
											v322 = 1000 - (451 + 549);
											v323 = nil;
											FlatIdent_6D68E = 1;
										end
										if (FlatIdent_6D68E == 1) then
											while true do
												if (v322 == (0 + 0)) then
													v323 = v220:FindFirstChild("Plants_Physical");
													if v323 then
														for v355, v356 in ipairs(v323:GetChildren()) do
															if v356:IsA("Model") then
																for v357, v358 in ipairs(v356:GetChildren()) do
																	if v358:IsA("BasePart") then
																		local FlatIdent_82923 = 0;
																		while true do
																			if (FlatIdent_82923 == 0) then
																				v358.Transparency = (v86 and (1 - 0)) or 0;
																				v358.CanCollide = not v86;
																				break;
																			end
																		end
																	end
																end
															end
														end
													end
													break;
												end
											end
											break;
										end
									end
								end
								break;
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end);
v40:NewButton("Hold Heaviest Fruit", "Holds Your Heaviest Fruit!", function()
	local FlatIdent_83844 = 0;
	local v88;
	local v89;
	local v90;
	local v91;
	while true do
		if (1 == FlatIdent_83844) then
			v90 = nil;
			function v90(v221)
				local v222 = v221:match("%[(%d+%.?%d*)kg%]");
				if v222 then
					return tonumber(v222);
				end
				return 0 - 0;
			end
			FlatIdent_83844 = 2;
		end
		if (FlatIdent_83844 == 2) then
			v91 = nil;
			function v91()
				local v223 = 1384 - (746 + 638);
				local v224;
				local v225;
				while true do
					if ((0 + 0) == v223) then
						v224 = nil;
						v225 = 0 - 0;
						v223 = 342 - (218 + 123);
					end
					if ((1582 - (1535 + 46)) == v223) then
						for v309, v310 in pairs(v89:GetChildren()) do
							if v310:IsA("Tool") then
								local FlatIdent_651C5 = 0;
								local v338;
								local v339;
								while true do
									if (FlatIdent_651C5 == 0) then
										v338 = 0;
										v339 = nil;
										FlatIdent_651C5 = 1;
									end
									if (FlatIdent_651C5 == 1) then
										while true do
											if (v338 == (0 + 0)) then
												v339 = v90(v310.Name);
												if (v339 > v225) then
													local FlatIdent_6E549 = 0;
													while true do
														if (FlatIdent_6E549 == 0) then
															v225 = v339;
															v224 = v310;
															break;
														end
													end
												end
												break;
											end
										end
										break;
									end
								end
							end
						end
						if v224 then
							v88.Character.Humanoid:EquipTool(v224);
						end
						break;
					end
				end
			end
			FlatIdent_83844 = 3;
		end
		if (FlatIdent_83844 == 0) then
			v88 = game:GetService("Players").LocalPlayer;
			v89 = v88.Backpack;
			FlatIdent_83844 = 1;
		end
		if (FlatIdent_83844 == 3) then
			v91();
			break;
		end
	end
end);
local v0 = game:GetService("Players");
local v1 = game:GetService("ReplicatedStorage");
local v2 = game:GetService("RunService");
local v4 = v0.LocalPlayer;
local v41 = v4.Backpack;
local v42 = v1:WaitForChild("GameEvents"):WaitForChild("ActivePetService");
local v43 = false;
local function v44(v92)
	local FlatIdent_21CA5 = 0;
	local v93;
	local v94;
	while true do
		if (FlatIdent_21CA5 == 0) then
			v93 = 0 + 0;
			v94 = nil;
			FlatIdent_21CA5 = 1;
		end
		if (FlatIdent_21CA5 == 1) then
			while true do
				local FlatIdent_803FB = 0;
				while true do
					if (FlatIdent_803FB == 0) then
						if (0 == v93) then
							local FlatIdent_55D83 = 0;
							while true do
								if (FlatIdent_55D83 == 1) then
									v93 = 561 - (306 + 254);
									break;
								end
								if (FlatIdent_55D83 == 0) then
									v94 = v92:match("%[(%d+%.?%d*)kg%]");
									if v94 then
										return tonumber(v94);
									end
									FlatIdent_55D83 = 1;
								end
							end
						end
						if (v93 == (1 + 0)) then
							return 0 - 0;
						end
						break;
					end
				end
			end
			break;
		end
	end
end
local function v45()
	local FlatIdent_30F75 = 0;
	local v95;
	local v96;
	local v97;
	while true do
		if (0 == FlatIdent_30F75) then
			v95 = 1467 - (899 + 568);
			v96 = nil;
			FlatIdent_30F75 = 1;
		end
		if (1 == FlatIdent_30F75) then
			v97 = nil;
			while true do
				if ((1 + 0) == v95) then
					for v294, v295 in pairs(v41:GetChildren()) do
						if v295:IsA("Tool") then
							local FlatIdent_527C6 = 0;
							local v324;
							local v325;
							while true do
								if (FlatIdent_527C6 == 0) then
									v324 = 0 - 0;
									v325 = nil;
									FlatIdent_527C6 = 1;
								end
								if (1 == FlatIdent_527C6) then
									while true do
										if (v324 == (603 - (268 + 335))) then
											v325 = v44(v295.Name);
											if (v325 > v97) then
												local FlatIdent_656E9 = 0;
												while true do
													if (FlatIdent_656E9 == 0) then
														v97 = v325;
														v96 = v295;
														break;
													end
												end
											end
											break;
										end
									end
									break;
								end
							end
						end
					end
					if v96 then
						v4.Character.Humanoid:EquipTool(v96);
					end
					break;
				end
				if (v95 == (290 - (60 + 230))) then
					local FlatIdent_1BA2F = 0;
					while true do
						if (FlatIdent_1BA2F == 0) then
							v96 = nil;
							v97 = 572 - (426 + 146);
							FlatIdent_1BA2F = 1;
						end
						if (1 == FlatIdent_1BA2F) then
							v95 = 1 + 0;
							break;
						end
					end
				end
			end
			break;
		end
	end
end
local v46 = v38:NewTab("Sell💰");
local v47 = v46:NewSection("Auto Sell");
v47:NewToggle("Auto Sell", "Automatically Sells Your Inventory!", function(v98)
	v13 = v98;
end);
v47:NewSlider("Sell Plants At ", "Automatically Sells Your Fruits At The Selected Amount Below!", 1656 - (282 + 1174), 1, function(v99)
	v14 = v99;
end);
v47:NewButton("Sell Inventory", "Automatically Sells Your Whole Inventory With 1 Click!", function()
	if v31() then
		task.wait(811.2 - (569 + 242));
		v8:FireServer();
	end
end);
local v48 = v38:NewTab("Shop🛒");
local v49 = v48:NewSection("Ui");
v49:NewButton("Seed Ui", "Opens The Seed Ui!", function()
	local v100 = game:GetService("VirtualInputManager");
	local v101 = game:GetService("Players");
	local v102 = game:GetService("SoundService");
	local v103 = Enum.KeyCode.E;
	local v104 = 8 - 5;
	local function v105()
		local FlatIdent_699E4 = 0;
		local v226;
		local v227;
		local v228;
		local v229;
		local v230;
		local v231;
		local v233;
		while true do
			if (FlatIdent_699E4 == 0) then
				v226 = v101.LocalPlayer;
				v227 = v226.Character or v226.CharacterAdded:Wait();
				v228 = v227:WaitForChild("HumanoidRootPart");
				v229 = workspace:FindFirstChild("NPCS"):FindFirstChild("Sam");
				FlatIdent_699E4 = 1;
			end
			if (FlatIdent_699E4 == 2) then
				v230.CFrame = v228.CFrame * CFrame.new(1024 - (706 + 318), 1251 - (721 + 530), -v104);
				v233 = nil;
				function v233(v268)
					local v269 = 1271 - (945 + 326);
					local v270;
					while true do
						if (v269 == (0 - 0)) then
							v270 = v102:FindFirstChild(v268);
							if v270 then
								local FlatIdent_6E214 = 0;
								local v340;
								local v341;
								while true do
									if (FlatIdent_6E214 == 1) then
										while true do
											if (v340 == (0 + 0)) then
												v341 = v270:FindFirstChild("Sam");
												if v341 then
													v341:Play();
												end
												break;
											end
										end
										break;
									end
									if (FlatIdent_6E214 == 0) then
										v340 = 0;
										v341 = nil;
										FlatIdent_6E214 = 1;
									end
								end
							end
							break;
						end
					end
				end
				v233("NPC_SFX");
				FlatIdent_699E4 = 3;
			end
			if (FlatIdent_699E4 == 1) then
				if not v229 then
					local FlatIdent_98327 = 0;
					while true do
						if (FlatIdent_98327 == 0) then
							warn("Sam NPC not found!");
							return;
						end
					end
				end
				v230 = v229:FindFirstChild("HumanoidRootPart");
				if not v230 then
					local v281 = 0;
					while true do
						if ((0 + 0) == v281) then
							warn("Sam has no HRP!");
							return;
						end
					end
				end
				v231 = v230.CFrame;
				FlatIdent_699E4 = 2;
			end
			if (FlatIdent_699E4 == 3) then
				v233("Response_Text");
				v233("NPC_Text");
				for v271 = 1, 703 - (271 + 429) do
					local FlatIdent_508D4 = 0;
					while true do
						if (1 == FlatIdent_508D4) then
							v100:SendKeyEvent(false, v103, false, nil);
							break;
						end
						if (FlatIdent_508D4 == 0) then
							v100:SendKeyEvent(true, v103, false, nil);
							task.wait(0.03 + 0);
							FlatIdent_508D4 = 1;
						end
					end
				end
				task.wait(0.15);
				FlatIdent_699E4 = 4;
			end
			if (4 == FlatIdent_699E4) then
				v230.CFrame = v231;
				break;
			end
		end
	end
	local v106 = game:GetService("UserInputService");
	v106.InputBegan:Connect(function(v234, v235)
		if (not v235 and (v234.KeyCode == ACTIVATION_KEY)) then
			v105();
		end
	end);
	v105();
end);
v49:NewButton("Gear Shop TP", "Teleports You To The Gear Shop!", function()
	local v107 = game:GetService("Players");
	local v108 = v107.LocalPlayer;
	local v109 = v108.Character or v108.CharacterAdded:Wait();
	local v110 = v109:WaitForChild("HumanoidRootPart");
	local v111 = workspace:FindFirstChild("NPCS"):FindFirstChild("Eloise");
	if not v111 then
		local FlatIdent_1691A = 0;
		local v272;
		while true do
			if (FlatIdent_1691A == 0) then
				v272 = 1500 - (1408 + 92);
				while true do
					if (v272 == (1086 - (461 + 625))) then
						warn("Eloise not found!");
						return;
					end
				end
				break;
			end
		end
	end
	local v112 = v111:FindFirstChild("HumanoidRootPart");
	if not v112 then
		local FlatIdent_22A5C = 0;
		local v273;
		while true do
			if (0 == FlatIdent_22A5C) then
				v273 = 1288 - (993 + 295);
				while true do
					if (v273 == (0 + 0)) then
						local FlatIdent_52EE1 = 0;
						while true do
							if (FlatIdent_52EE1 == 0) then
								warn("Eloise has no HRP!");
								return;
							end
						end
					end
				end
				break;
			end
		end
	end
	v110.CFrame = v112.CFrame * CFrame.new(1171 - (418 + 753), 0 + 0, -3);
end);
v49:NewButton("Pet Stand TP", "Teleports You To The Front Of petStand", function()
	local FlatIdent_2DB3E = 0;
	local v114;
	local v115;
	local v116;
	local v117;
	local v118;
	local v119;
	local v120;
	local v121;
	local v122;
	while true do
		if (2 == FlatIdent_2DB3E) then
			v118 = nil;
			v119 = nil;
			FlatIdent_2DB3E = 3;
		end
		if (FlatIdent_2DB3E == 4) then
			v122 = nil;
			while true do
				if (v114 == (1 + 0)) then
					v118 = v117:WaitForChild("HumanoidRootPart");
					v119 = workspace.NPCS["Pet Stand"];
					if not v119 then
						local FlatIdent_8A8EC = 0;
						while true do
							if (0 == FlatIdent_8A8EC) then
								warn("Pet Stand not found!");
								return;
							end
						end
					end
					v114 = 1 + 1;
				end
				if (v114 == (529 - (406 + 123))) then
					local FlatIdent_253F0 = 0;
					while true do
						if (0 == FlatIdent_253F0) then
							v115 = game:GetService("Players");
							v116 = v115.LocalPlayer;
							FlatIdent_253F0 = 1;
						end
						if (1 == FlatIdent_253F0) then
							v117 = v116.Character or v116.CharacterAdded:Wait();
							v114 = 1770 - (1749 + 20);
							break;
						end
					end
				end
				if (v114 == (1 + 2)) then
					v118.CFrame = CFrame.lookAt(v122, v120.Position);
					print("Teleported to the left-front of Pet Stand!");
					break;
				end
				if (v114 == (1324 - (1249 + 73))) then
					local FlatIdent_6B9E2 = 0;
					while true do
						if (FlatIdent_6B9E2 == 0) then
							v120 = v119:GetPivot();
							v121 = (v120.LookVector * -(3 + 5)) + (v120.RightVector * -(1152.7 - (466 + 679)));
							FlatIdent_6B9E2 = 1;
						end
						if (FlatIdent_6B9E2 == 1) then
							v122 = v120.Position + v121;
							v114 = 6 - 3;
							break;
						end
					end
				end
			end
			break;
		end
		if (FlatIdent_2DB3E == 3) then
			v120 = nil;
			v121 = nil;
			FlatIdent_2DB3E = 4;
		end
		if (FlatIdent_2DB3E == 1) then
			v116 = nil;
			v117 = nil;
			FlatIdent_2DB3E = 2;
		end
		if (FlatIdent_2DB3E == 0) then
			v114 = 0 + 0;
			v115 = nil;
			FlatIdent_2DB3E = 1;
		end
	end
end);
local v50 = v48:NewSection("Auto Buy Seed");
v50:NewDropdown("Seed's To Buy:", "Automatically Buys The Selected Seed/s", {"Carrot","Strawberry","Blueberry","Orange Tulip","Tomato","Corn","Daffodil","Watermelon","Pumpkin","Apple","Bamboo","Coconut","Cactus","Dragon Fruit","Mango","Grape","Mushroom","Pepper","Cacao","Beanstalk"}, function(v123)
	getgenv().selectedFruits = v123;
end);
v50:NewToggle("Auto Buy The Seed:", "Automatically Buys The Selected Seed/s", function(v125)
	local v126 = 0 - 0;
	while true do
		if (v126 == (0 + 0)) then
			v9 = v125;
			if v9 then
				startAutoBuy();
			end
			break;
		end
	end
end);
function startAutoBuy()
	while v9 do
		local FlatIdent_322B4 = 0;
		local v236;
		local v237;
		while true do
			if (FlatIdent_322B4 == 1) then
				while true do
					if (v236 == (0 - 0)) then
						local FlatIdent_3E44E = 0;
						while true do
							if (FlatIdent_3E44E == 1) then
								v236 = 1;
								break;
							end
							if (FlatIdent_3E44E == 0) then
								v237 = {getgenv().selectedFruits};
								game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(unpack(v237));
								FlatIdent_3E44E = 1;
							end
						end
					end
					if (v236 == (66 - (30 + 35))) then
						wait(v10);
						break;
					end
				end
				break;
			end
			if (FlatIdent_322B4 == 0) then
				v236 = 0 + 0;
				v237 = nil;
				FlatIdent_322B4 = 1;
			end
		end
	end
end
v50:NewButton("Buy All Seeds", "Buys All The Seeds In The Stock", function()
	local FlatIdent_87441 = 0;
	local v127;
	local v128;
	local v129;
	local v130;
	local v131;
	local v132;
	local v133;
	while true do
		if (FlatIdent_87441 == 3) then
			v133 = nil;
			while true do
				if (v127 == (1257 - (1043 + 214))) then
					v128 = {"Carrot","Strawberry","Blueberry","Orange Tulip","Tomato","Corn","Daffodil","Watermelon","Pumpkin","Apple","Bamboo","Coconut","Cactus","Dragon Fruit","Mango","Grape","Mushroom","Pepper","Cacao","Beanstalk"};
					v129 = game:GetService("Players").LocalPlayer;
					v127 = 1;
				end
				if (v127 == (2 + 0)) then
					local FlatIdent_9525B = 0;
					while true do
						if (FlatIdent_9525B == 1) then
							v127 = 129 - (116 + 10);
							break;
						end
						if (FlatIdent_9525B == 0) then
							v132 = v131:WaitForChild("BuySeedStock");
							v133 = 0;
							FlatIdent_9525B = 1;
						end
					end
				end
				if (3 == v127) then
					task.spawn(function()
						while v133 < 36 do
							local v311 = v130.Value;
							for v326, v327 in ipairs(v128) do
								local FlatIdent_77CC3 = 0;
								local v328;
								while true do
									if (FlatIdent_77CC3 == 0) then
										v328 = 0 + 0;
										while true do
											if (v328 == (738 - (542 + 196))) then
												v132:FireServer(v327);
												task.wait(0.1);
												break;
											end
										end
										break;
									end
								end
							end
							v133 = v133 + 1;
							if (v130.Value == v311) then
								break;
							end
						end
					end);
					break;
				end
				if (1 == v127) then
					local FlatIdent_47A85 = 0;
					while true do
						if (FlatIdent_47A85 == 1) then
							v127 = 2;
							break;
						end
						if (FlatIdent_47A85 == 0) then
							v130 = v129:WaitForChild("leaderstats"):WaitForChild("Sheckles");
							v131 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents");
							FlatIdent_47A85 = 1;
						end
					end
				end
			end
			break;
		end
		if (FlatIdent_87441 == 2) then
			v131 = nil;
			v132 = nil;
			FlatIdent_87441 = 3;
		end
		if (FlatIdent_87441 == 0) then
			v127 = 0 + 0;
			v128 = nil;
			FlatIdent_87441 = 1;
		end
		if (FlatIdent_87441 == 1) then
			v129 = nil;
			v130 = nil;
			FlatIdent_87441 = 2;
		end
	end
end);
local v51 = v48:NewSection("Auto Buy Gear");
local v52 = {"Watering Can","Trowel","Recall Wrench","Basic Sprinkler","Advanced Sprinkler","Godly Sprinkler","Lightning Rod","Master Sprinkler","Favorite Tool"};
local v4 = game:GetService("Players").LocalPlayer;
local v53 = v4:WaitForChild("leaderstats"):WaitForChild("Sheckles");
local v54 = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents");
local v55 = v54:WaitForChild("BuyGearStock");
v51:NewDropdown("Gear To Buy:", "Automatically Buys The Selected Gear", v52, function(v134)
	getgenv().selectedGear = v134;
end);
v51:NewToggle("Auto Buy Selected Gear", "Buys The Selected Gear From Above!", function(v136)
	getgenv().AutoBuyEnabled = v136;
end);
task.spawn(function()
	while true do
		if getgenv().AutoBuyEnabled then
			local v286 = v53.Value;
			for v296 = 406 - (118 + 287), 20 do
				if getgenv().selectedGear then
					local FlatIdent_59521 = 0;
					local v329;
					local v330;
					while true do
						if (FlatIdent_59521 == 0) then
							v329 = 0 - 0;
							v330 = nil;
							FlatIdent_59521 = 1;
						end
						if (FlatIdent_59521 == 1) then
							while true do
								if (v329 == 0) then
									local FlatIdent_4D69A = 0;
									while true do
										if (0 == FlatIdent_4D69A) then
											v330 = {getgenv().selectedGear};
											v55:FireServer(unpack(v330));
											FlatIdent_4D69A = 1;
										end
										if (FlatIdent_4D69A == 1) then
											v329 = 1;
											break;
										end
									end
								end
								if (v329 == (2 - 1)) then
									task.wait(377 - (142 + 235));
									break;
								end
							end
							break;
						end
					end
				end
			end
			if (v53.Value == v286) then
				break;
			end
		end
		task.wait(0.1 - 0);
	end
end);
v51:NewButton("Buy All Gear", "Buys All Gear From The List", function()
	for v238, v239 in ipairs(v52) do
		local FlatIdent_2B4B0 = 0;
		while true do
			if (FlatIdent_2B4B0 == 0) then
				v55:FireServer(v239);
				task.wait(0.1);
				break;
			end
		end
	end
end);
local v56 = false;
local v49 = v48:NewSection("Auto Buy Egg");
v49:NewToggle("Auto Buy All Eggs", "When Toggled It Automatically Buys Every Egg In Stock!", function(v138)
	local FlatIdent_1077D = 0;
	while true do
		if (0 == FlatIdent_1077D) then
			v56 = v138;
			if v56 then
				task.spawn(function()
					while v56 do
						local FlatIdent_89C1C = 0;
						local v297;
						local v298;
						while true do
							if (FlatIdent_89C1C == 1) then
								while true do
									if (v297 == (977 - (553 + 424))) then
										wait();
										v298 = {1};
										v297 = 1 - 0;
									end
									if (v297 == (2 + 0)) then
										local FlatIdent_851CE = 0;
										while true do
											if (FlatIdent_851CE == 0) then
												game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(v298));
												v298 = {(2 + 1)};
												FlatIdent_851CE = 1;
											end
											if (FlatIdent_851CE == 1) then
												v297 = 2 + 1;
												break;
											end
										end
									end
									if (v297 == (1 + 0)) then
										local FlatIdent_82AB4 = 0;
										while true do
											if (FlatIdent_82AB4 == 1) then
												v297 = 4 - 2;
												break;
											end
											if (FlatIdent_82AB4 == 0) then
												game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(v298));
												v298 = {(5 - 3)};
												FlatIdent_82AB4 = 1;
											end
										end
									end
									if (v297 == (1 + 2)) then
										game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyPetEgg"):FireServer(unpack(v298));
										break;
									end
								end
								break;
							end
							if (FlatIdent_89C1C == 0) then
								v297 = 0 + 0;
								v298 = nil;
								FlatIdent_89C1C = 1;
							end
						end
					end
				end);
			end
			break;
		end
	end
end);
local v57 = v38:NewTab("Local🚶‍♂️");
local v58 = v57:NewSection("Local Player🚶‍♂️");
v58:NewSlider("WalkSpeed", "Changes How Fast You Walk!", 1933 - 1533, 16, function(v139)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v139;
end);
v58:NewSlider("JumpPower", "Changes How Far You Can Jump!", 1153 - (239 + 514), 18 + 32, function(v141)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = v141;
end);
getgenv().AutoJump = true;
v58:NewToggle("Anti AFK", "Automatically Jumps Every 18 Minutes Exactly!", function(v143)
	getgenv().AutoJump = v143;
end);
task.spawn(function()
	repeat
		task.wait(1);
	until game:IsLoaded() 
	getgenv().KEYBIND = Enum.KeyCode.Space;
	while true do
		local FlatIdent_93FA5 = 0;
		local v240;
		while true do
			if (0 == FlatIdent_93FA5) then
				v240 = 1329 - (797 + 532);
				while true do
					if (v240 == (0 + 0)) then
						if getgenv().AutoJump then
							local FlatIdent_8C1D5 = 0;
							local v331;
							while true do
								if (FlatIdent_8C1D5 == 0) then
									v331 = 0 + 0;
									while true do
										if (v331 == 1) then
											game:GetService("VirtualInputManager"):SendKeyEvent(false, getgenv().KEYBIND, false, game);
											break;
										end
										if (v331 == 0) then
											local FlatIdent_511F5 = 0;
											while true do
												if (FlatIdent_511F5 == 1) then
													v331 = 2 - 1;
													break;
												end
												if (0 == FlatIdent_511F5) then
													game:GetService("VirtualInputManager"):SendKeyEvent(true, getgenv().KEYBIND, false, game);
													task.wait(0.1);
													FlatIdent_511F5 = 1;
												end
											end
										end
									end
									break;
								end
							end
						end
						task.wait(2282 - (373 + 829));
						break;
					end
				end
				break;
			end
		end
	end
end);
v58:NewButton("Fly(F)", "Makes You Fly When You Press: F", function()
	local v147 = game:GetService("Players");
	local v148 = game:GetService("UserInputService");
	local v149 = game:GetService("RunService");
	local v150 = v147.LocalPlayer;
	local v151 = v150.Character or v150.CharacterAdded:Wait();
	local v152 = v151:WaitForChild("Humanoid");
	local v153 = v151:WaitForChild("HumanoidRootPart");
	local v154 = 150;
	local v155 = false;
	local v156 = nil;
	local function v157()
		local FlatIdent_4D23E = 0;
		while true do
			if (FlatIdent_4D23E == 0) then
				if v155 then
					return;
				end
				v156 = Instance.new("BodyVelocity");
				v156.Velocity = Vector3.new(0, v152.WalkSpeed, 731 - (476 + 255));
				v156.MaxForce = Vector3.new(5130 - (369 + 761), 2314 + 1686, 4000);
				FlatIdent_4D23E = 1;
			end
			if (FlatIdent_4D23E == 2) then
				v155 = true;
				v152.WalkSpeed = v154;
				print("Flying enabled (Press F to disable)");
				break;
			end
			if (FlatIdent_4D23E == 1) then
				v156.P = 2270 - 1020;
				v156.Parent = v153;
				v152:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
				v152:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
				FlatIdent_4D23E = 2;
			end
		end
	end
	local function v158()
		local v246 = 0 - 0;
		while true do
			if (v246 == (241 - (64 + 174))) then
				print("Flying disabled");
				break;
			end
			if (v246 == 1) then
				local FlatIdent_1F33B = 0;
				while true do
					if (FlatIdent_1F33B == 1) then
						v246 = 1 + 1;
						break;
					end
					if (FlatIdent_1F33B == 0) then
						v152:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
						v152:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true);
						FlatIdent_1F33B = 1;
					end
				end
			end
			if ((0 - 0) == v246) then
				if not v155 then
					return;
				end
				if v156 then
					local v332 = 0;
					while true do
						if (v332 == (336 - (144 + 192))) then
							v156:Destroy();
							v156 = nil;
							break;
						end
					end
				end
				v246 = 217 - (42 + 174);
			end
			if (v246 == (2 + 0)) then
				local FlatIdent_397D1 = 0;
				while true do
					if (FlatIdent_397D1 == 1) then
						v246 = 2 + 1;
						break;
					end
					if (FlatIdent_397D1 == 0) then
						v155 = false;
						v152.WalkSpeed = 14 + 2;
						FlatIdent_397D1 = 1;
					end
				end
			end
		end
	end
	v148.InputBegan:Connect(function(v247, v248)
		if (not v248 and (v247.KeyCode == Enum.KeyCode.F)) then
			if v155 then
				v158();
			else
				v157();
			end
		end
	end);
	v150.CharacterAdded:Connect(function(v249)
		local FlatIdent_1A6E7 = 0;
		local v250;
		while true do
			if (FlatIdent_1A6E7 == 0) then
				v250 = 1504 - (363 + 1141);
				while true do
					if (v250 == (1580 - (1183 + 397))) then
						local FlatIdent_5C19E = 0;
						while true do
							if (FlatIdent_5C19E == 1) then
								v250 = 2 - 1;
								break;
							end
							if (FlatIdent_5C19E == 0) then
								v151 = v249;
								v152 = v151:WaitForChild("Humanoid");
								FlatIdent_5C19E = 1;
							end
						end
					end
					if (v250 == 1) then
						v153 = v151:WaitForChild("HumanoidRootPart");
						if v155 then
							local FlatIdent_90271 = 0;
							local v333;
							while true do
								if (FlatIdent_90271 == 0) then
									v333 = 0 + 0;
									while true do
										if (v333 == (0 + 0)) then
											local FlatIdent_285D = 0;
											while true do
												if (FlatIdent_285D == 0) then
													v158();
													task.wait();
													FlatIdent_285D = 1;
												end
												if (FlatIdent_285D == 1) then
													v333 = 1976 - (1913 + 62);
													break;
												end
											end
										end
										if (1 == v333) then
											v157();
											break;
										end
									end
									break;
								end
							end
						end
						break;
					end
				end
				break;
			end
		end
	end);
	v149.Heartbeat:Connect(function()
		if (not v155 or not v153) then
			return;
		end
		local v251 = workspace.CurrentCamera;
		local v252 = Vector3.new(0, 0, 0);
		local v253 = v251.CFrame.LookVector;
		local v254 = v251.CFrame.RightVector;
		if v148:IsKeyDown(Enum.KeyCode.W) then
			v252 = v252 + v253;
		end
		if v148:IsKeyDown(Enum.KeyCode.S) then
			v252 = v252 - v253;
		end
		if v148:IsKeyDown(Enum.KeyCode.D) then
			v252 = v252 + v254;
		end
		if v148:IsKeyDown(Enum.KeyCode.A) then
			v252 = v252 - v254;
		end
		if v148:IsKeyDown(Enum.KeyCode.Space) then
			v252 = v252 + Vector3.new(0 + 0, 2 - 1, 1933 - (565 + 1368));
		end
		if v148:IsKeyDown(Enum.KeyCode.LeftControl) then
			v252 = v252 + Vector3.new(0 - 0, -(1662 - (1477 + 184)), 0 - 0);
		end
		if (v252.Magnitude > 0) then
			v252 = v252.Unit * v154;
		else
			v252 = Vector3.new(0 + 0, 856 - (564 + 292), 0 - 0);
		end
		if v156 then
			local FlatIdent_44652 = 0;
			while true do
				if (FlatIdent_44652 == 0) then
					v156.Velocity = v252;
					v153.AssemblyLinearVelocity = Vector3.new(v252.X, v252.Y * (0.7 - 0), v252.Z);
					break;
				end
			end
		end
	end);
end);
v58:NewButton("Infinite Jumps", "Makes You Jump infinitely", function()
	loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))();
end);
local v60 = v38:NewTab("Game🎮");
local v61 = v60:NewSection("Game");
v61:NewButton("Rejoin", "Rejoins The Server!", function()
	local v159 = game:GetService("TeleportService");
	local v160 = game:GetService("Players");
	local v161 = v160.LocalPlayer;
	local v162 = game.PlaceId;
	local v163 = game.JobId;
	v159:TeleportToPlaceInstance(v162, v163, v161);
end);
v61:NewButton("Server Hop", "Joins Another Server!", function()
	local FlatIdent_28E8A = 0;
	local v164;
	local v165;
	local v166;
	local v167;
	while true do
		if (1 == FlatIdent_28E8A) then
			v166 = game:GetService("Players");
			v167 = nil;
			FlatIdent_28E8A = 2;
		end
		if (FlatIdent_28E8A == 2) then
			function v167()
				local v255 = game.PlaceId;
				local v256 = game.JobId;
				local v257, v258 = pcall(function()
					return v165:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v255 .. "/servers/Public?sortOrder=Asc&limit=100"));
				end);
				if (v257 and v258 and v258.data) then
					for v300, v301 in ipairs(v258.data) do
						if ((v301.playing < v301.maxPlayers) and (v301.id ~= v256)) then
							v164:TeleportToPlaceInstance(v255, v301.id, v166.LocalPlayer);
							break;
						end
					end
				else
					warn("Failed to get server list.");
				end
			end
			v167();
			break;
		end
		if (FlatIdent_28E8A == 0) then
			v164 = game:GetService("TeleportService");
			v165 = game:GetService("HttpService");
			FlatIdent_28E8A = 1;
		end
	end
end);
local v62 = v60:NewSection("Teleport");
v62:NewButton("Farm #1", "Teleports You To Farm #1", function()
	local FlatIdent_5C97A = 0;
	local v168;
	local v169;
	local v170;
	local v171;
	local v172;
	local v173;
	while true do
		if (FlatIdent_5C97A == 0) then
			v168 = 304 - (244 + 60);
			v169 = nil;
			FlatIdent_5C97A = 1;
		end
		if (FlatIdent_5C97A == 2) then
			v172 = nil;
			v173 = nil;
			FlatIdent_5C97A = 3;
		end
		if (FlatIdent_5C97A == 3) then
			while true do
				if (v168 == (2 + 0)) then
					v173 = workspace.Farm:GetChildren()[6]:FindFirstChild("Sign") and workspace.Farm:GetChildren()[482 - (41 + 435)].Sign:FindFirstChild("Part");
					if v173 then
						local FlatIdent_86ECC = 0;
						local v312;
						local v313;
						while true do
							if (FlatIdent_86ECC == 1) then
								while true do
									if (v312 == (0 + 0)) then
										v313 = v173.CFrame.LookVector * (1142 - (936 + 189));
										v172.CFrame = CFrame.new(v173.Position + v313, v173.Position);
										break;
									end
								end
								break;
							end
							if (FlatIdent_86ECC == 0) then
								v312 = 1001 - (938 + 63);
								v313 = nil;
								FlatIdent_86ECC = 1;
							end
						end
					end
					break;
				end
				if (v168 == 0) then
					v169 = game:GetService("Players");
					v170 = v169.LocalPlayer;
					v168 = 1 + 0;
				end
				if (1 == v168) then
					local FlatIdent_D6BD = 0;
					while true do
						if (FlatIdent_D6BD == 0) then
							v171 = v170.Character or v170.CharacterAdded:Wait();
							v172 = v171:WaitForChild("HumanoidRootPart");
							FlatIdent_D6BD = 1;
						end
						if (FlatIdent_D6BD == 1) then
							v168 = 1615 - (1565 + 48);
							break;
						end
					end
				end
			end
			break;
		end
		if (FlatIdent_5C97A == 1) then
			v170 = nil;
			v171 = nil;
			FlatIdent_5C97A = 2;
		end
	end
end);
v62:NewButton("Farm #2", "Teleports You To Farm #2", function()
	local FlatIdent_1DD0B = 0;
	local v174;
	local v175;
	local v176;
	local v177;
	local v178;
	while true do
		if (FlatIdent_1DD0B == 2) then
			v178 = workspace.Farm:GetChildren()[5]:FindFirstChild("Sign") and workspace.Farm:GetChildren()[4 + 1].Sign:FindFirstChild("Part");
			if v178 then
				local FlatIdent_4609C = 0;
				local v274;
				while true do
					if (FlatIdent_4609C == 0) then
						v274 = v178.CFrame.LookVector * 17;
						v177.CFrame = CFrame.new(v178.Position + v274, v178.Position);
						break;
					end
				end
			end
			break;
		end
		if (FlatIdent_1DD0B == 0) then
			v174 = game:GetService("Players");
			v175 = v174.LocalPlayer;
			FlatIdent_1DD0B = 1;
		end
		if (FlatIdent_1DD0B == 1) then
			v176 = v175.Character or v175.CharacterAdded:Wait();
			v177 = v176:WaitForChild("HumanoidRootPart");
			FlatIdent_1DD0B = 2;
		end
	end
end);
v62:NewButton("Farm #3", "Teleports You To Farm #3", function()
	local FlatIdent_45D0C = 0;
	local v179;
	local v180;
	local v181;
	local v182;
	local v183;
	local v184;
	while true do
		if (2 == FlatIdent_45D0C) then
			v183 = nil;
			v184 = nil;
			FlatIdent_45D0C = 3;
		end
		if (FlatIdent_45D0C == 1) then
			v181 = nil;
			v182 = nil;
			FlatIdent_45D0C = 2;
		end
		if (FlatIdent_45D0C == 0) then
			v179 = 1138 - (782 + 356);
			v180 = nil;
			FlatIdent_45D0C = 1;
		end
		if (FlatIdent_45D0C == 3) then
			while true do
				if (v179 == (269 - (176 + 91))) then
					v184 = workspace.Farm:GetChildren()[4 - 2]:FindFirstChild("Sign") and workspace.Farm:GetChildren()[2 - 0].Sign:FindFirstChild("Part");
					if v184 then
						local FlatIdent_63284 = 0;
						local v314;
						local v315;
						while true do
							if (FlatIdent_63284 == 1) then
								while true do
									if (v314 == (1092 - (975 + 117))) then
										v315 = v184.CFrame.LookVector * (1892 - (157 + 1718));
										v183.CFrame = CFrame.new(v184.Position + v315, v184.Position);
										break;
									end
								end
								break;
							end
							if (FlatIdent_63284 == 0) then
								v314 = 0;
								v315 = nil;
								FlatIdent_63284 = 1;
							end
						end
					end
					break;
				end
				if (v179 == (0 + 0)) then
					v180 = game:GetService("Players");
					v181 = v180.LocalPlayer;
					v179 = 1;
				end
				if (v179 == 1) then
					v182 = v181.Character or v181.CharacterAdded:Wait();
					v183 = v182:WaitForChild("HumanoidRootPart");
					v179 = 6 - 4;
				end
			end
			break;
		end
	end
end);
v62:NewButton("Farm #4", "Teleports You To Farm #4", function()
	local v185 = 0 - 0;
	local v186;
	local v187;
	local v188;
	local v189;
	local v190;
	while true do
		if (v185 == (1018 - (697 + 321))) then
			local FlatIdent_23AC6 = 0;
			while true do
				if (FlatIdent_23AC6 == 1) then
					v185 = 2 - 1;
					break;
				end
				if (FlatIdent_23AC6 == 0) then
					v186 = game:GetService("Players");
					v187 = v186.LocalPlayer;
					FlatIdent_23AC6 = 1;
				end
			end
		end
		if (v185 == (1 - 0)) then
			v188 = v187.Character or v187.CharacterAdded:Wait();
			v189 = v188:WaitForChild("HumanoidRootPart");
			v185 = 4 - 2;
		end
		if (v185 == 2) then
			v190 = workspace.Farm:GetChildren()[1 + 0]:FindFirstChild("Sign") and workspace.Farm:GetChildren()[1 - 0].Sign:FindFirstChild("Part");
			if v190 then
				local FlatIdent_69531 = 0;
				local v316;
				local v317;
				while true do
					if (FlatIdent_69531 == 0) then
						v316 = 0;
						v317 = nil;
						FlatIdent_69531 = 1;
					end
					if (FlatIdent_69531 == 1) then
						while true do
							if ((0 - 0) == v316) then
								v317 = v190.CFrame.LookVector * (1244 - (322 + 905));
								v189.CFrame = CFrame.new(v190.Position + v317, v190.Position);
								break;
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end);
v62:NewButton("Farm #5", "Teleports You To Farm #5", function()
	local FlatIdent_4FAC8 = 0;
	local v191;
	local v192;
	local v193;
	local v194;
	local v195;
	while true do
		if (1 == FlatIdent_4FAC8) then
			v193 = v192.Character or v192.CharacterAdded:Wait();
			v194 = v193:WaitForChild("HumanoidRootPart");
			FlatIdent_4FAC8 = 2;
		end
		if (FlatIdent_4FAC8 == 2) then
			v195 = workspace.Farm:GetChildren()[615 - (602 + 9)]:FindFirstChild("Sign") and workspace.Farm:GetChildren()[1193 - (449 + 740)].Sign:FindFirstChild("Part");
			if v195 then
				local FlatIdent_6DAAA = 0;
				local v276;
				while true do
					if (0 == FlatIdent_6DAAA) then
						v276 = v195.CFrame.LookVector * (889 - (826 + 46));
						v194.CFrame = CFrame.new(v195.Position + v276, v195.Position);
						break;
					end
				end
			end
			break;
		end
		if (FlatIdent_4FAC8 == 0) then
			v191 = game:GetService("Players");
			v192 = v191.LocalPlayer;
			FlatIdent_4FAC8 = 1;
		end
	end
end);
v62:NewButton("Farm #6", "Teleports You To Farm #6", function()
	local v196 = 947 - (245 + 702);
	local v197;
	local v198;
	local v199;
	local v200;
	local v201;
	while true do
		if (v196 == (6 - 4)) then
			v201 = workspace.Farm:GetChildren()[1 + 2]:FindFirstChild("Sign") and workspace.Farm:GetChildren()[1901 - (260 + 1638)].Sign:FindFirstChild("Part");
			if v201 then
				local v318 = 440 - (382 + 58);
				local v319;
				while true do
					if ((0 - 0) == v318) then
						v319 = v201.CFrame.LookVector * 17;
						v200.CFrame = CFrame.new(v201.Position + v319, v201.Position);
						break;
					end
				end
			end
			break;
		end
		if (v196 == 1) then
			v199 = v198.Character or v198.CharacterAdded:Wait();
			v200 = v199:WaitForChild("HumanoidRootPart");
			v196 = 2 + 0;
		end
		if (v196 == (0 - 0)) then
			local FlatIdent_32079 = 0;
			while true do
				if (0 == FlatIdent_32079) then
					v197 = game:GetService("Players");
					v198 = v197.LocalPlayer;
					FlatIdent_32079 = 1;
				end
				if (FlatIdent_32079 == 1) then
					v196 = 2 - 1;
					break;
				end
			end
		end
	end
end);
local v63 = v38:NewTab("Credits👑");
local v64 = v63:NewSection("Owner: Syko");
local v64 = v63:NewSection("Discord: https://discord.gg/48RuQjAZkZ");
local v65 = v38:NewTab("Settings");
local v66 = v65:NewSection("Ui");
v66:NewKeybind("Hide Ui", "When Pressed It Hides The Ui", Enum.KeyCode.K, function()
	v37:ToggleUI();
end);
local function v67()
	startAutoBuy();
end
local function v68()
	getgenv().selectedFruits = currentOption;
end
while true do
	local FlatIdent_8F9B8 = 0;
	while true do
		if (FlatIdent_8F9B8 == 0) then
			wait(5);
			v68();
			FlatIdent_8F9B8 = 1;
		end
		if (FlatIdent_8F9B8 == 1) then
			v67();
			break;
		end
	end
end
local function v69()
	getgenv().AutoBuyEnabled = state;
end
local function v70()
	getgenv().selectedGear = currentGear;
end
while true do
	local v205 = 1205 - (902 + 303);
	while true do
		if (v205 == (1 - 0)) then
			v70();
			break;
		end
		if (v205 == 0) then
			local FlatIdent_6F0B1 = 0;
			while true do
				if (FlatIdent_6F0B1 == 1) then
					v205 = 2 - 1;
					break;
				end
				if (0 == FlatIdent_6F0B1) then
					wait(5);
					v69();
					FlatIdent_6F0B1 = 1;
				end
			end
		end
	end
end
