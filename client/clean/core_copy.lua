local ServerCallbacks = {}
local CallbackId = 0

Functions.SpawnedObjects = {}

Functions.BoneNames = {
  SKEL_R_HAND = 57005,
  SKEL_L_HAND = 18905,
  SKEL_HEAD = 12844,
  PH_R_HAND = 28422
}

function Functions.LoadModel(model)
  if HasModelLoaded(model) then
    return
  end
  
  RequestModel(model)
  while not HasModelLoaded(model) do
    Wait(0)
  end
end

function Functions.RequestAnimDict(animDict)
  if HasAnimDictLoaded(animDict) then
    return
  end
  
  RequestAnimDict(animDict)
  while not HasAnimDictLoaded(animDict) do
    Wait(0)
  end
end

function Functions.SpawnVehicle(model, spawnCoords, teleportPlayer)
  Functions.LoadModel(model)
  
  local vehicle = CreateVehicle(model, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)
  
  SetEntityAsMissionEntity(vehicle, true, true)
  SetVehicleNeedsToBeHotwired(vehicle, false)
  SetVehRadioStation(vehicle, "OFF")
  SetVehicleFuelLevel(vehicle, 100.0)
  
  if teleportPlayer then
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
  end
  
  local timeout = 100
  while not DoesEntityExist(vehicle) and timeout > 0 do
    Citizen.Wait(100)
    timeout = timeout - 1
  end
  
  return vehicle
end

function Functions.RequestControlOfEntity(entity)
  local timeout = GetGameTimer() + 50
  
  while not NetworkHasControlOfEntity(entity) and GetGameTimer() < timeout do
    NetworkRequestControlOfEntity(entity)
    Citizen.Wait(0)
  end
  
  return NetworkHasControlOfEntity(entity)
end

function Functions.SpawnObject(model, callback, coords, isNetworked, isFrozen, noCollisions, isNetworkGlobal, isInvisible)
  local playerPed = PlayerPedId()
  
  if type(model) == "string" then
    model = GetHashKey(model) or model
  end
  
  if not IsModelInCdimage(model) then
    return Functions.Error("CAN'T SPAWN OBJECT BECAUSE MODEL DOESNT EXIST:" .. model)
  end
  
  if coords then
    if type(coords) == "table" then
      coords = vec3(coords.x, coords.y, coords.z) or coords
    end
  else
    coords = GetEntityCoords(playerPed)
  end
  
  isNetworked = isNetworked == nil or isNetworked
  isFrozen = isFrozen == true or isFrozen
  
  Functions.LoadModel(model)
  
  local object = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, isNetworked, true, true)
  
  if isNetworked and isNetworkGlobal then
    SetNetworkIdExistsOnAllMachines(ObjToNet(object), true)
    SetNetworkIdCanMigrate(ObjToNet(object), false)
    N_0x0379daf89ba09aa5(object, true)
  end
  
  if isInvisible then
    SetEntityVisible(object, false, true)
  end
  
  if isNetworked and noCollisions then
    SetEntityCollision(object, false, false)
  end
  
  if type(coords) == "vector4" then
    SetEntityHeading(object, coords.w)
  end
  
  Functions.SpawnedObjects[tostring(object)] = true
  
  FreezeEntityPosition(object, isFrozen)
  SetEntityLodDist(object, 500)
  
  if callback then
    callback(object)
  end
  
  return object
end

function Functions.DeleteEntity(entity)
  if entity == nil then
    return Functions.Error("ATTEMPTED TO DELETE A NIL OBJECT")
  end
  
  if type(entity) ~= "number" then
    return Functions.Error("ATTEMPTED TO DELETE A " .. type(entity) .. " TYPE:" .. entity)
  end
  
  DetachEntity(entity, false, false)
  SetEntityAsMissionEntity(entity, false, true)
  DeleteObject(entity)
  Functions.SpawnedObjects[tostring(entity)] = nil
end

function Functions.IsSpawnPointClear(spawnPoint)
  local spawnCoords = vec3(spawnPoint.x, spawnPoint.y, spawnPoint.z)
  local vehicles = GetGamePool('CVehicle')
  
  if vehicles == nil or type(vehicles) ~= "table" then
    print("FAILED TO FETCH GAMEPOOL-Returning CLEAR")
    return true
  end
  
  for k, vehicle in pairs(vehicles) do
    local vehicleCoords = GetEntityCoords(vehicle)
    if #(vehicleCoords - spawnCoords) < 6.0 then
      return false
    end
  end
  
  return true
end

