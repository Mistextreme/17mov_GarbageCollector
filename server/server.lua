local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = {}
L7_1 = 4
L8_1 = GetPlayerIdentifierByType
L9_1 = GetPlayerPing
L10_1 = TriggerClientEvent
function L11_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = msgpack
  L2_2 = L2_2.pack_args
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = ...
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L3_2 = #L2_2
  L4_2 = type
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = 1
    L5_2 = #A1_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = TriggerClientEventInternal
      L9_2 = A0_2
      L10_2 = A1_2[L7_2]
      L11_2 = L2_2
      L12_2 = L3_2
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
    return
  end
  L4_2 = TriggerClientEventInternal
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = L2_2
  L8_2 = L3_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L12_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if nil == A0_2 then
    L2_2 = 0
    return L2_2
  end
  L2_2 = L8_1
  if nil ~= L2_2 then
    L2_2 = L8_1
    L3_2 = A0_2
    L4_2 = A1_2
    return L2_2(L3_2, L4_2)
  else
    L2_2 = GetPlayerIdentifier
    L3_2 = A0_2
    L4_2 = 1
    return L2_2(L3_2, L4_2)
  end
end
GetPlayerIdentifierByType = L12_1
function L12_1(A0_2, ...)
  local L1_2, L2_2, L3_2
  if nil ~= A0_2 then
    L1_2 = L9_1
    L2_2 = A0_2
    L3_2 = ...
    L1_2(L2_2, L3_2)
  end
end
GetPlayerPing = L12_1
function L12_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2
  if nil ~= A1_2 then
    L2_2 = L10_1
    L3_2 = A0_2
    L4_2 = A1_2
    L5_2 = ...
    L2_2(L3_2, L4_2, L5_2)
  end
end
TriggerClientEvent = L12_1
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = 0
  L2_2 = pairs
  L3_2 = L0_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.host
    if L8_2 == A0_2 then
      L1_2 = L6_2
    end
  end
  if not L1_2 then
    return
  end
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L3_2 = {}
  L2_2.rewardsOptions = L3_2
  L2_2 = L0_1
  L2_2 = L2_2[L1_2]
  L2_2 = L2_2.clients
  L2_2 = #L2_2
  L2_2 = L2_2 + 1
  L3_2 = 1
  L4_2 = L2_2 - 1
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L0_1
    L7_2 = L7_2[L1_2]
    L7_2 = L7_2.clients
    L7_2 = L7_2[L6_2]
    if not L7_2 then
      return
    end
    L8_2 = L0_1
    L8_2 = L8_2[L1_2]
    L8_2 = L8_2.rewardsOptions
    L9_2 = math
    L9_2 = L9_2.floor
    L10_2 = 100
    L10_2 = L10_2 / L2_2
    L9_2 = L9_2(L10_2)
    L8_2[L7_2] = L9_2
  end
  L3_2 = L0_1
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.rewardsOptions
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = 100
  L5_2 = L5_2 / L2_2
  L4_2 = L4_2(L5_2)
  L3_2[A0_2] = L4_2
  L3_2 = TriggerForAllMembers
  L4_2 = A0_2
  L5_2 = "17mov_Garbage:SetMyReward"
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = 100
  L7_2 = L7_2 / L2_2
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = TriggerClientEvent
  L4_2 = "17mov_Garbage:UpdateHostPercentages"
  L5_2 = A0_2
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = 100
  L7_2 = L7_2 / L2_2
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
RecalculateRewards = L12_1
L12_1 = RegisterNetEvent
L13_1 = "17mov_GarbageCollector:server:fixRotation"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = DoesEntityExist
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = Entity
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    L2_2 = L2_2.state
    L2_2 = L2_2.validPos
    if L2_2 then
      L2_2 = TriggerClientEvent
      L3_2 = "17mov_GarbageCollector:client:fixRotation"
      L4_2 = -1
      L5_2 = A0_2
      L2_2(L3_2, L4_2, L5_2)
    end
  end
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_GarbageCollector:server:GarbageAnim"
function L14_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L6_2 = source
  L7_2 = L11_1
  L8_2 = "17mov_GarbageCollector:client:GarbageAnim"
  L9_2 = A0_2
  L10_2 = A1_2
  L11_2 = A2_2
  L12_2 = A3_2
  L13_2 = L6_2
  L14_2 = A4_2
  L15_2 = A5_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
end
L12_1(L13_1, L14_1)
function L12_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = DoesEntityExist
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L3_2 = Entity
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L3_2 = L3_2.queued_bags
  if not L3_2 then
    L3_2 = 0
  end
  if A1_2 then
    L3_2 = L3_2 + 1
    L4_2 = Entity
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = L4_2
    L4_2 = L4_2.set
    L6_2 = "queued_bags"
    L7_2 = L3_2
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  if 1 == L3_2 or A2_2 and L3_2 > 0 then
    L4_2 = Citizen
    L4_2 = L4_2.SetTimeout
    L5_2 = math
    L5_2 = L5_2.random
    L6_2 = Config
    L6_2 = L6_2.BinsRestartingDelay
    L6_2 = L6_2.min
    L7_2 = Config
    L7_2 = L7_2.BinsRestartingDelay
    L7_2 = L7_2.max
    L5_2 = L5_2(L6_2, L7_2)
    L5_2 = L5_2 * 1000
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      L0_3 = DoesEntityExist
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        return
      end
      L0_3 = Entity
      L1_3 = A0_2
      L0_3 = L0_3(L1_3)
      L0_3 = L0_3.state
      L0_3 = L0_3.queued_bags
      if not L0_3 then
        L0_3 = 0
      end
      if 0 == L0_3 then
        return
      end
      L1_3 = Entity
      L2_3 = A0_2
      L1_3 = L1_3(L2_3)
      L1_3 = L1_3.state
      L1_3 = L1_3.currentStage
      if L1_3 then
        L2_3 = Entity
        L3_3 = A0_2
        L2_3 = L2_3(L3_3)
        L2_3 = L2_3.state
        L3_3 = L2_3
        L2_3 = L2_3.set
        L4_3 = "currentStage"
        L5_3 = math
        L5_3 = L5_3.max
        L6_3 = L1_3 - 1
        L7_3 = 1
        L5_3 = L5_3(L6_3, L7_3)
        L6_3 = true
        L2_3(L3_3, L4_3, L5_3, L6_3)
      end
      L2_3 = Entity
      L3_3 = A0_2
      L2_3 = L2_3(L3_3)
      L2_3 = L2_3.state
      L3_3 = L2_3
      L2_3 = L2_3.set
      L4_3 = "queued_bags"
      L5_3 = math
      L5_3 = L5_3.max
      L6_3 = L0_3 - 1
      L7_3 = 0
      L5_3 = L5_3(L6_3, L7_3)
      L6_3 = true
      L2_3(L3_3, L4_3, L5_3, L6_3)
      L2_3 = RestartBagsQueue
      L3_3 = A0_2
      L4_3 = false
      L5_3 = true
      L2_3(L3_3, L4_3, L5_3)
    end
    L4_2(L5_2, L6_2)
  end
