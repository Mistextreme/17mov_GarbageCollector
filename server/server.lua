local PlayerLobbies = {}
local PendingInvites = {}
local ActiveBags = {}
local BagPickupAttempts = {}
local BagRespawnQueue = {}
local PlayerCooldowns = {}
local CooldownTimestamps = {}
local MaxPartySize = 4

local GetPlayerIdentifierByType = GetPlayerIdentifierByType
local GetPlayerPing = GetPlayerPing
local TriggerClientEvent = TriggerClientEvent

function TriggerClientEventBroadcast(eventName, targets, ...)
  local packedArgs = msgpack.pack_args(...)
  local argsLength = #packedArgs
  
  if type(targets) == "table" then
    for i = 1, #targets do
      TriggerClientEventInternal(eventName, targets[i], packedArgs, argsLength)
    end
    return
  end
  
  TriggerClientEventInternal(eventName, targets, packedArgs, argsLength)
end

function GetPlayerIdentifierByType(source, idType)
  if source == nil then
    return 0
  end
  
  if GetPlayerIdentifierByType ~= nil then
    return GetPlayerIdentifierByType(source, idType)
  else
    return GetPlayerIdentifier(source, 1)
  end
end

function GetPlayerPing(source, ...)
  if source ~= nil then
    GetPlayerPing(source, ...)
  end
end

function TriggerClientEvent(eventName, target, ...)
  if target ~= nil then
    TriggerClientEvent(eventName, target, ...)
  end
end

function RecalculateRewards(hostSource)
  local lobbyIndex = 0
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == hostSource then
      lobbyIndex = k
    end
  end
  
  if not lobbyIndex then
    return
  end
  
  PlayerLobbies[lobbyIndex].rewardsOptions = {}
  local totalMembers = #PlayerLobbies[lobbyIndex].clients + 1
  
  for i = 1, totalMembers - 1 do
    local client = PlayerLobbies[lobbyIndex].clients[i]
    if not client then
      return
    end
    
    PlayerLobbies[lobbyIndex].rewardsOptions[client] = math.floor(100 / totalMembers)
  end
  
  PlayerLobbies[lobbyIndex].rewardsOptions[hostSource] = math.floor(100 / totalMembers)
  
  TriggerForAllMembers(hostSource, "17mov_Garbage:SetMyReward", math.floor(100 / totalMembers))
  TriggerClientEvent("17mov_Garbage:UpdateHostPercentages", hostSource, math.floor(100 / totalMembers))
end

RegisterNetEvent("17mov_GarbageCollector:server:fixRotation", function(entityNetId)
  local entity = NetworkGetEntityFromNetworkId(entityNetId)
  
  if DoesEntityExist(entity) then
    if Entity(entity).state.validPos then
      TriggerClientEvent("17mov_GarbageCollector:client:fixRotation", -1, entityNetId)
    end
  end
end)

RegisterNetEvent("17mov_GarbageCollector:server:GarbageAnim", function(targets, entityNetId, sceneId, sourcePlayer, animData, stageIndex)
  local source = source
  TriggerClientEventBroadcast("17mov_GarbageCollector:client:GarbageAnim", targets, entityNetId, sceneId, sourcePlayer, source, animData, stageIndex)
end)

function RestartBagsQueue(entity, addToQueue, forceRestart)
  if not DoesEntityExist(entity) then
    return
  end
  
  local queuedBags = Entity(entity).state.queued_bags or 0
  
  if addToQueue then
    queuedBags = queuedBags + 1
    Entity(entity).state:set("queued_bags", queuedBags, true)
  end
  
  if queuedBags == 1 or (forceRestart and queuedBags > 0) then
    Citizen.SetTimeout(math.random(Config.BinsRestartingDelay.min, Config.BinsRestartingDelay.max) * 1000, function()
      if not DoesEntityExist(entity) then
        return
      end
      
      local currentQueued = Entity(entity).state.queued_bags or 0
      
      if currentQueued == 0 then
        return
      end
      
      local currentStage = Entity(entity).state.currentStage
      if currentStage then
        Entity(entity).state:set("currentStage", math.max(currentStage - 1, 1), true)
      end
      
      Entity(entity).state:set("queued_bags", math.max(currentQueued - 1, 0), true)
      RestartBagsQueue(entity, false, true)
    end)
  end