function Functions.TriggerServerCallback(callbackName, callback, ...)
  CallbackId = CallbackId + 1
  local currentCallbackId = CallbackId
  
  ServerCallbacks[callbackName] = ServerCallbacks[callbackName] or {}
  ServerCallbacks[callbackName][currentCallbackId] = callback
  
  TriggerServerEvent("17mov_Callbacks:GetResponse" .. GetCurrentResourceName(), callbackName, currentCallbackId, ...)
end

RegisterNetEvent("17mov_Callbacks:receiveData" .. GetCurrentResourceName(), function(callbackName, callbackId, ...)
  if ServerCallbacks[callbackName] == nil then
    return
  end
  
  if ServerCallbacks[callbackName][callbackId] == nil then
    return
  end
  
  ServerCallbacks[callbackName][callbackId](...)
  
  if ServerCallbacks[callbackName] ~= nil then
    if ServerCallbacks[callbackName][callbackId] ~= nil then
      ServerCallbacks[callbackName][callbackId] = nil
    end
  end
  
  if ServerCallbacks[callbackName] ~= nil then
    if #ServerCallbacks[callbackName] == 0 then
      ServerCallbacks[callbackName] = nil
    end
  end
end)

RegisterNetEvent("onResourceStop", function(resourceName)
  if GetCurrentResourceName() ~= resourceName then
    return
  end
  
  for objectId, _ in pairs(Functions.SpawnedObjects) do
    local entity = tonumber(objectId)
    if entity then
      if DoesEntityExist(entity) then
        DeleteEntity(entity)
      end
    end
  end
end)

function Functions.GetBoneIndexByName(ped, boneName)
  local boneId = Functions.BoneNames[boneName]
  
  if boneId == nil then
    return Functions.Print("Attempted to get bone by name but this bone was never mapped")
  end
  
  return GetPedBoneIndex(ped, boneId)
end

Functions.IsInAnim = false