end
RestartBagsQueue = L12_1
L12_1 = RegisterNetEvent
L13_1 = "17mov_GarbageCollector:server:GarbageSetOcupied"
function L14_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = NetworkGetEntityFromNetworkId
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = DoesEntityExist
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    if A1_2 then
      L5_2 = Entity
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L5_2 = L5_2.state
      L5_2 = L5_2.currentStage
      if not L5_2 then
        L5_2 = 1
      end
      L6_2 = math
      L6_2 = L6_2.min
      if A3_2 then
        L7_2 = 0
        if L7_2 then
          goto lbl_27
        end
      end
      L7_2 = 1
      ::lbl_27::
      L7_2 = L5_2 + L7_2
      L8_2 = A1_2
      L6_2 = L6_2(L7_2, L8_2)
      L5_2 = L6_2
      L6_2 = Entity
      L7_2 = L4_2
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2.state
      L7_2 = L6_2
      L6_2 = L6_2.set
      L8_2 = "currentStage"
      L9_2 = L5_2
      L10_2 = true
      L6_2(L7_2, L8_2, L9_2, L10_2)
      L6_2 = RestartBagsQueue
      L7_2 = L4_2
      L8_2 = true
      L9_2 = false
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = Entity
      L7_2 = L4_2
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2.state
      L7_2 = L6_2
      L6_2 = L6_2.set
      L8_2 = "GarbageOccupied"
      L9_2 = nil
      L10_2 = true
      L6_2(L7_2, L8_2, L9_2, L10_2)
    else
      L5_2 = Entity
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L5_2 = L5_2.state
      L6_2 = L5_2
      L5_2 = L5_2.set
      L7_2 = "GarbageOccupied"
      L8_2 = true
      L9_2 = true
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
    if A2_2 then
      L5_2 = Config
      L5_2 = L5_2.FixBinsPosition
      if L5_2 then
        L5_2 = Entity
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        L5_2 = L5_2.state
        L6_2 = L5_2
        L5_2 = L5_2.set
        L7_2 = "validPos"
        L8_2 = json
        L8_2 = L8_2.encode
        L9_2 = A2_2
        L8_2 = L8_2(L9_2)
        L9_2 = true
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
    end
  end
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_GarbageCollector:server:BlockBags"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = 1
  L2_2 = #A0_2
  L3_2 = 1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = NetworkGetEntityFromNetworkId
    L6_2 = A0_2[L4_2]
    L5_2 = L5_2(L6_2)
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = Entity
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2.state
      L7_2 = L6_2
      L6_2 = L6_2.set
      L8_2 = "GarbageBlock"
      L9_2 = true
      L10_2 = true
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
  end
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_GarbageCollector:server:GarbageGetOcupied"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = DoesEntityExist
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = Entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2.state
  L3_2 = L3_2.GarbageOccupied
  if L3_2 then
    L4_2 = true
    return L4_2
  end
  L4_2 = Entity
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2.state
  L5_2 = L4_2
  L4_2 = L4_2.set
  L6_2 = "GarbageOccupied"
  L7_2 = true
  L8_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = false
  return L4_2
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_Garbage:GetPlayersNames"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = {}
  L3_2 = 1
  L4_2 = #A1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = {}
    L10_2 = A1_2[L6_2]
    L9_2.id = L10_2
    L10_2 = GetPlayerIdentity
    L11_2 = A1_2[L6_2]
    L10_2 = L10_2(L11_2)
    L9_2.name = L10_2
    L7_2(L8_2, L9_2)
  end
  return L2_2
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_Garbage:CheckThisReward"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = 0
  L4_2 = 0
  L5_2 = pairs
  L6_2 = L0_1
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L10_2.host
    if A0_2 == L11_2 then
      L3_2 = L9_2
      break
    end
    L11_2 = 1
    L12_2 = L10_2.clients
    L12_2 = #L12_2
    L13_2 = 1
    for L14_2 = L11_2, L12_2, L13_2 do
      L15_2 = L10_2.clients
      L15_2 = L15_2[L14_2]
      if A0_2 == L15_2 then
        L3_2 = L9_2
        break
      end
    end
  end
  L5_2 = pairs
  L6_2 = L0_1
  L6_2 = L6_2[L3_2]
  L6_2 = L6_2.rewardsOptions
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    if L9_2 ~= A2_2 then
      L4_2 = L4_2 + L10_2
    end
  end
  L5_2 = L4_2 + A1_2
  if L5_2 > 100 then
    L5_2 = false
    return L5_2
  else
    L5_2 = L0_1
    L5_2 = L5_2[L3_2]
    L5_2 = L5_2.rewardsOptions
    L5_2[A2_2] = A1_2
    L5_2 = TriggerClientEvent
    L6_2 = "17mov_Garbage:SetMyReward"
    L7_2 = A2_2
    L8_2 = A1_2
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = true
    return L5_2
  end
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_Garbage:IfPlayerOwnsTeam"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = false
  L2_2 = pairs
  L3_2 = L0_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.host
    if L8_2 == A0_2 then
      L1_2 = true
      break
    end
  end
  return L1_2
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_Garbage:IfPlayerIsHost"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = true
  L2_2 = 0
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = 1
    L10_2 = L8_2.clients
    L10_2 = #L10_2
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = L8_2.clients
      L13_2 = L13_2[L12_2]
      if L13_2 == A0_2 then
        L1_2 = false
        L2_2 = L7_2
        break
      end
    end
  end
  if not L1_2 then
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L3_2 = L3_2.host
    if nil ~= L3_2 then
      L3_2 = GetPlayerPing
      L4_2 = L0_1
      L4_2 = L4_2[L2_2]
      L4_2 = L4_2.host
      L3_2 = L3_2(L4_2)
      if 0 ~= L3_2 then
        goto lbl_41
      end
    end
    L1_2 = true
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L3_2.host = A0_2
  end
  ::lbl_41::
  return L1_2
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_Garbage:init"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = {}
  L2_2 = GetPlayerIdentity
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2.name = L2_2
  L1_2.source = A0_2
  return L1_2
