-- Wow, Another rewrite I just really love rewriting stuff huh.
-- Minified UI source to make my life 1000x easier than whatever the fuck I was doing before
local start = tick()

if Loaded then return end 

--getgenv().identifyexecutor = function() return "Shitsploit" end

do -- UI Library.
    getgenv().runService=game:GetService"RunService"getgenv().textService=game:GetService"TextService"getgenv().inputService=game:GetService"UserInputService"getgenv().tweenService=game:GetService"TweenService"local runService=runService;local textService=textService;local inputService=inputService;local tweenService=tweenService;if getgenv().library then getgenv().library:Unload()end;local a={tabs={},draggable=true,flags={},title="Vex Services",open=false,mousestate=inputService.MouseIconEnabled,popup=nil,instances={},connections={},options={},notifications={},tabSize=1,theme={},foldername="ceri",fileext=".cr"}getgenv().library=a;local b,c,d,e,f;local g={Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Escape}local h={Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}a.round=function(i,j)j=j or 1;local k;if typeof(i)=="Vector2"then k=Vector2.new(a.round(i.X),a.round(i.Y))elseif typeof(i)=="Color3"then return a.round(i.r*255),a.round(i.g*255),a.round(i.b*255)else k=math.floor(i/j+math.sign(i)*0.5)*j;if k<0 then k=k+j end;return k end;return k end;local l;spawn(function()while a and wait()do l=Color3.fromHSV(tick()%6/6,1,1)end end)function a:Create(m,n)n=n or{}if not m then return end;local k=m=="Square"or m=="Line"or m=="Text"or m=="Quad"or m=="Circle"or m=="Triangle"local o=k and Drawing or Instance;local p=o.new(m)for q,r in next,n do p[q]=r end;table.insert(self.instances,{object=p,method=k})return p end;function a:AddConnection(s,t,u)u=type(t)=="function"and t or u;s=s:connect(u)if t~=u then self.connections[t]=s else table.insert(self.connections,s)end;return s end;function a:Unload()inputService.MouseIconEnabled=self.mousestate;for v,w in next,self.connections do w:Disconnect()end;for v,x in next,self.instances do if x.method then pcall(function()x.object:Remove()end)else x.object:Destroy()end end;for v,y in next,self.options do if y.type=="toggle"then pcall(function()y:SetState()end)end end;a=nil;getgenv().library={} end;function a:LoadConfig(z)if table.find(self:GetConfigs(),z)then local A,B=pcall(function()return game:GetService"HttpService":JSONDecode(readfile(self.foldername.."/"..z..self.fileext))end)B=A and B or{}for v,C in next,self.options do if C.hasInit then if C.type~="button"and C.flag and not C.skipflag then if C.type=="toggle"then spawn(function()C:SetState(B[C.flag]==1)end)elseif C.type=="color"then if B[C.flag]then spawn(function()C:SetColor(B[C.flag])end)if C.trans then spawn(function()C:SetTrans(B[C.flag.." Transparency"])end)end end elseif C.type=="bind"then spawn(function()C:SetKey(B[C.flag])end)else spawn(function()C:SetValue(B[C.flag])end)end end end end end end;function a:SaveConfig(z)local B={}if table.find(self:GetConfigs(),z)then B=game:GetService"HttpService":JSONDecode(readfile(self.foldername.."/"..z..self.fileext))end;for v,C in next,self.options do if C.type~="button"and C.flag and not C.skipflag then if C.type=="toggle"then B[C.flag]=C.state and 1 or 0 elseif C.type=="color"then B[C.flag]={C.color.r,C.color.g,C.color.b}if C.trans then B[C.flag.." Transparency"]=C.trans end elseif C.type=="bind"then B[C.flag]=C.key elseif C.type=="list"then B[C.flag]=C.value else B[C.flag]=C.value end end end;writefile(self.foldername.."/"..z..self.fileext,game:GetService"HttpService":JSONEncode(B))end;function a:GetConfigs()if not isfolder(self.foldername)then makefolder(self.foldername)return{}end;local D={}local k=0;for x,E in next,listfiles(self.foldername)do if E:sub(#E-#self.fileext+1,#E)==self.fileext then k=k+1;E=E:gsub(self.foldername.."\\","")E=E:gsub(self.fileext,"")table.insert(D,k,E)end end;return D end;local function F(C,G)C.main=a:Create("TextLabel",{LayoutOrder=C.position,Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-10,1,20),BackgroundTransparency=5,TextSize=13,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,Parent=G})setmetatable(C,{__newindex=function(o,x,E)if x=="Text"then C.main.Text=tostring(E)C.main.Size=UDim2.new(1,-10,1,textService:GetTextSize(C.main.Text,13,Enum.Font.Code,Vector2.new(C.main.AbsoluteSize.X,9e9)).Y+6)end end})C.Text=C.text end;local function H(C,G)C.hasInit=true;C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(2,1,1,15),BackgroundTransparency=3,Parent=G})a:Create("Frame",{AnchorPoint=Vector2.new(0.6,0.6),Position=UDim2.new(0.6,1,0.6,1),Size=UDim2.new(1,-23,1,2),BackgroundColor3=Color3.fromRGB(0,0,255),BorderColor3=Color3.new(),Parent=C.main})C.title=a:Create("TextLabel",{AnchorPoint=Vector2.new(0.4,0.4),Position=UDim2.new(0.4,0,0.4,1),BackgroundColor3=Color3.fromRGB(0,0,255),BorderSizePixel=1,TextColor3=Color3.new(0,0,255),TextSize=14,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Center,Parent=C.main})setmetatable(C,{__newindex=function(o,x,E)if x=="Text"then if E then C.title.Text=tostring(E)C.title.Size=UDim2.new(0,textService:GetTextSize(C.title.Text,14,Enum.Font.Code,Vector2.new(9e9,9e9)).X+12,0,20)C.main.Size=UDim2.new(1,0,0,18)else C.title.Text=""C.title.Size=UDim2.new()C.main.Size=UDim2.new(1,0,0,5)end end end})C.Text=C.text end;local function I(C,G)C.hasInit=true;C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,1,0,23),BackgroundTransparency=3,Parent=G})local J;local K;if C.style then J=a:Create("ImageLabel",{Position=UDim2.new(0,6,0,4),Size=UDim2.new(0,12,0,12),BackgroundTransparency=3,Image="rbxassetid://3570695787",ImageColor3=Color3.new(),Parent=C.main})a:Create("ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(1,-2,1,-2),BackgroundTransparency=3,Image="rbxassetid://3570695787",ImageColor3=Color3.fromRGB(60,60,60),Parent=J})a:Create("ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(1,-6,1,-6),BackgroundTransparency=1,Image="rbxassetid://3570695787",ImageColor3=Color3.fromRGB(40,40,40),Parent=J})K=a:Create("ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(1,-6,1,-6),BackgroundTransparency=1,Image="rbxassetid://3570695787",ImageColor3=a.flags["Menu Accent Color"],Visible=C.state,Parent=J})a:Create("ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://5941353943",ImageTransparency=0.6,Parent=J})table.insert(a.theme,K)else J=a:Create("Frame",{Position=UDim2.new(0,6,0,4),Size=UDim2.new(0,12,0,12),BackgroundColor3=a.flags["Menu Accent Color"],BorderColor3=Color3.new(),Parent=C.main})K=a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=C.state and 1 or 0,BackgroundColor3=Color3.fromRGB(50,50,50),BorderColor3=Color3.new(),Image="rbxassetid://4155801252",ImageTransparency=0.6,ImageColor3=Color3.new(),Parent=J})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=J})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=J})table.insert(a.theme,J)end;C.interest=a:Create("Frame",{Position=UDim2.new(0,0,0,0),Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Parent=C.main})C.title=a:Create("TextLabel",{Position=UDim2.new(0,24,0,0),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=C.text,TextColor3=C.state and Color3.fromRGB(210,210,210)or Color3.fromRGB(180,180,180),TextSize=14,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,Parent=C.interest})C.interest.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then C:SetState(not C.state)end;if L.UserInputType.Name=="MouseMovement"then if not a.warning and not a.slider then if C.style then J.ImageColor3=a.flags["Menu Accent Color"]else J.BorderColor3=a.flags["Menu Accent Color"]K.BorderColor3=a.flags["Menu Accent Color"]end end;if C.tip then a.tooltip.Text=C.tip;a.tooltip.Size=UDim2.new(0,textService:GetTextSize(C.tip,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,20)end end end)C.interest.InputChanged:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Position=UDim2.new(0,L.Position.X+26,0,L.Position.Y+36)end end end)C.interest.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.style then J.ImageColor3=Color3.new()else J.BorderColor3=Color3.new()K.BorderColor3=Color3.new()end;a.tooltip.Position=UDim2.new(2)end end)function C:SetState(M,N)M=typeof(M)=="boolean"and M;M=M or false;a.flags[self.flag]=M;self.state=M;C.title.TextColor3=M and Color3.fromRGB(210,210,210)or Color3.fromRGB(160,160,160)if C.style then K.Visible=M else K.BackgroundTransparency=M and 1 or 0 end;if not N then self.callback(M)end end;if C.state then delay(1,function()if a then C.callback(true)end end)end;setmetatable(C,{__newindex=function(o,x,E)if x=="Text"then C.title.Text=tostring(E)end end})end;local function O(C,G)C.hasInit=true;C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,0,0,26),BackgroundTransparency=1,Parent=G})C.title=a:Create("TextLabel",{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-5),Size=UDim2.new(1,-12,0,18),BackgroundColor3=Color3.fromRGB(50,50,50),BorderColor3=Color3.new(),Text=C.text,TextColor3=Color3.new(1,1,1),TextSize=15,Font=Enum.Font.Code,Parent=C.main})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.title})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.title})a:Create("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(180,180,180)),ColorSequenceKeypoint.new(1,Color3.fromRGB(253,253,253))}),Rotation=-90,Parent=C.title})C.title.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then C.callback()if a then a.flags[C.flag]=true end;if C.tip then a.tooltip.Text=C.tip;a.tooltip.Size=UDim2.new(0,textService:GetTextSize(C.tip,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,20)end end;if L.UserInputType.Name=="MouseMovement"then if not a.warning and not a.slider then C.title.BorderColor3=a.flags["Menu Accent Color"]end end end)C.title.InputChanged:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Position=UDim2.new(0,L.Position.X+26,0,L.Position.Y+36)end end end)C.title.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then C.title.BorderColor3=Color3.new()a.tooltip.Position=UDim2.new(2)end end)end;local function P(C,G)C.hasInit=true;local Q;local R;local S;if C.sub then C.main=C:getMain()else C.main=C.main or a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Parent=G})a:Create("TextLabel",{Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-12,1,0),BackgroundTransparency=1,Text=C.text,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.fromRGB(210,210,210),TextXAlignment=Enum.TextXAlignment.Left,Parent=C.main})end;local T=a:Create(C.sub and"TextButton"or"TextLabel",{Position=UDim2.new(1,-6-(C.subpos or 0),0,C.sub and 2 or 3),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundColor3=Color3.fromRGB(30,30,30),BorderSizePixel=0,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.fromRGB(160,160,160),TextXAlignment=Enum.TextXAlignment.Right,Parent=C.main})if C.sub then T.AutoButtonColor=false end;local U=C.sub and T or C.main;local V;U.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseButton1"then Q=true;T.Text="[...]"T.Size=UDim2.new(0,-textService:GetTextSize(T.Text,16,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,16)T.TextColor3=a.flags["Menu Accent Color"]end end)a:AddConnection(inputService.InputBegan,function(L)if inputService:GetFocusedTextBox()then return end;if Q then local W=table.find(h,L.UserInputType)and not C.nomouse and L.UserInputType;C:SetKey(W or not table.find(g,L.KeyCode)and L.KeyCode)else if(L.KeyCode.Name==C.key or L.UserInputType.Name==C.key)and not Q then if C.mode=="toggle"then a.flags[C.flag]=not a.flags[C.flag]C.callback(a.flags[C.flag],0)else a.flags[C.flag]=true;if S then S:Disconnect()C.callback(true,0)end;S=a:AddConnection(runService.RenderStepped,function(Z)if not inputService:GetFocusedTextBox()then C.callback(nil,Z)end end)end end end end)a:AddConnection(inputService.InputEnded,function(L)if C.key~="none"then if L.KeyCode.Name==C.key or L.UserInputType.Name==C.key then if S then S:Disconnect()a.flags[C.flag]=false;C.callback(true,0)end end end end)function C:SetKey(W)Q=false;T.TextColor3=Color3.fromRGB(160,160,160)if S then S:Disconnect()a.flags[C.flag]=false;C.callback(true,0)end;self.key=W and W.Name or W or self.key;if self.key=="Backspace"then self.key="none"T.Text="[NONE]"else local k=self.key;if self.key:match"Mouse"then k=self.key:gsub("Button",""):gsub("Mouse","M")elseif self.key:match"Shift"or self.key:match"Alt"or self.key:match"Control"then k=self.key:gsub("Left","L"):gsub("Right","R")end;T.Text="["..k:gsub("Control","CTRL"):upper().."]"end;T.Size=UDim2.new(0,-textService:GetTextSize(T.Text,16,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,16)end;C:SetKey()end;local function _(C,G)C.hasInit=true;if C.sub then C.main=C:getMain()C.main.Size=UDim2.new(1,0,0,42)else C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,0,0,C.textpos and 24 or 40),BackgroundTransparency=1,Parent=G})end;C.slider=a:Create("Frame",{Position=UDim2.new(0,6,0,C.sub and 22 or C.textpos and 4 or 20),Size=UDim2.new(1,-12,0,16),BackgroundColor3=Color3.fromRGB(50,50,50),BorderColor3=Color3.new(),Parent=C.main})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.8,Parent=C.slider})C.fill=a:Create("Frame",{BackgroundColor3=a.flags["Menu Accent Color"],BorderSizePixel=0,Parent=C.slider})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.slider})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.slider})C.title=a:Create("TextBox",{Position=UDim2.new((C.sub or C.textpos)and 0.5 or 0,(C.sub or C.textpos)and 0 or 6,0,0),Size=UDim2.new(0,0,0,(C.sub or C.textpos)and 14 or 18),BackgroundTransparency=1,Text=(C.text=="nil"and""or C.text..": ")..C.value..C.suffix,TextSize=(C.sub or C.textpos)and 14 or 15,Font=Enum.Font.Code,TextColor3=Color3.fromRGB(210,210,210),TextXAlignment=Enum.TextXAlignment[(C.sub or C.textpos)and"Center"or"Left"],Parent=(C.sub or C.textpos)and C.slider or C.main})table.insert(a.theme,C.fill)a:Create("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(115,115,115)),ColorSequenceKeypoint.new(1,Color3.new(1,1,1))}),Rotation=-90,Parent=C.fill})if C.min>=0 then C.fill.Size=UDim2.new((C.value-C.min)/(C.max-C.min),0,1,0)else C.fill.Position=UDim2.new((0-C.min)/(C.max-C.min),0,0,0)C.fill.Size=UDim2.new(C.value/(C.max-C.min),0,1,0)end;local a0;C.title.Focused:connect(function()if not a0 then C.title:ReleaseFocus()C.title.Text=(C.text=="nil"and""or C.text..": ")..C.value..C.suffix end end)C.title.FocusLost:connect(function()C.slider.BorderColor3=Color3.new()if a0 then if tonumber(C.title.Text)then C:SetValue(tonumber(C.title.Text))else C.title.Text=(C.text=="nil"and""or C.text..": ")..C.value..C.suffix end end;a0=false end)local U=(C.sub or C.textpos)and C.slider or C.main;U.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then if inputService:IsKeyDown(Enum.KeyCode.LeftControl)or inputService:IsKeyDown(Enum.KeyCode.RightControl)then a0=true;C.title:CaptureFocus()else a.slider=C;C.slider.BorderColor3=a.flags["Menu Accent Color"]C:SetValue(C.min+(L.Position.X-C.slider.AbsolutePosition.X)/C.slider.AbsoluteSize.X*(C.max-C.min))end end;if L.UserInputType.Name=="MouseMovement"then if not a.warning and not a.slider then C.slider.BorderColor3=a.flags["Menu Accent Color"]end;if C.tip then a.tooltip.Text=C.tip;a.tooltip.Size=UDim2.new(0,textService:GetTextSize(C.tip,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,20)end end end)U.InputChanged:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Position=UDim2.new(0,L.Position.X+26,0,L.Position.Y+36)end end end)U.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then a.tooltip.Position=UDim2.new(2)if C~=a.slider then C.slider.BorderColor3=Color3.new()end end end)function C:SetValue(r,N)if typeof(r)~="number"then r=0 end;r=a.round(r,C.float)r=math.clamp(r,self.min,self.max)if self.min>=0 then C.fill:TweenSize(UDim2.new((r-self.min)/(self.max-self.min),0,1,0),"Out","Quad",0.05,true)else C.fill:TweenPosition(UDim2.new((0-self.min)/(self.max-self.min),0,0,0),"Out","Quad",0.05,true)C.fill:TweenSize(UDim2.new(r/(self.max-self.min),0,1,0),"Out","Quad",0.1,true)end;a.flags[self.flag]=r;self.value=r;C.title.Text=(C.text=="nil"and""or C.text..": ")..C.value..C.suffix;if not N then self.callback(r)end end;delay(1,function()if a then C:SetValue(C.value)end end)end;local function a1(C,G)C.hasInit=true;if C.sub then C.main=C:getMain()C.main.Size=UDim2.new(1,0,0,48)else C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,0,0,C.text=="nil"and 30 or 48),BackgroundTransparency=1,Parent=G})if C.text~="nil"then a:Create("TextLabel",{Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-12,0,18),BackgroundTransparency=1,Text=C.text,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.fromRGB(210,210,210),TextXAlignment=Enum.TextXAlignment.Left,Parent=C.main})end end;local function a2()local a3=""for v,r in next,C.values do a3=a3 ..(C.value[r]and tostring(r)..", "or"")end;return string.sub(a3,1,#a3-2)end;C.listvalue=a:Create("TextLabel",{Position=UDim2.new(0,6,0,C.text=="nil"and not C.sub and 4 or 22),Size=UDim2.new(1,-12,0,22),BackgroundColor3=Color3.fromRGB(50,50,50),BorderColor3=Color3.new(),Text=" "..(typeof(C.value)=="string"and C.value or a2()),TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,Parent=C.main})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.8,Parent=C.listvalue})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.listvalue})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.listvalue})C.arrow=a:Create("ImageLabel",{Position=UDim2.new(1,-16,0,7),Size=UDim2.new(0,8,0,8),Rotation=90,BackgroundTransparency=1,Image="rbxassetid://4918373417",ImageColor3=Color3.new(1,1,1),ScaleType=Enum.ScaleType.Fit,ImageTransparency=0.4,Parent=C.listvalue})C.holder=a:Create("TextButton",{ZIndex=4,BackgroundColor3=Color3.fromRGB(40,40,40),BorderColor3=Color3.new(),Text="",AutoButtonColor=false,Visible=false,Parent=a.base})C.content=a:Create("ScrollingFrame",{ZIndex=4,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarImageColor3=Color3.new(),ScrollBarThickness=3,ScrollingDirection=Enum.ScrollingDirection.Y,VerticalScrollBarInset=Enum.ScrollBarInset.Always,TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png",Parent=C.holder})a:Create("ImageLabel",{ZIndex=4,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.holder})a:Create("ImageLabel",{ZIndex=4,Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.holder})local a4=a:Create("UIListLayout",{Padding=UDim.new(0,2),Parent=C.content})a:Create("UIPadding",{PaddingTop=UDim.new(0,4),PaddingLeft=UDim.new(0,4),Parent=C.content})local a5=0;a4.Changed:connect(function()C.holder.Size=UDim2.new(0,C.listvalue.AbsoluteSize.X,0,8+(a5>C.max and-2+C.max*22 or a4.AbsoluteContentSize.Y))C.content.CanvasSize=UDim2.new(0,0,0,8+a4.AbsoluteContentSize.Y)end)local U=C.sub and C.listvalue or C.main;C.listvalue.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then if a.popup==C then a.popup:Close()return end;if a.popup then a.popup:Close()end;C.arrow.Rotation=-90;C.open=true;C.holder.Visible=true;local a6=C.main.AbsolutePosition;C.holder.Position=UDim2.new(0,a6.X+6,0,a6.Y+(C.text=="nil"and not C.sub and 66 or 84))a.popup=C;C.listvalue.BorderColor3=a.flags["Menu Accent Color"]end;if L.UserInputType.Name=="MouseMovement"then if not a.warning and not a.slider then C.listvalue.BorderColor3=a.flags["Menu Accent Color"]end end end)C.listvalue.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if not C.open then C.listvalue.BorderColor3=Color3.new()end end end)U.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Text=C.tip;a.tooltip.Size=UDim2.new(0,textService:GetTextSize(C.tip,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,20)end end end)U.InputChanged:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Position=UDim2.new(0,L.Position.X+26,0,L.Position.Y+36)end end end)U.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then a.tooltip.Position=UDim2.new(2)end end)local a7;function C:AddValue(r,M)if self.labels[r]then return end;a5=a5+1;if self.multiselect then self.values[r]=M else if not table.find(self.values,r)then table.insert(self.values,r)end end;local a8=a:Create("TextLabel",{ZIndex=4,Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Text=r,TextSize=15,Font=Enum.Font.Code,TextTransparency=self.multiselect and(self.value[r]and 1 or 0)or self.value==r and 1 or 0,TextColor3=Color3.fromRGB(210,210,210),TextXAlignment=Enum.TextXAlignment.Left,Parent=C.content})self.labels[r]=a8;local a9=a:Create("TextLabel",{ZIndex=4,Size=UDim2.new(1,0,1,0),BackgroundTransparency=0.8,Text=" "..r,TextSize=15,Font=Enum.Font.Code,TextColor3=a.flags["Menu Accent Color"],TextXAlignment=Enum.TextXAlignment.Left,Visible=self.multiselect and self.value[r]or self.value==r,Parent=a8})a7=a7 or self.value==r and a9;table.insert(a.theme,a9)a8.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then if self.multiselect then self.value[r]=not self.value[r]self:SetValue(self.value)else self:SetValue(r)self:Close()end end end)end;for x,r in next,C.values do C:AddValue(tostring(typeof(x)=="number"and r or x))end;function C:RemoveValue(r)local a8=self.labels[r]if a8 then a8:Destroy()self.labels[r]=nil;a5=a5-1;if self.multiselect then self.values[r]=nil;self:SetValue(self.value)else table.remove(self.values,table.find(self.values,r))if self.value==r then a7=nil;self:SetValue(self.values[1]or"")end end end end;function C:SetValue(r,N)if self.multiselect and typeof(r)~="table"then r={}for x,E in next,self.values do r[E]=false end end;self.value=typeof(r)=="table"and r or tostring(table.find(self.values,r)and r or self.values[1])a.flags[self.flag]=self.value;C.listvalue.Text=" "..(self.multiselect and a2()or self.value)if self.multiselect then for t,a8 in next,self.labels do a8.TextTransparency=self.value[t]and 1 or 0;if a8:FindFirstChild"TextLabel"then a8.TextLabel.Visible=self.value[t]end end else if a7 then a7.TextTransparency=0;if a7:FindFirstChild"TextLabel"then a7.TextLabel.Visible=false end end;if self.labels[self.value]then a7=self.labels[self.value]a7.TextTransparency=1;if a7:FindFirstChild"TextLabel"then a7.TextLabel.Visible=true end end end;if not N then self.callback(self.value)end end;delay(1,function()if a then C:SetValue(C.value)end end)function C:Close()a.popup=nil;C.arrow.Rotation=90;self.open=false;C.holder.Visible=false;C.listvalue.BorderColor3=Color3.new()end;return C end;local function aa(C,G)C.hasInit=true;C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,0,0,C.text=="nil"and 28 or 44),BackgroundTransparency=1,Parent=G})if C.text~="nil"then C.title=a:Create("TextLabel",{Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-12,0,18),BackgroundTransparency=1,Text=C.text,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.fromRGB(210,210,210),TextXAlignment=Enum.TextXAlignment.Left,Parent=C.main})end;C.holder=a:Create("Frame",{Position=UDim2.new(0,6,0,C.text=="nil"and 4 or 20),Size=UDim2.new(1,-12,0,20),BackgroundColor3=Color3.fromRGB(50,50,50),BorderColor3=Color3.new(),Parent=C.main})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.8,Parent=C.holder})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.holder})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.holder})local ab=a:Create("TextBox",{Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-4,1,0),BackgroundTransparency=1,Text="  "..C.value,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,ClearTextOnFocus=false,Parent=C.holder})ab.FocusLost:connect(function(ac)C.holder.BorderColor3=Color3.new()C:SetValue(ab.Text,ac)end)ab.Focused:connect(function()C.holder.BorderColor3=a.flags["Menu Accent Color"]end)ab.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then ab.Text=""end;if L.UserInputType.Name=="MouseMovement"then if not a.warning and not a.slider then C.holder.BorderColor3=a.flags["Menu Accent Color"]end;if C.tip then a.tooltip.Text=C.tip;a.tooltip.Size=UDim2.new(0,textService:GetTextSize(C.tip,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,20)end end end)ab.InputChanged:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Position=UDim2.new(0,L.Position.X+26,0,L.Position.Y+36)end end end)ab.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if not ab:IsFocused()then C.holder.BorderColor3=Color3.new()end;a.tooltip.Position=UDim2.new(2)end end)function C:SetValue(r,ac)if tostring(r)==""then ab.Text=self.value else a.flags[self.flag]=tostring(r)self.value=tostring(r)ab.Text=self.value;self.callback(r,ac)end end;delay(1,function()if a then C:SetValue(C.value)end end)end;local function ad(C)C.mainHolder=a:Create("TextButton",{ZIndex=4,Size=UDim2.new(0,C.trans and 200 or 184,0,200),BackgroundColor3=Color3.fromRGB(40,40,40),BorderColor3=Color3.new(),AutoButtonColor=false,Visible=false,Parent=a.base})a:Create("ImageLabel",{ZIndex=4,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.mainHolder})a:Create("ImageLabel",{ZIndex=4,Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.mainHolder})local ae,af,ag=Color3.toHSV(C.color)ae,af,ag=ae==0 and 1 or ae,af+0.005,ag-0.005;local ah;local ai;local aj;local ak;if C.trans then ak=a:Create("ImageLabel",{ZIndex=5,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.fromHSV(ae,1,1),Rotation=180,Parent=a:Create("ImageLabel",{ZIndex=4,AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-6,0,6),Size=UDim2.new(0,10,1,-12),BorderColor3=Color3.new(),Image="rbxassetid://4632082392",ScaleType=Enum.ScaleType.Tile,TileSize=UDim2.new(0,5,0,5),Parent=C.mainHolder})})C.transSlider=a:Create("Frame",{ZIndex=5,Position=UDim2.new(0,0,C.trans,0),Size=UDim2.new(1,0,0,2),BackgroundColor3=Color3.fromRGB(38,41,65),BorderColor3=Color3.fromRGB(255,255,255),Parent=ak})ak.InputBegan:connect(function(al)if al.UserInputType.Name=="MouseButton1"then aj=true;C:SetTrans(1-(al.Position.Y-ak.AbsolutePosition.Y)/ak.AbsoluteSize.Y)end end)ak.InputEnded:connect(function(al)if al.UserInputType.Name=="MouseButton1"then aj=false end end)end;local am=a:Create("Frame",{ZIndex=4,AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,6,1,-6),Size=UDim2.new(1,C.trans and-28 or-12,0,10),BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(),Parent=C.mainHolder})local an=a:Create("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.17,Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(0.83,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))}),Parent=am})local ao=a:Create("Frame",{ZIndex=4,Position=UDim2.new(1-ae,0,0,0),Size=UDim2.new(0,2,1,0),BackgroundColor3=Color3.fromRGB(38,41,65),BorderColor3=Color3.fromRGB(255,255,255),Parent=am})am.InputBegan:connect(function(al)if al.UserInputType.Name=="MouseButton1"then ah=true;X=am.AbsolutePosition.X+am.AbsoluteSize.X-am.AbsolutePosition.X;X=math.clamp((al.Position.X-am.AbsolutePosition.X)/X,0,0.995)C:SetColor(Color3.fromHSV(1-X,af,ag))end end)am.InputEnded:connect(function(al)if al.UserInputType.Name=="MouseButton1"then ah=false end end)local ap=a:Create("ImageLabel",{ZIndex=4,Position=UDim2.new(0,6,0,6),Size=UDim2.new(1,C.trans and-28 or-12,1,-28),BackgroundColor3=Color3.fromHSV(ae,1,1),BorderColor3=Color3.new(),Image="rbxassetid://4155801252",ClipsDescendants=true,Parent=C.mainHolder})local aq=a:Create("Frame",{ZIndex=4,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(af,0,1-ag,0),Size=UDim2.new(0,4,0,4),Rotation=45,BackgroundColor3=Color3.fromRGB(255,255,255),Parent=ap})ap.InputBegan:connect(function(al)if al.UserInputType.Name=="MouseButton1"then ai=true;X=ap.AbsolutePosition.X+ap.AbsoluteSize.X-ap.AbsolutePosition.X;Y=ap.AbsolutePosition.Y+ap.AbsoluteSize.Y-ap.AbsolutePosition.Y;X=math.clamp((al.Position.X-ap.AbsolutePosition.X)/X,0.005,1)Y=math.clamp((al.Position.Y-ap.AbsolutePosition.Y)/Y,0,0.995)C:SetColor(Color3.fromHSV(ae,X,1-Y))end end)a:AddConnection(inputService.InputChanged,function(al)if al.UserInputType.Name=="MouseMovement"then if ai then X=ap.AbsolutePosition.X+ap.AbsoluteSize.X-ap.AbsolutePosition.X;Y=ap.AbsolutePosition.Y+ap.AbsoluteSize.Y-ap.AbsolutePosition.Y;X=math.clamp((al.Position.X-ap.AbsolutePosition.X)/X,0.005,1)Y=math.clamp((al.Position.Y-ap.AbsolutePosition.Y)/Y,0,0.995)C:SetColor(Color3.fromHSV(ae,X,1-Y))elseif ah then X=am.AbsolutePosition.X+am.AbsoluteSize.X-am.AbsolutePosition.X;X=math.clamp((al.Position.X-am.AbsolutePosition.X)/X,0,0.995)C:SetColor(Color3.fromHSV(1-X,af,ag))elseif aj then C:SetTrans(1-(al.Position.Y-ak.AbsolutePosition.Y)/ak.AbsoluteSize.Y)end end end)ap.InputEnded:connect(function(al)if al.UserInputType.Name=="MouseButton1"then ai=false end end)function C:updateVisuals(ar)ae,af,ag=Color3.toHSV(ar)ae=ae==0 and 1 or ae;ap.BackgroundColor3=Color3.fromHSV(ae,1,1)if C.trans then ak.ImageColor3=Color3.fromHSV(ae,1,1)end;ao.Position=UDim2.new(1-ae,0,0,0)aq.Position=UDim2.new(af,0,1-ag,0)end;return C end;local function as(C,G)C.hasInit=true;if C.sub then C.main=C:getMain()else C.main=a:Create("Frame",{LayoutOrder=C.position,Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Parent=G})C.title=a:Create("TextLabel",{Position=UDim2.new(0,6,0,0),Size=UDim2.new(1,-12,1,0),BackgroundTransparency=1,Text=C.text,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.fromRGB(210,210,210),TextXAlignment=Enum.TextXAlignment.Left,Parent=C.main})end;C.visualize=a:Create(C.sub and"TextButton"or"Frame",{Position=UDim2.new(1,-(C.subpos or 0)-24,0,4),Size=UDim2.new(0,18,0,12),SizeConstraint=Enum.SizeConstraint.RelativeYY,BackgroundColor3=C.color,BorderColor3=Color3.new(),Parent=C.main})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.6,Parent=C.visualize})a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.visualize})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=C.visualize})local U=C.sub and C.visualize or C.main;if C.sub then C.visualize.Text=""C.visualize.AutoButtonColor=false end;U.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then if not C.mainHolder then ad(C)end;if a.popup==C then a.popup:Close()return end;if a.popup then a.popup:Close()end;C.open=true;local a6=C.main.AbsolutePosition;C.mainHolder.Position=UDim2.new(0,a6.X+36+(C.trans and-16 or 0),0,a6.Y+56)C.mainHolder.Visible=true;a.popup=C;C.visualize.BorderColor3=a.flags["Menu Accent Color"]end;if L.UserInputType.Name=="MouseMovement"then if not a.warning and not a.slider then C.visualize.BorderColor3=a.flags["Menu Accent Color"]end;if C.tip then a.tooltip.Text=C.tip;a.tooltip.Size=UDim2.new(0,textService:GetTextSize(C.tip,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X,0,20)end end end)U.InputChanged:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if C.tip then a.tooltip.Position=UDim2.new(0,L.Position.X+26,0,L.Position.Y+36)end end end)U.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseMovement"then if not C.open then C.visualize.BorderColor3=Color3.new()end;a.tooltip.Position=UDim2.new(2)end end)function C:SetColor(at,N)if typeof(at)=="table"then at=Color3.new(at[1],at[2],at[3])end;at=at or Color3.new(1,1,1)if self.mainHolder then self:updateVisuals(at)end;C.visualize.BackgroundColor3=at;a.flags[self.flag]=at;self.color=at;if not N then self.callback(at)end end;if C.trans then function C:SetTrans(r,au)r=math.clamp(tonumber(r)or 0,0,1)if self.transSlider then self.transSlider.Position=UDim2.new(0,0,r,0)end;self.trans=r;a.flags[self.flag.." Transparency"]=1-r;self.calltrans(r)end;C:SetTrans(C.trans)end;delay(1,function()if a then C:SetColor(C.color)end end)function C:Close()a.popup=nil;self.open=false;self.mainHolder.Visible=false;C.visualize.BorderColor3=Color3.new()end end;function a:AddTab(av,a6)local aw={canInit=true,columns={},title=tostring(av)}table.insert(self.tabs,a6 or#self.tabs+1,aw)function aw:AddColumn()local ax={sections={},position=#self.columns,canInit=true,tab=self}table.insert(self.columns,ax)function ax:AddSection(av)local ay={title=tostring(av),options={},canInit=true,column=self}table.insert(self.sections,ay)function ay:AddLabel(az)local C={text=az}C.section=self;C.type="label"C.position=#self.options;C.canInit=true;table.insert(self.options,C)if a.hasInit and self.hasInit then F(C,self.content)else C.Init=F end;return C end;function ay:AddDivider(az)local C={text=az}C.section=self;C.type="divider"C.position=#self.options;C.canInit=true;table.insert(self.options,C)if a.hasInit and self.hasInit then H(C,self.content)else C.Init=H end;return C end;function ay:AddToggle(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.state=typeof(C.state)=="boolean"and C.state or false;C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.type="toggle"C.position=#self.options;C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.subcount=0;C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)C.style=C.style==2;a.flags[C.flag]=C.state;table.insert(self.options,C)a.options[C.flag]=C;function C:AddColor(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddColor(aA)end;function C:AddBind(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddBind(aA)end;function C:AddList(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddList(aA)end;function C:AddSlider(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddSlider(aA)end;if a.hasInit and self.hasInit then I(C,self.content)else C.Init=I end;return C end;function ay:AddButton(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.type="button"C.position=#self.options;C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.subcount=0;C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)table.insert(self.options,C)a.options[C.flag]=C;function C:AddBind(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()C.main.Size=UDim2.new(1,0,0,40)return C.main end;self.subcount=self.subcount+1;return ay:AddBind(aA)end;function C:AddColor(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()C.main.Size=UDim2.new(1,0,0,40)return C.main end;self.subcount=self.subcount+1;return ay:AddColor(aA)end;if a.hasInit and self.hasInit then O(C,self.content)else C.Init=O end;return C end;function ay:AddBind(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.key=C.key and C.key.Name or C.key or"none"C.nomouse=typeof(C.nomouse)=="boolean"and C.nomouse or false;C.mode=typeof(C.mode)=="string"and(C.mode=="toggle"or C.mode=="hold"and C.mode)or"toggle"C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.type="bind"C.position=#self.options;C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)table.insert(self.options,C)a.options[C.flag]=C;if a.hasInit and self.hasInit then P(C,self.content)else C.Init=P end;return C end;function ay:AddSlider(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.min=typeof(C.min)=="number"and C.min or 0;C.max=typeof(C.max)=="number"and C.max or 0;C.value=C.min<0 and 0 or math.clamp(typeof(C.value)=="number"and C.value or C.min,C.min,C.max)C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.float=typeof(C.value)=="number"and C.float or 1;C.suffix=C.suffix and tostring(C.suffix)or""C.textpos=C.textpos==2;C.type="slider"C.position=#self.options;C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.subcount=0;C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)a.flags[C.flag]=C.value;table.insert(self.options,C)a.options[C.flag]=C;function C:AddColor(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddColor(aA)end;function C:AddBind(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddBind(aA)end;if a.hasInit and self.hasInit then _(C,self.content)else C.Init=_ end;return C end;function ay:AddList(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.values=typeof(C.values)=="table"and C.values or{}C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.multiselect=typeof(C.multiselect)=="boolean"and C.multiselect or false;C.value=C.multiselect and(typeof(C.value)=="table"and C.value or{})or tostring(C.value or C.values[1]or"")if C.multiselect then for x,E in next,C.values do C.value[E]=false end end;C.max=C.max or 4;C.open=false;C.type="list"C.position=#self.options;C.labels={}C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.subcount=0;C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)a.flags[C.flag]=C.value;table.insert(self.options,C)a.options[C.flag]=C;function C:AddValue(r,M)if self.multiselect then self.values[r]=M else table.insert(self.values,r)end end;function C:AddColor(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddColor(aA)end;function C:AddBind(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddBind(aA)end;if a.hasInit and self.hasInit then a1(C,self.content)else C.Init=a1 end;return C end;function ay:AddBox(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.value=tostring(C.value or"")C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.type="box"C.position=#self.options;C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)a.flags[C.flag]=C.value;table.insert(self.options,C)a.options[C.flag]=C;if a.hasInit and self.hasInit then aa(C,self.content)else C.Init=aa end;return C end;function ay:AddColor(C)C=typeof(C)=="table"and C or{}C.section=self;C.text=tostring(C.text)C.color=typeof(C.color)=="table"and Color3.new(C.color[1],C.color[2],C.color[3])or C.color or Color3.new(1,1,1)C.callback=typeof(C.callback)=="function"and C.callback or function()end;C.calltrans=typeof(C.calltrans)=="function"and C.calltrans or C.calltrans==1 and C.callback or function()end;C.open=false;C.trans=tonumber(C.trans)C.subcount=1;C.type="color"C.position=#self.options;C.flag=(a.flagprefix and a.flagprefix.." "or"")..(C.flag or C.text)C.canInit=C.canInit~=nil and C.canInit or true;C.tip=C.tip and tostring(C.tip)a.flags[C.flag]=C.color;table.insert(self.options,C)a.options[C.flag]=C;function C:AddColor(aA)aA=typeof(aA)=="table"and aA or{}aA.sub=true;aA.subpos=self.subcount*24;function aA:getMain()return C.main end;self.subcount=self.subcount+1;return ay:AddColor(aA)end;if C.trans then a.flags[C.flag.." Transparency"]=C.trans end;if a.hasInit and self.hasInit then as(C,self.content)else C.Init=as end;return C end;function ay:SetTitle(aB)self.title=tostring(aB)if self.titleText then self.titleText.Text=tostring(aB)self.titleText.Size=UDim2.new(0,textService:GetTextSize(self.title,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X+10,0,3)end end;function ay:Init()if self.hasInit then return end;self.hasInit=true;self.main=a:Create("Frame",{BackgroundColor3=Color3.fromRGB(30,30,30),BorderColor3=Color3.new(),Parent=ax.main})self.content=a:Create("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(30,30,30),BorderColor3=Color3.fromRGB(60,60,60),BorderMode=Enum.BorderMode.Inset,Parent=self.main})a:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=self.main})table.insert(a.theme,a:Create("Frame",{Size=UDim2.new(1,0,0,1),BackgroundColor3=a.flags["Menu Accent Color"],BorderSizePixel=0,BorderMode=Enum.BorderMode.Inset,Parent=self.main}))local a4=a:Create("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,2),Parent=self.content})a:Create("UIPadding",{PaddingTop=UDim.new(0,12),Parent=self.content})self.titleText=a:Create("TextLabel",{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,12,0,0),Size=UDim2.new(0,textService:GetTextSize(self.title,15,Enum.Font.Code,Vector2.new(9e9,9e9)).X+10,0,3),BackgroundColor3=Color3.fromRGB(30,30,30),BorderSizePixel=0,Text=self.title,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),Parent=self.main})a4.Changed:connect(function()self.main.Size=UDim2.new(1,0,0,a4.AbsoluteContentSize.Y+16)end)for v,C in next,self.options do if C.canInit then C.Init(C,self.content)end end end;if a.hasInit and self.hasInit then ay:Init()end;return ay end;function ax:Init()if self.hasInit then return end;self.hasInit=true;self.main=a:Create("ScrollingFrame",{ZIndex=2,Position=UDim2.new(0,6+self.position*239,0,2),Size=UDim2.new(0,233,1,-4),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarImageColor3=Color3.fromRGB(),ScrollBarThickness=4,VerticalScrollBarInset=Enum.ScrollBarInset.ScrollBar,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false,Parent=a.columnHolder})local a4=a:Create("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,12),Parent=self.main})a:Create("UIPadding",{PaddingTop=UDim.new(0,8),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,2),Parent=self.main})a4.Changed:connect(function()self.main.CanvasSize=UDim2.new(0,0,0,a4.AbsoluteContentSize.Y+14)end)for v,ay in next,self.sections do if ay.canInit and#ay.options>0 then ay:Init()end end end;if a.hasInit and self.hasInit then ax:Init()end;return ax end;function aw:Init()if self.hasInit then return end;self.hasInit=true;local aC=textService:GetTextSize(self.title,18,Enum.Font.Code,Vector2.new(9e9,9e9)).X+10;self.button=a:Create("TextLabel",{Position=UDim2.new(0,a.tabSize,0,22),Size=UDim2.new(0,aC,0,30),BackgroundTransparency=1,Text=self.title,TextColor3=Color3.new(1,1,1),TextSize=15,Font=Enum.Font.Code,TextWrapped=true,ClipsDescendants=true,Parent=a.main})a.tabSize=a.tabSize+aC;self.button.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then a:selectTab(self)end end)for v,ax in next,self.columns do if ax.canInit then ax:Init()end end end;if self.hasInit then aw:Init()end;return aw end;function a:AddWarning(aD)aD=typeof(aD)=="table"and aD or{}aD.text=tostring(aD.text)aD.type=aD.type=="confirm"and"confirm"or""local aE;function aD:Show()a.warning=aD;if aD.main and aD.type==""then return end;if a.popup then a.popup:Close()end;if not aD.main then aD.main=a:Create("TextButton",{ZIndex=2,Size=UDim2.new(1,0,1,0),BackgroundTransparency=0.6,BackgroundColor3=Color3.new(),BorderSizePixel=0,Text="",AutoButtonColor=false,Parent=a.main})aD.message=a:Create("TextLabel",{ZIndex=2,Position=UDim2.new(0,20,0.5,-60),Size=UDim2.new(1,-40,0,40),BackgroundTransparency=1,TextSize=16,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),TextWrapped=true,RichText=true,Parent=aD.main})if aD.type=="confirm"then local aF=a:Create("TextLabel",{ZIndex=2,Position=UDim2.new(0.5,-105,0.5,-10),Size=UDim2.new(0,100,0,20),BackgroundColor3=Color3.fromRGB(40,40,40),BorderColor3=Color3.new(),Text="Yes",TextSize=16,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),Parent=aD.main})a:Create("ImageLabel",{ZIndex=2,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.8,Parent=aF})a:Create("ImageLabel",{ZIndex=2,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=aF})local aG=a:Create("TextLabel",{ZIndex=2,Position=UDim2.new(0.5,5,0.5,-10),Size=UDim2.new(0,100,0,20),BackgroundColor3=Color3.fromRGB(40,40,40),BorderColor3=Color3.new(),Text="No",TextSize=16,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),Parent=aD.main})a:Create("ImageLabel",{ZIndex=2,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.8,Parent=aG})a:Create("ImageLabel",{ZIndex=2,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=aG})aF.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then aE=true end end)aG.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then aE=false end end)else local aF=a:Create("TextLabel",{ZIndex=2,Position=UDim2.new(0.5,-50,0.5,-10),Size=UDim2.new(0,100,0,20),BackgroundColor3=Color3.fromRGB(30,30,30),BorderColor3=Color3.new(),Text="OK",TextSize=16,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),Parent=aD.main})a:Create("ImageLabel",{ZIndex=2,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2454009026",ImageColor3=Color3.new(),ImageTransparency=0.8,Parent=aF})a:Create("ImageLabel",{ZIndex=2,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(1,-2,1,-2),BackgroundTransparency=1,Image="rbxassetid://3570695787",ImageColor3=Color3.fromRGB(50,50,50),Parent=aF})aF.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then aE=true end end)end end;aD.main.Visible=true;aD.message.Text=aD.text;repeat wait()until aE~=nil;spawn(aD.Close)a.warning=nil;return aE end;function aD:Close()aE=nil;if not aD.main then return end;aD.main.Visible=false end;return aD end;function a:Close()self.open=not self.open;if self.open then inputService.MouseIconEnabled=false else inputService.MouseIconEnabled=self.mousestate end;if self.main then if self.popup then self.popup:Close()end;self.main.Visible=self.open;self.cursor.Visible=self.open;self.cursor1.Visible=self.open end end;function a:Init()if self.hasInit then return end;self.hasInit=true;self.base=a:Create("ScreenGui",{IgnoreGuiInset=true})if runService:IsStudio()then self.base.Parent=script.Parent.Parent elseif syn and syn.request then syn.protect_gui(self.base)self.base.Parent=game:GetService"CoreGui"else self.base.Parent=gethui() end;self.main=self:Create("ImageButton",{AutoButtonColor=false,Position=UDim2.new(0,100,0,46),Size=UDim2.new(0,90,0,90),BackgroundColor3=Color3.fromRGB(20,20,20),BorderColor3=Color3.new(),ScaleType=Enum.ScaleType.Tile,Modal=true,Visible=false,Parent=self.base})local aH=self:Create("Frame",{Size=UDim2.new(1,0,0,50),BackgroundColor3=Color3.fromRGB(30,30,30),BorderColor3=Color3.new(),Parent=self.main})self:Create("TextLabel",{Position=UDim2.new(0,6,0,-1),Size=UDim2.new(0,0,0,20),BackgroundTransparency=1,Text=tostring(self.title),Font=Enum.Font.Code,TextSize=18,TextColor3=Color3.new(1,1,1),TextXAlignment=Enum.TextXAlignment.Left,Parent=self.main})table.insert(a.theme,self:Create("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,24),BackgroundColor3=a.flags["Menu Accent Color"],BorderSizePixel=0,Parent=self.main}))a:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,ImageColor3=Color3.new(),ImageTransparency=0.4,Parent=aH})self.tabHighlight=self:Create("Frame",{BackgroundColor3=a.flags["Menu Accent Color"],BorderSizePixel=0,Parent=self.main})table.insert(a.theme,self.tabHighlight)self.columnHolder=self:Create("Frame",{Position=UDim2.new(0,5,0,55),Size=UDim2.new(1,-10,1,-60),BackgroundTransparency=1,Parent=self.main})self.cursor=self:Create("Triangle",{Color=Color3.fromRGB(180,180,180),Transparency=0.6})self.cursor1=self:Create("Triangle",{Color=Color3.fromRGB(240,240,240),Transparency=0.6})self.tooltip=self:Create("TextLabel",{ZIndex=2,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,Font=Enum.Font.Code,TextColor3=Color3.new(1,1,1),Visible=true,Parent=self.base})self:Create("Frame",{AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),Size=UDim2.new(1,10,1,0),Style=Enum.FrameStyle.RobloxRound,Parent=self.tooltip})self:Create("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.fromRGB(60,60,60),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=self.main})self:Create("ImageLabel",{Size=UDim2.new(1,-2,1,-2),Position=UDim2.new(0,1,0,1),BackgroundTransparency=1,Image="rbxassetid://2592362371",ImageColor3=Color3.new(),ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(2,2,62,62),Parent=self.main})aH.InputBegan:connect(function(L)if L.UserInputType.Name=="MouseButton1"then f=self.main;b=true;d=L.Position;e=f.Position;if a.popup then a.popup:Close()end end end)aH.InputChanged:connect(function(L)if b and L.UserInputType.Name=="MouseMovement"then c=L end end)aH.InputEnded:connect(function(L)if L.UserInputType.Name=="MouseButton1"then b=false end end)function self:selectTab(aw)if self.currentTab==aw then return end;if a.popup then a.popup:Close()end;if self.currentTab then self.currentTab.button.TextColor3=Color3.fromRGB(255,255,255)for v,ax in next,self.currentTab.columns do ax.main.Visible=false end end;self.main.Size=UDim2.new(0,16+(#aw.columns<2 and 2 or#aw.columns)*239,0,600)self.currentTab=aw;aw.button.TextColor3=a.flags["Menu Accent Color"]self.tabHighlight:TweenPosition(UDim2.new(0,aw.button.Position.X.Offset,0,50),"Out","Quad",0.2,true)self.tabHighlight:TweenSize(UDim2.new(0,aw.button.AbsoluteSize.X,0,-1),"Out","Quad",0.1,true)for v,ax in next,aw.columns do ax.main.Visible=true end end;spawn(function()while a do wait(1)local aI=self:GetConfigs()pcall(function()for v,z in next,aI do if not table.find(self.options["Config List"].values,z)then self.options["Config List"]:AddValue(z)end end;for x,z in next,self.options["Config List"].values do if not table.find(aI,z)then self.options["Config List"]:RemoveValue(z)end end end)end end)for v,aw in next,self.tabs do if aw.canInit then aw:Init()self:selectTab(aw)end end;self:AddConnection(inputService.InputEnded,function(L)if L.UserInputType.Name=="MouseButton1"and self.slider then self.slider.slider.BorderColor3=Color3.new()self.slider=nil end end)self:AddConnection(inputService.InputChanged,function(L)if self.open then if L.UserInputType.Name=="MouseMovement"then if self.cursor then local aJ=inputService:GetMouseLocation()local aK=Vector2.new(aJ.X,aJ.Y)self.cursor.PointA=aK;self.cursor.PointB=aK+Vector2.new(12,12)self.cursor.PointC=aK+Vector2.new(12,12)self.cursor1.PointA=aK;self.cursor1.PointB=aK+Vector2.new(11,11)self.cursor1.PointC=aK+Vector2.new(11,11)end;if self.slider then self.slider:SetValue(self.slider.min+(L.Position.X-self.slider.slider.AbsolutePosition.X)/self.slider.slider.AbsoluteSize.X*(self.slider.max-self.slider.min))end end;if L==c and b and a.draggable then local aL=L.Position-d;local aM=e.Y.Offset+aL.Y<-36 and-36 or e.Y.Offset+aL.Y;f:TweenPosition(UDim2.new(e.X.Scale,e.X.Offset+aL.X,e.Y.Scale,aM),"Out","Quint",0.1,true)end end end)if not getgenv().silent then delay(1,function()self:Close()end)end end;
end

assert(library.AddTab, "The UI Library failed initialisation.\nPlease contact a Developer.")


local EspLibrary = loadstring(game:HttpGet("https://ducksite.xyz/ceri/esp_library.lua"))()


EspLibrary.settings.enabled = false 
-- UI For Menu/Options
local AimbotTab = library:AddTab("Aimbot")
local VisualsTab = library:AddTab("Visuals")
local WeaponsTab = library:AddTab("Weapons")
local MiscTab = library:AddTab("Misc")
local SettingsTab = library:AddTab("Settings")
local CreditsTab = library:AddTab("Info")

-- UI Columns/Options
local AimbotColumn = AimbotTab:AddColumn()
local VisualsColumn = VisualsTab:AddColumn()
local VIsualsColumn2 = VisualsTab:AddColumn()
local WeaponsColumn = WeaponsTab:AddColumn()
local WeaponsColumn2 = WeaponsTab:AddColumn()
local MiscColumn = MiscTab:AddColumn()
local Misc2 = MiscTab:AddColumn()
local SettingsColumn = SettingsTab:AddColumn()
local CreditsColumn = CreditsTab:AddColumn()


-- UI Sections All Options On Pages
local AimbotSection = AimbotColumn:AddSection("Aimbot")
local ESPSection = VisualsColumn:AddSection("Esp")
local LightingSettings = VIsualsColumn2:AddSection("World")
local Crosshair = VIsualsColumn2:AddSection("Crosshair")
local WeaponsSection = WeaponsColumn:AddSection("Weapon Mods")
local KnifeAura = WeaponsColumn2:AddSection("Knife Aura")
local Grenades = WeaponsColumn2:AddSection("Grenades")
local WeaponModel = WeaponsColumn:AddSection("Weapon Model")
local MiscSection = MiscColumn:AddSection("Misc")
local SettingsSection = SettingsColumn:AddSection("Settings")
local CreditsSection = CreditsColumn:AddSection("Developer")
local CreditsSection2 = CreditsColumn:AddSection("Special Credits")
local CreditsSection3 = CreditsColumn:AddSection("UI Library")
local CreditsSection4 = CreditsColumn:AddSection("Discord")
local createConfigs = SettingsColumn:AddSection("Create Configs")
local LoadConfigs = SettingsColumn:AddSection("Load Configs")
local LibrarySettings = SettingsColumn:AddSection("Library Settings")

-- Grenades/Teleport Grenades
Grenades:AddToggle({
    text = "Grenade Teleport",
    flag = "GrenadeTP",

-- Grenades BlowUp Time 0-5
}):AddSlider({
    text = "Blow Up Time",
    flag = "GrenadeBlowUpTime",
    min = 0,
    max = 5,
    float = .002,
})
-- Bunny Hop, Multiple
MiscSection:AddToggle({
    text = "Bunny Hop",
    flag = "BunnyHop",
}):AddSlider({
    text = "Bunny Hop Speed",
    flag = "BunnyHopSpeed",
    min = 4,
    max = 70,
})

-- Server - Copy invite text and toggle ( discord.gg/vexservices )
CreditsSection4:AddLabel("discord.gg/vexservices")
CreditsSection4:AddButton({
    text = "Copy Invite",
    callback = function()
        setclipboard("discord.gg/vexservices")
    end,
})

-- Ambient Lighting/Brightness
local Lighting = game:GetService("Lighting")
local OldBrightness = Lighting.Brightness
local OldAmbience = Lighting.Ambient

-- Rainbow Gun / Toggle Option / Value
WeaponModel:AddToggle({
    text = "Rainbow Gun",
    flag = "RainbowGun",
    callback = function(value)
        library.flags.RainbowGun = value
    end,
})

-- Not Rainbow + Other Color of your Choice #000000 + / Toggle Option / Value
WeaponModel:AddToggle({
    text = "Gun Color ( Not Rnbw )",
    flag = "GunColorOn",
    callback = function(value)
        library.flags.GunColorOn = value
    end,
})

-- Gun Color again / Function = Value #000000 + 
WeaponModel:AddColor({
    text = "Gun Color",
    flag = "GunColor",
    callback = function(value)
        library.flags.GunColor = value
    end,
})

-- Weapon Transparency, Invisible to Visible/Bright
WeaponModel:AddToggle({
    text = "Weapon Transparency",
    flag = "WeaponTransparency",
    callback = function(value)
        library.flags.WeaponTransparency = value
    end,
})

-- Weapon Transparency, Invisible to Visible/Bright again / Value 0 - 1
WeaponModel:AddSlider({
    text = "Weapon Transparency",
    flag = "WeaponTransparencyValue",
    callback = function(value)
        library.flags.WeaponTransparencyValue = value
    end,
    min = 0,
    max = 1,
    float = 0.001,
})

-- Weapon Material Toggle Function
WeaponModel:AddToggle({
    text = "Weapon Material On",
    flag = "WeaponMaterial",
    callback = function(value)
        library.flags.WeaponMaterial = value
    end,
})

-- List of all Materials / Weapon Material Toggle Function
WeaponModel:AddList({
    text = "Weapon Material",
    flag = "WeaponMaterialValue",
    values = {
        "Plastic",
        "Wood",
        "Slate",
        "Concrete",
        "CorrodedMetal",
        "DiamondPlate",
        "Foil",
        "Grass",
        "Ice",
        "Marble",
        "Granite",
        "Brick",
        "Pebble",
        "Sand",
        "Fabric",
        "SmoothPlastic",
        "Metal",
        "WoodPlanks",
        "Cobblestone",
        "Neon",
        "Glass",
        "ForceField",
    },
    callback = function(value)
        library.flags.WeaponMaterialValue = value
    end,
})

-- Full Bright GUN Choice / Toggle / Function
LightingSettings:AddToggle({
    text = "FullBright",
    flag = "FullBright",
    callback = function(value) library.flags.BrightnessOn = value end,
})

-- Disco Mode on Weapon Toggle / Function - Blinking - Color #000000 + 
LightingSettings:AddToggle({
    text = 'Disco Mode',
    flag = 'RainbowAmbience',
    callback = function(value) library.flags.RainbowAmbience = value end,
})

-- Ambience Toggle Function / Brightness = Value 
LightingSettings:AddToggle({
    text = "Ambience",
    flag = "Ambience",
    callback = function(value) library.flags.Ambience = value end,
})

-- Ambience Toggle Function / Brightness = Value / Add Color = #000000 +
LightingSettings:AddColor({
    text = "Ambience Color",
    flag = "AmbienceColor",
    callback = function(value)
        if library.flags.Ambience then
            Lighting.Ambient = library.flags.AmbienceColor
        end
    end,
})

-- Menu Color / Changes Color of the Menu = Value - #000000 + 
LibrarySettings:AddColor({
    text = "Accent Color",
    flag = "Menu Accent Color",
    callback = function(value)
        library.flags["Menu Accent Color"] = value
    end,
})

-- Configs List / Toggle / Function / From Library
LoadConfigs:AddList({
    text = "Configs",
    skipflag = true,
    value = "",
    flag = "Config List",
    values = library:GetConfigs()
})

-- Config Name = Create from Library = Create Toggle / Function
createConfigs:AddBox({text = "Config Name", skipflag = true});
createConfigs:AddButton({
    text = "Create",
    callback = function()
        library:GetConfigs()
        writefile(library.foldername .. "/" .. library.flags['Config Name'] .. library.fileext , "{}")
        library.options['Config List']:AddValue(library.flags['Config Name'])
        library:SaveConfig(library.flags['Config List'])
    end,
})

-- Load Config List / Toggle On/Off Function
LoadConfigs:AddButton({
    text = "Load",
    callback = function()
        library:LoadConfig(library.flags['Config List'])
    end,
})

-- Gun Animations / Toggle Function From Misc Option
WeaponsSection:AddToggle({
    text = "No Gun Animations",
    flag = "NoAnim",
    callback = function(value) library.flags.NoAnim = value end
})

-- Save Option/Function/Toggle, Saves Settings Too Config 
LoadConfigs:AddButton({
    text = "Save",
    callback = function()
        library:SaveConfig(library.flags['Config List'])
    end,
})

-- Delete Option/Function/Toggle, Deletes Config and Saved Setting
LoadConfigs:AddButton({
    text = "Delete",
    callback = function()
        delfile(library.foldername .. "/" .. library.flags['Config List'] .. library.fileext)
    end,
})

-- Set Defualt Option/Toggle/Function, Sets Main Setting / Save Setting to Default
LoadConfigs:AddButton({
    text = "Set Default",
    callback = function()
        library:GetConfigs()
        writefile(library.foldername .. "/" .. "default" .. library.fileext , "{}")
        library.options['Config List']:AddValue("default")
        library:SaveConfig("default")
    end,
})

-- No Gun Bob Toggle/Function, Makes gun not move when walking/running
WeaponsSection:AddToggle({
    text = "No Gun Bob",
    flag = "NoGunBob",
    callback = function(value)
        library.flags.NoGunBob = value
    end,
})

-- Makes walkspeed number you put it at 10-70 Max, Walkspeed
MiscSection:AddToggle({
    text = "Custom Walkspeed",
    flag = "WalkspeedOn",
    callback = function(value)
        library.flags.WalkspeedOn = value
    end, 
}):AddSlider({
    text = "Walkspeed",
    flag = "Walkspeed",
    min = 10,
    max = 70,
    callback = function(value)
        library.flags.Walkspeed = value
    end, 
})

-- Makes Jump Power number you put it at 2-80 Max, Jump Power
MiscSection:AddToggle({
    text = "Custom Jump Power",
    flag = "JumpPowerOn",
    callback = function(value)
        library.flags.JumpPowerOn = value
    end, 
}):AddSlider({
    text = "JumpPower",
    flag = "JumpPower",
    min = 2,
    max = 80,
    callback = function(value)
        library.flags.JumpPower = value
    end,
})

-- No Fall Damage Function/Toggle, No Fall Damage, Doesn't take away health when falling from high place
MiscSection:AddToggle({
    text = "No Fall Damage",
    flag = "NoFallDamage",
    callback = function(value)
        library.flags.NoFallDamage = value
    end,
})

-- Kill Say, When you kill someone it types message you want it too say
MiscSection:AddToggle({
    text = "Kill Say",
    flag = "KillSay",
})

-- Kill Say, When you kill someone it types message you want it too say - PlayerName
MiscSection:AddBox({
    text = "Kill Say Message",
    flag = "KillSayMsg",
    value = "Shows: msg..playername"
})

-- Extends hitbox on player To make easier shots on Target 0-5 Max
MiscSection:AddToggle({
    text = "Hitbox Extender",
    flag = "HitboxExtender",
}):AddSlider({
    text = "Hitbox Extender",
    flag = "HitboxExtenderValue",
    min = 0,
    max = 5,
    callback = function(value)
        library.flags.HitboxExtenderValue = value
    end,
})

-- No spread on Weapon / Reduces / Function/Toggle 0-1 Max
WeaponsSection:AddToggle({
    text = "Spread Modifier",
    flag = "SpreadReduce",
    callback = function(value)
        library.flags.SpreadReduce = value
    end,
}):AddSlider({
    text = "Spread %",
    flag = "SpreadReduceValue",
    min = 0,
    max = 1,
    float = 0.001,
})

-- Adds recoil to gun to make gameplay less suspicous, Enable Recoil Gun modifactions/Mods
WeaponsSection:AddToggle({
    text = "Enable Recoil",
    flag = "RecoilOn",
    callback = function(value)
        library.flags.RecoilOn = value
    end,
})

-- Function that makes reload speed faster or slower 0-1 Max, Custom Reload Speed = Function/Toggle on Menu/UI
WeaponsSection:AddToggle({
    text = "Custom Reload Speed",
    flag = "CustomReloadSpeed",
    callback = function(value) CustomReloadSpeed = value end,
})

-- Function that controls Firerate 0-1, Shoots more bullets than default and increases bullet speed
WeaponsSection:AddToggle({
    text = "Custom Firerate",
    flag = "CustomFirerate",
    callback = function(value) CustomFirerate = value end,  
})

-- No recoil on Weapon 0-1, Function/Toggle, Makes gun easier to control, up/down/sideways
WeaponsSection:AddSlider({
    text = "Recoil %",
    flag = "NoRecoil",
    min = 0,
    max = 1,
    float = .001,
    callback = function(value)
        library.flags.NoRecoil = value
    end,
})

-- Reload Speed, Custom Reload Speed to 0.0001 or higher, increases speed of reloading and value/Toggle function
WeaponsSection:AddSlider({
    text = "Reload Speed",
    flag = "ReloadSpeed",
    min = 0,
    max = 1,
    float = .001,
    callback = function(value)
        library.flags.ReloadSpeed = value
    end,
})

-- Firerate Addition, Adds Firerate/More bullets to weapon/modifaction 0-2000 Max 
WeaponsSection:AddSlider({
    text = "Firerate addition",
    flag = "FirerateAdition",
    min = 0,
    max = 2000, 
    callback = function(value)
        library.flags.FirerateAdition = value
    end,
})

-- Knife Aura, Kills enemy from far away with a knife / adds distance 1-25 Max
KnifeAura:AddToggle({
    text = "Enabled",
    flag = "KnifeAura",
}):AddSlider({
    text = "Distance",
    flag = "KnifeAuraDistance",
    min = 1,
    max = 25,
})

-- Hold knife only for Kinfe Aura, Enable is toggle/function
KnifeAura:AddToggle({
    text = "Held Only",
    flag = "KnifeAuraHeld",
})

-- Credits UI / Menu
CreditsSection:AddLabel("Made by: StanTheMan#0001")
CreditsSection2:AddLabel(" Discord Server: |  discord.gg/vexservices ")

-- Enabled Toggle/Function of UI / Refresh Rate / MS = State adds suffix
ESPSection:AddToggle({
    text = "Enabled",
    state = true,
    callback = function(state)
        EspLibrary.settings.enabled = state
    end
}):AddSlider({
    text = "Refresh Rate",
    min = 0,
    max = 1000,
    value = 5,
    suffix = "ms",
    callback = function(state)
        EspLibrary.settings.refreshrate = state
    end
})

-- Checks Team Function / Toggle
ESPSection:AddToggle({
    text = "Team Check",
    state = false,
    callback = function(state)
        EspLibrary.settings.teamcheck = state
    end
})

-- Team Color, Changes Team Color ESP / WallHacks, #000000 + 
ESPSection:AddToggle({
    text = "Team Color",
    state = true,
    callback = function(state)
        EspLibrary.settings.teamcolor = state
    end
})

-- Changes ESP Names/WallHacks, UserName 
ESPSection:AddToggle({
    text = "Names",
    state = true,
    callback = function(state)
        EspLibrary.settings.names = state
    end
}):AddColor({
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.namescolor = state
    end
})

-- Adds outline to name to see easier = Adds Ambience /Brightness
ESPSection:AddToggle({
    text = "Names Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.namesoutline = state
    end
})

-- ESP Distance to Studs 
ESPSection:AddToggle({
    text = "Distance",
    state = true,
    callback = function(state)
        EspLibrary.settings.distance = state
    end
}):AddColor({
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.distancecolor = state
    end
})

-- Distance Studs Outline, adds lines too function/toggle
ESPSection:AddToggle({
    text = "Distance Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.distanceoutline = state
    end
})

-- Boxes to ESP/WallHacks, adds boxes to ESP instead of skeleton and other + 
ESPSection:AddToggle({
    text = "Boxes",
    state = true,
    callback = function(state)
        EspLibrary.settings.boxes = state
    end
}):AddColor({ -- Color of boxes function/Toggle
    color = Color3.new(1, 1, 1),
    callback = function(state)
        EspLibrary.settings.boxescolor = state
    end
})

-- Boxes outline, adds outline to boxes to make ambience and visual easier to see
ESPSection:AddToggle({
    text = "Boxes Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.boxesoutline = state
    end
})

-- Instead of boxes empty / just outline it fills the box with chosen color 
ESPSection:AddToggle({
    text = "Boxes Fill",
    state = false,
    callback = function(state)
        EspLibrary.settings.boxesfill = state
    end
}):AddColor({ -- Chosen color - #000000 + 
    color = Color3.new(1, 1, 1),
    trans = 0.5,
    flag = "boxesfillclr",
    callback = function(state)
        EspLibrary.settings.boxesfillcolor = state
        EspLibrary.settings.boxesfilltrans = library.flags["boxesfillclr Transparency"]
    end
})

-- Enemy HealthBars on ESP/Wallhacks, estimates exact health on enemy player to you to see what his health is at to get better advantage
local Healthbars = ESPSection:AddToggle({
    text = "Healthbars",
    state = false,
    callback = function(state)
        EspLibrary.settings.healthbars = state
    end
})
-- Healthbars -- Color #000000 + RGB
Healthbars:AddColor({
    color = Color3.new(0, 1, 0),
    callback = function(state)
        EspLibrary.settings.healthbarscolor = state
    end
})

-- Offset to ESP / Slider on HealthBar
Healthbars:AddSlider({
    text = "X Offset",
    min = 0,
    max = 10,
    value = 2,
    callback = function(state)
        EspLibrary.settings.healthbarsoffset = state
    end
})

-- HealthBar outline, instead of filled color, invisible inside 
ESPSection:AddToggle({
    text = "Healthbars Outline",
    state = false,
    callback = function(state)
        EspLibrary.settings.healthbarsoutline = state
    end
})

-- Tracers, Lines starting from you to enemy player, traces enemy player
local Tracers = ESPSection:AddToggle({
    text = "Tracers",
    state = false,
    callback = function(state)
        EspLibrary.settings.tracers = state
    end
})

Tracers:AddColor({
    color = Color3.new(1, 1, 1), -- Tracers colors = #000000 + 
    callback = function(state)
        EspLibrary.settings.tracerscolor = state
    end
})

-- Tracers list = adds to where you want it / line
Tracers:AddList({
    values = { "Top", "Left", "Right", "Bottom", "Center", "Mouse" },
    value = "Bottom",
    callback = function(state)
        EspLibrary.settings.tracersorigin = state
    end
})

-- UI/Menu text Font/Style of text 
ESPSection:AddList({
    text = "Text Font",
    values = { "UI", "System", "Plex", "Monospace" },
    value = "UI",
    callback = function(state) -- Text function into injects 
        EspLibrary.settings.textfont = Drawing.Fonts[state]
    end
})

-- Font Size/Style size of text/write into UI/Menu
ESPSection:AddSlider({
    text = "Text Font Size",
    min = 13, -- Value Start - Min
    max = 18,
    value = 18, -- Value Max
    suffix = "px",
    callback = function(state)
        EspLibrary.settings.textsize = state
    end
})

-- Crosshair Function/Toggle +
Crosshair:AddToggle({
    text = "Enabled",
    flag = "crosshairOn",
    callback = function(value)
        library.flags.crosshairOn = value
    end,
})
-- Corrshair Size/Value
Crosshair:AddSlider({
    text = "Size",
    flag = "crosshairSize",
    min = 1, -- Min
    max = 50, -- Max
    callback = function(value)
        library.flags.crosshairSize = value
    end,
})
-- Crosshair Transparency / Ambience / Brightness
Crosshair:AddSlider({
    text = "Transparency",
    flag = "crosshairTransparency",
    min = 0, -- Min
    max = 1, -- Max
    float = .1,
    callback = function(value)
        library.flags.crosshairTransparency = value -- Value - Library
    end,
})

-- Crosshair Color, changes crosshair color - #000000 + 
Crosshair:AddColor({
    text = "Color",
    flag = "crosshairColor",
    callback = function(value)
        library.flags.crosshairColor = value -- Value/function
    end,
})
-- Toggle UI Function Makes Key you want to make to open the UI/MENU
SettingsSection:AddBind({
    text = "Toggle UI",
    key = "RightShift",  -- Key to Toggle MENU/UI 
    callback = function() library:Close() end,
})
-- Aimbot Toggle/Function, toggles aim to switch on enemy head or chosen body part
AimbotSection:AddToggle({
    text = "Enabled",
    flag = "AimbotOn",
    callback = function(value)
        library.flags.AimbotOn = value
    end,
})
-- Aimbot Mode Toggle/Function, chooses the mode you choose, silent mode is so you don't have to aim and your bullets are magnet bullets
AimbotSection:AddList({
    text = "Aimbot Mode",
    flag = "AimbotMode",
    values = {
        "Automatic", -- Silent Mode
        "Manual", -- Manual Mode
    },
})
-- Aimbot Toggle/Functions min-0 max-100
AimbotSection:AddSlider({
    text = "Silent Aim Headshot %", -- Percent of hitting Bullets
    flag = "SilentAimHeadshotChance", -- Headshot chance of hitting/ bullets
    min = 0, -- Minunum Percent/Chance
    max = 100, -- Max Percent/Chance
})
-- Visible Check Toggle/Functions instead of aimbot through wall it checks through to make settings less suspicous
AimbotSection:AddToggle({
    text = "Visible Check", --Text on UI/MENU
    flag = "VisibleCheck",
    callback = function(value)
        library.flags.VisibleCheck = value
    end,
})
-- Highlight Enemy/Target, highlights the enemy for you to see them easier 
AimbotSection:AddToggle({
    text = "Highlight Target",
    flag = "HighlightTarget",
    callback = function(value)
        EspLibrary.settings.aimtarget_on = value -- Value
    end,
}):AddColor({
    flag = "aimtarget_color", -- Aimbot Color, Target color - #000000 +
    callback = function(value)
        EspLibrary.settings.aimtarget_color = value
    end,
})
-- Show FOV, Toggle/Function on UI/MENU shows FOV Line/Circle so you know where the shots go and how the screen is 
AimbotSection:AddToggle({
    text = "Show FOV",
    flag = "ShowFOV",
    callback = function(value)
        library.flags.ShowFOV = value
    end,
})
-- Follows the gun barrel, Toggle/Function on UI/Menu
AimbotSection:AddToggle({
    text = "FOV Follow Barrel", -- Text
    flag = "FOVFollowBarrel", -- Flag Version
    callback = function(value)
        library.flags.FOVFollowBarrel = value -- Value = Function
    end,
})
-- FOV for Silent Aim or Aimbot, Manual/Automatic
AimbotSection:AddSlider({
    text = "FOV",
    flag = "FOV",
    min = 5, -- Minumum for slider
    max = 600, -- Max for slider
    callback = function(value)
        library.flags.FOV = value
    end,
})
-- FOV Transparency, Ambience/Brightness to the FOV Line 
AimbotSection:AddSlider({
    text = "FOV Transparency",
    flag = "FOVTransparency",
    min = 0, -- Minumum
    max = 1, -- Max for slider/Number
    float = .001,
    callback = function(value)
        library.flags.FOVTransparency = value -- Value = Function in Libary
    end,
})
-- Fov Lines, shows the lines on the FOV so you can see where it leads to Enemy/Target
AimbotSection:AddSlider({
    text = "FOV Lines",
    flag = "FOVRadius",
    min = 4, -- Minumum
    max = 60, -- Max distance/studs for slider/number
    value = 15,
    callback = function(value)
        library.flags.FOVRadius = value
    end,
})
-- Thickness for FOV Lines adds more layers to lines 
library.flags.FOVRadius = 15
AimbotSection:AddSlider({
    text = "FOV Circle Thickness", -- Text
    flag = "FOVThickness", -- Flag
    min = 1, -- Minumum for slider/number
    max = 20, -- Max for slider/number
    callback = function(value)
        library.flags.FOVThickness = value -- Value
    end,
})
-- Adds smoothness to transitions on enemy when aimbot is toggled
AimbotSection:AddSlider({
    text = "Smoothness", -- Text 
    flag = "AimSmoothness", -- Flag
    min = 2, -- Minumum for slider/number
    max = 80, -- Max for slider/number
    float = .01, -- Floated for 0.1 or higher
    callback = function(value)
        library.flags.AimSmoothness = value -- Value = Function / Toggle Function 
    end,
})
-- Fov Color, adds chosen color to FOV lines - #000000 +
AimbotSection:AddColor({
    text = "FOV Color", -- Text
    flag = "FOVColor",
    value = Color3.fromRGB(255, 255, 255), -- RGB Version
    callback = function(value)
        library.flags.FOVColor = value -- Value = Function from libary
    end,
})
-- Target Part, choose what part you want aimlock/aimbot to go on
AimbotSection:AddList({
    text = "Target Part",
    flag = "TargetPart",
    values = { -- 7 Options
        "Head", -- 1
        "Torso", -- 2
        "Left Leg", -- 3
        "Right Leg", -- 4
        "Left Arm", -- 5
        "Right Arm", -- 6
        "Random", -- 7
    },
    value = "Head", -- Main Value/Option - 1
    callback = function(value)
        library.flags.TargetPart = value -- Function from libary
    end,
})
library.flags.TargetPart = "Head" -- Head = libary section

-- Key on keyboard/mouse for aiming to toggle on enemy/target player 
AimbotSection:AddList({
    text = "Aim Key",
    values = {
        "Left Mouse Button", -- Left
        "Right Mouse Button", -- Right
    },
    value = "Right Mouse Button", -- Value 1
    flag = "AimKey", -- Aim key verison flag
    callback = function(value)
        if value == "Left Mouse Button" then
            library.flags.AimKey = Enum.UserInputType.MouseButton1
        elseif value == "Right Mouse Button" then
            library.flags.AimKey = Enum.UserInputType.MouseButton2
        end
    end,
})
library.flags.AimKey = Enum.UserInputType.MouseButton2 -- Inputs chosen option

-- Aimbot Divider/Section 
AimbotSection:AddDivider()


-- Services + 4
local Players = game:GetService("Players") -- Players Service + 1
local ReplicatedStorage = game:GetService("ReplicatedStorage") -- Replicated Storage + 2
local UserInputService = game:GetService("UserInputService") -- User Inputted Service + 3
local RunService = game:GetService("RunService") -- Run Service + 4

-- Cache - 5
local LocalPlayer = Players.LocalPlayer -- Finds player / using UI/MENU
local Mouse = LocalPlayer:GetMouse() -- Spectates/Finds current mouse
local Camera = workspace.CurrentCamera -- Camera on Camera/Third Person view
local ViewportCenter = Camera.ViewportSize/2 -- Port size
library.flags.Closest = nil -- Non existance Cache

-- Libraries + Libaries script first/20th line
getgenv().Libraries = loadstring(game:HttpGet("https://ducksite.xyz/ceri/libraries.lua"))() -- 1 Main
getgenv().Hooks = Libraries.Hooks -- 2 Hooks
getgenv().DrawingObjectManager = Libraries.Drawings -- 3 Drawings

-- Animations 
animations = {}

-- Framework
getgenv().client = {}; do
    local gc = getgc(true)  
    for i = #gc, 1, -1 do
        local v = gc[i]
        local type = type(v)
        if type == 'function' then -- Function / Toggle
            if debug.getinfo(v).name == "loadmodules" then -- Loads Modules from game and UI/MENU to inject in game 
                client.loadmodules = v
            end
        end
-- Raws / Get
        if type == "table" then
            if (rawget(v, 'send')) then -- Sends to Raw
                client.network = v
            elseif (rawget(v, 'basecframe')) then -- BasecFrame 
                client.camera = v
            elseif (rawget(v, "gammo")) then -- Gammo
                client.gamelogic = v
            elseif (rawget(v, "getbodyparts")) then -- Gets body Parts
                client.replication = v
                client.replication.bodyparts = debug.getupvalue(client.replication.getbodyparts, 1) -- Value from get bodyparts
            elseif (rawget(v, "updateammo")) then -- Updates ammo
                client.hud = v
            elseif (rawget(v, "setbasewalkspeed")) then -- Sets basic walkspeed
                client.char = v
            elseif (rawget(v, "getscale")) then -- Scale of char
                client.uiscaler = v
            end
            if rawget(v, 'player') then -- Player Raw
                print("Got animation") -- Animations print from Player Raw
                table.insert(animations, v) -- Inserts table
            end -- End 1
        end -- End 2 
    end -- End 3
end -- End 4

-- Chats + 3 from Game 
local ChatGame = LocalPlayer.PlayerGui:WaitForChild("ChatGame") -- Chat Game
local GlobalChat = ChatGame:WaitForChild("GlobalChat") -- Global Chat
local MsgerMain = ReplicatedStorage.Misc:WaitForChild("MsgerMain") --MsgerMain 

-- Client Console Text/Print for UI/MENU
function client:console(Message)
    local Msger = MsgerMain:Clone()
	Msger.Text = "[Vex Services]: " -- Text Here
	Msger.TextColor3 = Color3.fromRGB(255, 100, 120) -- RGB
	Msger.Msg.Text = Message
	Msger.Parent = GlobalChat
	Msger.Msg.Position = UDim2.new(0, Msger.TextBounds.x / client.uiscaler.getscale(), 0, 0)
end

-- Script Loading text on Messages
client:console("Script loading, be patient...")
if identifyexecutor then
	executor = identifyexecutor():lower() -- Executors
	local supported = false
	if executor:find("ware") then -- Ware executor
		supported = true -- Supported Script
	elseif executor:find("synapse") then -- Synapse executor
		supported = true -- Supported Script
	elseif executor:find("krnl") then -- krnl executor
	    supported = true -- Supported Script
	end
	if not supported then
		client:console("This executor is not supported. If you think it does contact StanTheMan#0001 or Join or Discord:  discord.gg/vexservices") -- Not supported text on console / support / contact
        client:console("If you want to use another executor that works use KRNL.") -- Tip Text on Console
		return
	end -- End 1
end -- End 2

-- Module Not Found Text/Messages/ on UI/MENU 
c_assert = function(val,msg)
    if val == nil then -- Non existant
        LocalPlayer:Kick(msg) -- Kicks Local Player 
    end -- 1
end -- 2

-- Report to developer if missing module 
c_assert(client.network, "Could not find network module\nReport this to a developer.")
c_assert(client.camera, "Could not find camera module\nReport this to a developer.")
c_assert(client.gamelogic, "Could not find gamelogic module\nReport this to a developer.")
c_assert(client.replication, "Could not find replication module\nReport this to a developer.")
c_assert(client.hud, "Could not find hud module\nReport this to a developer.")
c_assert(client.char, "Could not find char module")
c_assert(client.loadmodules, "Could not find loadmodules function\nReport this to a developer.")
c_assert(client.replication.bodyparts, "Could not find bodyparts table\nReport this to a developer.")
-- Module Not Found Messages END 

-- Functions 
function client:IsAlive(player)
    if client.replication.bodyparts[player] and client.replication.bodyparts[player].head then -- Body Part Function
        return true 
    end
    return false
end

function client:getplayerhealth(player)
    return client.hud:getplayerhealth(player) -- Get Player Health Function / ESP / WALLS
end

function client:HasProperty(Object, Property)
    local success, error = pcall(function()
        local a = Object[Property] -- Objects of Property
    end)
    return success
end

function client:GetGun() -- Get Gun Function 
    for i,v in pairs(Camera:GetChildren()) do -- Get Children Function 
        if client.char.alive then 
            if v.Name == client.gamelogic.currentgun.name then -- Current Gmae name 
                return v 
            end
        end
    end
    return nil -- Returns non existant function 
end 

function client:IsVisible(player) -- Player is Visble Function
    if client:IsAlive(player) and client.replication.bodyparts[player] then -- Replication/Body Parts Function
        local HeadPos = client.replication.bodyparts[player].head.Position -- Client of ^^
        local Hit = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.p, HeadPos - Camera.CFrame.p), { -- Find parts on Ray with Ignore List Function
            workspace.Ignore, -- Ignore
            workspace.Players, -- Player
            workspace.Terrain, -- Terrain
            Camera
        })
        return Hit == nil -- Hits non existant function to return 
    end
    return false
