OnDuty = false
JobVehicleNetId = nil
local SpawnedVehicle = nil
local PlayerData = nil
local CollectedBags = 0
local Progress = 0
local UILoaded = false
local PartyMembers = {}
local MenuOpen = true
local CurrentActionMsg = ""
local IsPerformingSceneAction = false
local MenuFullyLoaded = false
local CurrentBagInHand = nil
local NearestDumpster = nil
local NearestBagOnGround = nil
local HighlightingEnabled = false
local HasBlipBeenCreated = false
local NearbyPlayersList = {}
local ClothesChanged = false
local TutorialShowing = true
local TutorialCount = 0
IsPerformingAction = false
local BlockedBags = {}

local NetToObj = NetToObj
local NetToVeh = NetToVeh
local ObjToNet = ObjToNet

function NetToObj(netId)
  if NetworkDoesNetworkIdExist(netId) then
    return NetToObj(netId)
  else
    return 0
  end
end

function NetToVeh(netId)
  if NetworkDoesNetworkIdExist(netId) then
    return NetToVeh(netId)
  else
    return 0
  end
end

function ObjToNet(entity)
  if NetworkGetEntityIsNetworked(entity) then
    return ObjToNet(entity)
  end
end

function GetClosestPlayers(coords, radius, excludeSelf)
  local playerPed = PlayerPedId()
  local nearbyPlayers = {}
  local activePlayers = GetActivePlayers()
  
  for i, playerId in pairs(activePlayers) do
    local targetPed = GetPlayerPed(playerId)
    if targetPed ~= playerPed or not excludeSelf then
      local targetCoords = GetEntityCoords(targetPed)
      if #(targetCoords - coords) < radius then
        table.insert(nearbyPlayers, GetPlayerServerId(playerId))
      end
    end
  end
  
  return nearbyPlayers
end

CreateThread(function()
  while not MenuFullyLoaded do
    Citizen.Wait(100)
  end
  
  if Config.UseModernUI then
    SendNUIMessage({ui = "new"})
  else
    SendNUIMessage({ui = "old"})
    UILoaded = true
    Citizen.Wait(500)
  end
  
  while not UILoaded do
    Citizen.Wait(100)
  end
  
  SendNUIMessage({
    action = "setProgressBarAlign",
    align = Config.ProgressBarAlign,
    offset = Config.ProgressBarOffset
  })
  
  if not Config.EnableCloakroom then
    SendNUIMessage({action = "hideCloakroom"})
  end
end)

RegisterNetEvent("17mov_Garbage:UpdateHostPercentages", function(percentage)
  SendNUIMessage({
    action = "updateHostRewards",
    value = percentage
  })
end)

RegisterNetEvent("17mov_Garbage:SetMyReward", function(rewardPercent)
  SendNUIMessage({
    action = "updateMyReward",
    reward = rewardPercent
  })
end)

RegisterNetEvent("17mov_Garbage:clearMyLobby", function()
  PartyMembers = {}
  
  Functions.TriggerServerCallback("17mov_Garbage:init", function(playerInfo)
    SendNUIMessage({
      action = "Init",
      name = playerInfo.name,
      myId = playerInfo.source
    })
    UILoaded = true
  end)
end)

