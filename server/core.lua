local ServerCallbacks = {}

function Functions.RegisterServerCallback(callbackName, callback)
  ServerCallbacks[callbackName] = callback
end

RegisterNetEvent("17mov_Callbacks:GetResponse" .. Functions.ResourceName, function(callbackName, callbackId, ...)
  local source = source
  
  if ServerCallbacks[callbackName] == nil then
    return
  end
  
  TriggerClientEvent(
    "17mov_Callbacks:receiveData" .. Functions.ResourceName,
    source,
    callbackName,
    callbackId,
    ServerCallbacks[callbackName](source, ...)
  )
end)

function GetLobbyIndex(playerId)
  local lobbyIndex = 0
  
  for k, lobby in pairs(PlayersPairs) do
    if lobby.host == playerId then
      lobbyIndex = k
      break
    end
    
    for i = 1, #lobby.clients do
      if lobby.clients[i] == playerId then
        lobbyIndex = k
        break
      end
    end
  end
  
  return lobbyIndex
end

function TriggerForClients(lobbyIndex, eventName, ...)
  local clients = PlayersPairs[lobbyIndex].clients
  
  for i = 1, #clients do
    TriggerClientEvent(eventName, clients[i], ...)
  end
end