end

-- Corners for client/console
function client:GetCorners(Size, CF)
    local Corners = {}
    Corners["TopLeft"] = (CF * CFrame.new(Size.X, Size.Y, 0)).p -- Top Left corner
    Corners["TopRight"] = (CF * CFrame.new(-Size.X, Size.Y, 0)).p -- Top Right corner
    Corners["BottomLeft"] = (CF * CFrame.new(Size.X, -Size.Y, 0)).p -- Bottom Left corner
    Corners["BottomRight"] = (CF * CFrame.new(-Size.X, -Size.Y, 0)).p -- Bottom Right corner
    return Corners
end -- END of corners


-- Bounding box client 
function client:GetBoundingBox(Bodyparts) -- Body Parts 
	local Size = Bodyparts.torso.Size * Vector3.new(1, 1.5) -- Vector 3 or newer
	local BoxCorners = self:GetCorners(Size, Bodyparts.torso.CFrame) -- Get corners

-- Views world port from to view corners 
	return {
		TopLeft = Camera:WorldToViewportPoint(BoxCorners.TopLeft), -- 1
		TopRight = Camera:WorldToViewportPoint(BoxCorners.TopRight), -- 2
		BottomLeft = Camera:WorldToViewportPoint(BoxCorners.BottomLeft), -- 3 
		BottomRight = Camera:WorldToViewportPoint(BoxCorners.BottomRight), -- 4
	}