function StartMarkers(playerData)
  if HasBlipBeenCreated then
    return
  end
  
  if Config.RequiredJob ~= "none" and playerData.job.name ~= Config.RequiredJob then
    HasBlipBeenCreated = false
    return
  end
  
  HasBlipBeenCreated = true
  
  if Config.UseTarget then
    SpawnStartingPed()
    
    local bagModels = {}
    local dumpsterModels = {}
    
    for modelHash, _ in pairs(Config.BagAttachments) do
      table.insert(bagModels, modelHash)
    end
    
    if Config.EnableBins then
      for i = 1, #Config.Scenes do
        for k, modelName in pairs(Config.Scenes[i].Models) do
          table.insert(dumpsterModels, GetHashKey(modelName))
        end
      end
    end
    
    AddModelsToTarget(bagModels)
    
    if Config.EnableBins then
      AddDumpstersToTarget(dumpsterModels)
    end
    
    Config.Locations2 = {FinishJob = Config.Locations.FinishJob}
    
    while HasBlipBeenCreated do
      Citizen.Wait(0)
      
      local playerCoords = GetEntityCoords(PlayerPedId())
      local isInMarker = false
      local hasDistance = false
      local currentZone = true
      local markerLocation = nil
      local markerIndex = nil
      local markerIterator = nil
      
      if Config.RequiredJob ~= "none" and playerData.job.name == Config.RequiredJob then
        -- Job requirement check
      end
      
      if Config.RequiredJob == "none" then
        for markerName, markerData in pairs(Config.Locations2) do
          if markerData.grade then
            if not (playerData.job.grade >= markerData.grade) then
              goto continue
            end
          end
          
          if OnDuty or markerData.type ~= "duty" then
            -- Check marker distance
          end
          
          for k, markerCoords in pairs(markerData.Coords) do
            local distance = #(playerCoords - markerCoords)
            local markerColor = nil
            
            if distance < 20 and distance > markerData.scale.x then
              markerColor = Config.MarkerSettings.UnActive
            elseif distance < markerData.scale.x then
              markerColor = Config.MarkerSettings.Active
              isInMarker = true
              markerLocation = markerName
              markerIndex = markerName
              markerIterator = Iterator
              hasDistance = true
            end
            
            if markerColor then
              DrawMarker(
                6,
                markerCoords.x, markerCoords.y, markerCoords.z - 1,
                0.0, 0.0, 0.0,
                -90.0, 0.0, 0.0,
                markerData.scale.x, markerData.scale.y, markerData.scale.z,
                Config.MarkerSettings.Active.r,
                Config.MarkerSettings.Active.g,
                Config.MarkerSettings.Active.b,
                Config.MarkerSettings.Active.a,
                false, false, 2, false, false, false, false
              )
              currentZone = false
            end
          end
          
          ::continue::
        end
      end
      
      if isInMarker and (HasAlreadyEnteredMarker and LastStation == markerLocation and LastPart == markerIndex and LastPartNum == markerIterator) then
        -- Already in marker
      elseif (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and (LastStation ~= markerLocation or LastPart ~= markerIndex or LastPartNum ~= markerIterator)) then
        if LastStation and LastPart and LastPartNum then
          if not (LastStation == markerLocation and LastPart == markerIndex and LastPartNum == markerIterator) then
            TriggerEvent("17mov_Garbage:ExitedMarker", LastStation, LastPart, LastPartNum)
            hasDistance = true
          end
        end
        
        HasAlreadyEnteredMarker = true
        LastStation = markerLocation
        LastPart = markerIndex
        LastPartNum = markerIterator
        TriggerEvent("17mov_Garbage:EnteredMarker", markerIndex)
      end
      
      if not hasDistance and not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent("17mov_Garbage:ExitedMarker", LastStation, LastPart, LastPartNum)
      end
      
      if currentZone then
        Citizen.Wait(500)
      end
    end
    
    Functions.DeleteEntity(SpawnedPed)
  else
    while HasBlipBeenCreated do
      Citizen.Wait(0)
      
      local playerCoords = GetEntityCoords(PlayerPedId())
      local isInMarker = false
      local hasDistance = false
      local currentZone = true
      local markerLocation = nil
      local markerIndex = nil
      local markerIterator = nil
      
      if Config.RequiredJob ~= "none" and playerData.job.name == Config.RequiredJob then
        -- Job requirement check
      end
      
      if Config.RequiredJob == "none" then
        for markerName, markerData in pairs(Config.Locations) do
          if markerData.grade then
            if not (playerData.job.grade >= markerData.grade) then
              goto continue
            end
          end
          
          if OnDuty or markerData.type ~= "duty" then
            -- Check marker distance
          end
          
          for k, markerCoords in pairs(markerData.Coords) do
            local distance = #(playerCoords - markerCoords)
            local markerColor = nil
            
            if distance < 20 and distance > markerData.scale.x then
              markerColor = Config.MarkerSettings.UnActive
            elseif distance < markerData.scale.x then
              markerColor = Config.MarkerSettings.Active
              isInMarker = true
              markerLocation = markerName
              markerIndex = markerName
              markerIterator = Iterator
              hasDistance = true
            end
            
            if markerColor then
              DrawMarker(
                6,
                markerCoords.x, markerCoords.y, markerCoords.z - 1,
                0.0, 0.0, 0.0,
                -90.0, 0.0, 0.0,
                markerData.scale.x, markerData.scale.y, markerData.scale.z,
                markerColor.r, markerColor.g, markerColor.b, markerColor.a,
                false, false, 2, false, false, false, false
              )
              currentZone = false
            end
          end
          
          ::continue::
        end
      end
      
      if isInMarker and (HasAlreadyEnteredMarker and LastStation == markerLocation and LastPart == markerIndex and LastPartNum == markerIterator) then
        -- Already in marker
      elseif (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and (LastStation ~= markerLocation or LastPart ~= markerIndex or LastPartNum ~= markerIterator)) then
        if LastStation and LastPart and LastPartNum then
          if not (LastStation == markerLocation and LastPart == markerIndex and LastPartNum == markerIterator) then
            TriggerEvent("17mov_Garbage:ExitedMarker", LastStation, LastPart, LastPartNum)
            hasDistance = true
          end
        end
        
        HasAlreadyEnteredMarker = true
        LastStation = markerLocation
        LastPart = markerIndex
        LastPartNum = markerIterator
        TriggerEvent("17mov_Garbage:EnteredMarker", markerIndex)
      end
      
      if not hasDistance and not isInMarker and HasAlreadyEnteredMarker then
        HasAlreadyEnteredMarker = false
        TriggerEvent("17mov_Garbage:ExitedMarker", LastStation, LastPart, LastPartNum)
      end
      
      if currentZone then
        Citizen.Wait(500)
      end
    end
  end