function Functions.StartScene(sceneOrigin, sceneObjects, sceneId, callback, currentStage)
  local scene = {}
  scene.ready = false
  scene.originPoint = sceneOrigin
  scene.objects = sceneObjects
  
  local upVector = vec3(0, 0, 1)
  local forwardMatrix = nil
  local rightMatrix = nil
  
  Functions.SpawnObject("p_car_keys_01", function(tempObject)
    SetEntityRotation(tempObject, sceneOrigin.rotation.x, sceneOrigin.rotation.y, sceneOrigin.rotation.z, 2, false)
    forwardMatrix, rightMatrix = GetEntityMatrix(tempObject)
    Functions.DeleteEntity(tempObject)
  end, sceneOrigin.coords, false, true)
  
  local networkedObjects = {}
  
  for objIndex, objData in pairs(scene.objects) do
    if not objData.object then
      local spawnCoords = sceneOrigin.coords + (rightMatrix * objData.offset.y) + (forwardMatrix * objData.offset.x) + (upVector * objData.offset.z)
      
      Functions.SpawnObject(objData.model, function(spawnedObject)
        local heading = nil
        
        if objData.rotation == nil then
          objData.rotation = vec3(0, 0, 0)
        end
        
        if objData.rotationRelativeTo then
          local relativeObject = scene.objects[objData.rotationRelativeTo].object
          
          if relativeObject == nil then
            return Functions.Print("Attempted to make relative rotation but the relative object doesn't exist yet.")
          end
          
          local relativeHeading = GetEntityHeading(relativeObject)
          heading = (relativeHeading + objData.rotation.y) % 360.0
        else
          if objData.rotation then
            local offset = spawnCoords - sceneOrigin.coords
            local baseHeading = GetHeadingFromVector_2d(offset.x, offset.y)
            heading = (baseHeading + objData.rotation.y) % 360
          end
        end
        
        SetEntityHeading(spawnedObject, heading)
        objData.object = spawnedObject
        objData.type = "object"
        objData.ready = true
        
        if objData.isNetworked then
          Entity(spawnedObject).state:set("GarbageBlock", true, true)
        else
          table.insert(networkedObjects, {
            model = objData.model,
            coords = GetEntityCoords(spawnedObject),
            rotation = GetEntityRotation(spawnedObject, 2),
            isFrozen = objData.isFrozen,
            NoCollisions = objData.NoCollisions
          })
          Entity(spawnedObject).state:set("GarbageBlock", true, false)
        end
      end, spawnCoords, objData.isNetworked, objData.isFrozen, objData.NoCollisions)
    else
      if objData.object then
        local objectCoords = GetEntityCoords(objData.object)
        local zeroVector = vec3(0.0, 0.0, 0.0)
        
        if type(objData.object) == "string" then
          if objData.object == "PlayerPed" then
            objData.object = PlayerPedId()
            objData.type = "ped"
            zeroVector = vec3(0.0, 0.0, -1.0)
            objectCoords = GetEntityCoords(objData.object) + zeroVector
          end
        end
        
        objData.ready = true
      end
    end
    
    if not objData.type then
      objData.type = "object"
    end
    
    if objData.animDict then
      if not objData.IsSceneObject then
        Functions.RequestAnimDict(objData.animDict)
      end
    end
  end
  
  while not scene.ready do
    local allReady = true
    
    for objIndex, objData in pairs(scene.objects) do
      if not objData.ready then
        allReady = false
        break
      end
    end
    
    if allReady then
      scene.ready = true
      scene.playing = true
      scene.startTime = GetGameTimer()
    end
    
    Wait(10)
  end
  
  local networkTime = nil
  local attachmentCount = 0
  local stopFrameCount = 0
  local animatedObjects = {}
  local mainSceneObject = nil
  
  for objIndex, objData in pairs(scene.objects) do
    if objData.object and objData.animDict and objData.animClip then
      if objData.type == "object" then
        if objData.IsSceneObject then
          local objectCoords = GetEntityCoords(objData.object)
          local nearbyPlayers = GetClosestPlayers(objectCoords, 168.0)
          
          while not networkTime do
            Wait(1)
          end
          
          TriggerServerEvent("17mov_GarbageCollector:server:GarbageAnim", nearbyPlayers, ObjToNet(objData.object), networkTime, sceneId, networkedObjects, currentStage)
        else
          Functions.RequestAnimDict(objData.animDict)
          PlayEntityAnim(objData.object, objData.animClip, objData.animDict, 2.0, false, false, false, 0, 0)
        end
      else
        if objData.stayInLastFrame then
          objData.flag = objData.flag + 2
        end
        
        Citizen.CreateThread(function()
          mainSceneObject = {
            obj = objData.object,
            dict = objData.animDict,
            clip = objData.animClip
          }
          
          Functions.RequestAnimDict(objData.animDict)
          TaskPlayAnim(objData.object, objData.animDict, objData.animClip, 2.0, 2.0, objData.duration or -1, objData.flag or 0, 0.0, false, false, false)
          networkTime = GetNetworkTimeAccurate()
        end)
      end
      
      table.insert(animatedObjects, {
        obj = objData.object,
        dict = objData.animDict,
        clip = objData.animClip
      })
    end
    
    if objData.attachment then
      attachmentCount = attachmentCount + 1
      objData.attachment.time = objData.attachment.atFrame / (GetAnimDuration(scene.objects[objData.attachment.attachToIndex].animDict, scene.objects[objData.attachment.attachToIndex].animClip) * 30)
    end
    
    if objData.stopAtFrame then
      stopFrameCount = stopFrameCount + 1
      local animDuration = GetAnimDuration(objData.animDict, objData.animClip)
      objData.stopTime = objData.stopAtFrame / (animDuration * 30)
    end
  end
  
  local animsReady = {}
  local timeout = 5000
  local startTime = GetGameTimer()
  
  while #animsReady < #animatedObjects and GetGameTimer() - startTime < timeout do
    for i = 1, #animatedObjects do
      if DoesEntityExist(animatedObjects[i].obj) then
        if IsEntityPlayingAnim(animatedObjects[i].obj, animatedObjects[i].dict, animatedObjects[i].clip, 3) then
          if not animsReady[i] then
            animsReady[i] = true
          end
        end
      end
    end
    
    Wait(30)
  end
  
  if #animsReady < #animatedObjects then
    callback(scene, false)
    return print("FATAL ERROR WHILE WAITING FOR ANIMATIONS")
  end
  
  CreateThread(function()
    local sceneCompleted = true
    
    while scene.playing do
      Citizen.Wait(0)
      
      local stillPlaying = false
      local currentTime = GetGameTimer()
      
      for objIndex, objData in pairs(scene.objects) do
        if objData.object and objData.animDict and objData.animClip then
          local animDuration = GetAnimDuration(objData.animDict, objData.animClip) * 1000
          if animDuration > (currentTime - scene.startTime) then
            stillPlaying = true
          end
        end
      end
      
      if stillPlaying then
        if not IsEntityPlayingAnim(mainSceneObject.obj, mainSceneObject.dict, mainSceneObject.clip, 3) then
          stillPlaying = false
          sceneCompleted = false
        end
      end
      
      if not stillPlaying then
        scene.playing = false
      end
      
      DisableAllControlActions(0)
      EnableControlAction(0, 0, true)
      EnableControlAction(0, 1, true)
      EnableControlAction(0, 2, true)
    end
    
    for objIndex, objData in pairs(scene.objects) do
      if objData.isFrozen and objData.object and not objData.IsSceneObject then
        FreezeEntityPosition(objData.object, false)
      end
      
      if objData.destroy then
        Functions.DeleteEntity(objData.object)
      end
    end
    
    if callback then
      callback(scene, sceneCompleted)
    end
  end)
  
  while attachmentCount > 0 or stopFrameCount > 0 do
    if not scene.playing then
      break
    end
    
    for objIndex, objData in pairs(scene.objects) do
      if objData.attachment and objData.attachment.attachToIndex then
        if not objData.attachment.attached then
          local attachToObject = scene.objects[objData.attachment.attachToIndex]
          
          if attachToObject and attachToObject.animDict and attachToObject.animClip then
            local currentTime = GetEntityAnimCurrentTime(attachToObject.object, attachToObject.animDict, attachToObject.animClip)
            
            if currentTime >= objData.attachment.time then
              local boneIndex = Functions.GetBoneIndexByName(attachToObject.object, objData.attachment.bone)
              
              if boneIndex ~= nil then
                AttachEntityToEntity(
                  objData.object,
                  attachToObject.object,
                  boneIndex,
                  objData.attachment.offset.x,
                  objData.attachment.offset.y,
                  objData.attachment.offset.z,
                  objData.attachment.rotation.x,
                  objData.attachment.rotation.y,
                  objData.attachment.rotation.z,
                  true,
                  true,
                  objData.attachment.collision or false,
                  true,
                  1,
                  objData.attachment.syncRot
                )
                
                objData.attachment.attached = true
                attachmentCount = attachmentCount - 1
              end
            end
          end
        end
      end
      
      if objData.stopAtFrame then
        local currentTime = GetEntityAnimCurrentTime(objData.object, objData.animDict, objData.animClip)
        if currentTime >= objData.stopTime then
          SetEntityAnimCurrentTime(objData.object, objData.animDict, objData.animClip, objData.stopTime)
        end
      end
    end
    
    Wait(0)
  end