end

RegisterNetEvent("17mov_GarbageCollector:server:GarbageSetOcupied", function(entityNetId, maxStages, validPosition, skipStageIncrement)
  local entity = NetworkGetEntityFromNetworkId(entityNetId)
  
  if DoesEntityExist(entity) then
    if maxStages then
      local currentStage = Entity(entity).state.currentStage or 1
      currentStage = math.min((skipStageIncrement and 0 or 1) + currentStage, maxStages)
      Entity(entity).state:set("currentStage", currentStage, true)
      RestartBagsQueue(entity, true, false)
      Entity(entity).state:set("GarbageOccupied", nil, true)
    else
      Entity(entity).state:set("GarbageOccupied", true, true)
    end
    
    if validPosition then
      if Config.FixBinsPosition then
        Entity(entity).state:set("validPos", json.encode(validPosition), true)
      end
    end
  end
end)

RegisterNetEvent("17mov_GarbageCollector:server:BlockBags", function(bagNetIds)
  for i = 1, #bagNetIds do
    local entity = NetworkGetEntityFromNetworkId(bagNetIds[i])
    if DoesEntityExist(entity) then
      Entity(entity).state:set("GarbageBlock", true, true)
    end
  end
end)

Functions.RegisterServerCallback("17mov_GarbageCollector:server:GarbageGetOcupied", function(source, entityNetId)
  local entity = NetworkGetEntityFromNetworkId(entityNetId)
  
  if not DoesEntityExist(entity) then
    return false
  end
  
  if Entity(entity).state.GarbageOccupied then
    return true
  end
  
  Entity(entity).state:set("GarbageOccupied", true, true)
  return false
end)

Functions.RegisterServerCallback("17mov_Garbage:GetPlayersNames", function(source, playerIds)
  local playerNames = {}
  
  for i = 1, #playerIds do
    table.insert(playerNames, {
      id = playerIds[i],
      name = GetPlayerIdentity(playerIds[i])
    })
  end
  
  return playerNames
end)

Functions.RegisterServerCallback("17mov_Garbage:CheckThisReward", function(source, rewardPercent, targetPlayerId)
  local lobbyIndex = 0
  local otherRewardsTotal = 0
  
  for k, lobby in pairs(PlayerLobbies) do
    if source == lobby.host then
      lobbyIndex = k
      break
    end
    
    for i = 1, #lobby.clients do
      if source == lobby.clients[i] then
        lobbyIndex = k
        break
      end
    end
  end
  
  for playerId, percent in pairs(PlayerLobbies[lobbyIndex].rewardsOptions) do
    if playerId ~= targetPlayerId then
      otherRewardsTotal = otherRewardsTotal + percent
    end
  end
  
  if otherRewardsTotal + rewardPercent > 100 then
    return false
  else
    PlayerLobbies[lobbyIndex].rewardsOptions[targetPlayerId] = rewardPercent
    TriggerClientEvent("17mov_Garbage:SetMyReward", targetPlayerId, rewardPercent)
    return true
  end
end)

Functions.RegisterServerCallback("17mov_Garbage:IfPlayerOwnsTeam", function(source)
  local ownsTeam = false
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      ownsTeam = true
      break
    end
  end
  
  return ownsTeam
end)

Functions.RegisterServerCallback("17mov_Garbage:IfPlayerIsHost", function(source)
  local isHost = true
  local memberLobbyIndex = 0
  
  for k, lobby in pairs(PlayerLobbies) do
    for i = 1, #lobby.clients do
      if lobby.clients[i] == source then
        isHost = false
        memberLobbyIndex = k
        break
      end
    end
  end
  
  if not isHost then
    if PlayerLobbies[memberLobbyIndex].host ~= nil and GetPlayerPing(PlayerLobbies[memberLobbyIndex].host) ~= 0 then
      -- Host is still connected
    else
      isHost = true
      PlayerLobbies[memberLobbyIndex].host = source
    end
  end
  
  return isHost
end)

Functions.RegisterServerCallback("17mov_Garbage:init", function(source)
  return {
    name = GetPlayerIdentity(source),
    source = source
  }
end)