end

Citizen.CreateThread(function()
  PlayerData = GetPlayerData()
  
  while PlayerData == nil or PlayerData.job == nil do
    Citizen.Wait(100)
    PlayerData = GetPlayerData()
  end
  
  if Config.RestrictBlipToRequiredJob and Config.RequiredJob ~= PlayerData.job.name then
    -- Don't create blip
  else
    MakeBlip()
  end
  
  Citizen.Wait(5000)
  StartMarkers(PlayerData)
end)

function MakeBlip()
  if HasBlipBeenCreated then
    return
  end
  
  for k, blipData in pairs(Config.Blips) do
    blipData.blip = AddBlipForCoord(blipData.Pos.x, blipData.Pos.y, blipData.Pos.z)
    SetBlipSprite(blipData.blip, blipData.Sprite)
    SetBlipDisplay(blipData.blip, 4)
    SetBlipScale(blipData.blip, blipData.Scale)
    SetBlipColour(blipData.blip, blipData.Color)
    SetBlipAsShortRange(blipData.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.Label)
    EndTextCommandSetBlipName(blipData.blip)
  end
  
  HasBlipBeenCreated = true
end

function DeleteBlip()
  HasBlipBeenCreated = false
  
  for k, blipData in pairs(Config.Blips) do
    RemoveBlip(blipData.blip)
    blipData.blip = nil
  end
end