end

-- Chams function / Player 
function client:HandleChams(player)
    RunService:BindToRenderStep("Chams", 1, function()
        
    end)
end -- END 

-- Creats render for crosshair - 1 or 2 line 
function client:CreateCrosshairRenderstep() -- Rendering setup
    local Vertical = DrawingObjectManager:NewDrawing("Crosshair_1", "Line") -- Line 1
    local Horizontal = DrawingObjectManager:NewDrawing("Crosshair_2", "Line") -- Line 2

-- Run services to crosshair renders 
    RunService:BindToRenderStep("Crosshair", 1, function() -- FUnction 1 on crosshair toggle function 
        Vertical.Visible = library.flags.crosshairOn -- 1
        Horizontal.Visible = library.flags.crosshairOn -- 2
        Vertical.Color = library.flags.crosshairColor -- 3
        Horizontal.Color = library.flags.crosshairColor -- 4
        Vertical.Transparency = library.flags.crosshairTransparency -- 5
        Horizontal.Transparency = library.flags.crosshairTransparency -- 6
-- Center the crosshair renders 
        Vertical.From = Vector2.new(ViewportCenter.X, ViewportCenter.Y - library.flags.crosshairSize) -- Render 1
        Vertical.To = Vector2.new(ViewportCenter.X, ViewportCenter.Y + library.flags.crosshairSize) -- Render 2
        Horizontal.From = Vector2.new(ViewportCenter.X - library.flags.crosshairSize, ViewportCenter.Y) -- Render 3
        Horizontal.To = Vector2.new(ViewportCenter.X + library.flags.crosshairSize, ViewportCenter.Y) -- Render 4
    end) -- End 1