Functions.RegisterServerCallback("17mov_Garbage:GetLobbyMembers", function(source, hostId)
  if hostId == nil then
    return {}
  end
  
  local members = {hostId}
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == hostId then
      for i = 1, #lobby.clients do
        table.insert(members, lobby.clients[i])
      end
    end
  end
  
  return members
end)

RegisterNetEvent("17mov_Garbage:SendRequestToClient_sv", function(targetPlayerId)
  local source = source
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == targetPlayerId then
      return Notify(source, _L("Lobby.Player.AlreadyHost"))
    else
      for i = 1, #lobby.clients do
        if lobby.clients[i] == targetPlayerId then
          return Notify(source, _L("Lobby.Player.AlreadyInTeam"))
        end
      end
    end
  end
  
  for k, invite in pairs(PendingInvites) do
    if invite.client == targetPlayerId then
      return Notify(source, _L("Lobby.Player.AlreadyGotInvite"))
    else
      if invite.host == source and invite.client ~= nil then
        return Notify(source, _L("Lobby.Player.AlreadyInvited"))
      end
    end
  end
  
  local clientMembers = {}
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      clientMembers = lobby.clients
    end
  end
  
  if #clientMembers + 1 >= MaxPartySize then
    return Notify(source, _L("Lobby.StartJob.PartyFull"))
  end
  
  table.insert(PendingInvites, {host = source, client = targetPlayerId})
  
  Notify(source, _L("Lobby.StartJob.InviteSent"))
  TriggerClientEvent("17mov_Garbage:SendRequestToClient_cl", targetPlayerId, GetPlayerIdentity(source))
end)

RegisterNetEvent("17mov_Garbage:UpdateServerPartyBagsCounter", function(bagModel)
  local source = source
  
  if ActiveBags[source] == nil then
    return
  end
  
  if BagRespawnQueue[source] ~= nil then
    if os.time() - BagRespawnQueue[source] < 2 then
      return
    end
  end
  
  local bagValue = Config.BagAttachments[bagModel].counterValue or 1
  
  if bagValue == nil then
    bagValue = 1
  end
  
  if bagValue >= 100 then
    return
  end
  
  BagRespawnQueue[source] = os.time()
  
  if bagValue == nil then
    bagValue = 1
  end
  
  local lobbyIndex = 0
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      lobbyIndex = k
      break
    else
      for i = 1, #lobby.clients do
        if source == lobby.clients[i] then
          lobbyIndex = k
          break
        end
      end
    end
  end
  
  local vehicle = NetworkGetEntityFromNetworkId(PlayerLobbies[lobbyIndex].vehNetId)
  local playerPos = GetEntityCoords(GetPlayerPed(source))
  local vehiclePos = GetEntityCoords(vehicle)
  
  if #(vehiclePos - playerPos) > 10.0 then
    return
  end
  
  ActiveBags[source] = nil
  
  local hostSource = nil
  local foundLobby = false
  local currentBags = 0
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      foundLobby = true
      hostSource = lobby.host
    else
      for i = 1, #lobby.clients do
        if source == lobby.clients[i] then
          foundLobby = true
          hostSource = lobby.host
        end
      end
    end
    
    if foundLobby then
      if lobby.bags ~= nil and lobby.bags < 100 then
        lobby.bags = lobby.bags + bagValue
      end
      currentBags = lobby.bags
      break
    end
  end
  
  TriggerForAllMembers(hostSource, "17mov_Garbage:UpdateBagsCounter", currentBags)
end)

RegisterNetEvent("17mov_Garbage:ClientReactRequest", function(accepted)
  local source = source
  local hostSource = nil
  local inviteFound = false
  
  for k, invite in pairs(PendingInvites) do
    if invite.client == source then
      hostSource = invite.host
      PendingInvites[k] = nil
      break
    end
  end
  
  if accepted then
    if hostSource ~= nil and source ~= nil then
      for k, lobby in pairs(PlayerLobbies) do
        if lobby.host == hostSource then
          if lobby.clients ~= nil then
            table.insert(lobby.clients, source)
            inviteFound = true
          end
        end
      end
      
      if not inviteFound then
        table.insert(PlayerLobbies, {
          host = hostSource,
          clients = {source},
          bags = 0
        })
      end
      
      if Config.UseModernUI then
        RecalculateRewards(hostSource)
      end
      
      Notify(hostSource, _L("Lobby.Player.Accepted"))
      
      local partyMembers = GetAllPartyMugs(hostSource)
      TriggerForAllMembers(hostSource, "17mov_Garbage:RefreshMugs", partyMembers)
    else
      Notify(source, _L("Lobby.Player.InviteError"))
      Notify(hostSource, _L("Lobby.Player.InviteError"))
    end
  else
    Notify(hostSource, _L("Lobby.Player.Declined"))
  end
end)