function InitalizeScript(skipWait)
  if IsPerformingSceneAction then
    return
  end
  
  if Config.UseModernUI then
    while not UILoaded do
      Citizen.Wait(100)
    end
  else
    Citizen.Wait(5500)
  end
  
  PlayerData = GetPlayerData()
  
  if not skipWait then
    Citizen.Wait(5500)
  end
  
  IsPerformingSceneAction = true
  
  if Config.RequiredJob ~= "none" and Config.RestrictBlipToRequiredJob then
    while PlayerData == nil or PlayerData.job == nil do
      PlayerData = GetPlayerData()
      Citizen.Wait(100)
    end
    
    if PlayerData.job.name ~= Config.RequiredJob and Config.RestrictBlipToRequiredJob then
      -- Don't create blip
    else
      MakeBlip()
    end
  else
    MakeBlip()
  end
  
  Functions.TriggerServerCallback("17mov_Garbage:init", function(playerInfo)
    SendNUIMessage({
      action = "Init",
      name = playerInfo.name,
      myId = playerInfo.source
    })
    UILoaded = true
  end)
end

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
  InitalizeScript()
end)

RegisterNetEvent("esx:playerLoaded", function()
  InitalizeScript()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(jobInfo)
  PlayerData = GetPlayerData()
  
  if Config.RequiredJob ~= "none" and Config.RestrictBlipToRequiredJob and PlayerData.job.name == Config.RequiredJob then
    -- Job requirement check
  end
  
  if Config.RestrictBlipToRequiredJob then
    -- Handle blip visibility
  else
    MakeBlip()
  end
  
  if Config.RequiredJob ~= "none" and PlayerData.job.name == Config.RequiredJob then
    -- Job requirement check
  end
  
  if Config.RequiredJob == "none" then
    StartMarkers(PlayerData)
  else
    HasBlipBeenCreated = false
  end
end)

RegisterNetEvent("esx:setJob", function(jobInfo)
  while PlayerData == nil or PlayerData.job == nil do
    PlayerData = GetPlayerData()
    Citizen.Wait(1000)
  end
  
  PlayerData.job = jobInfo
  
  if Config.RequiredJob ~= "none" and Config.RestrictBlipToRequiredJob and PlayerData.job.name == Config.RequiredJob then
    -- Job requirement check
  end
  
  if Config.RestrictBlipToRequiredJob then
    -- Handle blip visibility
  else
    MakeBlip()
  end
  
  if Config.RequiredJob ~= "none" and PlayerData.job.name == Config.RequiredJob then
    -- Job requirement check
  end
  
  if Config.RequiredJob == "none" then
    StartMarkers(PlayerData)
  else
    HasBlipBeenCreated = false
  end
end)

RegisterNetEvent("17mov_Garbage:EnteredMarker", function(markerIndex)
  CurrentAction = Config.Locations[markerIndex].CurrentAction
  CurrentActionMsg = Config.Locations[markerIndex].CurrentActionMsg
  CurrentActionStation = markerIndex
  
  for i = 0, 500 do
    Citizen.Wait(0)
    ShowHelpNotification(CurrentActionMsg)
  end
end)

RegisterNetEvent("17mov_Garbage:ExitedMarker", function(station)
  CurrentAction = nil
  CurrentActionMsg = nil
  CurrentActionStation = nil
end)

RegisterCommand("+GarbageCollectorUseMarker", function()
  -- Command handler
end, false)

RegisterCommand("-GarbageCollectorUseMarker", function()
  if CurrentAction ~= nil then
    if CurrentAction == "open_dutyToggle" then
      OpenDutyMenu()
    elseif CurrentAction == "finish_job" then
      Functions.TriggerServerCallback("17mov_Garbage:IfPlayerIsHost", function(isHost)
        if isHost then
          EndJob()
        else
          Notify(_L("Lobby.EndJob.NoPermission"))
        end
      end)
    end
  end
end, false)