end -- End 2

-- Predict Movement/Moving
function client:PredictMovement(player, strength) -- Cleint for function
    if client:IsAlive(player) then -- Is Alive predicts or is 
    
    end -- End 1 
end -- End 2

-- Player on screen Function 
function client:PlayerOnScreen(player) -- CLeint for function 
    if client:IsAlive(player) then -- Is alive function to prediction 
        local Pos, OnScreen = Camera:WorldToViewportPoint(client.replication.bodyparts[player].head.Position) -- Pos, on Screen to camera 
        local RealMouseLocation = UserInputService:GetMouseLocation() -- Gets/predicts mouse location 
        local Distance = library.flags.FOV -- From Libary to FOV and Flags 
        local IsInFOV = false -- Is false 
        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude -- Magnitude and location 
        if Dist < Distance then -- From Distance to the dist Prediction 
            Distance = Dist -- Dist 1
            IsInFOV = true -- In FOV 1 
        end -- End 1
        return {OnScreen = OnScreen, IsInFOV = IsInFOV} -- Returns FOV on Settings 
    end -- End 2 
end -- End 3

-- Function is false 
function client:InitAimbot() -- Client to function 
    local MouseDown = false -- Mouse down location 
    UserInputService.InputBegan:Connect(function(key) -- Inputted service from mouse = connects 
        if key.UserInputType == library.flags.AimKey then --  To Libary ^^ 
            MouseDown = true -- True 1
        end -- End 1 
    end) -- End 2 

