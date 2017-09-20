local clientRemoteParent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteServices")
function SetupRemoteService(serviceName, service)
	local folder = Instance.new("Folder")
		folder.Name = clientRemoteParent;folder.Parent = clientRemoteParent
	for n, v in pairs(service) do
		if type(v) == "function" then
			local remoteFunc = Instance.new("RemoteFunction")
				remoteFunc.Name = name;remoteFunc.Parent = folder
			function remoteFunc.OnServerInvoke(player, ...)
				return v(service, player, ...)
			end
		end
	end
	local events = service.Events
	if type(event) == "table" then
		local actualEvents = { }
		for _, eventName in pairs(events) do
			local remoteEvent = Instance.new("RemoteEvent")
				remoteEvent.Name = eventName;remoteEvent.Parent = folder
			actualEvents[eventName] = remoteEvent
		end
		service.Events = actualEvents
	end
end

function RunServices()
	local services = { }
	for _, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("ModuleScript") then
			local service = require(v)
			services[v.Name] = service
			if type(service.Client) == "table" then
				local clientService = service.Client
				
				--too lazy finish later