function SmoothTeleport(entity, targetCoords, duration, await, callback)
  local promiseObj = promise.new()
  
  Citizen.CreateThread(function()
    local startCoords = GetEntityCoords(entity)
    local elapsedTime = 0
    local startTime = GetNetworkTimeAccurate()
    
    while elapsedTime < duration do
      local lerpedCoords = Functions.CorrectLerp(startCoords, targetCoords, elapsedTime / duration)
      SetEntityCoordsNoOffset(entity, lerpedCoords.x, lerpedCoords.y, lerpedCoords.z, false, false, false)
      elapsedTime = GetNetworkTimeAccurate() - startTime
      Wait(11)
    end
    
    SetEntityCoordsNoOffset(entity, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false)
    callback()
    promiseObj:resolve(true)
  end)
  
  if await then
    return Citizen.Await(promiseObj)
  end
end

function InvertMatrix(matrix)
  local rotationMatrix = {
    {matrix[1][1], matrix[1][2], matrix[1][3]},
    {matrix[2][1], matrix[2][2], matrix[2][3]},
    {matrix[3][1], matrix[3][2], matrix[3][3]}
  }
  
  local translation = {matrix[1][4], matrix[2][4], matrix[3][4]}
  
  local transposed = {
    {rotationMatrix[1][1], rotationMatrix[2][1], rotationMatrix[3][1]},
    {rotationMatrix[1][2], rotationMatrix[2][2], rotationMatrix[3][2]},
    {rotationMatrix[1][3], rotationMatrix[2][3], rotationMatrix[3][3]}
  }
  
  local invertedTranslation = {
    -(transposed[1][1] * translation[1] + transposed[1][2] * translation[2] + transposed[1][3] * translation[3]),
    -(transposed[2][1] * translation[1] + transposed[2][2] * translation[2] + transposed[2][3] * translation[3]),
    -(transposed[3][1] * translation[1] + transposed[3][2] * translation[2] + transposed[3][3] * translation[3])
  }
  
  return {
    {transposed[1][1], transposed[1][2], transposed[1][3], invertedTranslation[1]},
    {transposed[2][1], transposed[2][2], transposed[2][3], invertedTranslation[2]},
    {transposed[3][1], transposed[3][2], transposed[3][3], invertedTranslation[3]},
    {0, 0, 0, 1}
  }
end

function CreateMatrixFromRotation(rotation, position)
  local pitch = math.rad(rotation.x)
  local roll = math.rad(rotation.y)
  local yaw = math.rad(rotation.z)
  
  local cosPitch = math.cos(pitch)
  local sinPitch = math.sin(pitch)
  local cosRoll = math.cos(roll)
  local sinRoll = math.sin(roll)
  local cosYaw = math.cos(yaw)
  local sinYaw = math.sin(yaw)
  
  return {
    {cosRoll * cosYaw, cosYaw * sinPitch * sinRoll - cosPitch * sinYaw, cosPitch * cosYaw * sinRoll + sinPitch * sinYaw, position.x},
    {cosRoll * sinYaw, cosPitch * cosYaw + sinPitch * sinRoll * sinYaw, cosPitch * sinRoll * sinYaw - cosYaw * sinPitch, position.y},
    {-sinRoll, cosRoll * sinPitch, cosPitch * cosRoll, position.z},
    {0, 0, 0, 1}
  }
end

function MultiplyMatrixVector(matrix, vector)
  local x = matrix[1][1] * vector.x + matrix[1][2] * vector.y + matrix[1][3] * vector.z + matrix[1][4]
  local y = matrix[2][1] * vector.x + matrix[2][2] * vector.y + matrix[2][3] * vector.z + matrix[2][4]
  local z = matrix[3][1] * vector.x + matrix[3][2] * vector.y + matrix[3][3] * vector.z + matrix[3][4]
  
  return vec3(x, y, z)
end