-- Connect to keys client and function  
    UserInputService.InputEnded:Connect(function(key) -- Key function 
        if key.UserInputType == library.flags.AimKey then -- AImKey function from libary 
            MouseDown = false -- Flase 
        end -- End 1 
    end) -- End 2

-- Aimbot circle / FOV 
    local Circle = DrawingObjectManager:NewDrawing("Aimbot_Circle", "Circle") -- New drawing of Aimbot / FOV 
    local Closest -- Closest 
    local ClosestPosition -- Posistion ^^
    local OnScreen, ScreenPos = nil,nil -- Non existant Screen, POS 
    RunService:BindToRenderStep("Aimbot", 1, function() -- Fucntion for Rendering 1 
        CharAlive = client.char.alive -- Client is alive, char 
        if client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then -- Game logic from current gun barrel 
            Barrel = client.gamelogic.currentgun.barrel -- Follows gun barrel = Game Logic 
        else -- 1 
            Barrel = nil -- Non existant Barrel

        end -- End 1 
-- Start of Radius of FOV and Other 
        Circle.NumSides = library.flags.FOVRadius -- FOV Radius
        Circle.Thickness = library.flags.FOVThickness -- FOV Thickness 
        Circle.Color = library.flags.FOVColor -- FOV Color 1
        Circle.Radius = library.flags.FOV -- FOV Flags 
        Circle.Transparency = library.flags.FOVTransparency -- FOV Transparency
        Circle.Color = library.flags.FOVColor -- FOV Color 2
        Circle.Visible = library.flags.ShowFOV -- FOV Show 
        if client.char.alive and client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then -- Current Gun / Barrel nil = Fucntion to Toggle 
            if library.flags.FOVFollowBarrel then
                local Pos, OnScreen = Camera:WorldToViewportPoint(client.gamelogic.currentgun.barrel.CFrame * Vector3.new(0, 0, -10)) -- Vector 3 or newer
                Circle.Position = Vector2.new(Pos.X, Pos.Y) -- POS Direction  / Position 
            else -- 2
                Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 36) -- + 35 Direction or Position
            end -- End 1
        else -- 3
            Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
        end -- End 2