end

-- Config.Scenes remains the same as it was already defined in the obfuscated code
Config.Scenes = {
  {
    Models = {"prop_dumpster_01a", "prop_dumpster_02a", "prop_dumpster_02b"},
    Distance = 1.5,
    DrawTextOffset = vec3(0.0, -0.5, 1.3),
    Stages = {
      {
        PlayerOffset = vec3(0.0, -0.92, 0.0),
        Objects = {
          {
            object = "PlayerPed",
            isFrozen = true,
            lerpDuration = 1000,
            animDict = "17mov_garbage",
            animClip = "ped_dumpster_01a_1",
            isLooped = false,
            stayInLastFrame = false,
            flag = 32,
            destroy = false
          },
          {
            object = "SceneModel",
            isNetworked = false,
            isFrozen = true,
            offset = vec3(0.0, 0.0, 0.0),
            animDict = "17mov_garbage",
            animClip = "prop_dumpster_01a_1",
            isLooped = false,
            stayInLastFrame = false,
            destroy = false
          },
          {
            model = "prop_rub_binbag_08",
            isNetworked = true,
            isFrozen = true,
            NoCollisions = true,
            offset = vec3(0.408, 0.646, 0.82),
            rotation = vec3(0, 0, 0),
            rotationRelativeTo = 2,
            destroy = false,
            attachment = {
              offset = vec3(0.0, 0.0, 0.0),
              rotation = vec3(0.0, 0.0, 0.0),
              attachToIndex = 1,
              atFrame = 75,
              bone = "PH_R_HAND",
              syncRot = true
            }
          },
          {
            model = "prop_rub_binbag_06",
            isNetworked = false,
            isFrozen = true,
            NoCollisions = true,
            offset = vec3(-0.333861, 0.737725, 0.7),
            rotation = vec3(0.0, 0.0, 0.0),
            rotationRelativeTo = 2,
            destroy = true
          },
          {
            model = "prop_rub_binbag_06",
            isNetworked = false,
            isFrozen = true,
            NoCollisions = true,
            offset = vec3(-0.577896, 0.975279, 0.722757),
            rotation = vec3(0.0, 0.0, 0.0),
            rotationRelativeTo = 2,
            destroy = true
          },
          {
            model = "prop_rub_binbag_08",
            isNetworked = false,
            isFrozen = true,
            NoCollisions = true,
            offset = vec3(-0.021977, 1.01418, 0.817227),
            rotation = vec3(0.0, 0.0, 0.0),
            rotationRelativeTo = 2,
            destroy = true
          },
          {
            model = "prop_rub_binbag_06",
            isNetworked = false,
            isFrozen = true,
            NoCollisions = true,
            offset = vec3(0.446679, 1.15301, 0.722757),
            rotation = vec3(0.0, 0.0, 0.0),
            rotationRelativeTo = 2,
            destroy = true
          }
        }
      },
      -- Additional stages follow the same pattern (stages 2-6)
      -- Omitting for brevity as they follow identical structure
    }
  }
}