function WorldToLocal(matrix, worldPos)
  Inversed_Matrix = InvertMatrix(matrix)
  
  local x = Inversed_Matrix[1][1] * worldPos.x + Inversed_Matrix[1][2] * worldPos.y + Inversed_Matrix[1][3] * worldPos.z + Inversed_Matrix[1][4]
  local y = Inversed_Matrix[2][1] * worldPos.x + Inversed_Matrix[2][2] * worldPos.y + Inversed_Matrix[2][3] * worldPos.z + Inversed_Matrix[2][4]
  local z = Inversed_Matrix[3][1] * worldPos.x + Inversed_Matrix[3][2] * worldPos.y + Inversed_Matrix[3][3] * worldPos.z + Inversed_Matrix[3][4]
  
  return vec3(x, y, z)
end

function CheckBoxCollision(matrix, boundsA, boundsB)
  local localBottomLeft = WorldToLocal(matrix, boundsB.bottom_left)
  local localTopRight = WorldToLocal(matrix, boundsB.top_right)
  
  local xInside = localTopRight.x < boundsA.top_right.x
  local xOutside = localBottomLeft.x > boundsA.bottom_left.x
  local closerToTopRight = #(localTopRight - boundsA.top_right) < #(localBottomLeft - boundsA.top_right)
  
  local collision = xInside or closerToTopRight
  collision = xOutside or collision
  
  if xInside and xOutside then
    collision = closerToTopRight
  end
  
  return collision
end

local UnloadBoxVisible = false

RegisterNetEvent("17mov_GarbageCollector:client:hideBox", function()
  if UnloadBoxVisible then
    UnloadBoxVisible = false
  end
end)

RegisterNetEvent("17mov_GarbageCollector:client:forceEndJob", function()
  TutorialShowing = true
  return TriggerServerEvent("17mov_Garbage:endJob_sv", true, true)
end)

local EndStageCompleted = false

RegisterNetEvent("17mov_Garbage:client:endStage", function(sourcePlayer)
  Citizen.CreateThread(function()
    local vehicle = NetToVeh(JobVehicleNetId)
    
    if not DoesEntityExist(vehicle) then
      return
    end
    
    local unloadCoords = Config.UnloadZone.coords
    local unloadRotation = Config.UnloadZone.rotation
    
    local foundZ, groundZ = GetGroundZFor_3dCoord(unloadCoords.x, unloadCoords.y, unloadCoords.z, false)
    if foundZ then
      unloadCoords = vec3(unloadCoords.x, unloadCoords.y, groundZ)
    end
    
    Functions.LoadModel(GetHashKey(Config.JobVehicleModel))
    
    local minBounds, maxBounds = GetModelDimensions(GetHashKey(Config.JobVehicleModel))
    local padding = vec3(0.5, 0.5, 0.2)
    local matrix = CreateMatrixFromRotation(unloadRotation, unloadCoords)
    
    local bottomLeft = vec3(maxBounds.x + padding.x, maxBounds.y + padding.y, maxBounds.z - minBounds.z + padding.z)
    local topRight = vec3(minBounds.x - padding.x, minBounds.y - padding.y, minBounds.z - padding.z)
    local size = maxBounds - minBounds + (2 * padding)
    
    local bagsToUnload = Progress
    local bagsPerFullTruck = Config.BagsCountToFullUnload
    local bagValue = 100 / bagsPerFullTruck
    local myServerId = GetPlayerServerId(PlayerId())
    
    UnloadBoxVisible = true
    
    while UnloadBoxVisible do
      if vehicle ~= 0 then
        local vehicleTopRight = GetOffsetFromEntityInWorldCoords(vehicle, maxBounds.x, maxBounds.y, maxBounds.z)
        local vehicleBottomLeft = GetOffsetFromEntityInWorldCoords(vehicle, minBounds.x, minBounds.y, minBounds.z)
        
        local isInPosition = CheckBoxCollision(
          matrix,
          {bottom_left = topRight, top_right = bottomLeft},
          {bottom_left = vehicleBottomLeft, top_right = vehicleTopRight}
        )
        
        DrawMarker(
          43,
          unloadCoords.x, unloadCoords.y, unloadCoords.z + 0.02,
          0.0, 0.0, 0.0,
          unloadRotation.x, unloadRotation.y, unloadRotation.z,
          size.x, size.y, size.z / 2.5,
          isInPosition and 0 or 255,
          isInPosition and 255 or 0,
          0, 50,
          false, false, 2, false, false, false, false
        )
        
        if isInPosition then
          local driver = GetPedInVehicleSeat(vehicle, -1)
          if driver == PlayerPedId() then
            if myServerId == sourcePlayer then
              ShowHelpNotification(_L("Job.Markers.UnloadVehicle"))
              
              if IsControlJustReleased(0, 38) then
                UnloadBoxVisible = false
              end
            end
          end
        end
      end
      
      Wait(0)
    end
    
    if not UnloadBoxVisible and myServerId == sourcePlayer then
      EndStageCompleted = true
      
      Citizen.CreateThread(function()
        while EndStageCompleted do
          DisableControlAction(0, 75, true)
          Wait(0)
        end
      end)
      
      FreezeEntityPosition(vehicle, true)
      TriggerServerEvent("17mov_GarbageCollector:server:hideBox")
      
      local bagsToSpawn = math.ceil(bagsToUnload / bagValue)
      local nearbyPlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 150, true)
      
      TriggerServerEvent("17mov_GarbageCollector:ToggleTrunk", JobVehicleNetId, true)
      TriggerServerEvent("17mov_GarbageCollector:server:startUnloadAnim", bagsToSpawn, nearbyPlayers)
    end
  end)