-- Aimbot On Toggle Function = Alive or Char Live 
        if library.flags.AimbotOn and client.char.alive then
            local Distance = library.flags.FOV -- From Libary 
            local Bodyparts -- Body Parts 
            local RealMouseLocation -- Real Mouse Location 
            if library.flags.FOVFollowBarrel then -- FOV Follows Barrel
                local Pos = Camera:WorldToViewportPoint(client.gamelogic.currentgun.barrel.CFrame * Vector3.new(0, 0, -10)) -- Vector 3 or newer 
                RealMouseLocation = Vector2.new(Pos.X, Pos.Y) -- CBA changing variable name 
            else -- 4
                RealMouseLocation = UserInputService:GetMouseLocation() -- Inputs Mouse Location = Function 
            end -- End 1
            if RealMouseLocation ~= nil then
                for i,v in pairs(Players:GetPlayers()) do
                    if (v ~= LocalPlayer) and (v.Team ~= LocalPlayer.Team) and client:IsAlive(v) then
                        Bodyparts = client.replication.bodyparts[v]
                        local Pos, OnScreen = Camera:WorldToViewportPoint(Bodyparts.head.Position)
                        local Dist = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude -- Magnitude prediction for Vector 3 or Dist 
                        if Dist < Distance then
                            Distance = Dist -- Dist = Distance
                            Closest = v -- Closest is V = Toggle Function for Aimbot
                            EspLibrary.settings.aimtarget = v -- V = Aimbot Toggle Function 
                        end -- End 2
                    end -- End 3 
                end -- End 4