RegisterNetEvent("17mov_Garbage:KickPlayerFromLobby", function(kickedPlayerId, notifyKicked, callerSource)
  local source = source
  local targetPlayerId = kickedPlayerId
  
  if callerSource == nil then
    for k, lobby in pairs(PlayerLobbies) do
      for i = 1, #lobby.clients do
        if lobby.host == source and lobby.clients[i] == targetPlayerId then
          lobby.clients[i] = nil
          break
        end
      end
    end
  else
    for k, lobby in pairs(PlayerLobbies) do
      for i = 1, #lobby.clients do
        if lobby.clients[i] == callerSource then
          source = lobby.host
          lobby.clients[i] = nil
          break
        end
      end
    end
  end
  
  if notifyKicked then
    Notify(targetPlayerId, _L("Lobby.Player.Kicked"))
  end
  
  if Config.UseModernUI then
    local soloMugs = {{
      id = targetPlayerId,
      name = GetPlayerIdentity(targetPlayerId),
      isHost = true
    }}
    
    TriggerClientEvent("17mov_Garbage:RefreshMugs", targetPlayerId, soloMugs, targetPlayerId)
    TriggerClientEvent("17mov_Garbage:clearMyLobby", targetPlayerId)
    TriggerClientEvent("17mov_Garbage:SetMyReward", targetPlayerId, 100)
    
    local partyMembers = GetAllPartyMugs(source)
    TriggerForAllMembers(source, "17mov_Garbage:RefreshMugs", partyMembers)
    RecalculateRewards(source)
    
    for k, lobby in pairs(PlayerLobbies) do
      if #lobby.clients == 0 and lobby.host == source then
        PlayerLobbies[k] = nil
        TriggerClientEvent("17mov_Garbage:clearMyLobby", source)
      end
    end
  else
    local soloMugs = {{
      id = targetPlayerId,
      name = GetPlayerIdentity(targetPlayerId),
      isHost = true
    }}
    
    TriggerClientEvent("17mov_Garbage:RefreshMugs", targetPlayerId, soloMugs, targetPlayerId)
    
    local partyMembers = GetAllPartyMugs(source)
    TriggerForAllMembers(source, "17mov_Garbage:RefreshMugs", partyMembers)
    
    for k, lobby in pairs(PlayerLobbies) do
      if #lobby.clients == 0 and lobby.host == source then
        PlayerLobbies[k] = nil
      end
    end
  end
end)

RegisterNetEvent("17mov_GarbageJob:SendVehicleNetId", function(vehicleNetId)
  local source = source
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      lobby.vehNetId = vehicleNetId
    end
  end
end)

local UnloadStageComplete = {}

RegisterNetEvent("17mov_Garbage:server:endStage", function()
  local source = source
  UnloadStageComplete[tostring(source)] = true
  TriggerForAllMembers(source, "17mov_Garbage:client:endStage", source)
end)

RegisterNetEvent("17mov_GarbageCollector:server:startUnloadAnim", function(bagsToUnload, nearbyPlayers)
  local source = source
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      TriggerClientEvent("17mov_GarbageCollector:client:startUnloadAnim", source, bagsToUnload, true)
      return TriggerClientEventBroadcast("17mov_GarbageCollector:client:startUnloadAnim", nearbyPlayers, bagsToUnload, false)
    end
  end
end)