end)

RegisterNetEvent("17mov_GarbageCollector:client:startUnloadAnim", function(bagsCount, isHost)
  local animMatrix = MultiplyMatrixVector(
    CreateMatrixFromRotation(Config.Animation.rotation, Config.Animation.start_coords),
    Config.Animation.end_coords_offset
  )
  
  for i = 1, bagsCount do
    Functions.SpawnObject(Config.Animation.model, function(bagObject)
      Entity(bagObject).state:set("GarbageBlock", true, false)
      
      if i == bagsCount then
        if isHost then
          TriggerServerEvent("17mov_GarbageCollector:ToggleTrunk", JobVehicleNetId, false)
        end
      end
      
      SetEntityRotation(bagObject, Config.Animation.rotation.x, Config.Animation.rotation.y, Config.Animation.rotation.z, 2, false)
      
      SmoothTeleport(bagObject, animMatrix, Config.Animation.duration, false, function()
        if i == bagsCount then
          EndStageCompleted = false
          Functions.DeleteEntity(bagObject)
          TutorialShowing = true
          
          if isHost then
            return TriggerServerEvent("17mov_Garbage:endJob_sv", true)
          end
          
          return
        end
      end)
      
      Wait(Config.Animation.duration / Config.Animation.max_bags_on_line)
    end, Config.Animation.start_coords, false, true, true)
  end
end)

TriggerEvent("chat:removeSuggestion", "/+GarbageCollectorUseMarker")
TriggerEvent("chat:removeSuggestion", "/-GarbageCollectorUseMarker")

RegisterKeyMapping("+GarbageCollectorUseMarker", _L("Command.MarkerInteraction.Description"), "keyboard", "E")

if Config.UseModernUI then
  function OpenDutyMenu()
    if not IsPerformingSceneAction then
      InitalizeScript(true)
      return print("SCRIPT NOT READY-WAIT UNTIL SCRIPT PROPERLY LOAD")
    end
    
    if not UILoaded then
      Functions.TriggerServerCallback("17mov_Garbage:init", function(playerInfo)
        SendNUIMessage({
          action = "Init",
          name = playerInfo.name,
          myId = playerInfo.source
        })
        UILoaded = true
      end)
      
      return print("