-- Screen POS, Local from Screen POS, NIL = Non Existant or = Closest to Function / Toggle 
                local ScreenPos, OnScreen = nil, nil -- Start of NIL
                if Closest and client.replication.bodyparts[Closest] then -- Body Parts 
                    local ClosestParts = client.replication.bodyparts[Closest] -- Body Parts Closest
                    if library.flags.TargetPart == "Head" then -- Head Target Part from Libary 
                        ClosestPosition = ClosestParts.head.Position -- Position ^^
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.head.Position) -- 1
                    elseif library.flags.TargetPart == "Torso" then -- Torso Target part from libary
                        ClosestPosition = ClosestParts.torso.Position -- Position ^^ 
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.torso.Position) -- 2
                    elseif library.flags.TargetPart == "Left Arm" then -- Left Arm Target part from libary
                        ClosestPosition = ClosestParts.larm.Position -- Position ^^ 
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.larm.Position) -- 3
                    elseif library.flags.TargetPart == "Right Arm" then -- Right Arm Target part from libary
                        ClosestPosition = ClosestParts.rarm.Position -- Position ^^ 
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.rarm.Position) -- 4
                    elseif library.flags.TargetPart == "Left Leg" then -- Left Leg Target part from libary
                        ClosestPosition = ClosestParts.lleg.Position -- Position ^^ 
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.lleg.Position) -- 5
                    elseif library.flags.TargetPart == "Right Leg" then -- Right Leg Target part from libary
                        ClosestPosition = ClosestParts.rleg.Position -- Position ^^ 
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(ClosestParts.rleg.Position) -- 6
                    elseif library.flags.TargetPart == "Random" then -- Chooses Random Body Part to Lock On
                        local Parts = { -- Local Parts = Body Parts or Closest Function 
                            ClosestParts.head, -- Head = Closest Part
                            ClosestParts.torso, -- Torso = Closest Part
                            ClosestParts.larm, -- Left Arm = Closest Part
                            ClosestParts.rarm, -- Right Arm = Closest Part
                            ClosestParts.lleg, -- Left Leg = Closest Part
                            ClosestParts.rleg -- Right Leg = Closest Part
                        } -- End of Closest Parts 