end
L12_1(L13_1, L14_1)
L12_1 = Functions
L12_1 = L12_1.RegisterServerCallback
L13_1 = "17mov_Garbage:GetLobbyMembers"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if nil == A1_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = {}
  L3_2 = A1_2
  L2_2[1] = L3_2
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.host
    if L9_2 == A1_2 then
      L9_2 = 1
      L10_2 = L8_2.clients
      L10_2 = #L10_2
      L11_2 = 1
      for L12_2 = L9_2, L10_2, L11_2 do
        L13_2 = table
        L13_2 = L13_2.insert
        L14_2 = L2_2
        L15_2 = L8_2.clients
        L15_2 = L15_2[L12_2]
        L13_2(L14_2, L15_2)
      end
    end
  end
  return L2_2
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_Garbage:SendRequestToClient_sv"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = source
  L2_2 = pairs
  L3_2 = L0_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.host
    if L8_2 == A0_2 then
      L8_2 = Notify
      L9_2 = L1_2
      L10_2 = _L
      L11_2 = "Lobby.Player.AlreadyHost"
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
      return L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    else
      L8_2 = 1
      L9_2 = L7_2.clients
      L9_2 = #L9_2
      L10_2 = 1
      for L11_2 = L8_2, L9_2, L10_2 do
        L12_2 = L7_2.clients
        L12_2 = L12_2[L11_2]
        if L12_2 == A0_2 then
          L12_2 = Notify
          L13_2 = L1_2
          L14_2 = _L
          L15_2 = "Lobby.Player.AlreadyInTeam"
          L14_2, L15_2 = L14_2(L15_2)
          return L12_2(L13_2, L14_2, L15_2)
        end
      end
    end
  end
  L2_2 = pairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.client
    if L8_2 == A0_2 then
      L8_2 = Notify
      L9_2 = L1_2
      L10_2 = _L
      L11_2 = "Lobby.Player.AlreadyGotInvite"
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
      return L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    else
      L8_2 = L7_2.host
      if L8_2 == L1_2 then
        L8_2 = L7_2.client
        if nil ~= L8_2 then
          L8_2 = Notify
          L9_2 = L1_2
          L10_2 = _L
          L11_2 = "Lobby.Player.AlreadyInvited"
          L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L10_2(L11_2)
          return L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        end
      end
    end
  end
  L2_2 = {}
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.host
    if L9_2 == L1_2 then
      L2_2 = L8_2.clients
    end
  end
  L3_2 = #L2_2
  L3_2 = L3_2 + 1
  L4_2 = L7_1
  if L3_2 >= L4_2 then
    L3_2 = Notify
    L4_2 = L1_2
    L5_2 = _L
    L6_2 = "Lobby.StartJob.PartyFull"
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L5_2(L6_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L1_1
  L5_2 = {}
  L5_2.host = L1_2
  L5_2.client = A0_2
  L3_2(L4_2, L5_2)
  L3_2 = Notify
  L4_2 = L1_2
  L5_2 = _L
  L6_2 = "Lobby.StartJob.InviteSent"
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L3_2 = TriggerClientEvent
  L4_2 = "17mov_Garbage:SendRequestToClient_cl"
  L5_2 = A0_2
  L6_2 = GetPlayerIdentity
  L7_2 = L1_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_Garbage:UpdateServerPartyBagsCounter"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = source
  L2_2 = L2_1
  L2_2 = L2_2[L1_2]
  if nil == L2_2 then
    return
  end
  L2_2 = L5_1
  L2_2 = L2_2[L1_2]
  if nil ~= L2_2 then
    L2_2 = os
    L2_2 = L2_2.time
    L2_2 = L2_2()
    L3_2 = L5_1
    L3_2 = L3_2[L1_2]
    L2_2 = L2_2 - L3_2
    if L2_2 < 2 then
      return
    end
  end
  L2_2 = Config
  L2_2 = L2_2.BagAttachments
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.counterValue
  if not L2_2 then
    L2_2 = 1
  end
  L3_2 = L5_1
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L3_2[L1_2] = L4_2
  if nil == L2_2 then
    L2_2 = 1
  end
  if L2_2 >= 100 then
    return
  end
  L3_2 = 0
  L4_2 = pairs
  L5_2 = L0_1
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.host
    if L10_2 == L1_2 then
      L3_2 = L8_2
      break
    else
      L10_2 = 1
      L11_2 = L9_2.clients
      L11_2 = #L11_2
      L12_2 = 1
      for L13_2 = L10_2, L11_2, L12_2 do
        L14_2 = L9_2.clients
        L14_2 = L14_2[L13_2]
        if L1_2 == L14_2 then
          L3_2 = L8_2
          break
        end
      end
    end
  end
  L4_2 = NetworkGetEntityFromNetworkId
  L5_2 = L0_1
  L5_2 = L5_2[L3_2]
  L5_2 = L5_2.vehNetId
  L4_2 = L4_2(L5_2)
  L5_2 = GetEntityCoords
  L6_2 = GetPlayerPed
  L7_2 = L1_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L6_2 = GetEntityCoords
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 - L5_2
  L6_2 = #L6_2
  if L6_2 > 10.0 then
    return
  end
  L6_2 = L2_1
  L6_2[L1_2] = nil
  L6_2 = nil
  L7_2 = false
  L8_2 = 0
  L9_2 = pairs
  L10_2 = L0_1
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L14_2.host
    if L15_2 == L1_2 then
      L7_2 = true
      L6_2 = L14_2.host
    else
      L15_2 = 1
      L16_2 = L14_2.clients
      L16_2 = #L16_2
      L17_2 = 1
      for L18_2 = L15_2, L16_2, L17_2 do
        L19_2 = L14_2.clients
        L19_2 = L19_2[L18_2]
        if L1_2 == L19_2 then
          L7_2 = true
          L6_2 = L14_2.host
        end
      end
    end
    if L7_2 then
      L15_2 = L14_2.bags
      if nil ~= L15_2 then
        L15_2 = L14_2.bags
        if L15_2 < 100 then
          L15_2 = L14_2.bags
          L15_2 = L15_2 + L2_2
          L14_2.bags = L15_2
        end
        L8_2 = L14_2.bags
        break
      end
    end
  end
  L9_2 = TriggerForAllMembers
  L10_2 = L6_2
  L11_2 = "17mov_Garbage:UpdateBagsCounter"
  L12_2 = L8_2
  L9_2(L10_2, L11_2, L12_2)
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_Garbage:ClientReactRequest"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = source
  L2_2 = nil
  L3_2 = false
  L4_2 = pairs
  L5_2 = L1_1
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.client
    if L10_2 == L1_2 then
      L2_2 = L9_2.host
      L10_2 = L1_1
      L10_2[L8_2] = nil
      break
    end
  end
  if A0_2 then
    if nil ~= L2_2 and nil ~= L1_2 then
      L4_2 = pairs
      L5_2 = L0_1
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = L9_2.host
        if L10_2 == L2_2 then
          L10_2 = L9_2.clients
          if nil ~= L10_2 then
            L10_2 = table
            L10_2 = L10_2.insert
            L11_2 = L9_2.clients
            L12_2 = L1_2
            L10_2(L11_2, L12_2)
            L3_2 = true
          end
        end
      end
      if not L3_2 then
        L4_2 = table
        L4_2 = L4_2.insert
        L5_2 = L0_1
        L6_2 = {}
        L6_2.host = L2_2
        L7_2 = {}
        L8_2 = L1_2
        L7_2[1] = L8_2
        L6_2.clients = L7_2
        L6_2.bags = 0
        L4_2(L5_2, L6_2)
      end
      L4_2 = Config
      L4_2 = L4_2.UseModernUI
      if L4_2 then
        L4_2 = RecalculateRewards
        L5_2 = L2_2
        L4_2(L5_2)
      end
      L4_2 = Notify
      L5_2 = L2_2
      L6_2 = _L
      L7_2 = "Lobby.Player.Accepted"
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L4_2 = GetAllPartyMugs
      L5_2 = L2_2
      L4_2 = L4_2(L5_2)
      L5_2 = TriggerForAllMembers
      L6_2 = L2_2
      L7_2 = "17mov_Garbage:RefreshMugs"
      L8_2 = L4_2
      L5_2(L6_2, L7_2, L8_2)
    else
      L4_2 = Notify
      L5_2 = L1_2
      L6_2 = _L
      L7_2 = "Lobby.Player.InviteError"
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L4_2 = Notify
      L5_2 = L2_2
      L6_2 = _L
      L7_2 = "Lobby.Player.InviteError"
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    end
  else
    L4_2 = Notify
    L5_2 = L2_2
    L6_2 = _L
    L7_2 = "Lobby.Player.Declined"
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_Garbage:KickPlayerFromLobby"
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = source
  L4_2 = A0_2
  if nil == A2_2 then
    L5_2 = pairs
    L6_2 = L0_1
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = 1
      L12_2 = L10_2.clients
      L12_2 = #L12_2
      L13_2 = 1
      for L14_2 = L11_2, L12_2, L13_2 do
        L15_2 = L10_2.host
        if L15_2 == L3_2 then
          L15_2 = L10_2.clients
          L15_2 = L15_2[L14_2]
          if L15_2 == L4_2 then
            L15_2 = L10_2.clients
            L15_2[L14_2] = nil
            break
          end
        end
      end
    end
  else
    L5_2 = pairs
    L6_2 = L0_1
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = 1
      L12_2 = L10_2.clients
      L12_2 = #L12_2
      L13_2 = 1
      for L14_2 = L11_2, L12_2, L13_2 do
        L15_2 = L10_2.clients
        L15_2 = L15_2[L14_2]
        if L15_2 == A2_2 then
          L3_2 = L10_2.host
          L15_2 = L10_2.clients
          L15_2[L14_2] = nil
          break
        end
      end
    end
  end
  if A1_2 then
    L5_2 = Notify
    L6_2 = L4_2
    L7_2 = _L
    L8_2 = "Lobby.Player.Kicked"
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L7_2(L8_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L5_2 = Config
  L5_2 = L5_2.UseModernUI
  if L5_2 then
    L5_2 = {}
    L6_2 = {}
    L6_2.id = L4_2
    L7_2 = GetPlayerIdentity
    L8_2 = L4_2
    L7_2 = L7_2(L8_2)
    L6_2.name = L7_2
    L6_2.isHost = true
    L5_2[1] = L6_2
    L6_2 = TriggerClientEvent
    L7_2 = "17mov_Garbage:RefreshMugs"
    L8_2 = L4_2
    L9_2 = L5_2
    L10_2 = L4_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = TriggerClientEvent
    L7_2 = "17mov_Garbage:clearMyLobby"
    L8_2 = L4_2
    L6_2(L7_2, L8_2)
    L6_2 = TriggerClientEvent
    L7_2 = "17mov_Garbage:SetMyReward"
    L8_2 = L4_2
    L9_2 = 100
    L6_2(L7_2, L8_2, L9_2)
    L6_2 = GetAllPartyMugs
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L7_2 = TriggerForAllMembers
    L8_2 = L3_2
    L9_2 = "17mov_Garbage:RefreshMugs"
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = RecalculateRewards
    L8_2 = L3_2
    L7_2(L8_2)
    L7_2 = pairs
    L8_2 = L0_1
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.clients
      L13_2 = #L13_2
      if 0 == L13_2 then
        L13_2 = L12_2.host
        if L13_2 == L3_2 then
          L13_2 = L0_1
          L13_2[L11_2] = nil
          L13_2 = TriggerClientEvent
          L14_2 = "17mov_Garbage:clearMyLobby"
          L15_2 = L3_2
          L13_2(L14_2, L15_2)
        end
      end
    end
  else
    L5_2 = {}
    L6_2 = {}
    L6_2.id = L4_2
    L7_2 = GetPlayerIdentity
    L8_2 = L4_2
    L7_2 = L7_2(L8_2)
    L6_2.name = L7_2
    L6_2.isHost = true
    L5_2[1] = L6_2
    L6_2 = TriggerClientEvent
    L7_2 = "17mov_Garbage:RefreshMugs"
    L8_2 = L4_2
    L9_2 = L5_2
    L10_2 = L4_2
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = GetAllPartyMugs
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L7_2 = TriggerForAllMembers
    L8_2 = L3_2
    L9_2 = "17mov_Garbage:RefreshMugs"
    L10_2 = L6_2
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = pairs
    L8_2 = L0_1
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.clients
      L13_2 = #L13_2
      if 0 == L13_2 then
        L13_2 = L12_2.host
        if L13_2 == L3_2 then
          L13_2 = L0_1
          L13_2[L11_2] = nil
        end
      end
    end
  end
end
L12_1(L13_1, L14_1)
L12_1 = RegisterNetEvent
L13_1 = "17mov_GarbageJob:SendVehicleNetId"
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = source
  L2_2 = pairs
  L3_2 = L0_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.host
    if L8_2 == L1_2 then
      L7_2.vehNetId = A0_2
    end
  end
end
L12_1(L13_1, L14_1)
L12_1 = {}
L13_1 = RegisterNetEvent
L14_1 = "17mov_Garbage:server:endStage"
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = tostring
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L12_1
  L2_2[L1_2] = true
  L1_2 = TriggerForAllMembers
  L2_2 = L0_2
  L3_2 = "17mov_Garbage:client:endStage"
  L4_2 = L0_2
  L1_2(L2_2, L3_2, L4_2)
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "17mov_GarbageCollector:server:startUnloadAnim"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = source
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.host
    if L9_2 == L2_2 then
      L9_2 = TriggerClientEvent
      L10_2 = "17mov_GarbageCollector:client:startUnloadAnim"
      L11_2 = L2_2
      L12_2 = A0_2
      L13_2 = true
      L9_2(L10_2, L11_2, L12_2, L13_2)
      L9_2 = L11_1
      L10_2 = "17mov_GarbageCollector:client:startUnloadAnim"
      L11_2 = A1_2
      L12_2 = A0_2
      L13_2 = false
      return L9_2(L10_2, L11_2, L12_2, L13_2)
    end
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "17mov_Garbage:endJob_sv"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = source
  L3_2 = nil
  L4_2 = TriggerForAllMembers
  L5_2 = L2_2
  L6_2 = "17mov_Garbage:endJob_cl"
  L7_2 = 0
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = pairs
  L5_2 = L0_1
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.host
    if L10_2 == L2_2 then
      L9_2.working = false
      L3_2 = L9_2.bags
      L9_2.bags = 0
      L10_2 = {}
      L11_2 = 1
      L12_2 = L9_2.clients
      L12_2 = #L12_2
      L13_2 = 1
      for L14_2 = L11_2, L12_2, L13_2 do
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L10_2
        L17_2 = L9_2.clients
        L17_2 = L17_2[L14_2]
        L15_2(L16_2, L17_2)
      end
      L11_2 = table
      L11_2 = L11_2.insert
      L12_2 = L10_2
      L13_2 = L9_2.host
      L11_2(L12_2, L13_2)
      L11_2 = Citizen
      L11_2 = L11_2.CreateThread
      function L12_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        L0_3 = NetworkGetEntityFromNetworkId
        L1_3 = L9_2.vehNetId
        L0_3 = L0_3(L1_3)
        L1_3 = DoesEntityExist
        L2_3 = L0_3
        L1_3 = L1_3(L2_3)
        if L1_3 then
          L1_3 = A0_2
          if not L1_3 then
            L1_3 = A0_2
            if L1_3 then
              goto lbl_52
            end
            L1_3 = Config
            L1_3 = L1_3.DeleteVehicleWithPenalty
            if not L1_3 then
              goto lbl_52
            end
          end
          L1_3 = A1_2
          if not L1_3 then
            L1_3 = A0_2
            if not L1_3 then
              L1_3 = GetVehiclePedIsIn
              L2_3 = GetPlayerPed
              L3_3 = L2_2
              L2_3 = L2_3(L3_3)
              L3_3 = false
              L1_3 = L1_3(L2_3, L3_3)
              L0_3 = L1_3
            end
            L1_3 = 1
            L2_3 = L10_2
            L2_3 = #L2_3
            L3_3 = 1
            for L4_3 = L1_3, L2_3, L3_3 do
              L5_3 = TaskLeaveVehicle
              L6_3 = GetPlayerPed
              L7_3 = L10_2
              L7_3 = L7_3[L4_3]
              L6_3 = L6_3(L7_3)
              L7_3 = L0_3
              L8_3 = 0
              L5_3(L6_3, L7_3, L8_3)
            end
            L1_3 = Wait
            L2_3 = 1750
            L1_3(L2_3)
            L1_3 = DeleteEntity
            L2_3 = L0_3
            L1_3(L2_3)
          end
        end
        ::lbl_52::
      end
      L11_2(L12_2)
      L11_2 = Config
      L11_2 = L11_2.Price
      L11_2 = L3_2 * L11_2
      L12_2 = Config
      L12_2 = L12_2.MultiplyRewardWhileWorkingInGroup
      if L12_2 then
        L12_2 = math
        L12_2 = L12_2.floor
        L13_2 = L9_2.clients
        L13_2 = #L13_2
        L13_2 = L13_2 + 1
        L13_2 = L11_2 * L13_2
        L12_2 = L12_2(L13_2)
        L11_2 = L12_2
      end
      L12_2 = Config
      L12_2 = L12_2.UseModernUI
      if L12_2 then
        L12_2 = L9_2.clients
        L12_2 = #L12_2
        if 0 == L12_2 then
          L12_2 = RecalculateRewards
          L13_2 = L2_2
          L12_2(L13_2)
        end
      end
      L12_2 = {}
      L13_2 = 1
      L14_2 = #L10_2
      L15_2 = 1
      for L16_2 = L13_2, L14_2, L15_2 do
        L17_2 = 0
        L18_2 = Config
        L18_2 = L18_2.UseModernUI
        if L18_2 then
          L18_2 = Config
          L18_2 = L18_2.LetBossSplitReward
          if L18_2 then
            L18_2 = math
            L18_2 = L18_2.floor
            L19_2 = L9_2.rewardsOptions
            L20_2 = L10_2[L16_2]
            L19_2 = L19_2[L20_2]
            L19_2 = L19_2 / 100
            L19_2 = L11_2 * L19_2
            L18_2 = L18_2(L19_2)
            L17_2 = L18_2
        end
        else
          L18_2 = Config
          L18_2 = L18_2.UseModernUI
          if not L18_2 then
            L18_2 = Config
            L18_2 = L18_2.SplitReward
            if L18_2 then
              L18_2 = math
              L18_2 = L18_2.floor
              L19_2 = L9_2.clients
              L19_2 = #L19_2
              L19_2 = L19_2 + 1
              L19_2 = L11_2 / L19_2
              L18_2 = L18_2(L19_2)
              L17_2 = L18_2
          end
          else
            L17_2 = L11_2
          end
        end
        if not A0_2 then
          L18_2 = PayPenalty
          L19_2 = L10_2[L16_2]
          L20_2 = Config
          L20_2 = L20_2.PenaltyAmount
          L18_2(L19_2, L20_2)
          L18_2 = Notify
          L19_2 = L10_2[L16_2]
          L20_2 = _L
          L21_2 = "Job.Gameplay.RewardPenalty"
          L22_2 = Config
          L22_2 = L22_2.PenaltyAmount
          L20_2, L21_2, L22_2 = L20_2(L21_2, L22_2)
          L18_2(L19_2, L20_2, L21_2, L22_2)
        end
        if not A0_2 then
          if A0_2 then
            goto lbl_159
          end
          L18_2 = Config
          L18_2 = L18_2.DontPayRewardWithoutVehicle
          if false ~= L18_2 then
            goto lbl_159
          end
        end
        L18_2 = L10_2[L16_2]
        L18_2 = L12_2[L18_2]
        if not L18_2 then
          L18_2 = L10_2[L16_2]
          L12_2[L18_2] = true
          L18_2 = Pay
          L19_2 = L10_2[L16_2]
          L20_2 = L17_2
          L21_2 = #L10_2
          L22_2 = L3_2
          L18_2(L19_2, L20_2, L21_2, L22_2)
          L18_2 = Notify
          L19_2 = L10_2[L16_2]
          L20_2 = _L
          L21_2 = "Job.Gameplay.Reward"
          L22_2 = L17_2
          L20_2, L21_2, L22_2 = L20_2(L21_2, L22_2)
          L18_2(L19_2, L20_2, L21_2, L22_2)
        end
        ::lbl_159::
      end
      L13_2 = L9_2.clients
      L13_2 = #L13_2
      if 0 == L13_2 then
        L13_2 = L0_1
        L13_2[L8_2] = nil
        L13_2 = TriggerClientEvent
        L14_2 = "17mov_Garbage:clearMyLobby"
        L15_2 = L2_2
        L13_2(L14_2, L15_2)
      end
    end
  end
  L4_2 = tostring
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = L12_1
  L4_2 = L5_2[L4_2]
  if L4_2 then
    L4_2 = tostring
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L5_2 = L12_1
    L5_2[L4_2] = nil
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "17mov_Garbage:StartJob_sv"
function L15_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L0_2 = source
  L1_2 = nil
  L2_2 = nil
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.host
    if L9_2 == L0_2 then
      L1_2 = L8_2.clients
      L2_2 = L7_2
      break
    end
  end
  L3_2 = Config
  L3_2 = L3_2.RequireJobAlsoForFriends
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.RequiredJob
    if "none" ~= L3_2 and nil ~= L1_2 then
      L3_2 = 1
      L4_2 = #L1_2
      L5_2 = 1
      for L6_2 = L3_2, L4_2, L5_2 do
        L7_2 = GetPlayerJob
        L8_2 = L1_2[L6_2]
        L7_2 = L7_2(L8_2)
        L8_2 = Config
        L8_2 = L8_2.RequiredJob
        if L7_2 ~= L8_2 then
          L7_2 = Notify
          L8_2 = L0_2
          L9_2 = _L
          L10_2 = "Lobby.StartJob.NoRequiredJob"
          L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L9_2(L10_2)
          return L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        end
      end
    end
  end
  L3_2 = IsHaveRequiredItem
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = Notify
    L4_2 = L0_2
    L5_2 = _L
    L6_2 = "Lobby.StartJob.NoItem"
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L5_2(L6_2)
    return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  end
  L3_2 = Config
  L3_2 = L3_2.RequireItemFromWholeTeam
  if L3_2 and nil ~= L1_2 then
    L3_2 = 1
    L4_2 = #L1_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = IsHaveRequiredItem
      L8_2 = L1_2[L6_2]
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = Notify
        L8_2 = L0_2
        L9_2 = _L
        L10_2 = "Lobby.StartJob.NoItem"
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L9_2(L10_2)
        return L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      end
    end
  end
  L3_2 = Config
  L3_2 = L3_2.JobCooldown
  if L3_2 > 0 then
    L3_2 = CooldownsTime
    if not L3_2 then
      L3_2 = {}
    end
    CooldownsTime = L3_2
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L4_2 = GetPlayerIdentifierByType
    L5_2 = L0_2
    L6_2 = "license"
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = L6_1
    L5_2 = L5_2[L4_2]
    if L5_2 then
      L5_2 = CooldownsTime
      L5_2 = L5_2[L4_2]
      L5_2 = L3_2 - L5_2
      L6_2 = Config
      L6_2 = L6_2.JobCooldown
      if L5_2 >= L6_2 then
        L6_2 = L6_1
        L6_2[L4_2] = nil
        L6_2 = CooldownsTime
        L6_2[L4_2] = nil
      else
        L6_2 = Config
        L6_2 = L6_2.JobCooldown
        L6_2 = L6_2 - L5_2
        L7_2 = math
        L7_2 = L7_2.floor
        L8_2 = L6_2 / 3600
        L7_2 = L7_2(L8_2)
        L8_2 = math
        L8_2 = L8_2.floor
        L9_2 = L6_2 % 3600
        L9_2 = L9_2 / 60
        L8_2 = L8_2(L9_2)
        L9_2 = L6_2 % 60
        L10_2 = ""
        if L7_2 > 0 then
          L11_2 = L10_2
          L12_2 = L7_2
          L13_2 = _L
          L14_2 = "Job.Time.Hours"
          L13_2 = L13_2(L14_2)
          L14_2 = " "
          L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
          L10_2 = L11_2
        end
        if L8_2 > 0 then
          L11_2 = L10_2
          L12_2 = L8_2
          L13_2 = _L
          L14_2 = "Job.Time.Minutes"
          L13_2 = L13_2(L14_2)
          L14_2 = " "
          L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
          L10_2 = L11_2
        end
        L11_2 = L10_2
        L12_2 = L9_2
        L13_2 = _L
        L14_2 = "Job.Time.Seconds"
        L13_2 = L13_2(L14_2)
        L11_2 = L11_2 .. L12_2 .. L13_2
        L10_2 = L11_2
        L11_2 = Notify
        L12_2 = L0_2
        L13_2 = _L
        L14_2 = "Lobby.StartJob.Cooldown"
        L15_2 = GetPlayerIdentity
        L16_2 = L0_2
        L15_2 = L15_2(L16_2)
        L16_2 = L10_2
        L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L13_2(L14_2, L15_2, L16_2)
        return L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      end
    end
    if nil ~= L1_2 then
      L5_2 = 1
      L6_2 = #L1_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = GetPlayerIdentifierByType
        L10_2 = L1_2[L8_2]
        L11_2 = "license"
        L9_2 = L9_2(L10_2, L11_2)
        L10_2 = L6_1
        L10_2 = L10_2[L9_2]
        if L10_2 then
          L10_2 = CooldownsTime
          L10_2 = L10_2[L9_2]
          L10_2 = L3_2 - L10_2
          L11_2 = Config
          L11_2 = L11_2.JobCooldown
          if L10_2 >= L11_2 then
            L11_2 = L6_1
            L11_2[L9_2] = nil
            L11_2 = CooldownsTime
            L11_2[L9_2] = nil
          else
            L11_2 = Config
            L11_2 = L11_2.JobCooldown
            L11_2 = L11_2 - L10_2
            L12_2 = math
            L12_2 = L12_2.floor
            L13_2 = L11_2 / 3600
            L12_2 = L12_2(L13_2)
            L13_2 = math
            L13_2 = L13_2.floor
            L14_2 = L11_2 % 3600
            L14_2 = L14_2 / 60
            L13_2 = L13_2(L14_2)
            L14_2 = L11_2 % 60
            L15_2 = ""
            if L12_2 > 0 then
              L16_2 = L15_2
              L17_2 = L12_2
              L18_2 = _L
              L19_2 = "Job.Time.Hours"
              L18_2 = L18_2(L19_2)
              L19_2 = " "
              L16_2 = L16_2 .. L17_2 .. L18_2 .. L19_2
              L15_2 = L16_2
            end
            if L13_2 > 0 then
              L16_2 = L15_2
              L17_2 = L13_2
              L18_2 = _L
              L19_2 = "Job.Time.Minutes"
              L18_2 = L18_2(L19_2)
              L19_2 = " "
              L16_2 = L16_2 .. L17_2 .. L18_2 .. L19_2
              L15_2 = L16_2
            end
            L16_2 = L15_2
            L17_2 = L14_2
            L18_2 = _L
            L19_2 = "Job.Time.Seconds"
            L18_2 = L18_2(L19_2)
            L16_2 = L16_2 .. L17_2 .. L18_2
            L15_2 = L16_2
            L16_2 = Notify
            L17_2 = L0_2
            L18_2 = _L
            L19_2 = "Lobby.StartJob.Cooldown"
            L20_2 = GetPlayerIdentity
            L21_2 = L1_2[L8_2]
            L20_2 = L20_2(L21_2)
            L21_2 = L15_2
            L18_2, L19_2, L20_2, L21_2 = L18_2(L19_2, L20_2, L21_2)
            return L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
          end
        end
      end
    end
    L5_2 = L6_1
    L5_2[L4_2] = true
    L5_2 = CooldownsTime
    L5_2[L4_2] = L3_2
    if nil ~= L1_2 then
      L5_2 = 1
      L6_2 = #L1_2
      L7_2 = 1
      for L8_2 = L5_2, L6_2, L7_2 do
        L9_2 = GetPlayerIdentifierByType
        L10_2 = L1_2[L8_2]
        L11_2 = "license"
        L9_2 = L9_2(L10_2, L11_2)
        L10_2 = L6_1
        L10_2[L9_2] = true
        L10_2 = CooldownsTime
        L10_2[L9_2] = L3_2
      end
    end
  end
  L3_2 = Config
  L3_2 = L3_2.RequireOneFriendMinimum
  if L3_2 then
    if nil ~= L1_2 then
      L3_2 = #L1_2
      if L3_2 > 0 then
        if nil ~= L2_2 then
          L3_2 = L0_1
          L3_2 = L3_2[L2_2]
          L3_2.working = true
          L3_2 = Config
          L3_2 = L3_2.Debug
          L3_2 = L3_2.enabled
          if L3_2 then
            L3_2 = Citizen
            L3_2 = L3_2.CreateThread
            function L4_2()
              local L0_3, L1_3, L2_3, L3_3
              L1_3 = L2_2
              L0_3 = L0_1
              L0_3 = L0_3[L1_3]
              L1_3 = Config
              L1_3 = L1_3.Debug
              L1_3 = L1_3.base_progress
              L0_3.bags = L1_3
              L0_3 = Wait
              L1_3 = 5000
              L0_3(L1_3)
              L0_3 = TriggerForAllMembers
              L1_3 = L0_2
              L2_3 = "17mov_Garbage:UpdateBagsCounter"
              L3_3 = Config
              L3_3 = L3_3.Debug
              L3_3 = L3_3.base_progress
              L0_3(L1_3, L2_3, L3_3)
            end
            L3_2(L4_2)
          end
        end
        L3_2 = TriggerForAllMembers
        L4_2 = L0_2
        L5_2 = "17mov_Garbage:StartJob_cl"
        L6_2 = L0_2
        L3_2(L4_2, L5_2, L6_2)
    end
    else
      L3_2 = Notify
      L4_2 = L0_2
      L5_2 = _L
      L6_2 = "Lobby.StartJob.MemberRequired"
      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L5_2(L6_2)
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    end
  else
    if nil == L1_2 then
      L3_2 = table
      L3_2 = L3_2.insert
      L4_2 = L0_1
      L5_2 = {}
      L5_2.host = L0_2
      L6_2 = {}
      L5_2.clients = L6_2
      L5_2.bags = 0
      L3_2(L4_2, L5_2)
    end
    L2_2 = 0
    L3_2 = pairs
    L4_2 = L0_1
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L8_2.host
      if L9_2 == L0_2 then
        L2_2 = L7_2
        break
      end
    end
    L3_2 = L0_1
    L3_2 = L3_2[L2_2]
    L3_2.working = true
    L3_2 = Config
    L3_2 = L3_2.Debug
    L3_2 = L3_2.enabled
    if L3_2 then
      L3_2 = Citizen
      L3_2 = L3_2.CreateThread
      function L4_2()
        local L0_3, L1_3, L2_3, L3_3
        L1_3 = L2_2
        L0_3 = L0_1
        L0_3 = L0_3[L1_3]
        L1_3 = Config
        L1_3 = L1_3.Debug
        L1_3 = L1_3.base_progress
        L0_3.bags = L1_3
        L0_3 = Wait
        L1_3 = 5000
        L0_3(L1_3)
        L0_3 = TriggerForAllMembers
        L1_3 = L0_2
        L2_3 = "17mov_Garbage:UpdateBagsCounter"
        L3_3 = Config
        L3_3 = L3_3.Debug
        L3_3 = L3_3.base_progress
        L0_3(L1_3, L2_3, L3_3)
      end
      L3_2(L4_2)
    end
    L3_2 = TriggerForAllMembers
    L4_2 = L0_2
    L5_2 = "17mov_Garbage:StartJob_cl"
    L6_2 = L0_2
    L3_2(L4_2, L5_2, L6_2)
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "17mov_GarbageCollector:ToggleTrunk"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = NetworkGetEntityFromNetworkId
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = DoesEntityExist
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = GetEntityModel
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if 1917016601 == L3_2 then
        L3_2 = NetworkGetEntityOwner
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        if 0 == L3_2 then
          if A1_2 then
            L4_2 = SetVehicleDoorOpen
            L5_2 = L2_2
            L6_2 = 5
            L7_2 = false
            L8_2 = false
            L4_2(L5_2, L6_2, L7_2, L8_2)
          else
            L4_2 = SetVehicleDoorShut
            L5_2 = L2_2
            L6_2 = 5
            L7_2 = false
            L4_2(L5_2, L6_2, L7_2)
          end
        else
          L4_2 = TriggerClientEvent
          L5_2 = "17mov_GarbageCollector:ToggleTrunk"
          L6_2 = L3_2
          L7_2 = A0_2
          L8_2 = A1_2
          L4_2(L5_2, L6_2, L7_2, L8_2)
        end
      end
    end
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "17mov_GarbageCollector:BagCollected"
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = TriggerClientEvent
    L7_2 = "17mov_GarbageCollector:BagCollected"
    L8_2 = A0_2[L5_2]
    L9_2 = A1_2
    L6_2(L7_2, L8_2, L9_2)
  end
end
L13_1(L14_1, L15_1)
L13_1 = RegisterNetEvent
L14_1 = "17mov_GarbageCollector:server:BagCollected"
function L15_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = NetworkGetEntityFromNetworkId
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = DoesEntityExist
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = DeleteEntity
    L3_2 = L1_2
    L2_2(L3_2)
  end
end
L13_1(L14_1, L15_1)
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.host
    if A0_2 == L7_2 then
      L7_2 = L6_2.clients
      return L7_2
    end
  end
end
L14_1 = RegisterNetEvent
L15_1 = "17mov_GarbageCollector:server:TeleportCrewMembers"
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = source
  L3_2 = L13_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = #L3_2
    if 0 ~= L4_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L4_2 = 1
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = TriggerClientEvent
    L9_2 = "17mov_GarbageCollector:client:TeleportCrewMembers"
    L10_2 = L3_2[L7_2]
    L11_2 = A0_2
    L12_2 = L7_2 - 1
    L13_2 = A1_2
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  end
end
L14_1(L15_1, L16_1)
L14_1 = Functions
L14_1 = L14_1.RegisterServerCallback
L15_1 = "17mov_GarbageCollector:CheckAllow"
function L16_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A3_2 then
    L4_2 = NetworkGetEntityFromNetworkId
    L5_2 = A3_2
    L4_2 = L4_2(L5_2)
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = Entity
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L5_2 = L5_2.state
      L5_2 = L5_2.ServerRequest
      if L5_2 then
        L5_2 = false
        return L5_2
      end
      L5_2 = Entity
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      L5_2 = L5_2.state
      L6_2 = L5_2
      L5_2 = L5_2.set
      L7_2 = "ServerRequest"
      L8_2 = true
      L9_2 = true
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = true
      return L5_2
    end
  end
  L4_2 = L3_1
  L5_2 = {}
  L5_2.coords = A1_2
  L5_2.increaseDistance = A2_2
  L4_2[A0_2] = L5_2
  L4_2 = pairs
  L5_2 = L3_1
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    if A2_2 then
      L10_2 = L9_2.increaseDistance
      if L10_2 then
        L10_2 = 2.0
        if L10_2 then
          goto lbl_50
        end
      end
    end
    L10_2 = 0.1
    ::lbl_50::
    L11_2 = L9_2.coords
    L11_2 = L11_2 - A1_2
    L11_2 = #L11_2
    if L10_2 > L11_2 and L8_2 ~= A0_2 then
      L11_2 = L3_1
      L11_2[A0_2] = nil
      L11_2 = false
      return L11_2
    end
  end
  L4_2 = L2_1
  L4_2[A0_2] = true
  L4_2 = true
  return L4_2
end
L14_1(L15_1, L16_1)
L14_1 = RegisterNetEvent
L15_1 = "17mov_GarbageCollector:server:clearRequest"
function L16_1()
  local L0_2, L1_2
  L0_2 = source
  L1_2 = L3_1
  L1_2[L0_2] = nil
end
L14_1(L15_1, L16_1)
function L14_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = {}
  L1_2 = pairs
  L2_2 = L0_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.working
    if L7_2 then
      L7_2 = table
      L7_2 = L7_2.insert
      L8_2 = L0_2
      L9_2 = L6_2.host
      L7_2(L8_2, L9_2)
      L7_2 = 1
      L8_2 = L6_2.clients
      L8_2 = #L8_2
      L9_2 = 1
      for L10_2 = L7_2, L8_2, L9_2 do
        L11_2 = table
        L11_2 = L11_2.insert
        L12_2 = L0_2
        L13_2 = L6_2.clients
        L13_2 = L13_2[L10_2]
        L11_2(L12_2, L13_2)
      end
    end
  end
  return L0_2
end
GetPlayersOnDuty = L14_1
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = 0
  L4_2 = pairs
  L5_2 = L0_1
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.host
    if A0_2 == L10_2 then
      L2_2 = L9_2.clients
      L3_2 = L8_2
    end
  end
  L4_2 = Config
  L4_2 = L4_2.UseModernUI
  if L4_2 then
    L4_2 = 1
    L5_2 = #L2_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = {}
      L11_2 = L2_2[L7_2]
      L10_2.id = L11_2
      L11_2 = GetPlayerIdentity
      L12_2 = L2_2[L7_2]
      L11_2 = L11_2(L12_2)
      L10_2.name = L11_2
      L10_2.isHost = false
      L11_2 = L0_1
      L11_2 = L11_2[L3_2]
      L11_2 = L11_2.rewardsOptions
      L12_2 = L2_2[L7_2]
      L11_2 = L11_2[L12_2]
      L10_2.rewardPercent = L11_2
      L8_2(L9_2, L10_2)
    end
    L4_2 = #L2_2
    if 0 == L4_2 then
      L4_2 = table
      L4_2 = L4_2.insert
      L5_2 = L1_2
      L6_2 = {}
      L6_2.id = A0_2
      L7_2 = GetPlayerIdentity
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      L6_2.name = L7_2
      L6_2.isHost = true
      L7_2 = L0_1
      L7_2 = L7_2[L3_2]
      L7_2 = L7_2.rewardsOptions
      L7_2 = L7_2[A0_2]
      L6_2.rewardPercent = L7_2
      L4_2(L5_2, L6_2)
    else
      L4_2 = table
      L4_2 = L4_2.insert
      L5_2 = L1_2
      L6_2 = {}
      L6_2.id = A0_2
      L7_2 = GetPlayerIdentity
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      L6_2.name = L7_2
      L6_2.isHost = true
      L7_2 = L0_1
      L7_2 = L7_2[L3_2]
      L7_2 = L7_2.rewardsOptions
      L7_2 = L7_2[A0_2]
      L6_2.rewardPercent = L7_2
      L4_2(L5_2, L6_2)
    end
  else
    L4_2 = 1
    L5_2 = #L2_2
    L6_2 = 1
    for L7_2 = L4_2, L5_2, L6_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = L1_2
      L10_2 = {}
      L11_2 = L2_2[L7_2]
      L10_2.id = L11_2
      L11_2 = GetPlayerIdentity
      L12_2 = L2_2[L7_2]
      L11_2 = L11_2(L12_2)
      L10_2.name = L11_2
      L10_2.isHost = false
      L8_2(L9_2, L10_2)
    end
    L4_2 = #L2_2
    if 0 == L4_2 then
      L4_2 = table
      L4_2 = L4_2.insert
      L5_2 = L1_2
      L6_2 = {}
      L6_2.id = A0_2
      L7_2 = GetPlayerIdentity
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      L6_2.name = L7_2
      L6_2.isHost = true
      L4_2(L5_2, L6_2)
    else
      L4_2 = table
      L4_2 = L4_2.insert
      L5_2 = L1_2
      L6_2 = {}
      L6_2.id = A0_2
      L7_2 = GetPlayerIdentity
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      L6_2.name = L7_2
      L6_2.isHost = true
      L4_2(L5_2, L6_2)
    end
  end
  return L1_2
end
GetAllPartyMugs = L14_1
L14_1 = RegisterNetEvent
L15_1 = "17mov_GarbageCollector:server:hideBox"
function L16_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = source
  L1_2 = TriggerForAllMembers
  L2_2 = L0_2
  L3_2 = "17mov_GarbageCollector:client:hideBox"
  L1_2(L2_2, L3_2)
end
L14_1(L15_1, L16_1)
function L14_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = L13_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = 1
  L5_2 = #L3_2
  L5_2 = L5_2 + 1
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = L3_2[L7_2]
    if not L8_2 then
      L8_2 = A0_2
    end
    if nil ~= L8_2 then
      L9_2 = type
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if "number" == L9_2 then
        if "17mov_Garbage:RefreshMugs" == A1_2 or "17mov_Garbage:StartJob_cl" == A1_2 then
          L9_2 = TriggerClientEvent
          L10_2 = A1_2
          L11_2 = L8_2
          L12_2 = A2_2
          L13_2 = L8_2
          L9_2(L10_2, L11_2, L12_2, L13_2)
        else
          L9_2 = TriggerClientEvent
          L10_2 = A1_2
          L11_2 = L8_2
          L12_2 = A2_2
          L9_2(L10_2, L11_2, L12_2)
        end
      end
    end
  end
end
TriggerForAllMembers = L14_1
L14_1 = RegisterNetEvent
L15_1 = "onResourceStop"
function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 ~= A0_2 then
    return
  end
  L1_2 = GetAllVehicles
  L1_2 = L1_2()
  L2_2 = GetAllObjects
  L2_2 = L2_2()
  L3_2 = GetAllPeds
  L3_2 = L3_2()
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = 1
  L6_2 = math
  L6_2 = L6_2.max
  L7_2 = #L1_2
  L8_2 = #L2_2
  L9_2 = #L3_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L1_2[L8_2]
    if L9_2 then
      L9_2 = GetEntityScript
      L10_2 = L1_2[L8_2]
      L9_2, L10_2 = L9_2(L10_2)
      if L9_2 == L4_2 then
        L11_2 = DeleteEntity
        L12_2 = L1_2[L8_2]
        L11_2(L12_2)
      end
    end
    L9_2 = L2_2[L8_2]
    if L9_2 then
      L9_2 = GetEntityScript
      L10_2 = L2_2[L8_2]
      L9_2, L10_2 = L9_2(L10_2)
      L11_2 = Entity
      L12_2 = L2_2[L8_2]
      L11_2 = L11_2(L12_2)
      L11_2 = L11_2.state
      L11_2 = L11_2.currentStage
      if L11_2 then
        L11_2 = Entity
        L12_2 = L2_2[L8_2]
        L11_2 = L11_2(L12_2)
        L11_2 = L11_2.state
        L12_2 = L11_2
        L11_2 = L11_2.set
        L13_2 = "currentStage"
        L14_2 = nil
        L15_2 = true
        L11_2(L12_2, L13_2, L14_2, L15_2)
      end
      L11_2 = Entity
      L12_2 = L2_2[L8_2]
      L11_2 = L11_2(L12_2)
      L11_2 = L11_2.state
      L11_2 = L11_2.queued_bags
      if L11_2 then
        L11_2 = Entity
        L12_2 = L2_2[L8_2]
        L11_2 = L11_2(L12_2)
        L11_2 = L11_2.state
        L12_2 = L11_2
        L11_2 = L11_2.set
        L13_2 = "queued_bags"
        L14_2 = nil
        L15_2 = true
        L11_2(L12_2, L13_2, L14_2, L15_2)
      end
      L11_2 = Entity
      L12_2 = L2_2[L8_2]
      L11_2 = L11_2(L12_2)
      L11_2 = L11_2.state
      L11_2 = L11_2.GarbageOccupied
      if L11_2 then
        L11_2 = Entity
        L12_2 = L2_2[L8_2]
        L11_2 = L11_2(L12_2)
        L11_2 = L11_2.state
        L12_2 = L11_2
        L11_2 = L11_2.set
        L13_2 = "GarbageOccupied"
        L14_2 = nil
        L15_2 = true
        L11_2(L12_2, L13_2, L14_2, L15_2)
      end
      L11_2 = Entity
      L12_2 = L2_2[L8_2]
      L11_2 = L11_2(L12_2)
      L11_2 = L11_2.state
      L11_2 = L11_2.validPos
      if L11_2 then
        L11_2 = Entity
        L12_2 = L2_2[L8_2]
        L11_2 = L11_2(L12_2)
        L11_2 = L11_2.state
        L12_2 = L11_2
        L11_2 = L11_2.set
        L13_2 = "validPos"
        L14_2 = nil
        L15_2 = true
        L11_2(L12_2, L13_2, L14_2, L15_2)
      end
      if L9_2 == L4_2 then
        L11_2 = DeleteEntity
        L12_2 = L2_2[L8_2]
        L11_2(L12_2)
      end
    end
    L9_2 = L3_2[L8_2]
    if L9_2 then
      L9_2 = GetEntityScript
      L10_2 = L3_2[L8_2]
      L9_2, L10_2 = L9_2(L10_2)
      if L9_2 == L4_2 then
        L11_2 = DeleteEntity
        L12_2 = L3_2[L8_2]
        L11_2(L12_2)
      end
    end
  end
end
L14_1(L15_1, L16_1)
L14_1 = RegisterNetEvent
L15_1 = "playerDropped"
function L16_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = source
  L1_2 = L3_1
  L1_2 = L1_2[L0_2]
  if L1_2 then
    L1_2 = L3_1
    L1_2[L0_2] = nil
  end
  L1_2 = nil
  L2_2 = false
  L3_2 = pairs
  L4_2 = L0_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.host
    if L9_2 == L0_2 then
      L9_2 = 1
      L10_2 = L8_2.clients
      L10_2 = #L10_2
      L11_2 = 1
      for L12_2 = L9_2, L10_2, L11_2 do
        L13_2 = GetPlayerPing
        L14_2 = L8_2.clients
        L14_2 = L14_2[L12_2]
        L13_2 = L13_2(L14_2)
        if 0 ~= L13_2 then
          L13_2 = L8_2.clients
          L13_2 = L13_2[L12_2]
          L8_2.host = L13_2
          L13_2 = Notify
          L14_2 = L8_2.clients
          L14_2 = L14_2[L12_2]
          L15_2 = _L
          L16_2 = "Lobby.Player.NewBoss"
          L15_2, L16_2 = L15_2(L16_2)
          L13_2(L14_2, L15_2, L16_2)
          L13_2 = table
          L13_2 = L13_2.remove
          L14_2 = L8_2.clients
          L15_2 = L12_2
          L13_2(L14_2, L15_2)
          break
        end
      end
      L2_2 = true
      L1_2 = L7_2
      break
    end
    L9_2 = 1
    L10_2 = L8_2.clients
    L10_2 = #L10_2
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = L8_2.clients
      L13_2 = L13_2[L12_2]
      if L13_2 == L0_2 then
        L13_2 = table
        L13_2 = L13_2.remove
        L14_2 = L8_2.clients
        L15_2 = L12_2
        L13_2(L14_2, L15_2)
        L1_2 = L7_2
        break
      end
    end
  end
  if nil == L1_2 then
    return
  end
  L3_2 = L0_1
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.host
  L4_2 = L0_1
  L4_2 = L4_2[L1_2]
  L4_2 = L4_2.working
  if L4_2 then
    L4_2 = L0_1
    L4_2 = L4_2[L1_2]
    L4_2 = L4_2.clients
    L4_2 = #L4_2
    if 0 == L4_2 then
      L4_2 = TriggerClientEvent
      L5_2 = "17mov_Garbage:clearMyLobby"
      L6_2 = L3_2
      L4_2(L5_2, L6_2)
    else
      L4_2 = TriggerForAllMembers
      L5_2 = L3_2
      L6_2 = "17mov_Garbage:RefreshMugs"
      L7_2 = GetAllPartyMugs
      L8_2 = L3_2
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2)
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L4_2 = Config
      L4_2 = L4_2.UseModernUI
      if L4_2 then
        L4_2 = RecalculateRewards
        L5_2 = L3_2
        L4_2(L5_2)
      end
    end
    if L2_2 then
      L4_2 = tostring
      L5_2 = L0_2
      L4_2 = L4_2(L5_2)
      L5_2 = L12_1
      L4_2 = L5_2[L4_2]
      if L4_2 then
        L4_2 = tostring
        L5_2 = L0_2
        L4_2 = L4_2(L5_2)
        L5_2 = L12_1
        L5_2[L4_2] = nil
        L4_2 = NetworkGetEntityFromNetworkId
        L5_2 = L0_1
        L5_2 = L5_2[L1_2]
        L5_2 = L5_2.vehNetId
        L4_2 = L4_2(L5_2)
        L5_2 = DoesEntityExist
        L6_2 = L4_2
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L5_2 = DeleteEntity
          L6_2 = L4_2
          L5_2(L6_2)
        end
        L5_2 = TriggerClientEvent
        L6_2 = "17mov_GarbageCollector:client:forceEndJob"
        L7_2 = L3_2
        L5_2(L6_2, L7_2)
        L5_2 = TriggerForAllMembers
        L6_2 = L3_2
        L7_2 = "17mov_GarbageCollector:client:hideBox"
        L5_2(L6_2, L7_2)
      end
    end
  else
    L4_2 = L0_1
    L4_2 = L4_2[L1_2]
    L4_2 = L4_2.clients
    L4_2 = #L4_2
    if 0 == L4_2 then
      L4_2 = TriggerClientEvent
      L5_2 = "17mov_Garbage:clearMyLobby"
      L6_2 = L3_2
      L4_2(L5_2, L6_2)
      L4_2 = L0_1
      L4_2[L1_2] = nil
    end
  end
end
L14_1(L15_1, L16_1)