RegisterNetEvent("17mov_Garbage:endJob_sv", function(hasVehicle, skipPenalty)
  local source = source
  local collectedBags = nil
  
  TriggerForAllMembers(source, "17mov_Garbage:endJob_cl", 0)
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      lobby.working = false
      collectedBags = lobby.bags
      lobby.bags = 0
      
      local allMembers = {}
      for i = 1, #lobby.clients do
        table.insert(allMembers, lobby.clients[i])
      end
      table.insert(allMembers, lobby.host)
      
      Citizen.CreateThread(function()
        local vehicle = NetworkGetEntityFromNetworkId(lobby.vehNetId)
        
        if DoesEntityExist(vehicle) then
          if hasVehicle or (hasVehicle and Config.DeleteVehicleWithPenalty) then
            if skipPenalty or hasVehicle then
              -- Skip vehicle handling
            else
              vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
              
              for i = 1, #allMembers do
                TaskLeaveVehicle(GetPlayerPed(allMembers[i]), vehicle, 0)
              end
              
              Wait(1750)
              DeleteEntity(vehicle)
            end
          end
        end
      end)
      
      local totalReward = collectedBags * Config.Price
      
      if Config.MultiplyRewardWhileWorkingInGroup then
        totalReward = math.floor(totalReward * (#lobby.clients + 1))
      end
      
      if Config.UseModernUI and #lobby.clients == 0 then
        RecalculateRewards(source)
      end
      
      local paidPlayers = {}
      for i = 1, #allMembers do
        local playerReward = 0
        
        if Config.UseModernUI and Config.LetBossSplitReward then
          playerReward = math.floor(totalReward * (lobby.rewardsOptions[allMembers[i]] / 100))
        elseif not Config.UseModernUI and Config.SplitReward then
          playerReward = math.floor(totalReward / (#lobby.clients + 1))
        else
          playerReward = totalReward
        end
        
        if not hasVehicle then
          PayPenalty(allMembers[i], Config.PenaltyAmount)
          Notify(allMembers[i], _L("Job.Gameplay.RewardPenalty", Config.PenaltyAmount))
        end
        
        if hasVehicle or (not hasVehicle and Config.DontPayRewardWithoutVehicle == false) then
          if not paidPlayers[allMembers[i]] then
            paidPlayers[allMembers[i]] = true
            Pay(allMembers[i], playerReward, #allMembers, collectedBags)
            Notify(allMembers[i], _L("Job.Gameplay.Reward", playerReward))
          end
        end
      end
      
      if #lobby.clients == 0 then
        PlayerLobbies[k] = nil
        TriggerClientEvent("17mov_Garbage:clearMyLobby", source)
      end
    end
  end
  
  if UnloadStageComplete[tostring(source)] then
    UnloadStageComplete[tostring(source)] = nil
  end
end)

RegisterNetEvent("17mov_Garbage:StartJob_sv", function()
  local source = source
  local lobbyMembers = nil
  local lobbyIndex = nil
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      lobbyMembers = lobby.clients
      lobbyIndex = k
      break
    end
  end
  
  if Config.RequireJobAlsoForFriends and Config.RequiredJob ~= "none" and lobbyMembers ~= nil then
    for i = 1, #lobbyMembers do
      if GetPlayerJob(lobbyMembers[i]) ~= Config.RequiredJob then
        return Notify(source, _L("Lobby.StartJob.NoRequiredJob"))
      end
    end
  end
  
  if not IsHaveRequiredItem(source) then
    return Notify(source, _L("Lobby.StartJob.NoItem"))
  end
  
  if Config.RequireItemFromWholeTeam and lobbyMembers ~= nil then
    for i = 1, #lobbyMembers do
      if not IsHaveRequiredItem(lobbyMembers[i]) then
        return Notify(source, _L("Lobby.StartJob.NoItem"))
      end
    end
  end
  
  if Config.JobCooldown > 0 then
    CooldownsTime = CooldownsTime or {}
    
    local currentTime = os.time()
    local playerLicense = GetPlayerIdentifierByType(source, "license")
    
    if PlayerCooldowns[playerLicense] then
      local elapsedTime = currentTime - CooldownsTime[playerLicense]
      
      if elapsedTime >= Config.JobCooldown then
        PlayerCooldowns[playerLicense] = nil
        CooldownsTime[playerLicense] = nil
      else
        local remainingTime = Config.JobCooldown - elapsedTime
        local hours = math.floor(remainingTime / 3600)
        local minutes = math.floor((remainingTime % 3600) / 60)
        local seconds = remainingTime % 60
        
        local timeString = ""
        if hours > 0 then
          timeString = timeString .. hours .. _L("Job.Time.Hours") .. " "
        end
        if minutes > 0 then
          timeString = timeString .. minutes .. _L("Job.Time.Minutes") .. " "
        end
        timeString = timeString .. seconds .. _L("Job.Time.Seconds")
        
        return Notify(source, _L("Lobby.StartJob.Cooldown", GetPlayerIdentity(source), timeString))
      end
    end
    
    if lobbyMembers ~= nil then
      for i = 1, #lobbyMembers do
        local memberLicense = GetPlayerIdentifierByType(lobbyMembers[i], "license")
        
        if PlayerCooldowns[memberLicense] then
          local elapsedTime = currentTime - CooldownsTime[memberLicense]
          
          if elapsedTime >= Config.JobCooldown then
            PlayerCooldowns[memberLicense] = nil
            CooldownsTime[memberLicense] = nil
          else
            local remainingTime = Config.JobCooldown - elapsedTime
            local hours = math.floor(remainingTime / 3600)
            local minutes = math.floor((remainingTime % 3600) / 60)
            local seconds = remainingTime % 60
            
            local timeString = ""
            if hours > 0 then
              timeString = timeString .. hours .. _L("Job.Time.Hours") .. " "
            end
            if minutes > 0 then
              timeString = timeString .. minutes .. _L("Job.Time.Minutes") .. " "
            end
            timeString = timeString .. seconds .. _L("Job.Time.Seconds")
            
            return Notify(source, _L("Lobby.StartJob.Cooldown", GetPlayerIdentity(lobbyMembers[i]), timeString))
          end
        end
      end
    end
    
    PlayerCooldowns[playerLicense] = true
    CooldownsTime[playerLicense] = currentTime
    
    if lobbyMembers ~= nil then
      for i = 1, #lobbyMembers do
        local memberLicense = GetPlayerIdentifierByType(lobbyMembers[i], "license")
        PlayerCooldowns[memberLicense] = true
        CooldownsTime[memberLicense] = currentTime
      end
    end
  end
  
  if Config.RequireOneFriendMinimum then
    if lobbyMembers ~= nil and #lobbyMembers > 0 then
      if lobbyIndex ~= nil then
        PlayerLobbies[lobbyIndex].working = true
        
        if Config.Debug.enabled then
          Citizen.CreateThread(function()
            PlayerLobbies[lobbyIndex].bags = Config.Debug.base_progress
            Wait(5000)
            TriggerForAllMembers(source, "17mov_Garbage:UpdateBagsCounter", Config.Debug.base_progress)
          end)
        end
      end
      
      TriggerForAllMembers(source, "17mov_Garbage:StartJob_cl", source)
    else
      Notify(source, _L("Lobby.StartJob.MemberRequired"))
    end
  else
    if lobbyMembers == nil then
      table.insert(PlayerLobbies, {
        host = source,
        clients = {},
        bags = 0
      })
    end
    
    lobbyIndex = 0
    for k, lobby in pairs(PlayerLobbies) do
      if lobby.host == source then
        lobbyIndex = k
        break
      end
    end
    
    PlayerLobbies[lobbyIndex].working = true
    
    if Config.Debug.enabled then
      Citizen.CreateThread(function()
        PlayerLobbies[lobbyIndex].bags = Config.Debug.base_progress
        Wait(5000)
        TriggerForAllMembers(source, "17mov_Garbage:UpdateBagsCounter", Config.Debug.base_progress)
      end)
    end
    
    TriggerForAllMembers(source, "17mov_Garbage:StartJob_cl", source)
  end
end)

RegisterNetEvent("17mov_GarbageCollector:ToggleTrunk", function(vehicleNetId, openTrunk)
  local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
  
  if vehicle and DoesEntityExist(vehicle) then
    if GetEntityModel(vehicle) == 1917016601 then -- trash model hash
      local vehicleOwner = NetworkGetEntityOwner(vehicle)
      
      if vehicleOwner == 0 then
        if openTrunk then
          SetVehicleDoorOpen(vehicle, 5, false, false)
        else
          SetVehicleDoorShut(vehicle, 5, false)
        end
      else
        TriggerClientEvent("17mov_GarbageCollector:ToggleTrunk", vehicleOwner, vehicleNetId, openTrunk)
      end
    end
  end
end)

RegisterNetEvent("17mov_GarbageCollector:BagCollected", function(nearbyPlayers, bagData)
  for i = 1, #nearbyPlayers do
    TriggerClientEvent("17mov_GarbageCollector:BagCollected", nearbyPlayers[i], bagData)
  end
end)

RegisterNetEvent("17mov_GarbageCollector:server:BagCollected", function(bagNetId)
  local entity =NetworkGetEntityFromNetworkId(bagNetId)
  
  if DoesEntityExist(entity) then
    DeleteEntity(entity)
  end
end)

function GetLobbyClients(hostSource)
  for k, lobby in pairs(PlayerLobbies) do
    if hostSource == lobby.host then
      return lobby.clients
    end
  end
end

RegisterNetEvent("17mov_GarbageCollector:server:TeleportCrewMembers", function(vehicleNetId, memberOffset, networkTime)
  local source = source
  local crewMembers = GetLobbyClients(source)
  
  if not crewMembers or #crewMembers == 0 then
    return
  end
  
  for i = 1, #crewMembers do
    TriggerClientEvent("17mov_GarbageCollector:client:TeleportCrewMembers", crewMembers[i], vehicleNetId, i - 1, networkTime)
  end
end)

Functions.RegisterServerCallback("17mov_GarbageCollector:CheckAllow", function(source, coords, increaseDistance, entityNetId)
  if entityNetId then
    local entity = NetworkGetEntityFromNetworkId(entityNetId)
    
    if DoesEntityExist(entity) then
      if Entity(entity).state.ServerRequest then
        return false
      end
      
      Entity(entity).state:set("ServerRequest", true, true)
      return true
    end
  end
  
  BagPickupAttempts[source] = {coords = coords, increaseDistance = increaseDistance}
  
  for playerId, attemptData in pairs(BagPickupAttempts) do
    local distance = increaseDistance and 2.0 or 0.1
    
    if #(attemptData.coords - coords) < distance and playerId ~= source then
      BagPickupAttempts[source] = nil
      return false
    end
  end
  
  ActiveBags[source] = true
  return true
end)

RegisterNetEvent("17mov_GarbageCollector:server:clearRequest", function()
  local source = source
  BagPickupAttempts[source] = nil
end)

function GetPlayersOnDuty()
  local onDutyPlayers = {}
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.working then
      table.insert(onDutyPlayers, lobby.host)
      
      for i = 1, #lobby.clients do
        table.insert(onDutyPlayers, lobby.clients[i])
      end
    end
  end
  
  return onDutyPlayers
end

function GetAllPartyMugs(hostSource)
  local partyMembers = {}
  local lobbyClients = {}
  local lobbyIndex = 0
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == hostSource then
      lobbyClients = lobby.clients
      lobbyIndex = k
    end
  end
  
  if Config.UseModernUI then
    for i = 1, #lobbyClients do
      table.insert(partyMembers, {
        id = lobbyClients[i],
        name = GetPlayerIdentity(lobbyClients[i]),
        isHost = false,
        rewardPercent = PlayerLobbies[lobbyIndex].rewardsOptions[lobbyClients[i]]
      })
    end
    
    if #lobbyClients == 0 then
      table.insert(partyMembers, {
        id = hostSource,
        name = GetPlayerIdentity(hostSource),
        isHost = true,
        rewardPercent = PlayerLobbies[lobbyIndex].rewardsOptions[hostSource]
      })
    else
      table.insert(partyMembers, {
        id = hostSource,
        name = GetPlayerIdentity(hostSource),
        isHost = true,
        rewardPercent = PlayerLobbies[lobbyIndex].rewardsOptions[hostSource]
      })
    end
  else
    for i = 1, #lobbyClients do
      table.insert(partyMembers, {
        id = lobbyClients[i],
        name = GetPlayerIdentity(lobbyClients[i]),
        isHost = false
      })
    end
    
    if #lobbyClients == 0 then
      table.insert(partyMembers, {
        id = hostSource,
        name = GetPlayerIdentity(hostSource),
        isHost = true
      })
    else
      table.insert(partyMembers, {
        id = hostSource,
        name = GetPlayerIdentity(hostSource),
        isHost = true
      })
    end
  end
  
  return partyMembers
end

RegisterNetEvent("17mov_GarbageCollector:server:hideBox", function()
  local source = source
  TriggerForAllMembers(source, "17mov_GarbageCollector:client:hideBox")
end)

function TriggerForAllMembers(hostSource, eventName, ...)
  local crewMembers = GetLobbyClients(hostSource) or {}
  
  for i = 1, #crewMembers + 1 do
    local targetPlayer = crewMembers[i] or hostSource
    
    if targetPlayer ~= nil and type(targetPlayer) == "number" then
      if eventName == "17mov_Garbage:RefreshMugs" or eventName == "17mov_Garbage:StartJob_cl" then
        TriggerClientEvent(eventName, targetPlayer, ..., targetPlayer)
      else
        TriggerClientEvent(eventName, targetPlayer, ...)
      end
    end
  end
end

RegisterNetEvent("onResourceStop", function(resourceName)
  if GetCurrentResourceName() ~= resourceName then
    return
  end
  
  local allVehicles = GetAllVehicles()
  local allObjects = GetAllObjects()
  local allPeds = GetAllPeds()
  local currentResource = GetCurrentResourceName()
  
  for i = 1, math.max(#allVehicles, #allObjects, #allPeds) do
    if allVehicles[i] then
      local entityResource, _ = GetEntityScript(allVehicles[i])
      if entityResource == currentResource then
        DeleteEntity(allVehicles[i])
      end
    end
    
    if allObjects[i] then
      local entityResource, _ = GetEntityScript(allObjects[i])
      
      if Entity(allObjects[i]).state.currentStage then
        Entity(allObjects[i]).state:set("currentStage", nil, true)
      end
      
      if Entity(allObjects[i]).state.queued_bags then
        Entity(allObjects[i]).state:set("queued_bags", nil, true)
      end
      
      if Entity(allObjects[i]).state.GarbageOccupied then
        Entity(allObjects[i]).state:set("GarbageOccupied", nil, true)
      end
      
      if Entity(allObjects[i]).state.validPos then
        Entity(allObjects[i]).state:set("validPos", nil, true)
      end
      
      if entityResource == currentResource then
        DeleteEntity(allObjects[i])
      end
    end
    
    if allPeds[i] then
      local entityResource, _ = GetEntityScript(allPeds[i])
      if entityResource == currentResource then
        DeleteEntity(allPeds[i])
      end
    end
  end
end)

RegisterNetEvent("playerDropped", function()
  local source = source
  
  if BagPickupAttempts[source] then
    BagPickupAttempts[source] = nil
  end
  
  local memberLobbyIndex = nil
  local wasHost = false
  
  for k, lobby in pairs(PlayerLobbies) do
    if lobby.host == source then
      for i = 1, #lobby.clients do
        if GetPlayerPing(lobby.clients[i]) ~= 0 then
          lobby.host = lobby.clients[i]
          Notify(lobby.clients[i], _L("Lobby.Player.NewBoss"))
          table.remove(lobby.clients, i)
          break
        end
      end
      
      wasHost = true
      memberLobbyIndex = k
      break
    end
    
    for i = 1, #lobby.clients do
      if lobby.clients[i] == source then
        table.remove(lobby.clients, i)
        memberLobbyIndex = k
        break
      end
    end
  end
  
  if memberLobbyIndex == nil then
    return
  end
  
  local hostSource = PlayerLobbies[memberLobbyIndex].host
  
  if PlayerLobbies[memberLobbyIndex].working then
    if #PlayerLobbies[memberLobbyIndex].clients == 0 then
      TriggerClientEvent("17mov_Garbage:clearMyLobby", hostSource)
    else
      TriggerForAllMembers(hostSource, "17mov_Garbage:RefreshMugs", GetAllPartyMugs(hostSource))
      
      if Config.UseModernUI then
        RecalculateRewards(hostSource)
      end
    end
    
    if wasHost and UnloadStageComplete[tostring(source)] then
      UnloadStageComplete[tostring(source)] = nil
      
      local vehicle = NetworkGetEntityFromNetworkId(PlayerLobbies[memberLobbyIndex].vehNetId)
      if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
      end
      
      TriggerClientEvent("17mov_GarbageCollector:client:forceEndJob", hostSource)
      TriggerForAllMembers(hostSource, "17mov_GarbageCollector:client:hideBox")
    end
  else
    if #PlayerLobbies[memberLobbyIndex].clients == 0 then
      TriggerClientEvent("17mov_Garbage:clearMyLobby", hostSource)
      PlayerLobbies[memberLobbyIndex] = nil
    end
  end
end)