-- On Screen Point = Math random answers 
                        local Part = Parts[math.random(1, #Parts)]
                        ClosestPosition = Part.Position
                        ScreenPos, OnScreen = Camera:WorldToScreenPoint(Part.Position) -- World to screen on Point 
                    end
                    if library.flags.AimbotMode == "Silent" then -- Silent Aim = Magnet Bullets
                        if math.random(1,100) < library.flags.SilentAimHeadshotChance then -- Headshot chance to hit = %
                            ClosestPosition = ClosestParts.head.Position -- Head position and closest parts
                        else
                            ClosestPosition = ClosestParts.torso.Position -- Torso for silent aim
                        end -- End 1
                    end -- End 2
                    if OnScreen and library.flags.AimbotMode == "Mouse" and MouseDown then -- Mouse and Mouse down when smoothing = to smooth aim and silent aim
                        local Smoothing = math.clamp(library.flags.AimSmoothness, 3, 100) -- Aim Smoothness 3-100
                        local X = ((ScreenPos.X) - (Mouse.X)) / Smoothing -- Position to smoothing
                        local Y = ((ScreenPos.Y) - (Mouse.Y)) / Smoothing -- Other same as top 
                        if library.flags.VisibleCheck and not client:IsVisible(Closest) then -- Visible Check
                            return -- Returns all of functions and toggles
                        end -- End 1
                        mousemoverel(X, Y) -- Mouse Move 1 x-y
                    end -- End 2
                end -- End 3
            end -- End 4
        end -- End 6
    end) -- End 6
    local Old -- Old local script / Function to Toggle 
    Old = hookmetamethod(game, "__index", function(Self, Key) -- Self Keys to silent aim 
        if library.flags.AimbotMode == "Silent" and client.char.alive then -- Silent Aim to Char = Alive to CFrame
            if Key == "CFrame" and not checkcaller() then -- Cframe
                if client.gamelogic.currentgun and client.gamelogic.currentgun.barrel then -- Current Barrel = nil
                    if Self == client.gamelogic.currentgun.barrel or Self == client.gamelogic.currentgun.aimsightdata[1].sightpart then -- Sight Part too function or toggle option
                        if Closest and ClosestPosition then
                            if getcallingscript().Name == "RenderSteppedRunner" then -- Calling Function
                                local PlayerOnScreen = client:PlayerOnScreen(Closest) -- Player on screen client function
                                if PlayerOnScreen and PlayerOnScreen.OnScreen then -- On screen Player
                                    local OnScreen = PlayerOnScreen.OnScreen -- On screen FOV
                                    local IsInFOV = PlayerOnScreen.IsInFOV -- ON FOV / Screen
                                    local Position = Self.Position -- Position to self position
                                    if IsInFOV and OnScreen then -- On screen ON FOV adds ambience to your shots 
                                        if library.flags.VisibleCheck and not client:IsVisible(Closest) then -- visible Check = Closest body Parts 
                                            return Old(Self, Key) -- Returns old functions to new functions and toggle options
                                        end -- End 1
                                        local CFramePosition = CFrame.new(Position, ClosestPosition) -- CFrame Position 
                                        return CFramePosition -- Cframe Position 1
                                    end -- End 1
                                end -- End 2
                            end -- End 3
                        end -- End 4
                    end -- End 5
                end -- End 6
            end -- End 7
        end -- End 8
        return Old(Self, Key) -- Returns 8 endings to Self Key for aimbot or silent aim keys / Toggles options
    end) -- End 9
end -- End 10 

-- I and V Pairs into animations and functions 
for i,v in pairs(animations) do -- Do this ^^
   if v.player then -- Old .v player
        local old_player = v.player -- Top function ^^
        v.player = function(a, b) -- A to B Functions 
            print("Successfully Overwritten Function") -- Print for Overwriting Function
            if client.char.alive and client.gamelogic.currentgun and library.flags.NoAnim then -- Client for Game Logic 
                print("Passed the First Check")
                if client.gamelogic.currentgun.type ~= "KNIFE" then -- Knife Function 
                    for i,v in pairs(client.gamelogic.currentgun.data.animations) do -- Gives game Client loops 
                        print("Looped through",v) -- Looped through Print / Message 
                        if b == v then -- B = V on Return Function 
                            return function() end -- Return Function - Toggle 
                        end -- End 1
                    end -- End 2
                end -- End 3
            end -- end 4
            return old_player(a,b) -- End of Ends and return back to end function 
        end -- End 5
    end -- End 6
end -- End 7

-- Cleint for Solve Vector 3
function client:SolveVector3(Vector)
    if library.flags.NoRecoil == 0 then -- No Recoil function 
        return Vector3.new() -- Returns Vector 3 into Libary Functions 
    else
        return Vector * library.flags.NoRecoil -- No Recoil inserted into Libary 
    end
end 
-- Weapon client = Functions for toggle 
function client:Weapons()
    local vec = Vector3.new()
    local SolveVector3 = function(vector)return client:SolveVector3(vector) end -- Solves Vector 3
    local loadgun = debug.getupvalue(client.loadmodules, 6) -- 6 Modules 
    local modifydata = debug.getupvalue(loadgun, 1) -- Loads Funs 1-1
    debug.setupvalue(loadgun, 1, function(...) -- Same here ^^
        retv = modifydata(...) -- Modifys Data 
        v1 = retv -- Retv to V1
        if library.flags.CustomFirerate then -- Custom Firerate Function then insert number you want as firerate 1-inf recommended = 1-100
            if type(retv.firerate) == 'number' then -- Number
                retv.firerate = retv.firerate + library.flags.FirerateAdition -- FireRate Addition 
            end -- End 1
        end -- End 2 

-- Library for Recoil ON
        if library.flags.RecoilOn then
            v1.rotkickmin = SolveVector3(v1.rotkickmin) -- Solves Vector 3 - 1 = v1 to v1 - 4
            v1.rotkickmax = SolveVector3(v1.rotkickmax) -- Solves Vector 3 - 2
            v1.transkickmin = SolveVector3(v1.transkickmin) -- Solves Vector 3 - 3
            v1.transkickmax = SolveVector3(v1.transkickmax) -- Solves Vector 3 - 4
            --v1.camkickmin = SolveVector3(v1.camkickmin) ^^
            --v1.camkickmax = SolveVector3(v1.camkickmax) ^^
            --v1.camkickspeed = 0;
            v1.aimrotkickmin = SolveVector3(v1.aimrotkickmin) 
            v1.aimrotkickmax = SolveVector3(v1.aimrotkickmax)
            v1.aimtranskickmin = SolveVector3(v1.aimtranskickmin)
            v1.aimtranskickmax = SolveVector3(v1.aimtranskickmax)
            v1.aimcamkickmin = SolveVector3(v1.aimcamkickmin)
            v1.aimcamkickmax = SolveVector3(v1.aimcamkickmax)
            --v1.aimcamkickspeed = 0;
            --v1.modelkickspeed = 0;
            --v1.modelrecoverspeed = 0;
            --v1.modelkickdamper = 0.0;
            --v1.aimkickmult = 0.0;
        end -- End 1
-- Library Spread Reduce 
        if library.flags.SpreadReduce then 
            v1.hipfirespread = v1.hipfirespread * library.flags.SpreadReduceValue; -- Hipfire Accuracy V1 to V1 = 3
            v1.hipfirestability = v1.hipfirestability * library.flags.SpreadReduceValue; -- Spread Reduce from Library
            v1.hipfirespreadrecover = v1.hipfirespreadrecover * library.flags.SpreadReduceValue; -- Spread Reduce from Library = Value 
        end -- End 1
-- Custom Reload Speed
        if library.flags.CustomReloadSpeed then -- Custom Reload Speed 
            local anim = v1.animations -- Custom Reload Speed  Local or Animations to V1
            if anim.tacticalreload then -- tactiacl Reload to V1 ^^
                v1.animations.tacticalreload.resettime = library.flags.ReloadSpeed -- Reload Speed 
                v1.animations.tacticalreload.stdtimescale = library.flags.ReloadSpeed -- Reload Speed Time Scale
                v1.animations.tacticalreload.timescale = library.flags.ReloadSpeed -- reload Speed Animations 
            elseif anim.reload then -- If none use ...
                v1.animations.reload.resettime = library.flags.ReloadSpeed -- Reset Time
                v1.animations.reload.stdtimescale = library.flags.ReloadSpeed -- Reload STD Time Scale 
                v1.animations.reload.timescale = library.flags.ReloadSpeed -- Time Scale of Reloading
            elseif anim.pullbolt then -- Animation PullBolt
                v1.animations.pullbolt.stdtimescale = library.flags.ReloadSpeed -- V1 STD Time Scale
                v1.animations.pullbolt.timescale = library.flags.ReloadSpeed -- Reload Scale 
                v1.animations.pullbolt.resettime = library.flags.ReloadSpeed -- Library Flags for Reset Time Scale
            end -- End 1
        end -- End 2
        return retv -- Returns End Functions to RETV
    end) -- End 3
    local gunbob = debug.getupvalue(loadgun, 58) -- Load gun Function to 58
    debug.setupvalue(loadgun, 58, function(...) -- Load Gun = Function to setup the value 
        if library.flags.NoGunBob then -- Library to NoGunBob
            return CFrame.new() -- CFrame returns to Flag or GunBob
        end -- End 1
        return gunbob(...)
    end) -- End 2
end -- End 3
library.flags.GunColor = Color3.fromRGB(255,255,255) -- RBG Brightness for MENU/UI
function client:MiscLoop() -- Misc Loop 
    Lighting:GetPropertyChangedSignal("Brightness"):Connect(function(v) -- Function for Property
        if library.flags.BrightnessOn then
            Lighting.Brightness = 1000 -- Brightness to 1000
            Lighting.GlobalShadows=false -- False Brightness to global Shadows
        else
            Lighting.Brightness = OldBrightness -- Old Brightness Abandon
            Lighting.GlobalShadows=true -- Global Shadows Lighting = True
        end -- End 1
    end) -- End 2
    
    local GameGui = LocalPlayer.PlayerGui.MainGui:WaitForChild("GameGui") -- Game GUI = Local Player or Player GUI

    GameGui.Killfeed.ChildAdded:Connect(function(c)
        repeat task.wait() until c.Text ~= "StanTheMan"
        if library.flags.KillSay then
            if c.Text == LocalPlayer.Name then
                local Victim = c.Victim.Text
                if Victim == LocalPlayer.Name then
                    return
                end -- End 1
                local Msg = library.flags.KillSayMsg..Victim or "You killed "..Victim -- You Killed if Function Toggle is to type chat if you kill someone 
                client.network:send("chatted", Msg) -- Chatted in Console if you kill someone
            end -- End 1
        end -- End 2
    end) -- End 3
    
-- Function to closest body part
    function closest() -- closest function
        local Distance = math.huge -- Huge Math to Distance or Studs 
        local Closest -- Closest Local Part Function
        local Bodyparts -- BodyParts Local Function
        local AimPart --  AimPart Local Function
        local RealMouseLocation = UserInputService:GetMouseLocation() -- Real Mouse Location Function Localy
        local Pos, OnScreen = nil, nil -- Nil on Screen Function 
        local Autowallable = false -- Autowallabe Local Function = False 
        local inFOV = false -- In FOV Function Localy
-- For I-V in pairs to get players
        for i,v in pairs(Players:GetPlayers()) do -- Get Players
            if (v ~= LocalPlayer) and (v.Team ~= LocalPlayer.Team) and client.replication.bodyparts[v] and client.replication.bodyparts[v].head then -- Localy Players / Body Parts
                Bodyparts = client.replication.bodyparts[v] -- Client = BodyParts

-- Bulletcheck arguments : Origin, Target, Trajectory, Acceleration, Penetration Depth 
                local Pos2, OnScreen2 = Camera:WorldToScreenPoint(Bodyparts.head.Position)
                local Dist = (Vector2.new(Pos2.X, Pos2.Y) - Vector2.new(RealMouseLocation.X, RealMouseLocation.Y)).Magnitude
                if Dist < Distance then
                    AimPart = Bodyparts['head'] -- Aim Part Head from BodyParts Function
                    Distance = Dist -- Distance = Dist on Aiming Toggle Function
                    Closest = v -- Closest V = Dist 
                    inFOV = true -- FOV True Client Function or Toggle
                    Pos, OnScreen = Pos2, OnScreen2 -- On Screen Pos2
                end -- End 1
            end -- End 2
        end -- End 3
        return {Closest = Closest, OnScreen = OnScreen, Part = AimPart, InFOV = inFOV} -- Return back from Body Parts or Aim Parts 
    end -- End 4


    local oldsend = client.network.send -- Network Client
    equipped = 1 -- Client equipped with 1
    client.network.send = function(self, name, ...) -- Client Name 
        if name == "falldamage" and library.flags.NoFallDamage then -- No Fall Damage 
            return 
        end -- End 1
        
        if name == "equip" then -- Equip 
            equipped = ...
        end
        
        if name == "newgrenade" and library.flags.GrenadeTP then
            local args = {...}
            if args[2].blowuptime then args[2].blowuptime=library.flags.GrenadeBlowUpTime end
            local ClosestPlayer = closest()
            if not ClosestPlayer or not ClosestPlayer.Closest or not ClosestPlayer.Part then return old(self, data, ...) end
            for i,v in pairs(args[2].frames) do
                if v ~= args[2].frames[1] then
                    if ClosestPlayer.OnScreen then
                        if v.p0 then
                            v.p0 = ClosestPlayer.Part.Position
                        end
                    end
                end
            end
        end
        return oldsend(self, name, ...)
    end
    
    
    SpaceDown = false
    UserInputService.InputBegan:Connect(function(key)
        if key.KeyCode == Enum.KeyCode.Space then
            SpaceDown = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(key)
        if key.KeyCode == Enum.KeyCode.Space then
            SpaceDown = false
        end
    end)


    RunService:BindToRenderStep("Misc", 1, function()
            if library.flags.HitboxExtender then
            for i,v in pairs(Players:GetPlayers()) do
                if client:IsAlive(v) and client.replication.bodyparts[v] and client.replication.bodyparts[v].head and client.char.alive then
                    local bp = client.replication.bodyparts[v]
                    local hbv = library.flags.HitboxExtenderValue
                    bp.head.Size = Vector3.new(hbv,hbv,hbv)
                    bp.torso.Size = Vector3.new(hbv,hbv,hbv)
                    bp.lleg.Size = Vector3.new(hbv,hbv,hbv)
                    bp.rleg.Size = Vector3.new(hbv,hbv,hbv)
                    bp.larm.Size = Vector3.new(hbv,hbv,hbv)
                    bp.rarm.Size = Vector3.new(hbv,hbv,hbv)
                end
            end
        end 

        if library.flags.WalkspeedOn then
            client.char:setbasewalkspeed(library.flags.Walkspeed)
        end
        if not library.flags.Ambience and library.flags.FullBright then
            Lighting.Ambient = Color3.fromRGB(255,255,255)
            Lighting.Brightness = 1000
        end
        if library.flags.FullBright then
            Lighting.Brightness = 1000
            Lighting.Ambient = Color3.fromRGB(255,255,255)
        end
        if not library.flags.FullBright and library.flags.Ambience then
            Lighting.Ambient = library.flags.AmbienceColor
        elseif not library.flags.FullBright and not library.flags.Ambience and not library.flags.RainbowAmbience then
            Lighting.Ambient = OldAmbience
        end
        if library.flags.Ambience then
            Lighting.Ambient = library.flags.AmbienceColor
        end
        
        if library.flags.KnifeAura and client.char.alive then
            if library.flags.KnifeAuraHeld then
                if client.gamelogic.currentgun.type ~= "KNIFE" then
                    return
                end
            end
            for i,v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
                    if client:IsAlive(v) and client.replication.bodyparts[v] then
                        local Closest 
                        local Distance = library.flags.KnifeAuraDistance
                        local Dist = (client.replication.bodyparts[v].head.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Dist < Distance then
                            Dist = Distance
                            oldsend(client.network, "equip", 3) 
                            client.network:send("knifehit", client.replication.getplayerhit(client.replication.bodyparts[v].head), tick(), "Head")
                            client.network:send("equip", equipped) 
                        end
                    end
                end
            end
        end
        if SpaceDown and client.char.alive and library.flags.BunnyHop then
            client.char:setbasewalkspeed(library.flags.BunnyHopSpeed)
            client.char:jump(4)
        elseif not SpaceDown and client.char.alive and not library.flags.WalkspeedOn then
            client.char:setbasewalkspeed(12)
        end
    end)
    spawn(function()
        while wait() do
            local gun = client:GetGun()
            if (gun ~= nil) and (client.char.alive) then
                for i,v in pairs(gun:GetDescendants()) do
                    if not v.Name:find("TheBarrel") and not v.Name:find("IronGlow") and not v.Name:find("SightMark") and not v.Name:find("TheBarrel2") and v ~= client.gamelogic.currentgun.barrel then
                        if client:HasProperty(v, "Color") then
                            if library.flags.GunColorOn and library.flags.RainbowGun then
                                pcall(function()
                                    if v.Material ~= Enum.Material.Glass then
                                        v.Color = library.flags.GunColor
                                    end
                                end)
                            elseif library.flags.GunColorOn and not library.flags.RainbowGun then
                                pcall(function()
                                    if v.Material ~= Enum.Material.Glass then
                                        v.Color = library.flags.GunColor
                                    end
                                end)
                            elseif not library.flags.GunColorOn and library.flags.RainbowGun then
                                pcall(function()
                                    if v.Material ~= Enum.Material.Glass then
                                        local hue = tick() % 3/3
                                        v.Color = Color3.fromHSV(hue,1,1)
                                    end
                                end)
                            end
                        end 
                        if client:HasProperty(v, "Material") and library.flags.WeaponMaterial then
                            pcall(function()
                                if v.Material ~= Enum.Material.Glass then
                                    v.Material = Enum.Material[library.flags.WeaponMaterialValue]
                                end    
                            end)
                        end
                        if client:HasProperty(v, "Transparency") and library.flags.WeaponTransparency then
                            pcall(function()
                                if v.Material ~= Enum.Material.Glass then
                                    v.Transparency = library.flags.WeaponTransparencyValue
                                end
                            end)
                        end
                    end 
                end
            end
        end
    end)

    spawn(function()
        while wait() do
            if library.flags.RainbowAmbience and not library.flags.Ambience then
                local hue = tick() % 2/2
                local Color = Color3.fromHSV(hue,1,1)
                Lighting.Ambient = Color
            end
        end
    end)

    
    local oldjump = client.char.jump
    client.char.jump = function(tbl, jp)
        if library.flags.JumpPowerOn then
            return oldjump(tbl, library.flags.JumpPower)
        end
        return oldjump(tbl, jp)
    end
end

function client:init()
    client:MiscLoop()
    client:CreateCrosshairRenderstep()
    client:InitAimbot()
    client:Weapons()

    EspLibrary:Init()
    EspLibrary.settings.limitdistance = false

    function EspLibrary:GetHealth(Player)
        return client.hud:getplayerhealth(Player)
    end

    function EspLibrary:GetCharacter(Player)
        local Character = client.replication.getbodyparts(Player)

        return Character and Character.torso.Parent, Character and Character.torso
    end
end



library.flags['Menu Accent Color'] = Color3.fromRGB(0, 0, 255)
library:Init()
client:init()
if isfile("ceri/default.cr") then
    library:LoadConfig("default")
end 

client:console("Vex Services Tool loaded in " .. tostring(tick() - start) .. "ms")

library:selectTab(library.tabs[1])

-- END OF MAIN CODE.
