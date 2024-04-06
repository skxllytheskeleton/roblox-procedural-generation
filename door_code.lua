script.Parent.ClickDetector.MouseClick:Connect(function() --do something when its clicked
	local thisRoom = script.Parent.Parent.Parent.Name --the name of the room that this door exits
	if game.ReplicatedStorage.Rooms:FindFirstChild(thisRoom) then --look for this room in the rooms folder
		game.ReplicatedStorage.Rooms:FindFirstChild(thisRoom).Parent = game.ReplicatedStorage.TempDisabledRooms --disable it temporary
	end
	local rooms = game.ReplicatedStorage.Rooms:GetChildren() --the rooms folder
	local chosenRoom = rooms[math.random(1,#rooms)]:Clone() --select a random room
	chosenRoom.Parent = workspace.GeneratedRooms --put the room in the generated rooms folder
	chosenRoom:PivotTo(script.Parent.Parent.Base.CFrame) --move to the exit of the room
	script.Parent.Parent.Open.CanCollide = true --open door
	script.Parent.Parent.Open.Transparency = 0
	script.Parent.Parent.Open.Sound:Play()
	if game.ReplicatedStorage.TempDisabledRooms:FindFirstChild(thisRoom) then
		game.ReplicatedStorage.TempDisabledRooms:FindFirstChild(thisRoom).Parent = game.ReplicatedStorage.Rooms
	end
	script.Parent:Destroy()
end)