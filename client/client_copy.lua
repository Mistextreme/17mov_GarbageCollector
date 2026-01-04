local L0_1,L1_1,L2_1,L3_1,L4_1,L5_1,L6_1,L7_1,L8_1,L9_1,L10_1,L11_1,L12_1,L13_1,L14_1,L15_1,L16_1,L17_1,L18_1,L19_1,L20_1,L21_1,L22_1,L23_1,L24_1,L25_1,L26_1,L27_1,L28_1,L29_1,L30_1,L31_1,L32_1,L33_1,L34_1,L35_1,L36_1,L37_1
OnDuty=false
JobVehicleNetId=nil
L0_1=nil
L1_1=nil
L2_1=0
L3_1=0
L4_1=false
L5_1={}
L6_1=true
L7_1=""
L8_1=false
L9_1=false
L10_1=false
L11_1={}
L12_1=false
L13_1=nil
L14_1=nil
L15_1=false
L16_1=false
L17_1={}
L18_1=false
L19_1=true
L20_1=0
IsPerformingAction=false
L21_1={}
L22_1=NetToObj
L23_1=NetToVeh
L24_1=ObjToNet
function L25_1(A0_2)
local L1_2,L2_2
L1_2=NetworkDoesNetworkIdExist
L2_2=A0_2
L1_2=L1_2(L2_2)
if L1_2 then
L1_2=L22_1
L2_2=A0_2
return L1_2(L2_2)
else
L1_2=0
return L1_2
end
end
NetToObj=L25_1
function L25_1(A0_2)
local L1_2,L2_2
L1_2=NetworkDoesNetworkIdExist
L2_2=A0_2
L1_2=L1_2(L2_2)
if L1_2 then
L1_2=L23_1
L2_2=A0_2
return L1_2(L2_2)
else
L1_2=0
return L1_2
end
end
NetToVeh=L25_1
function L25_1(A0_2)
local L1_2,L2_2
L1_2=NetworkGetEntityIsNetworked
L2_2=A0_2
L1_2=L1_2(L2_2)
if L1_2 then
L1_2=L24_1
L2_2=A0_2
return L1_2(L2_2)
end
end
ObjToNet=L25_1
function L25_1(A0_2,A1_2,A2_2)
local L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2
L3_2=PlayerPedId
L3_2=L3_2()
L4_2={}
L5_2=GetActivePlayers
L5_2=L5_2()
L6_2=1
L7_2=#L5_2
L8_2=1
for L9_2=L6_2,L7_2,L8_2 do
L10_2=GetPlayerPed
L11_2=L5_2[L9_2]
L10_2=L10_2(L11_2)
L11_2=GetEntityCoords
L12_2=L10_2
L11_2=L11_2(L12_2)
L11_2=L11_2-A0_2
L11_2=#L11_2
if A1_2>L11_2 and(A2_2 and L10_2 ~=L3_2 or not A2_2)then
L11_2=#L4_2
L11_2=L11_2+1
L12_2=GetPlayerServerId
L13_2=L5_2[L9_2]
L12_2=L12_2(L13_2)
L4_2[L11_2]=L12_2
end
end
return L4_2
end
GetClosestPlayers=L25_1
L25_1=CreateThread
function L26_1()
local L0_2,L1_2,L2_2
while true do
L0_2=L9_1
if L0_2 then
break
end
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=100
L0_2(L1_2)
end
L0_2=Config
L0_2=L0_2.UseModernUI
if L0_2 then
L0_2=SendNUIMessage
L1_2={}
L1_2.ui="new"
L0_2(L1_2)
else
L0_2=SendNUIMessage
L1_2={}
L1_2.ui="old"
L0_2(L1_2)
L0_2=true
L10_1=L0_2
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=500
L0_2(L1_2)
end
while true do
L0_2=L10_1
if L0_2 then
break
end
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=100
L0_2(L1_2)
end
L0_2=SendNUIMessage
L1_2={}
L1_2.action="setProgressBarAlign"
L2_2=Config
L2_2=L2_2.ProgressBarAlign
L1_2.align=L2_2
L2_2=Config
L2_2=L2_2.ProgressBarOffset
L1_2.offset=L2_2
L0_2(L1_2)
L0_2=Config
L0_2=L0_2.EnableCloakroom
if not L0_2 then
L0_2=SendNUIMessage
L1_2={}
L1_2.action="hideCloakroom"
L0_2(L1_2)
end
end
L25_1(L26_1)
L25_1=RegisterNetEvent
L26_1="17mov_Garbage:UpdateHostPercentages"
function L27_1(A0_2)
local L1_2,L2_2
L1_2=SendNUIMessage
L2_2={}
L2_2.action="updateHostRewards"
L2_2.value=A0_2
L1_2(L2_2)
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="17mov_Garbage:SetMyReward"
function L27_1(A0_2)
local L1_2,L2_2
L1_2=SendNUIMessage
L2_2={}
L2_2.action="updateMyReward"
L2_2.reward=A0_2
L1_2(L2_2)
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="17mov_Garbage:clearMyLobby"
function L27_1()
local L0_2,L1_2,L2_2
L0_2={}
L5_1=L0_2
L0_2=Functions
L0_2=L0_2.TriggerServerCallback
L1_2="17mov_Garbage:init"
function L2_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="Init"
L3_3=A0_3.name
L2_3.name=L3_3
L3_3=A0_3.source
L2_3.myId=L3_3
L1_3(L2_3)
L1_3=true
L4_1=L1_3
end
L0_2(L1_2,L2_2)
end
L25_1(L26_1,L27_1)
function L25_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2
L1_2=L12_1
if L1_2 then
return
end
L1_2=Config
L1_2=L1_2.RequiredJob
if "none" ~=L1_2 then
L1_2=A0_2.job
L1_2=L1_2.name
L2_2=Config
L2_2=L2_2.RequiredJob
if L1_2 ~=L2_2 then
L1_2=false
L12_1=L1_2
return
end
end
L1_2=true
L12_1=L1_2
L1_2=Config
L1_2=L1_2.UseTarget
if L1_2 then
L1_2=SpawnStartingPed
L1_2()
L1_2={}
L2_2={}
L3_2=pairs
L4_2=Config
L4_2=L4_2.BagAttachments
L3_2,L4_2,L5_2,L6_2=L3_2(L4_2)
for L7_2,L8_2 in L3_2,L4_2,L5_2,L6_2 do
L9_2=table
L9_2=L9_2.insert
L10_2=L1_2
L11_2=L7_2
L9_2(L10_2,L11_2)
end
L3_2=Config
L3_2=L3_2.EnableBins
if L3_2 then
L3_2=1
L4_2=Config
L4_2=L4_2.Scenes
L4_2=#L4_2
L5_2=1
for L6_2=L3_2,L4_2,L5_2 do
L7_2=pairs
L8_2=Config
L8_2=L8_2.Scenes
L8_2=L8_2[L6_2]
L8_2=L8_2.Models
L7_2,L8_2,L9_2,L10_2=L7_2(L8_2)
for L11_2,L12_2 in L7_2,L8_2,L9_2,L10_2 do
L13_2=table
L13_2=L13_2.insert
L14_2=L2_2
L15_2=GetHashKey
L16_2=L12_2
L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2=L15_2(L16_2)
L13_2(L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2)
end
end
end
L3_2=AddModelsToTarget
L4_2=L1_2
L3_2(L4_2)
L3_2=Config
L3_2=L3_2.EnableBins
if L3_2 then
L3_2=AddDumpstersToTarget
L4_2=L2_2
L3_2(L4_2)
end
L3_2=Config
L4_2={}
L5_2=Config
L5_2=L5_2.Locations
L5_2=L5_2.FinishJob
L4_2.FinishJob=L5_2
L3_2.Locations2=L4_2
while true do
L3_2=L12_1
if not L3_2 then
break
end
L3_2=Citizen
L3_2=L3_2.Wait
L4_2=0
L3_2(L4_2)
L3_2=GetEntityCoords
L4_2=PlayerPedId
L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2=L4_2()
L3_2=L3_2(L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2)
L4_2=false
L5_2=false
L6_2=true
L7_2=nil
L8_2=nil
L9_2=nil
L10_2=Config
L10_2=L10_2.RequiredJob
if "none" ~=L10_2 then
L10_2=A0_2.job
L10_2=L10_2.name
L11_2=Config
L11_2=L11_2.RequiredJob
if L10_2==L11_2 then
goto lbl_118
end
end
L10_2=Config
L10_2=L10_2.RequiredJob
::lbl_118::
if "none"==L10_2 then
L10_2=pairs
L11_2=Config
L11_2=L11_2.Locations2
L10_2,L11_2,L12_2,L13_2=L10_2(L11_2)
for L14_2,L15_2 in L10_2,L11_2,L12_2,L13_2 do
L16_2=L15_2.grade
if L16_2 then
L16_2=A0_2.job
L16_2=L16_2.grade
L17_2=L15_2.grade
if not(L16_2>=L17_2)then
goto lbl_218
end
end
L16_2=OnDuty
if not L16_2 then
L16_2=L15_2.type
if "duty" ~=L16_2 then
goto lbl_218
end
end
L16_2=pairs
L17_2=L15_2.Coords
L16_2,L17_2,L18_2,L19_2=L16_2(L17_2)
for L20_2,L21_2 in L16_2,L17_2,L18_2,L19_2 do
L22_2=L3_2-L21_2
L22_2=#L22_2
L23_2=nil
if L22_2<20 then
L24_2=L15_2.scale
L24_2=L24_2.x
if L22_2>L24_2 then
L24_2=Config
L24_2=L24_2.MarkerSettings
L23_2=L24_2.UnActive
end
else
L24_2=L15_2.scale
L24_2=L24_2.x
if L22_2<L24_2 then
L24_2=Config
L24_2=L24_2.MarkerSettings
L23_2=L24_2.Active
L24_2=true
L25_2=L14_2
L26_2=L14_2
L9_2=Iterator
L8_2=L26_2
L7_2=L25_2
L4_2=L24_2
end
end
if L23_2 then
L24_2=DrawMarker
L25_2=6
L26_2=L21_2.x
L27_2=L21_2.y
L28_2=L21_2.z
L28_2=L28_2-1
L29_2=0.0
L30_2=0.0
L31_2=0.0
L32_2=-90.0
L33_2=0.0
L34_2=0.0
L35_2=L15_2.scale
L35_2=L35_2.x
L36_2=L15_2.scale
L36_2=L36_2.y
L37_2=L15_2.scale
L37_2=L37_2.z
L38_2=Config
L38_2=L38_2.MarkerSettings
L38_2=L38_2.Active
L38_2=L38_2.r
L39_2=Config
L39_2=L39_2.MarkerSettings
L39_2=L39_2.Active
L39_2=L39_2.g
L40_2=Config
L40_2=L40_2.MarkerSettings
L40_2=L40_2.Active
L40_2=L40_2.b
L41_2=Config
L41_2=L41_2.MarkerSettings
L41_2=L41_2.Active
L41_2=L41_2.a
L42_2=false
L43_2=false
L44_2=2
L45_2=false
L46_2=false
L47_2=false
L48_2=false
L24_2(L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2)
L6_2=false
end
end
::lbl_218::
end
if L4_2 then
L10_2=HasAlreadyEnteredMarker
if not L10_2 then
goto lbl_237
end
end
if L4_2 then
L10_2=LastStation
if L10_2==L7_2 then
L10_2=LastPart
if L10_2==L8_2 then
L10_2=LastPartNum
if L10_2==L9_2 then
goto lbl_270
end
end
end
::lbl_237::
L10_2=LastStation
if L10_2 then
L10_2=LastPart
if L10_2 then
L10_2=LastPartNum
if L10_2 then
L10_2=LastStation
if L10_2==L7_2 then
L10_2=LastPart
if L10_2==L8_2 then
L10_2=LastPartNum
if L10_2==L9_2 then
goto lbl_262
end
end
end
L10_2=TriggerEvent
L11_2="17mov_Garbage:ExitedMarker"
L12_2=LastStation
L13_2=LastPart
L14_2=LastPartNum
L10_2(L11_2,L12_2,L13_2,L14_2)
L5_2=true
end
end
end
::lbl_262::
HasAlreadyEnteredMarker=true
LastStation=L7_2
LastPart=L8_2
LastPartNum=L9_2
L10_2=TriggerEvent
L11_2="17mov_Garbage:EnteredMarker"
L12_2=L8_2
L10_2(L11_2,L12_2)
end
::lbl_270::
if not L5_2 and not L4_2 then
L10_2=HasAlreadyEnteredMarker
if L10_2 then
HasAlreadyEnteredMarker=false
L10_2=TriggerEvent
L11_2="17mov_Garbage:ExitedMarker"
L12_2=LastStation
L13_2=LastPart
L14_2=LastPartNum
L10_2(L11_2,L12_2,L13_2,L14_2)
end
end
if L6_2 then
L10_2=Citizen
L10_2=L10_2.Wait
L11_2=500
L10_2(L11_2)
end
end
end
L3_2=Functions
L3_2=L3_2.DeleteEntity
L4_2=SpawnedPed
L3_2(L4_2)
else
while true do
L1_2=L12_1
if not L1_2 then
break
end
L1_2=Citizen
L1_2=L1_2.Wait
L2_2=0
L1_2(L2_2)
L1_2=GetEntityCoords
L2_2=PlayerPedId
L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2=L2_2()
L1_2=L1_2(L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2,L47_2,L48_2)
L2_2=false
L3_2=false
L4_2=true
L5_2=nil
L6_2=nil
L7_2=nil
L8_2=Config
L8_2=L8_2.RequiredJob
if "none" ~=L8_2 then
L8_2=A0_2.job
L8_2=L8_2.name
L9_2=Config
L9_2=L9_2.RequiredJob
if L8_2==L9_2 then
goto lbl_325
end
end
L8_2=Config
L8_2=L8_2.RequiredJob
::lbl_325::
if "none"==L8_2 then
L8_2=pairs
L9_2=Config
L9_2=L9_2.Locations
L8_2,L9_2,L10_2,L11_2=L8_2(L9_2)
for L12_2,L13_2 in L8_2,L9_2,L10_2,L11_2 do
L14_2=L13_2.grade
if L14_2 then
L14_2=A0_2.job
L14_2=L14_2.grade
L15_2=L13_2.grade
if not(L14_2>=L15_2)then
goto lbl_413
end
end
L14_2=OnDuty
if not L14_2 then
L14_2=L13_2.type
if "duty" ~=L14_2 then
goto lbl_413
end
end
L14_2=pairs
L15_2=L13_2.Coords
L14_2,L15_2,L16_2,L17_2=L14_2(L15_2)
for L18_2,L19_2 in L14_2,L15_2,L16_2,L17_2 do
L20_2=L1_2-L19_2
L20_2=#L20_2
L21_2=nil
if L20_2<20 then
L22_2=L13_2.scale
L22_2=L22_2.x
if L20_2>L22_2 then
L22_2=Config
L22_2=L22_2.MarkerSettings
L21_2=L22_2.UnActive
end
else
L22_2=L13_2.scale
L22_2=L22_2.x
if L20_2<L22_2 then
L22_2=Config
L22_2=L22_2.MarkerSettings
L21_2=L22_2.Active
L22_2=true
L23_2=L12_2
L24_2=L12_2
L7_2=Iterator
L6_2=L24_2
L5_2=L23_2
L2_2=L22_2
end
end
if L21_2 then
L22_2=DrawMarker
L23_2=6
L24_2=L19_2.x
L25_2=L19_2.y
L26_2=L19_2.z
L26_2=L26_2-1
L27_2=0.0
L28_2=0.0
L29_2=0.0
L30_2=-90.0
L31_2=0.0
L32_2=0.0
L33_2=L13_2.scale
L33_2=L33_2.x
L34_2=L13_2.scale
L34_2=L34_2.y
L35_2=L13_2.scale
L35_2=L35_2.z
L36_2=L21_2.r
L37_2=L21_2.g
L38_2=L21_2.b
L39_2=L21_2.a
L40_2=false
L41_2=false
L42_2=2
L43_2=false
L44_2=false
L45_2=false
L46_2=false
L22_2(L23_2,L24_2,L25_2,L26_2,L27_2,L28_2,L29_2,L30_2,L31_2,L32_2,L33_2,L34_2,L35_2,L36_2,L37_2,L38_2,L39_2,L40_2,L41_2,L42_2,L43_2,L44_2,L45_2,L46_2)
L4_2=false
end
end
::lbl_413::
end
if L2_2 then
L8_2=HasAlreadyEnteredMarker
if not L8_2 then
goto lbl_432
end
end
if L2_2 then
L8_2=LastStation
if L8_2==L5_2 then
L8_2=LastPart
if L8_2==L6_2 then
L8_2=LastPartNum
if L8_2==L7_2 then
goto lbl_465
end
end
end
::lbl_432::
L8_2=LastStation
if L8_2 then
L8_2=LastPart
if L8_2 then
L8_2=LastPartNum
if L8_2 then
L8_2=LastStation
if L8_2==L5_2 then
L8_2=LastPart
if L8_2==L6_2 then
L8_2=LastPartNum
if L8_2==L7_2 then
goto lbl_457
end
end
end
L8_2=TriggerEvent
L9_2="17mov_Garbage:ExitedMarker"
L10_2=LastStation
L11_2=LastPart
L12_2=LastPartNum
L8_2(L9_2,L10_2,L11_2,L12_2)
L3_2=true
end
end
end
::lbl_457::
HasAlreadyEnteredMarker=true
LastStation=L5_2
LastPart=L6_2
LastPartNum=L7_2
L8_2=TriggerEvent
L9_2="17mov_Garbage:EnteredMarker"
L10_2=L6_2
L8_2(L9_2,L10_2)
end
::lbl_465::
if not L3_2 and not L2_2 then
L8_2=HasAlreadyEnteredMarker
if L8_2 then
HasAlreadyEnteredMarker=false
L8_2=TriggerEvent
L9_2="17mov_Garbage:ExitedMarker"
L10_2=LastStation
L11_2=LastPart
L12_2=LastPartNum
L8_2(L9_2,L10_2,L11_2,L12_2)
end
end
if L4_2 then
L8_2=Citizen
L8_2=L8_2.Wait
L9_2=500
L8_2(L9_2)
end
end
end
end
end
StartMarkers=L25_1
L25_1=Citizen
L25_1=L25_1.CreateThread
function L26_1()
local L0_2,L1_2
L0_2=GetPlayerData
L0_2=L0_2()
L1_1=L0_2
while true do
L0_2=L1_1
if nil ~=L0_2 then
L0_2=L1_1.job
if nil ~=L0_2 then
break
end
end
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=100
L0_2(L1_2)
L0_2=GetPlayerData
L0_2=L0_2()
L1_1=L0_2
end
L0_2=Config
L0_2=L0_2.RestrictBlipToRequiredJob
if L0_2 then
L0_2=Config
L0_2=L0_2.RequiredJob
L1_2=L1_1.job
L1_2=L1_2.name
if L0_2 ~=L1_2 then
goto lbl_30
end
end
L0_2=MakeBlip
L0_2()
::lbl_30::
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=5000
L0_2(L1_2)
L0_2=StartMarkers
L1_2=L1_1
L0_2(L1_2)
end
L25_1(L26_1)
function L25_1()
local L0_2,L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2
L0_2=L16_1
if L0_2 then
return
end
L0_2=pairs
L1_2=Config
L1_2=L1_2.Blips
L0_2,L1_2,L2_2,L3_2=L0_2(L1_2)
for L4_2,L5_2 in L0_2,L1_2,L2_2,L3_2 do
L6_2=AddBlipForCoord
L7_2=L5_2.Pos
L7_2=L7_2.x
L8_2=L5_2.Pos
L8_2=L8_2.y
L9_2=L5_2.Pos
L9_2=L9_2.z
L6_2=L6_2(L7_2,L8_2,L9_2)
L5_2.blip=L6_2
L6_2=SetBlipSprite
L7_2=L5_2.blip
L8_2=L5_2.Sprite
L6_2(L7_2,L8_2)
L6_2=SetBlipDisplay
L7_2=L5_2.blip
L8_2=4
L6_2(L7_2,L8_2)
L6_2=SetBlipScale
L7_2=L5_2.blip
L8_2=L5_2.Scale
L6_2(L7_2,L8_2)
L6_2=SetBlipColour
L7_2=L5_2.blip
L8_2=L5_2.Color
L6_2(L7_2,L8_2)
L6_2=SetBlipAsShortRange
L7_2=L5_2.blip
L8_2=true
L6_2(L7_2,L8_2)
L6_2=BeginTextCommandSetBlipName
L7_2="STRING"
L6_2(L7_2)
L6_2=AddTextComponentString
L7_2=L5_2.Label
L6_2(L7_2)
L6_2=EndTextCommandSetBlipName
L7_2=L5_2.blip
L6_2(L7_2)
end
L0_2=true
L16_1=L0_2
end
MakeBlip=L25_1
function L25_1()
local L0_2,L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2
L0_2=false
L16_1=L0_2
L0_2=pairs
L1_2=Config
L1_2=L1_2.Blips
L0_2,L1_2,L2_2,L3_2=L0_2(L1_2)
for L4_2,L5_2 in L0_2,L1_2,L2_2,L3_2 do
L6_2=RemoveBlip
L7_2=L5_2.blip
L6_2(L7_2)
L5_2.blip=nil
end
end
DeleteBlip=L25_1
function L25_1(A0_2)
local L1_2,L2_2,L3_2
L1_2=L8_1
if L1_2 then
return
end
L1_2=Config
L1_2=L1_2.UseModernUI
if L1_2 then
while true do
L1_2=L10_1
if L1_2 then
break
end
L1_2=Citizen
L1_2=L1_2.Wait
L2_2=100
L1_2(L2_2)
end
else
L1_2=Citizen
L1_2=L1_2.Wait
L2_2=5500
L1_2(L2_2)
end
L1_2=GetPlayerData
L1_2=L1_2()
L1_1=L1_2
if not A0_2 then
L1_2=Citizen
L1_2=L1_2.Wait
L2_2=5500
L1_2(L2_2)
end
L1_2=true
L8_1=L1_2
L1_2=Config
L1_2=L1_2.RequiredJob
if "none" ~=L1_2 then
L1_2=Config
L1_2=L1_2.RestrictBlipToRequiredJob
if L1_2 then
while true do
L1_2=L1_1
if nil ~=L1_2 then
break
end
L1_2=L1_1.job
if nil ~=L1_2 then
break
end
L1_2=GetPlayerData
L1_2=L1_2()
L1_1=L1_2
L1_2=Citizen
L1_2=L1_2.Wait
L2_2=100
L1_2(L2_2)
end
L1_2=L1_1.job
L1_2=L1_2.name
L2_2=Config
L2_2=L2_2.RequiredJob
if L1_2 ~=L2_2 then
L1_2=Config
L1_2=L1_2.RestrictBlipToRequiredJob
end
if not L1_2 then
L1_2=MakeBlip
L1_2()
end
end
else
L1_2=MakeBlip
L1_2()
end
L1_2=Functions
L1_2=L1_2.TriggerServerCallback
L2_2="17mov_Garbage:init"
function L3_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="Init"
L3_3=A0_3.name
L2_3.name=L3_3
L3_3=A0_3.source
L2_3.myId=L3_3
L1_3(L2_3)
L1_3=true
L4_1=L1_3
end
L1_2(L2_2,L3_2)
end
InitalizeScript=L25_1
L25_1=RegisterNetEvent
L26_1="QBCore:Client:OnPlayerLoaded"
function L27_1()
local L0_2,L1_2
L0_2=InitalizeScript
L0_2()
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="esx:playerLoaded"
function L27_1()
local L0_2,L1_2
L0_2=InitalizeScript
L0_2()
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="QBCore:Client:OnJobUpdate"
function L27_1(A0_2)
local L1_2,L2_2
L1_2=GetPlayerData
L1_2=L1_2()
L1_1=L1_2
L1_2=Config
L1_2=L1_2.RequiredJob
if "none" ~=L1_2 then
L1_2=Config
L1_2=L1_2.RestrictBlipToRequiredJob
if L1_2 then
L1_2=L1_1.job
L1_2=L1_2.name
L2_2=Config
L2_2=L2_2.RequiredJob
if L1_2==L2_2 then
goto lbl_22
end
end
end
L1_2=Config
L1_2=L1_2.RestrictBlipToRequiredJob
::lbl_22::
if not L1_2 then
L1_2=MakeBlip
L1_2()
else
L1_2=DeleteBlip
L1_2()
end
L1_2=Config
L1_2=L1_2.RequiredJob
if "none" ~=L1_2 then
L1_2=L1_1.job
L1_2=L1_2.name
L2_2=Config
L2_2=L2_2.RequiredJob
if L1_2==L2_2 then
goto lbl_41
end
end
L1_2=Config
L1_2=L1_2.RequiredJob
::lbl_41::
if "none"==L1_2 then
L1_2=StartMarkers
L2_2=L1_1
L1_2(L2_2)
else
L1_2=false
L12_1=L1_2
end
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="esx:setJob"
function L27_1(A0_2)
local L1_2,L2_2
while true do
L1_2=L1_1
if nil ~=L1_2 then
L1_2=L1_1.job
if nil ~=L1_2 then
break
end
end
L1_2=GetPlayerData
L1_2=L1_2()
L1_1=L1_2
L1_2=Citizen
L1_2=L1_2.Wait
L2_2=1000
L1_2(L2_2)
end
L1_1.job=A0_2
L1_2=Config
L1_2=L1_2.RequiredJob
if "none" ~=L1_2 then
L1_2=Config
L1_2=L1_2.RestrictBlipToRequiredJob
if L1_2 then
L1_2=L1_1.job
L1_2=L1_2.name
L2_2=Config
L2_2=L2_2.RequiredJob
if L1_2==L2_2 then
goto lbl_34
end
end
end
L1_2=Config
L1_2=L1_2.RestrictBlipToRequiredJob
::lbl_34::
if not L1_2 then
L1_2=MakeBlip
L1_2()
else
L1_2=DeleteBlip
L1_2()
end
L1_2=Config
L1_2=L1_2.RequiredJob
if "none" ~=L1_2 then
L1_2=L1_1.job
L1_2=L1_2.name
L2_2=Config
L2_2=L2_2.RequiredJob
if L1_2==L2_2 then
goto lbl_53
end
end
L1_2=Config
L1_2=L1_2.RequiredJob
::lbl_53::
if "none"==L1_2 then
L1_2=StartMarkers
L2_2=L1_1
L1_2(L2_2)
else
L1_2=false
L12_1=L1_2
end
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="17mov_Garbage:EnteredMarker"
function L27_1(A0_2)
local L1_2,L2_2,L3_2
L1_2=Config
L1_2=L1_2.Locations
L1_2=L1_2[A0_2]
L1_2=L1_2.CurrentAction
CurrentAction=L1_2
L1_2=Config
L1_2=L1_2.Locations
L1_2=L1_2[A0_2]
L1_2=L1_2.CurrentActionMsg
CurrentActionMsg=L1_2
CurrentActionStation=A0_2
L1_2=0
while true do
L2_2=500
if not(L1_2<L2_2)then
break
end
L2_2=Citizen
L2_2=L2_2.Wait
L3_2=0
L2_2(L3_2)
L2_2=ShowHelpNotification
L3_2=CurrentActionMsg
L2_2(L3_2)
L1_2=L1_2+1
end
end
L25_1(L26_1,L27_1)
L25_1=RegisterNetEvent
L26_1="17mov_Garbage:ExitedMarker"
function L27_1(A0_2)
local L1_2
CurrentAction=nil
CurrentActionMsg=nil
CurrentActionStation=nil
end
L25_1(L26_1,L27_1)
L25_1=RegisterCommand
L26_1="+GarbageCollectorUseMarker"
function L27_1()
local L0_2,L1_2
end
L28_1=false
L25_1(L26_1,L27_1,L28_1)
L25_1=RegisterCommand
L26_1="-GarbageCollectorUseMarker"
function L27_1()
local L0_2,L1_2,L2_2
L0_2=CurrentAction
if nil ~=L0_2 then
L0_2=CurrentAction
if "open_dutyToggle"==L0_2 then
L0_2=OpenDutyMenu
L0_2()
else
L0_2=CurrentAction
if "finish_job"==L0_2 then
L0_2=Functions
L0_2=L0_2.TriggerServerCallback
L1_2="17mov_Garbage:IfPlayerIsHost"
function L2_2(A0_3)
local L1_3,L2_3,L3_3
if A0_3 then
L1_3=EndJob
L1_3()
else
L1_3=Notify
L2_3=_L
L3_3="Lobby.EndJob.NoPermission"
L2_3,L3_3=L2_3(L3_3)
L1_3(L2_3,L3_3)
end
end
L0_2(L1_2,L2_2)
end
end
end
end
L28_1=false
L25_1(L26_1,L27_1,L28_1)
function L25_1(A0_2,A1_2,A2_2,A3_2,A4_2)
local L5_2,L6_2,L7_2
L5_2=promise
L6_2=L5_2
L5_2=L5_2.new
L5_2=L5_2(L6_2)
L6_2=Citizen
L6_2=L6_2.CreateThread
function L7_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3
L0_3=GetEntityCoords
L1_3=A0_2
L0_3=L0_3(L1_3)
L1_3=0
L2_3=GetNetworkTimeAccurate
L2_3=L2_3()
while true do
L3_3=A2_2
if not(L1_3<L3_3)then
break
end
L3_3=Functions
L3_3=L3_3.CorrectLerp
L4_3=L0_3
L5_3=A1_2
L6_3=A2_2
L6_3=L1_3/L6_3
L3_3=L3_3(L4_3,L5_3,L6_3)
L4_3=SetEntityCoordsNoOffset
L5_3=A0_2
L6_3=L3_3.x
L7_3=L3_3.y
L8_3=L3_3.z
L9_3=false
L10_3=false
L11_3=false
L4_3(L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3)
L4_3=GetNetworkTimeAccurate
L4_3=L4_3()
L1_3=L4_3-L2_3
L4_3=Wait
L5_3=11
L4_3(L5_3)
end
L3_3=SetEntityCoordsNoOffset
L4_3=A0_2
L5_3=A1_2.x
L6_3=A1_2.y
L7_3=A1_2.z
L8_3=false
L9_3=false
L10_3=false
L3_3(L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3)
L3_3=A4_2
L3_3()
L3_3=L5_2
L4_3=L3_3
L3_3=L3_3.resolve
L5_3=true
L3_3(L4_3,L5_3)
end
L6_2(L7_2)
if A3_2 then
L6_2=Citizen
L6_2=L6_2.Await
L7_2=L5_2
return L6_2(L7_2)
end
end
function L26_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2
L1_2={}
L2_2={}
L3_2=A0_2[1]
L3_2=L3_2[1]
L4_2=A0_2[1]
L4_2=L4_2[2]
L5_2=A0_2[1]
L5_2=L5_2[3]
L2_2[1]=L3_2
L2_2[2]=L4_2
L2_2[3]=L5_2
L3_2={}
L4_2=A0_2[2]
L4_2=L4_2[1]
L5_2=A0_2[2]
L5_2=L5_2[2]
L6_2=A0_2[2]
L6_2=L6_2[3]
L3_2[1]=L4_2
L3_2[2]=L5_2
L3_2[3]=L6_2
L4_2={}
L5_2=A0_2[3]
L5_2=L5_2[1]
L6_2=A0_2[3]
L6_2=L6_2[2]
L7_2=A0_2[3]
L7_2=L7_2[3]
L4_2[1]=L5_2
L4_2[2]=L6_2
L4_2[3]=L7_2
L1_2[1]=L2_2
L1_2[2]=L3_2
L1_2[3]=L4_2
L2_2={}
L3_2=A0_2[1]
L3_2=L3_2[4]
L4_2=A0_2[2]
L4_2=L4_2[4]
L5_2=A0_2[3]
L5_2=L5_2[4]
L2_2[1]=L3_2
L2_2[2]=L4_2
L2_2[3]=L5_2
L3_2={}
L4_2={}
L5_2=L1_2[1]
L5_2=L5_2[1]
L6_2=L1_2[2]
L6_2=L6_2[1]
L7_2=L1_2[3]
L7_2=L7_2[1]
L4_2[1]=L5_2
L4_2[2]=L6_2
L4_2[3]=L7_2
L5_2={}
L6_2=L1_2[1]
L6_2=L6_2[2]
L7_2=L1_2[2]
L7_2=L7_2[2]
L8_2=L1_2[3]
L8_2=L8_2[2]
L5_2[1]=L6_2
L5_2[2]=L7_2
L5_2[3]=L8_2
L6_2={}
L7_2=L1_2[1]
L7_2=L7_2[3]
L8_2=L1_2[2]
L8_2=L8_2[3]
L9_2=L1_2[3]
L9_2=L9_2[3]
L6_2[1]=L7_2
L6_2[2]=L8_2
L6_2[3]=L9_2
L3_2[1]=L4_2
L3_2[2]=L5_2
L3_2[3]=L6_2
L4_2={}
L5_2=L3_2[1]
L5_2=L5_2[1]
L6_2=L2_2[1]
L5_2=L5_2*L6_2
L6_2=L3_2[1]
L6_2=L6_2[2]
L7_2=L2_2[2]
L6_2=L6_2*L7_2
L5_2=L5_2+L6_2
L6_2=L3_2[1]
L6_2=L6_2[3]
L7_2=L2_2[3]
L6_2=L6_2*L7_2
L5_2=L5_2+L6_2
L5_2=-L5_2
L6_2=L3_2[2]
L6_2=L6_2[1]
L7_2=L2_2[1]
L6_2=L6_2*L7_2
L7_2=L3_2[2]
L7_2=L7_2[2]
L8_2=L2_2[2]
L7_2=L7_2*L8_2
L6_2=L6_2+L7_2
L7_2=L3_2[2]
L7_2=L7_2[3]
L8_2=L2_2[3]
L7_2=L7_2*L8_2
L6_2=L6_2+L7_2
L6_2=-L6_2
L7_2=L3_2[3]
L7_2=L7_2[1]
L8_2=L2_2[1]
L7_2=L7_2*L8_2
L8_2=L3_2[3]
L8_2=L8_2[2]
L9_2=L2_2[2]
L8_2=L8_2*L9_2
L7_2=L7_2+L8_2
L8_2=L3_2[3]
L8_2=L8_2[3]
L9_2=L2_2[3]
L8_2=L8_2*L9_2
L7_2=L7_2+L8_2
L7_2=-L7_2
L4_2[1]=L5_2
L4_2[2]=L6_2
L4_2[3]=L7_2
L5_2={}
L6_2={}
L7_2=L3_2[1]
L7_2=L7_2[1]
L8_2=L3_2[1]
L8_2=L8_2[2]
L9_2=L3_2[1]
L9_2=L9_2[3]
L10_2=L4_2[1]
L6_2[1]=L7_2
L6_2[2]=L8_2
L6_2[3]=L9_2
L6_2[4]=L10_2
L7_2={}
L8_2=L3_2[2]
L8_2=L8_2[1]
L9_2=L3_2[2]
L9_2=L9_2[2]
L10_2=L3_2[2]
L10_2=L10_2[3]
L11_2=L4_2[2]
L7_2[1]=L8_2
L7_2[2]=L9_2
L7_2[3]=L10_2
L7_2[4]=L11_2
L8_2={}
L9_2=L3_2[3]
L9_2=L9_2[1]
L10_2=L3_2[3]
L10_2=L10_2[2]
L11_2=L3_2[3]
L11_2=L11_2[3]
L12_2=L4_2[3]
L8_2[1]=L9_2
L8_2[2]=L10_2
L8_2[3]=L11_2
L8_2[4]=L12_2
L9_2={}
L10_2=0
L11_2=0
L12_2=0
L13_2=1
L9_2[1]=L10_2
L9_2[2]=L11_2
L9_2[3]=L12_2
L9_2[4]=L13_2
L5_2[1]=L6_2
L5_2[2]=L7_2
L5_2[3]=L8_2
L5_2[4]=L9_2
return L5_2
end
function L27_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2
L2_2=math
L2_2=L2_2.rad
L3_2=A0_2.x
L2_2=L2_2(L3_2)
L3_2=math
L3_2=L3_2.rad
L4_2=A0_2.y
L3_2=L3_2(L4_2)
L4_2=math
L4_2=L4_2.rad
L5_2=A0_2.z
L4_2=L4_2(L5_2)
L5_2=math
L5_2=L5_2.cos
L6_2=L2_2
L5_2=L5_2(L6_2)
L6_2=math
L6_2=L6_2.sin
L7_2=L2_2
L6_2=L6_2(L7_2)
L7_2=math
L7_2=L7_2.cos
L8_2=L3_2
L7_2=L7_2(L8_2)
L8_2=math
L8_2=L8_2.sin
L9_2=L3_2
L8_2=L8_2(L9_2)
L9_2=math
L9_2=L9_2.cos
L10_2=L4_2
L9_2=L9_2(L10_2)
L10_2=math
L10_2=L10_2.sin
L11_2=L4_2
L10_2=L10_2(L11_2)
L11_2={}
L12_2={}
L13_2=L7_2*L9_2
L14_2=L9_2*L6_2
L14_2=L14_2*L8_2
L15_2=L5_2*L10_2
L14_2=L14_2-L15_2
L15_2=L6_2*L10_2
L16_2=L5_2*L9_2
L16_2=L16_2*L8_2
L15_2=L15_2+L16_2
L16_2=A1_2.x
L12_2[1]=L13_2
L12_2[2]=L14_2
L12_2[3]=L15_2
L12_2[4]=L16_2
L13_2={}
L14_2=L7_2*L10_2
L15_2=L5_2*L9_2
L16_2=L6_2*L8_2
L16_2=L16_2*L10_2
L15_2=L15_2+L16_2
L16_2=L5_2*L8_2
L16_2=L16_2*L10_2
L17_2=L9_2*L6_2
L16_2=L16_2-L17_2
L17_2=A1_2.y
L13_2[1]=L14_2
L13_2[2]=L15_2
L13_2[3]=L16_2
L13_2[4]=L17_2
L14_2={}
L15_2=-L8_2
L16_2=L7_2*L6_2
L17_2=L5_2*L7_2
L18_2=A1_2.z
L14_2[1]=L15_2
L14_2[2]=L16_2
L14_2[3]=L17_2
L14_2[4]=L18_2
L15_2={}
L16_2=0
L17_2=0
L18_2=0
L19_2=1
L15_2[1]=L16_2
L15_2[2]=L17_2
L15_2[3]=L18_2
L15_2[4]=L19_2
L11_2[1]=L12_2
L11_2[2]=L13_2
L11_2[3]=L14_2
L11_2[4]=L15_2
return L11_2
end
function L28_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2
L2_2=A0_2[1]
L2_2=L2_2[1]
L3_2=A1_2.x
L2_2=L2_2*L3_2
L3_2=A0_2[1]
L3_2=L3_2[2]
L4_2=A1_2.y
L3_2=L3_2*L4_2
L2_2=L2_2+L3_2
L3_2=A0_2[1]
L3_2=L3_2[3]
L4_2=A1_2.z
L3_2=L3_2*L4_2
L2_2=L2_2+L3_2
L3_2=A0_2[1]
L3_2=L3_2[4]
L2_2=L2_2+L3_2
L3_2=A0_2[2]
L3_2=L3_2[1]
L4_2=A1_2.x
L3_2=L3_2*L4_2
L4_2=A0_2[2]
L4_2=L4_2[2]
L5_2=A1_2.y
L4_2=L4_2*L5_2
L3_2=L3_2+L4_2
L4_2=A0_2[2]
L4_2=L4_2[3]
L5_2=A1_2.z
L4_2=L4_2*L5_2
L3_2=L3_2+L4_2
L4_2=A0_2[2]
L4_2=L4_2[4]
L3_2=L3_2+L4_2
L4_2=A0_2[3]
L4_2=L4_2[1]
L5_2=A1_2.x
L4_2=L4_2*L5_2
L5_2=A0_2[3]
L5_2=L5_2[2]
L6_2=A1_2.y
L5_2=L5_2*L6_2
L4_2=L4_2+L5_2
L5_2=A0_2[3]
L5_2=L5_2[3]
L6_2=A1_2.z
L5_2=L5_2*L6_2
L4_2=L4_2+L5_2
L5_2=A0_2[3]
L5_2=L5_2[4]
L4_2=L4_2+L5_2
L5_2=vec3
L6_2=L2_2
L7_2=L3_2
L8_2=L4_2
return L5_2(L6_2,L7_2,L8_2)
end
function L29_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2
L2_2=L26_1
L3_2=A0_2
L2_2=L2_2(L3_2)
Inversed_Matrix=L2_2
L2_2=Inversed_Matrix
L2_2=L2_2[1]
L2_2=L2_2[1]
L3_2=A1_2.x
L2_2=L2_2*L3_2
L3_2=Inversed_Matrix
L3_2=L3_2[1]
L3_2=L3_2[2]
L4_2=A1_2.y
L3_2=L3_2*L4_2
L2_2=L2_2+L3_2
L3_2=Inversed_Matrix
L3_2=L3_2[1]
L3_2=L3_2[3]
L4_2=A1_2.z
L3_2=L3_2*L4_2
L2_2=L2_2+L3_2
L3_2=Inversed_Matrix
L3_2=L3_2[1]
L3_2=L3_2[4]
L2_2=L2_2+L3_2
L3_2=Inversed_Matrix
L3_2=L3_2[2]
L3_2=L3_2[1]
L4_2=A1_2.x
L3_2=L3_2*L4_2
L4_2=Inversed_Matrix
L4_2=L4_2[2]
L4_2=L4_2[2]
L5_2=A1_2.y
L4_2=L4_2*L5_2
L3_2=L3_2+L4_2
L4_2=Inversed_Matrix
L4_2=L4_2[2]
L4_2=L4_2[3]
L5_2=A1_2.z
L4_2=L4_2*L5_2
L3_2=L3_2+L4_2
L4_2=Inversed_Matrix
L4_2=L4_2[2]
L4_2=L4_2[4]
L3_2=L3_2+L4_2
L4_2=Inversed_Matrix
L4_2=L4_2[3]
L4_2=L4_2[1]
L5_2=A1_2.x
L4_2=L4_2*L5_2
L5_2=Inversed_Matrix
L5_2=L5_2[3]
L5_2=L5_2[2]
L6_2=A1_2.y
L5_2=L5_2*L6_2
L4_2=L4_2+L5_2
L5_2=Inversed_Matrix
L5_2=L5_2[3]
L5_2=L5_2[3]
L6_2=A1_2.z
L5_2=L5_2*L6_2
L4_2=L4_2+L5_2
L5_2=Inversed_Matrix
L5_2=L5_2[3]
L5_2=L5_2[4]
L4_2=L4_2+L5_2
L5_2=vec3
L6_2=L2_2
L7_2=L3_2
L8_2=L4_2
return L5_2(L6_2,L7_2,L8_2)
end
function L30_1(A0_2,A1_2,A2_2)
local L3_2,L4_2,L5_2,L6_2,L7_2,L8_2
L3_2={}
L4_2=L29_1
L5_2=A0_2
L6_2=A2_2.bottom_left
L4_2=L4_2(L5_2,L6_2)
L3_2.bottom_left=L4_2
L4_2=L29_1
L5_2=A0_2
L6_2=A2_2.top_right
L4_2=L4_2(L5_2,L6_2)
L3_2.top_right=L4_2
L4_2=L3_2.top_right
L4_2=L4_2.x
L5_2=A1_2.top_right
L5_2=L5_2.x
L4_2=L4_2<L5_2
L5_2=L3_2.bottom_left
L5_2=L5_2.x
L6_2=A1_2.bottom_left
L6_2=L6_2.x
L5_2=L5_2>L6_2
L6_2=L3_2.top_right
L7_2=A1_2.top_right
L6_2=L6_2-L7_2
L6_2=#L6_2
L7_2=L3_2.bottom_left
L8_2=A1_2.top_right
L7_2=L7_2-L8_2
L7_2=#L7_2
L6_2=L6_2<L7_2
L7_2=L4_2 or L7_2
L7_2=L5_2 or L7_2
if L4_2 and L5_2 then
L7_2=L6_2
end
return L7_2
end
L31_1=false
L32_1=RegisterNetEvent
L33_1="17mov_GarbageCollector:client:hideBox"
function L34_1()
local L0_2,L1_2
L0_2=L31_1
if L0_2 then
L0_2=false
L31_1=L0_2
end
end
L32_1(L33_1,L34_1)
L32_1=RegisterNetEvent
L33_1="17mov_GarbageCollector:client:forceEndJob"
function L34_1()
local L0_2,L1_2,L2_2,L3_2
L0_2=true
L19_1=L0_2
L0_2=TriggerServerEvent
L1_2="17mov_Garbage:endJob_sv"
L2_2=true
L3_2=true
return L0_2(L1_2,L2_2,L3_2)
end
L32_1(L33_1,L34_1)
L32_1=false
L33_1=RegisterNetEvent
L34_1="17mov_Garbage:client:endStage"
function L35_1(A0_2)
local L1_2,L2_2
L1_2=Citizen
L1_2=L1_2.CreateThread
function L2_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3
L0_3=NetToVeh
L1_3=JobVehicleNetId
L0_3=L0_3(L1_3)
L1_3=DoesEntityExist
L2_3=L0_3
L1_3=L1_3(L2_3)
if not L1_3 then
return
end
L1_3=Config
L1_3=L1_3.UnloadZone
L1_3=L1_3.coords
L2_3=Config
L2_3=L2_3.UnloadZone
L2_3=L2_3.rotation
L3_3=GetGroundZFor_3dCoord
L4_3=L1_3.x
L5_3=L1_3.y
L6_3=L1_3.z
L7_3=false
L3_3,L4_3=L3_3(L4_3,L5_3,L6_3,L7_3)
if L3_3 then
L5_3=vec3
L6_3=L1_3.x
L7_3=L1_3.y
L8_3=L4_3
L5_3=L5_3(L6_3,L7_3,L8_3)
L1_3=L5_3
end
L5_3=Functions
L5_3=L5_3.LoadModel
L6_3=GetHashKey
L7_3=Config
L7_3=L7_3.JobVehicleModel
L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3=L6_3(L7_3)
L5_3(L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3)
L5_3=GetModelDimensions
L6_3=GetHashKey
L7_3=Config
L7_3=L7_3.JobVehicleModel
L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3=L6_3(L7_3)
L5_3,L6_3=L5_3(L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3)
L7_3=vec3
L8_3=0.5
L9_3=0.5
L10_3=0.2
L7_3=L7_3(L8_3,L9_3,L10_3)
L8_3=L27_1
L9_3=L2_3
L10_3=L1_3
L8_3=L8_3(L9_3,L10_3)
L9_3=vec3
L10_3=L6_3.x
L11_3=L7_3.x
L10_3=L10_3+L11_3
L11_3=L6_3.y
L12_3=L7_3.y
L11_3=L11_3+L12_3
L12_3=L6_3.z
L13_3=L5_3.z
L12_3=L12_3-L13_3
L13_3=L7_3.z
L12_3=L12_3+L13_3
L9_3=L9_3(L10_3,L11_3,L12_3)
L10_3=vec3
L11_3=L5_3.x
L12_3=L7_3.x
L11_3=L11_3-L12_3
L12_3=L5_3.y
L13_3=L7_3.y
L12_3=L12_3-L13_3
L13_3=L5_3.z
L14_3=L7_3.z
L13_3=L13_3-L14_3
L10_3=L10_3(L11_3,L12_3,L13_3)
L11_3=L6_3-L5_3
L12_3=2*L7_3
L11_3=L11_3+L12_3
L12_3=L3_1
L13_3=Config
L13_3=L13_3.BagsCountToFullUnload
L14_3=100
L13_3=L14_3/L13_3
L14_3=GetPlayerServerId
L15_3=PlayerId
L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3=L15_3()
L14_3=L14_3(L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3)
L15_3=true
L31_1=L15_3
while true do
L15_3=L31_1
if not L15_3 then
break
end
if 0 ~=L0_3 then
L15_3=GetOffsetFromEntityInWorldCoords
L16_3=L0_3
L17_3=L6_3.x
L18_3=L6_3.y
L19_3=L6_3.z
L15_3=L15_3(L16_3,L17_3,L18_3,L19_3)
L16_3=GetOffsetFromEntityInWorldCoords
L17_3=L0_3
L18_3=L5_3.x
L19_3=L5_3.y
L20_3=L5_3.z
L16_3=L16_3(L17_3,L18_3,L19_3,L20_3)
L17_3=L30_1
L18_3=L8_3
L19_3={}
L19_3.bottom_left=L10_3
L19_3.top_right=L9_3
L20_3={}
L20_3.bottom_left=L16_3
L20_3.top_right=L15_3
L17_3=L17_3(L18_3,L19_3,L20_3)
L18_3=DrawMarker
L19_3=43
L20_3=L1_3.x
L21_3=L1_3.y
L22_3=L1_3.z
L22_3=L22_3+0.02
L23_3=0.0
L24_3=0.0
L25_3=0.0
L26_3=L2_3.x
L27_3=L2_3.y
L28_3=L2_3.z
L29_3=L11_3.x
L30_3=L11_3.y
L31_3=L11_3.z
L31_3=L31_3/2.5
if L17_3 then
L32_3=0
if L32_3 then
goto lbl_153
end
end
L32_3=255
::lbl_153::
if L17_3 then
L33_3=255
if L33_3 then
goto lbl_159
end
end
L33_3=0
::lbl_159::
L34_3=0
L35_3=50
L36_3=false
L37_3=false
L38_3=2
L39_3=false
L40_3=false
L41_3=false
L42_3=false
L18_3(L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3)
if L17_3 then
L18_3=GetPedInVehicleSeat
L19_3=L0_3
L20_3=-1
L18_3=L18_3(L19_3,L20_3)
L19_3=PlayerPedId
L19_3=L19_3()
if L18_3==L19_3 then
L18_3=A0_2
if L14_3==L18_3 then
L18_3=ShowHelpNotification
L19_3=_L
L20_3="Job.Markers.UnloadVehicle"
L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3=L19_3(L20_3)
L18_3(L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3)
L18_3=IsControlJustReleased
L19_3=0
L20_3=38
L18_3=L18_3(L19_3,L20_3)
if L18_3 then
L18_3=false
L31_1=L18_3
end
end
end
end
end
L15_3=Wait
L16_3=0
L15_3(L16_3)
end
L15_3=L31_1
if not L15_3 then
L15_3=A0_2
if L14_3==L15_3 then
L15_3=true
L32_1=L15_3
L15_3=Citizen
L15_3=L15_3.CreateThread
function L16_3()
local L0_4,L1_4,L2_4,L3_4
while true do
L0_4=L32_1
if not L0_4 then
break
end
L0_4=DisableControlAction
L1_4=0
L2_4=75
L3_4=true
L0_4(L1_4,L2_4,L3_4)
L0_4=Wait
L1_4=0
L0_4(L1_4)
end
end
L15_3(L16_3)
L15_3=FreezeEntityPosition
L16_3=L0_3
L17_3=true
L15_3(L16_3,L17_3)
L15_3=TriggerServerEvent
L16_3="17mov_GarbageCollector:server:hideBox"
L15_3(L16_3)
L15_3=math
L15_3=L15_3.ceil
L16_3=L12_3/L13_3
L15_3=L15_3(L16_3)
L16_3=GetClosestPlayers
L17_3=GetEntityCoords
L18_3=PlayerPedId
L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3=L18_3()
L17_3=L17_3(L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3,L28_3,L29_3,L30_3,L31_3,L32_3,L33_3,L34_3,L35_3,L36_3,L37_3,L38_3,L39_3,L40_3,L41_3,L42_3)
L18_3=150
L19_3=true
L16_3=L16_3(L17_3,L18_3,L19_3)
L17_3=TriggerServerEvent
L18_3="17mov_GarbageCollector:ToggleTrunk"
L19_3=JobVehicleNetId
L20_3=true
L17_3(L18_3,L19_3,L20_3)
L17_3=TriggerServerEvent
L18_3="17mov_GarbageCollector:server:startUnloadAnim"
L19_3=L15_3
L20_3=L16_3
L17_3(L18_3,L19_3,L20_3)
end
end
end
L1_2(L2_2)
end
L33_1(L34_1,L35_1)
L33_1=RegisterNetEvent
L34_1="17mov_GarbageCollector:client:startUnloadAnim"
function L35_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2
L2_2=L28_1
L3_2=L27_1
L4_2=Config
L4_2=L4_2.Animation
L4_2=L4_2.rotation
L5_2=Config
L5_2=L5_2.Animation
L5_2=L5_2.start_coords
L3_2=L3_2(L4_2,L5_2)
L4_2=Config
L4_2=L4_2.Animation
L4_2=L4_2.end_coords_offset
L2_2=L2_2(L3_2,L4_2)
L3_2=1
L4_2=A0_2
L5_2=1
for L6_2=L3_2,L4_2,L5_2 do
L7_2=Functions
L7_2=L7_2.SpawnObject
L8_2=Config
L8_2=L8_2.Animation
L8_2=L8_2.model
function L9_2(A0_3)
local L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3
L1_3=Entity
L2_3=A0_3
L1_3=L1_3(L2_3)
L1_3=L1_3.state
L2_3=L1_3
L1_3=L1_3.set
L3_3="GarbageBlock"
L4_3=true
L5_3=false
L1_3(L2_3,L3_3,L4_3,L5_3)
L1_3=L6_2
L2_3=A0_2
if L1_3==L2_3 then
L1_3=A1_2
if L1_3 then
L1_3=TriggerServerEvent
L2_3="17mov_GarbageCollector:ToggleTrunk"
L3_3=JobVehicleNetId
L4_3=false
L1_3(L2_3,L3_3,L4_3)
end
end
L1_3=SetEntityRotation
L2_3=A0_3
L3_3=Config
L3_3=L3_3.Animation
L3_3=L3_3.rotation
L3_3=L3_3.x
L4_3=Config
L4_3=L4_3.Animation
L4_3=L4_3.rotation
L4_3=L4_3.y
L5_3=Config
L5_3=L5_3.Animation
L5_3=L5_3.rotation
L5_3=L5_3.z
L6_3=2
L7_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3)
L1_3=L25_1
L2_3=A0_3
L3_3=L2_2
L4_3=Config
L4_3=L4_3.Animation
L4_3=L4_3.duration
L5_3=false
function L6_3()
local L0_4,L1_4,L2_4
L0_4=L6_2
L1_4=A0_2
if L0_4==L1_4 then
L0_4=false
L32_1=L0_4
L0_4=Functions
L0_4=L0_4.DeleteEntity
L1_4=A0_3
L0_4(L1_4)
L0_4=true
L19_1=L0_4
L0_4=A1_2
if L0_4 then
L0_4=TriggerServerEvent
L1_4="17mov_Garbage:endJob_sv"
L2_4=true
return L0_4(L1_4,L2_4)
end
return
end
end
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3)
L1_3=Wait
L2_3=Config
L2_3=L2_3.Animation
L2_3=L2_3.duration
L3_3=Config
L3_3=L3_3.Animation
L3_3=L3_3.max_bags_on_line
L2_3=L2_3/L3_3
L1_3(L2_3)
end
L10_2=Config
L10_2=L10_2.Animation
L10_2=L10_2.start_coords
L11_2=false
L12_2=true
L13_2=true
L7_2(L8_2,L9_2,L10_2,L11_2,L12_2,L13_2)
end
end
L33_1(L34_1,L35_1)
L33_1=TriggerEvent
L34_1="chat:removeSuggestion"
L35_1="/+GarbageCollectorUseMarker"
L33_1(L34_1,L35_1)
L33_1=TriggerEvent
L34_1="chat:removeSuggestion"
L35_1="/-GarbageCollectorUseMarker"
L33_1(L34_1,L35_1)
L33_1=RegisterKeyMapping
L34_1="+GarbageCollectorUseMarker"
L35_1=_L
L36_1="Command.MarkerInteraction.Description"
L35_1=L35_1(L36_1)
L36_1="keyboard"
L37_1="E"
L33_1(L34_1,L35_1,L36_1,L37_1)
L33_1=Config
L33_1=L33_1.UseModernUI
if L33_1 then
function L33_1()
local L0_2,L1_2,L2_2,L3_2,L4_2
L0_2=L8_1
if not L0_2 then
L0_2=InitalizeScript
L1_2=true
L0_2(L1_2)
L0_2=print
L1_2="SCRIPT NOT READY-WAIT UNTIL SCRIPT PROPERLY LOAD"
return L0_2(L1_2)
end
L0_2=L4_1
if not L0_2 then
L0_2=Functions
L0_2=L0_2.TriggerServerCallback
L1_2="17mov_Garbage:init"
function L2_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="Init"
L3_3=A0_3.name
L2_3.name=L3_3
L3_3=A0_3.source
L2_3.myId=L3_3
L1_3(L2_3)
L1_3=true
L4_1=L1_3
end
L0_2(L1_2,L2_2)
L0_2=print
L1_2="SCRIPT NOT READY-WAIT UNTIL SCRIPT PROPERLY LOAD"
return L0_2(L1_2)
end
L0_2=SetNuiFocus
L1_2=true
L2_2=true
L0_2(L1_2,L2_2)
L0_2=SendNUIMessage
L1_2={}
L1_2.action="OpenWorkMenu"
L0_2(L1_2)
L0_2=true
L6_1=L0_2
L0_2=false
L1_2=false
L2_2=false
L3_2=CreateThread
function L4_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3
while true do
L0_3=L6_1
if not L0_3 then
break
end
L0_3=GetActivePlayers
L0_3=L0_3()
L1_3=GetEntityCoords
L2_3=PlayerPedId
L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3=L2_3()
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3)
L2_3={}
L3_3=false
L4_3=pairs
L5_3=L0_3
L4_3,L5_3,L6_3,L7_3=L4_3(L5_3)
for L8_3,L9_3 in L4_3,L5_3,L6_3,L7_3 do
L10_3=PlayerId
L10_3=L10_3()
if L10_3 ~=L9_3 then
L10_3=GetPlayerPed
L11_3=L9_3
L10_3=L10_3(L11_3)
L11_3=GetEntityCoords
L12_3=L10_3
L11_3=L11_3(L12_3)
L11_3=L1_3-L11_3
L11_3=#L11_3
if L11_3<10.0 then
L11_3=#L2_3
L11_3=L11_3+1
L12_3=GetPlayerServerId
L13_3=L9_3
L12_3=L12_3(L13_3)
L2_3[L11_3]=L12_3
end
end
end
L4_3=#L2_3
if 0==L4_3 then
L4_3=L2_2
if not L4_3 then
goto lbl_54
end
end
L4_3=Functions
L4_3=L4_3.TriggerServerCallback
L5_3="17mov_Garbage:GetPlayersNames"
function L6_3(A0_4)
local L1_4,L2_4,L3_4,L4_4,L5_4,L6_4,L7_4,L8_4,L9_4,L10_4,L11_4,L12_4,L13_4,L14_4,L15_4
L1_4=pairs
L2_4=A0_4
L1_4,L2_4,L3_4,L4_4=L1_4(L2_4)
for L5_4,L6_4 in L1_4,L2_4,L3_4,L4_4 do
L8_4=L6_4.id
L7_4=L5_1
L7_4=L7_4[L8_4]
if nil==L7_4 then
L7_4=true
L3_3=L7_4
L8_4=L6_4.id
L7_4=L17_1
L7_4=L7_4[L8_4]
if nil==L7_4 then
L8_4=L6_4.id
L7_4=L17_1
L9_4={}
L10_4=L6_4.id
L9_4.id=L10_4
L10_4=L6_4.name
L9_4.name=L10_4
L7_4[L8_4]=L9_4
L7_4=CreateThread
function L8_4()
local L0_5,L1_5,L2_5
while true do
L0_5=L0_2
if L0_5 then
break
end
L0_5=Citizen
L0_5=L0_5.Wait
L1_5=10
L0_5(L1_5)
end
L0_5=SendNUIMessage
L1_5={}
L1_5.action="addNewNearbyPlayer"
L2_5=L6_4.id
L1_5.id=L2_5
L2_5=L6_4.name
L1_5.name=L2_5
L0_5(L1_5)
end
L7_4(L8_4)
end
else
A0_4[L5_4]=nil
end
end
L1_4=false
L2_2=L1_4
L1_4=pairs
L2_4=L17_1
L1_4,L2_4,L3_4,L4_4=L1_4(L2_4)
for L5_4,L6_4 in L1_4,L2_4,L3_4,L4_4 do
L7_4=true
L2_2=L7_4
L7_4=false
L8_4=L6_4.id
L9_4=pairs
L10_4=A0_4
L9_4,L10_4,L11_4,L12_4=L9_4(L10_4)
for L13_4,L14_4 in L9_4,L10_4,L11_4,L12_4 do
L15_4=L14_4.id
if L15_4==L8_4 then
L7_4=true
break
end
end
if not L7_4 then
L9_4=L17_1
L9_4[L8_4]=nil
L9_4=true
L1_2=L9_4
L9_4=SendNUIMessage
L10_4={}
L10_4.action="DeleteNearbyPlayer"
L11_4=L6_4.id
L10_4.id=L11_4
L9_4(L10_4)
L9_4=CreateThread
function L10_4()
local L0_5,L1_5
L0_5=Citizen
L0_5=L0_5.Wait
L1_5=250
L0_5(L1_5)
L0_5=false
L1_2=L0_5
end
L9_4(L10_4)
end
end
L1_4=L3_3
if not L1_4 then
L1_4=L0_2
if L1_4 then
L1_4=CreateThread
function L2_4()
local L0_5,L1_5
while true do
L0_5=L1_2
if not L0_5 then
break
end
L0_5=Citizen
L0_5=L0_5.Wait
L1_5=10
L0_5(L1_5)
end
L0_5=SendNUIMessage
L1_5={}
L1_5.action="hideNearbyPlayersTab"
L0_5(L1_5)
L0_5=CreateThread
function L1_5()
local L0_6,L1_6
L0_6=Citizen
L0_6=L0_6.Wait
L1_6=250
L0_6(L1_6)
L0_6=false
L0_2=L0_6
end
L0_5(L1_5)
end
L1_4(L2_4)
end
else
L1_4=L3_3
if L1_4 then
L1_4=L0_2
if not L1_4 then
L1_4=SendNUIMessage
L2_4={}
L2_4.action="showNearbyPlayersTab"
L1_4(L2_4)
L1_4=CreateThread
function L2_4()
local L0_5,L1_5
L0_5=Citizen
L0_5=L0_5.Wait
L1_5=250
L0_5(L1_5)
L0_5=true
L0_2=L0_5
end
L1_4(L2_4)
end
end
end
end
L7_3=L2_3
L4_3(L5_3,L6_3,L7_3)
::lbl_54::
L4_3=Citizen
L4_3=L4_3.Wait
L5_3=2500
L4_3(L5_3)
end
end
L3_2(L4_2)
end
OpenDutyMenu=L33_1
else
function L33_1()
local L0_2,L1_2,L2_2
L0_2=L8_1
if not L0_2 then
L0_2=InitalizeScript
L1_2=true
L0_2(L1_2)
L0_2=print
L1_2="SCRIPT NOT READY-WAIT UNTIL SCRIPT PROPERLY LOAD"
return L0_2(L1_2)
end
L0_2=L4_1
if not L0_2 then
L0_2=Functions
L0_2=L0_2.TriggerServerCallback
L1_2="17mov_Garbage:init"
function L2_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="Init"
L3_3=A0_3.name
L2_3.name=L3_3
L3_3=A0_3.source
L2_3.myId=L3_3
L1_3(L2_3)
L1_3=true
L4_1=L1_3
end
L0_2(L1_2,L2_2)
L0_2=print
L1_2="SCRIPT NOT READY-WAIT UNTIL SCRIPT PROPERLY LOAD"
return L0_2(L1_2)
end
L0_2=Functions
L0_2=L0_2.TriggerServerCallback
L1_2="17mov_Garbage:IfPlayerIsHost"
function L2_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="HostStatusUpdate"
L2_3.status=A0_3
L1_3(L2_3)
L1_3=SendNUIMessage
L2_3={}
L2_3.action="OpenWorkMenu"
L1_3(L2_3)
L1_3=SetNuiFocus
L2_3=true
L3_3=true
L1_3(L2_3,L3_3)
end
L0_2(L1_2,L2_2)
end
OpenDutyMenu=L33_1
end
L33_1=RegisterNetEvent
L34_1="17mov_Garbage:SendRequestToClient_cl"
function L35_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=SetNuiFocus
L3_2=true
L4_2=true
L2_2(L3_2,L4_2)
L2_2=SendNUIMessage
L3_2={}
L3_2.action="ShowInviteBox"
L3_2.name=A0_2
L2_2(L3_2)
end
L33_1(L34_1,L35_1)
L33_1=Config
L33_1=L33_1.UseModernUI
if L33_1 then
L33_1=RegisterNetEvent
L34_1="17mov_Garbage:RefreshMugs"
function L35_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2
while true do
L2_2=L4_1
if L2_2 then
break
end
L2_2=Citizen
L2_2=L2_2.Wait
L3_2=100
L2_2(L3_2)
end
L2_2=pairs
L3_2=A0_2
L2_2,L3_2,L4_2,L5_2=L2_2(L3_2)
for L6_2,L7_2 in L2_2,L3_2,L4_2,L5_2 do
L8_2=SendNUIMessage
L9_2={}
L9_2.action="DeleteNearbyPlayer"
L10_2=L7_2.id
L9_2.id=L10_2
L8_2(L9_2)
L9_2=L7_2.id
L8_2=L5_1
L8_2=L8_2[L9_2]
if nil==L8_2 then
L8_2=GetPlayerServerId
L9_2=PlayerId
L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2=L9_2()
L8_2=L8_2(L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2)
L9_2=L7_2.id
if L8_2==L9_2 then
L9_2=L7_2.id
L8_2=L5_1
L10_2={}
L11_2=L7_2.name
L10_2.name=L11_2
L11_2=L7_2.id
L10_2.id=L11_2
L11_2=L7_2.isHost
L10_2.isHost=L11_2
L11_2=L7_2.rewardPercent
L10_2.rewardPercent=L11_2
L10_2.itsMe=true
L8_2[L9_2]=L10_2
else
L9_2=L7_2.id
L8_2=L5_1
L10_2={}
L11_2=L7_2.name
L10_2.name=L11_2
L11_2=L7_2.id
L10_2.id=L11_2
L11_2=L7_2.isHost
L10_2.isHost=L11_2
L11_2=L7_2.rewardPercent
L10_2.rewardPercent=L11_2
L10_2.itsMe=false
L8_2[L9_2]=L10_2
end
L8_2=SendNUIMessage
L9_2={}
L9_2.action="addNewMember"
L10_2=L7_2.name
L9_2.name=L10_2
L10_2=L7_2.id
L9_2.id=L10_2
L10_2=L7_2.isHost
L9_2.isHost=L10_2
L10_2=L7_2.rewardPercent
L9_2.rewardPercent=L10_2
L11_2=L7_2.id
L10_2=L5_1
L10_2=L10_2[L11_2]
L10_2=L10_2.itsMe
L9_2.showQuitBtn=L10_2
L8_2(L9_2)
end
end
L2_2=0
L3_2=pairs
L4_2=L5_1
L3_2,L4_2,L5_2,L6_2=L3_2(L4_2)
for L7_2,L8_2 in L3_2,L4_2,L5_2,L6_2 do
L9_2=L8_2.id
L10_2=false
L11_2=pairs
L12_2=A0_2
L11_2,L12_2,L13_2,L14_2=L11_2(L12_2)
for L15_2,L16_2 in L11_2,L12_2,L13_2,L14_2 do
L17_2=L16_2.id
if L17_2==L9_2 then
L10_2=true
break
end
end
if not L10_2 then
L11_2=L5_1
L11_2[L9_2]=nil
L11_2=SendNUIMessage
L12_2={}
L12_2.action="DeletePlayer"
L12_2.id=L9_2
L11_2(L12_2)
else
L2_2=L2_2+1
end
end
if 1==L2_2 then
L3_2=Functions
L3_2=L3_2.TriggerServerCallback
L4_2="17mov_Garbage:init"
function L5_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="Init"
L3_3=A0_3.name
L2_3.name=L3_3
L3_3=A0_3.source
L2_3.myId=L3_3
L1_3(L2_3)
L1_3=true
L4_1=L1_3
end
L3_2(L4_2,L5_2)
end
L3_2=Functions
L3_2=L3_2.TriggerServerCallback
L4_2="17mov_Garbage:IfPlayerOwnsTeam"
function L5_2(A0_3)
local L1_3,L2_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="ToggleHostHUD"
L2_3.boolean=A0_3
L1_3(L2_3)
end
L3_2(L4_2,L5_2)
end
L33_1(L34_1,L35_1)
else
L33_1=RegisterNetEvent
L34_1="17mov_Garbage:RefreshMugs"
function L35_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
while true do
L2_2=L4_1
if L2_2 then
break
end
L2_2=Citizen
L2_2=L2_2.Wait
L3_2=100
L2_2(L3_2)
end
L2_2=Citizen
L2_2=L2_2.Wait
L3_2=100
L2_2(L3_2)
L2_2=SendNUIMessage
L3_2={}
L3_2.action="refreshMugs"
L3_2.names=A0_2
L3_2.myId=A1_2
L2_2(L3_2)
L2_2=Functions
L2_2=L2_2.TriggerServerCallback
L3_2="17mov_Garbage:IfPlayerIsHost"
function L4_2(A0_3)
local L1_3,L2_3
L1_3=SendNUIMessage
L2_3={}
L2_3.action="HostStatusUpdate"
L2_3.status=A0_3
L1_3(L2_3)
end
L2_2(L3_2,L4_2)
end
L33_1(L34_1,L35_1)
end
L33_1=3000
L34_1=RegisterNetEvent
L35_1="17mov_GarbageCollector:client:GarbageAnim"
function L36_1(A0_2,A1_2,A2_2,A3_2,A4_2,A5_2)
local L6_2,L7_2
L6_2=Citizen
L6_2=L6_2.CreateThread
function L7_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3
L0_3=GetGameTimer
L0_3=L0_3()
L1_3=GetPlayerServerId
L2_3=PlayerId
L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3=L2_3()
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3)
while true do
L2_3=NetworkDoesEntityExistWithNetworkId
L3_3=A0_2
L2_3=L2_3(L3_3)
if L2_3 then
break
end
L2_3=GetGameTimer
L2_3=L2_3()
L2_3=L2_3-L0_3
L3_3=L33_1
if L2_3>L3_3 then
return
end
L2_3=Wait
L3_3=1
L2_3(L3_3)
end
L2_3=NetToObj
L3_3=A0_2
L2_3=L2_3(L3_3)
L3_3=Config
L3_3=L3_3.Debug
L3_3=L3_3.enabled
if L3_3 then
L3_3=Config
L3_3=L3_3.Debug
L3_3=L3_3.bin_stage
if L3_3 then
goto lbl_38
end
end
L3_3=A5_2
::lbl_38::
L4_3=Config
L4_3=L4_3.Scenes
L5_3=A2_2
L4_3=L4_3[L5_3]
L5_3={}
L6_3=L4_3.Stages
L6_3=L6_3[L3_3]
L6_3=L6_3.Objects
L6_3=L6_3[2]
L6_3=L6_3.animDict
L5_3.dict=L6_3
L6_3=L4_3.Stages
L6_3=L6_3[L3_3]
L6_3=L6_3.Objects
L6_3=L6_3[2]
L6_3=L6_3.animClip
L5_3.clip=L6_3
L6_3={}
L7_3=L4_3.Stages
L7_3=L7_3[L3_3]
L7_3=L7_3.Objects
L7_3=L7_3[1]
L7_3=L7_3.animDict
L6_3.dict=L7_3
L7_3=L4_3.Stages
L7_3=L7_3[L3_3]
L7_3=L7_3.Objects
L7_3=L7_3[1]
L7_3=L7_3.animClip
L6_3.clip=L7_3
L7_3=GetPlayerPed
L8_3=GetPlayerFromServerId
L9_3=A3_2
L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3=L8_3(L9_3)
L7_3=L7_3(L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3)
L8_3={}
L9_3=A3_2
if L1_3 ~=L9_3 then
L9_3=1
L10_3=A4_2
L10_3=#L10_3
L11_3=1
for L12_3=L9_3,L10_3,L11_3 do
L13_3=Functions
L13_3=L13_3.SpawnObject
L14_3=A4_2
L14_3=L14_3[L12_3]
L14_3=L14_3.model
function L15_3(A0_4)
local L1_4,L2_4,L3_4,L4_4,L5_4,L6_4,L7_4
L1_4=SetEntityRotation
L2_4=A0_4
L4_4=L12_3
L3_4=A4_2
L3_4=L3_4[L4_4]
L3_4=L3_4.rotation
L3_4=L3_4.x
L5_4=L12_3
L4_4=A4_2
L4_4=L4_4[L5_4]
L4_4=L4_4.rotation
L4_4=L4_4.y
L6_4=L12_3
L5_4=A4_2
L5_4=L5_4[L6_4]
L5_4=L5_4.rotation
L5_4=L5_4.z
L6_4=2
L7_4=false
L1_4(L2_4,L3_4,L4_4,L5_4,L6_4,L7_4)
L1_4=L8_3
L1_4=#L1_4
L2_4=L1_4+1
L1_4=L8_3
L1_4[L2_4]=A0_4
L1_4=Entity
L2_4=A0_4
L1_4=L1_4(L2_4)
L1_4=L1_4.state
L2_4=L1_4
L1_4=L1_4.set
L3_4="GarbageBlock"
L4_4=true
L5_4=false
L1_4(L2_4,L3_4,L4_4,L5_4)
end
L16_3=A4_2
L16_3=L16_3[L12_3]
L16_3=L16_3.coords
L17_3=false
L18_3=A4_2
L18_3=L18_3[L12_3]
L18_3=L18_3.isFrozen
L19_3=A4_2
L19_3=L19_3[L12_3]
L19_3=L19_3.NoCollisions
L13_3(L14_3,L15_3,L16_3,L17_3,L18_3,L19_3)
end
end
L9_3=false
if L2_3 then
L10_3=NetworkGetEntityOwner
L11_3=L2_3
L10_3=L10_3(L11_3)
L11_3=PlayerId
L11_3=L11_3()
if L10_3==L11_3 then
L10_3=FreezeEntityPosition
L11_3=L2_3
L12_3=true
L10_3(L11_3,L12_3)
L10_3=SetEntityNoCollisionEntity
L11_3=L7_3
L12_3=L2_3
L13_3=false
L10_3(L11_3,L12_3,L13_3)
L10_3=L5_3.dict
L11_3=L5_3.clip
L12_3=Functions
L12_3=L12_3.RequestAnimDict
L13_3=L10_3
L12_3(L13_3)
L12_3=PlayEntityAnim
L13_3=L2_3
L14_3=L11_3
L15_3=L10_3
L16_3=2.0
L17_3=false
L18_3=false
L19_3=false
L20_3=0
L21_3=0
L12_3(L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3)
while true do
L12_3=IsEntityPlayingAnim
L13_3=L2_3
L14_3=L10_3
L15_3=L11_3
L16_3=3
L12_3=L12_3(L13_3,L14_3,L15_3,L16_3)
if L12_3 then
break
end
L12_3=Wait
L13_3=1
L12_3(L13_3)
end
while true do
L12_3=IsEntityPlayingAnim
L13_3=L7_3
L14_3=L6_3.dict
L15_3=L6_3.clip
L16_3=3
L12_3=L12_3(L13_3,L14_3,L15_3,L16_3)
if L12_3 then
break
end
L12_3=Wait
L13_3=1
L12_3(L13_3)
end
L12_3=GetNetworkTimeAccurate
L12_3=L12_3()
L13_3=A1_2
L12_3=L12_3-L13_3
L13_3=GetAnimDuration
L14_3=L6_3.dict
L15_3=L6_3.clip
L13_3=L13_3(L14_3,L15_3)
L13_3=L13_3*1000
L13_3=L12_3/L13_3
L14_3=SetEntityAnimCurrentTime
L15_3=L7_3
L16_3=L6_3.dict
L17_3=L6_3.clip
L18_3=L13_3
L14_3(L15_3,L16_3,L17_3,L18_3)
L14_3=GetAnimDuration
L15_3=L10_3
L16_3=L11_3
L14_3=L14_3(L15_3,L16_3)
L14_3=L14_3*1000
L14_3=L12_3/L14_3
L15_3=SetEntityAnimCurrentTime
L16_3=L2_3
L17_3=L10_3
L18_3=L11_3
L19_3=L14_3
L15_3(L16_3,L17_3,L18_3,L19_3)
while true do
L15_3=IsEntityPlayingAnim
L16_3=L2_3
L17_3=L10_3
L18_3=L11_3
L19_3=3
L15_3=L15_3(L16_3,L17_3,L18_3,L19_3)
if not L15_3 then
break
end
L15_3=IsEntityPlayingAnim
L16_3=L7_3
L17_3=L6_3.dict
L18_3=L6_3.clip
L19_3=3
L15_3=L15_3(L16_3,L17_3,L18_3,L19_3)
if not L15_3 then
L15_3=StopEntityAnim
L16_3=L2_3
L17_3=L11_3
L18_3=L10_3
L19_3=1
L15_3(L16_3,L17_3,L18_3,L19_3)
L9_3=true
end
L15_3=Wait
L16_3=1
L15_3(L16_3)
end
L15_3=L4_3.Stages
L15_3=#L15_3
L16_3=TriggerServerEvent
L17_3="17mov_GarbageCollector:server:GarbageSetOcupied"
L18_3=A0_2
L19_3=L15_3
L20_3=nil
L21_3=L9_3
L16_3(L17_3,L18_3,L19_3,L20_3,L21_3)
L16_3=SetEntityNoCollisionEntity
L17_3=L7_3
L18_3=L2_3
L19_3=true
L16_3(L17_3,L18_3,L19_3)
L16_3=FreezeEntityPosition
L17_3=L2_3
L18_3=false
L16_3(L17_3,L18_3)
end
elseif L2_3 then
L10_3=L5_3.dict
L11_3=L5_3.clip
L12_3=Functions
L12_3=L12_3.RequestAnimDict
L13_3=L10_3
L12_3(L13_3)
while true do
L12_3=IsEntityPlayingAnim
L13_3=L2_3
L14_3=L10_3
L15_3=L11_3
L16_3=3
L12_3=L12_3(L13_3,L14_3,L15_3,L16_3)
if L12_3 then
break
end
L12_3=Wait
L13_3=1
L12_3(L13_3)
end
while true do
L12_3=IsEntityPlayingAnim
L13_3=L7_3
L14_3=L6_3.dict
L15_3=L6_3.clip
L16_3=3
L12_3=L12_3(L13_3,L14_3,L15_3,L16_3)
if L12_3 then
break
end
L12_3=Wait
L13_3=1
L12_3(L13_3)
end
L12_3=GetNetworkTimeAccurate
L12_3=L12_3()
L13_3=A1_2
L12_3=L12_3-L13_3
L13_3=GetAnimDuration
L14_3=L6_3.dict
L15_3=L6_3.clip
L13_3=L13_3(L14_3,L15_3)
L13_3=L13_3*1000
L13_3=L12_3/L13_3
L14_3=SetEntityAnimCurrentTime
L15_3=L7_3
L16_3=L6_3.dict
L17_3=L6_3.clip
L18_3=L13_3
L14_3(L15_3,L16_3,L17_3,L18_3)
L14_3=GetAnimDuration
L15_3=L10_3
L16_3=L11_3
L14_3=L14_3(L15_3,L16_3)
L14_3=L14_3*1000
L14_3=L12_3/L14_3
L15_3=SetEntityAnimCurrentTime
L16_3=L2_3
L17_3=L10_3
L18_3=L11_3
L19_3=L14_3
L15_3(L16_3,L17_3,L18_3,L19_3)
while true do
L15_3=IsEntityPlayingAnim
L16_3=L2_3
L17_3=L10_3
L18_3=L11_3
L19_3=3
L15_3=L15_3(L16_3,L17_3,L18_3,L19_3)
if not L15_3 then
break
end
L15_3=Wait
L16_3=1
L15_3(L16_3)
end
end
L10_3=#L8_3
if L10_3>0 then
L10_3=1
L11_3=#L8_3
L12_3=1
for L13_3=L10_3,L11_3,L12_3 do
L14_3=Functions
L14_3=L14_3.DeleteEntity
L15_3=L8_3[L13_3]
L14_3(L15_3)
end
end
end
L6_2(L7_2)
end
L34_1(L35_1,L36_1)
function L34_1()
local L0_2,L1_2,L2_2
L0_2=L15_1
if L0_2 then
return
end
L0_2=true
L15_1=L0_2
L0_2=GetCurrentResourceName
L0_2=L0_2()
L1_2=CreateThread
function L2_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3
while true do
L0_3=L15_1
if not L0_3 then
break
end
L0_3=1000
L1_3=L13_1
if L1_3 then
L0_3=0
L1_3=L13_1.scene
L2_3=L13_1.object
L3_3=L13_1.sceneId
L4_3=GetOffsetFromEntityInWorldCoords
L5_3=L2_3
L6_3=L1_3.DrawTextOffset
L6_3=L6_3.x
L7_3=L1_3.DrawTextOffset
L7_3=L7_3.y
L8_3=L1_3.DrawTextOffset
L8_3=L8_3.z
L4_3=L4_3(L5_3,L6_3,L7_3,L8_3)
L5_3=Entity
L6_3=L2_3
L5_3=L5_3(L6_3)
L5_3=L5_3.state
L5_3=L5_3.GarbageOccupied
if L5_3 then
goto lbl_123
end
L5_3=IsHoldingTrash
L5_3=L5_3()
if L5_3 then
goto lbl_123
end
L5_3=DrawText3Ds
L6_3=L4_3.x
L7_3=L4_3.y
L8_3=L4_3.z
L9_3=Config
L9_3=L9_3.Debug
L9_3=L9_3.enabled
if L9_3 then
L9_3="DEBUG:"
if L9_3 then
goto lbl_45
end
end
L9_3=""
::lbl_45::
L10_3=Config
L10_3=L10_3.KeybindSettings
L10_3=L10_3.bagsInteractionkeyString
L11_3=_L
L12_3="Job.Gameplay.SearchDumpster"
L11_3=L11_3(L12_3)
L9_3=L9_3 .. L10_3 .. L11_3
L5_3(L6_3,L7_3,L8_3,L9_3)
L5_3=IsControlJustReleased
L6_3=0
L7_3=38
L5_3=L5_3(L6_3,L7_3)
if L5_3 then
L5_3=StartScene
L6_3=L1_3
L7_3=L3_3
L8_3=L2_3
L5_3(L6_3,L7_3,L8_3)
end
else
L1_3=L14_1
if L1_3 then
L0_3=0
L1_3=GetEntityCoords
L2_3=L14_1
L1_3=L1_3(L2_3)
L2_3=GetEntityScript
L3_3=L14_1
L2_3,L3_3=L2_3(L3_3)
L4_3=Entity
L5_3=L14_1
L4_3=L4_3(L5_3)
L4_3=L4_3.state
L4_3=L4_3.GarbageBlock
if not L4_3 then
if L2_3 then
L4_3=L0_2
end
if L2_3==L4_3 then
L4_3=IsHoldingTrash
L4_3=L4_3()
if not L4_3 then
L4_3=HasObjectBeenBroken
L5_3=L14_1
L4_3=L4_3(L5_3)
if not L4_3 then
L4_3=DrawText3Ds
L5_3=L1_3.x
L6_3=L1_3.y
L7_3=L1_3.z
L8_3=Config
L8_3=L8_3.KeybindSettings
L8_3=L8_3.bagsInteractionkeyString
L9_3=_L
L10_3="Job.Gameplay.Pick"
L9_3=L9_3(L10_3)
L8_3=L8_3 .. L9_3
L4_3(L5_3,L6_3,L7_3,L8_3)
L4_3=IsControlJustReleased
L5_3=0
L6_3=Config
L6_3=L6_3.KeybindSettings
L6_3=L6_3.bagsInteractionKey
L4_3=L4_3(L5_3,L6_3)
if L4_3 then
L4_3=PickTrash
L5_3=L14_1
L4_3(L5_3)
end
end
end
end
end
else
L1_3=false
L15_1=L1_3
return
end
end
::lbl_123::
L1_3=Citizen
L1_3=L1_3.Wait
L2_3=L0_3
L1_3(L2_3)
end
end
L1_2(L2_2)
end
L35_1=RegisterNetEvent
L36_1="17mov_GarbageCollector:client:TeleportCrewMembers"
function L37_1(A0_2,A1_2,A2_2)
local L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2
while true do
L3_2=NetworkDoesEntityExistWithNetworkId
L4_2=A0_2
L3_2=L3_2(L4_2)
if L3_2 then
break
end
L3_2=Wait
L4_2=10
L3_2(L4_2)
end
L3_2=5000
L4_2=GetGameTimer
L4_2=L4_2()
L5_2=nil
while not L5_2 or L5_2==A0_2 do
L6_2=GetGameTimer
L6_2=L6_2()
L6_2=L6_2-L4_2
if L3_2<L6_2 then
L6_2=Notify
L7_2="Teleporting crew members failed,vehicle not found"
return L6_2(L7_2)
end
L6_2=NetToVeh
L7_2=A0_2
L6_2=L6_2(L7_2)
L5_2=L6_2
L6_2=Wait
L7_2=10
L6_2(L7_2)
end
L6_2=DoScreenFadeOut
L7_2=300
L6_2(L7_2)
while true do
L6_2=IsScreenFadedOut
L6_2=L6_2()
if L6_2 then
break
end
L6_2=Citizen
L6_2=L6_2.Wait
L7_2=1
L6_2(L7_2)
end
L6_2=false
L7_2=0+A1_2
L8_2=GetVehicleMaxNumberOfPassengers
L9_2=L5_2
L8_2=L8_2(L9_2)
L8_2=L8_2-1
L9_2=1
for L10_2=L7_2,L8_2,L9_2 do
L11_2=IsVehicleSeatFree
L12_2=L5_2
L13_2=L10_2
L11_2=L11_2(L12_2,L13_2)
if L11_2 then
L11_2=PlayerPedId
L11_2=L11_2()
L6_2=true
L12_2=TaskEnterVehicle
L13_2=L11_2
L14_2=L5_2
L15_2=-1
L16_2=L10_2
L17_2=2.0
L18_2=16
L19_2=0
L12_2(L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2)
L12_2=Wait
L13_2=100
L12_2(L13_2)
break
end
end
L7_2=GetNetworkTimeAccurate
L7_2=L7_2()
L7_2=L7_2-A2_2
L8_2=Wait
L9_2=2000
L9_2=L9_2-L7_2
L8_2(L9_2)
L8_2=DoScreenFadeIn
L9_2=300
L8_2(L9_2)
if not L6_2 then
L8_2=Notify
L9_2="No free seat found in vehicle"
L8_2(L9_2)
end
end
L35_1(L36_1,L37_1)
L35_1=RegisterNetEvent
L36_1="17mov_Garbage:StartJob_cl"
function L37_1(A0_2,A1_2,A2_2,A3_2,A4_2)
local L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2
L5_2=Config
L5_2=L5_2.SpawnPoint
L6_2=0
L3_1=L6_2
OnDuty=true
L6_2=0
L20_1=L6_2
L6_2=GetResourceKvpInt
L7_2="17mov_Tutorials:"
L8_2="garbageTutorial"
L7_2=L7_2 .. L8_2
L6_2=L6_2(L7_2)
if 0==L6_2 then
L6_2=5
L20_1=L6_2
L6_2="garbageTutorial"
L7_1=L6_2
L6_2=SetNuiFocus
L7_2=true
L8_2=true
L6_2(L7_2,L8_2)
L6_2=SendNUIMessage
L7_2={}
L7_2.action="showTutorial"
L8_2=_L
L9_2="Job.Gameplay.Tutorial"
L8_2=L8_2(L9_2)
L7_2.customText=L8_2
L6_2(L7_2)
end
L6_2=CreateThread
function L7_2()
local L0_3,L1_3
L0_3=L18_1
if not L0_3 then
L0_3=Config
L0_3=L0_3.RequireWorkClothes
if L0_3 then
L0_3=true
L18_1=L0_3
L0_3=ChangeClothes
L1_3="work"
L0_3(L1_3)
end
end
end
L6_2(L7_2)
if A0_2==A1_2 then
if not A3_2 then
L6_2=Config
L6_2=L6_2.EnableVehicleTeleporting
if L6_2 then
L6_2=DoScreenFadeOut
L7_2=300
L6_2(L7_2)
while true do
L6_2=IsScreenFadedOut
L6_2=L6_2()
if L6_2 then
break
end
L6_2=Wait
L7_2=1
L6_2(L7_2)
end
end
L6_2=PrepeareVehicle
L6_2()
L6_2=Functions
L6_2=L6_2.SpawnVehicle
L7_2=Config
L7_2=L7_2.JobVehicleModel
L8_2=L5_2
L9_2=Config
L9_2=L9_2.EnableVehicleTeleporting
L6_2=L6_2(L7_2,L8_2,L9_2)
L7_2=SetVehicle
L8_2=L6_2
L7_2(L8_2)
L7_2=GetGameTimer
L7_2=L7_2()
while true do
L8_2=DoesEntityExist
L9_2=L6_2
L8_2=L8_2(L9_2)
if L8_2 then
break
end
L8_2=GetGameTimer
L8_2=L8_2()
L8_2=L8_2-L7_2
L9_2=2000
if not(L8_2<L9_2)then
break
end
L8_2=Wait
L9_2=1
L8_2(L9_2)
end
L8_2=GetGameTimer
L8_2=L8_2()
L7_2=L8_2
while true do
L8_2=VehToNet
L9_2=L6_2
L8_2=L8_2(L9_2)
if L8_2 then
break
end
L8_2=GetGameTimer
L8_2=L8_2()
L8_2=L8_2-L7_2
L9_2=2000
if not(L8_2<L9_2)then
break
end
L8_2=Wait
L9_2=1
L8_2(L9_2)
end
L0_1=L6_2
L8_2=VehToNet
L9_2=L6_2
L8_2=L8_2(L9_2)
JobVehicleNetId=L8_2
L8_2=GetNetworkTimeAccurate
L8_2=L8_2()
L9_2=Config
L9_2=L9_2.EnableVehicleCrewMembersTeleporting
if L9_2 then
L9_2=TriggerServerEvent
L10_2="17mov_GarbageCollector:server:TeleportCrewMembers"
L11_2=JobVehicleNetId
L12_2=L8_2
L9_2(L10_2,L11_2,L12_2)
end
L9_2=Citizen
L9_2=L9_2.Wait
L10_2=2000
L9_2(L10_2)
L9_2=DoScreenFadeIn
L10_2=300
L9_2(L10_2)
else
L6_2=NetToVeh
L7_2=A4_2
L6_2=L6_2(L7_2)
L0_1=L6_2
JobVehicleNetId=A4_2
L6_2=0
while true do
L7_2=L0_1
if 0 ~=L7_2 then
break
end
L7_2=NetToVeh
L8_2=A4_2
L7_2=L7_2(L8_2)
L0_1=L7_2
L7_2=Citizen
L7_2=L7_2.Wait
L8_2=100
L7_2(L8_2)
L6_2=L6_2+1
L7_2=300
if L6_2>L7_2 then
break
end
end
while true do
L7_2=DoesEntityExist
L8_2=L0_1
L7_2=L7_2(L8_2)
if L7_2 then
break
end
L7_2=300
if not(L6_2<L7_2)then
break
end
L7_2=Citizen
L7_2=L7_2.Wait
L8_2=100
L7_2(L8_2)
end
L7_2=Config
L7_2=L7_2.UseTarget
if L7_2 then
L7_2=AddJobVehicleToTargetSystem
L8_2=L0_1
L7_2(L8_2)
end
end
L6_2=Config
L6_2=L6_2.UseTarget
if L6_2 then
L6_2=AddJobVehicleToTargetSystem
L7_2=L0_1
L6_2(L7_2)
end
L6_2=TriggerServerEvent
L7_2="17mov_GarbageJob:SendVehicleNetId"
L8_2=JobVehicleNetId
L6_2(L7_2,L8_2)
elseif not A3_2 then
while true do
L6_2=Citizen
L6_2=L6_2.Wait
L7_2=0
L6_2(L7_2)
L6_2=GetClosestVehicle
L7_2=vector3
L8_2=L5_2.x
L9_2=L5_2.y
L10_2=L5_2.z
L7_2,L8_2,L9_2,L10_2,L11_2,L12_2=L7_2(L8_2,L9_2,L10_2)
L6_2=L6_2(L7_2,L8_2,L9_2,L10_2,L11_2,L12_2)
if nil ~=L6_2 then
L7_2=vector3
L8_2=L5_2.x
L9_2=L5_2.y
L10_2=L5_2.z
L7_2=L7_2(L8_2,L9_2,L10_2)
L8_2=GetEntityCoords
L9_2=L6_2
L8_2=L8_2(L9_2)
L7_2=L7_2-L8_2
L7_2=#L7_2
if L7_2<5.0 then
L7_2=Citizen
L7_2=L7_2.Wait
L8_2=300
L7_2(L8_2)
L7_2=Config
L7_2=L7_2.UseTarget
if L7_2 then
L7_2=AddJobVehicleToTargetSystem
L8_2=L6_2
L7_2(L8_2)
end
L7_2=VehToNet
L8_2=L6_2
L7_2=L7_2(L8_2)
JobVehicleNetId=L7_2
L0_1=L6_2
break
end
end
end
L6_2=Config
L6_2=L6_2.GiveKeysToAllLobby
if L6_2 then
L6_2=SetVehicle
L7_2=L0_1
L6_2(L7_2)
end
else
L6_2=NetToVeh
L7_2=A4_2
L6_2=L6_2(L7_2)
L0_1=L6_2
JobVehicleNetId=A4_2
L6_2=0
while true do
L7_2=L0_1
if 0 ~=L7_2 then
break
end
L7_2=NetToVeh
L8_2=A4_2
L7_2=L7_2(L8_2)
L0_1=L7_2
L7_2=Citizen
L7_2=L7_2.Wait
L8_2=100
L7_2(L8_2)
L6_2=L6_2+1
L7_2=400
if L6_2>L7_2 then
break
end
end
while true do
L7_2=DoesEntityExist
L8_2=L0_1
L7_2=L7_2(L8_2)
if L7_2 then
break
end
L7_2=400
if not(L6_2<L7_2)then
break
end
L7_2=Citizen
L7_2=L7_2.Wait
L8_2=100
L7_2(L8_2)
end
L7_2=Config
L7_2=L7_2.UseTarget
if L7_2 then
L7_2=AddJobVehicleToTargetSystem
L8_2=L0_1
L7_2(L8_2)
end
end
L6_2=SendNUIMessage
L7_2={}
L7_2.action="showCounter"
L6_2(L7_2)
L6_2=CreateThread
function L7_2()
local L0_3,L1_3,L2_3
while true do
L0_3=OnDuty
if not L0_3 then
break
end
L0_3=JobVehicleNetId
if 0 ~=L0_3 then
L0_3=JobVehicleNetId
if nil ~=L0_3 then
L0_3=NetworkDoesNetworkIdExist
L1_3=JobVehicleNetId
L0_3=L0_3(L1_3)
if L0_3 then
L0_3=NetToVeh
L1_3=JobVehicleNetId
L0_3=L0_3(L1_3)
L1_3=L0_1
if L1_3 ~=L0_3 then
L1_3=JobVehicleNetId
if L0_3 ~=L1_3 then
L1_3=Config
L1_3=L1_3.UseTarget
if L1_3 then
L1_3=DeleteEntityFromTarget
L2_3=L0_1
L1_3(L2_3)
end
L1_3=NetToVeh
L2_3=JobVehicleNetId
L1_3=L1_3(L2_3)
L0_1=L1_3
L1_3=Config
L1_3=L1_3.UseTarget
if L1_3 then
L1_3=AddJobVehicleToTargetSystem
L2_3=L0_1
L1_3(L2_3)
end
end
end
end
end
end
L0_3=Citizen
L0_3=L0_3.Wait
L1_3=5000
L0_3(L1_3)
end
end
L6_2(L7_2)
L6_2=CreateThread
function L7_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3,L25_3,L26_3,L27_3
while true do
L0_3=OnDuty
if not L0_3 then
break
end
L0_3=Config
L0_3=L0_3.UseTarget
if L0_3 then
break
end
L0_3=PlayerPedId
L0_3=L0_3()
L1_3=GetEntityCoords
L2_3=L0_3
L1_3=L1_3(L2_3)
L2_3=GetGamePool
L3_3="CObject"
L2_3=L2_3(L3_3)
L3_3=nil
L4_3=nil
L5_3=1.5
L6_3=pairs
L7_3=L2_3
L6_3,L7_3,L8_3,L9_3=L6_3(L7_3)
for L10_3,L11_3 in L6_3,L7_3,L8_3,L9_3 do
L12_3=GetEntityModel
L13_3=L11_3
L12_3=L12_3(L13_3)
L13_3=Config
L13_3=L13_3.EnableBins
if L13_3 then
L13_3=pairs
L14_3=Config
L14_3=L14_3.Scenes
L13_3,L14_3,L15_3,L16_3=L13_3(L14_3)
for L17_3,L18_3 in L13_3,L14_3,L15_3,L16_3 do
L19_3=false
L20_3=pairs
L21_3=L18_3.Models
L20_3,L21_3,L22_3,L23_3=L20_3(L21_3)
for L24_3,L25_3 in L20_3,L21_3,L22_3,L23_3 do
L26_3=GetHashKey
L27_3=L25_3
L26_3=L26_3(L27_3)
if L12_3==L26_3 then
L19_3=true
end
end
if L19_3 then
L20_3=GetEntityCoords
L21_3=L11_3
L20_3=L20_3(L21_3)
L21_3=L1_3-L20_3
L21_3=#L21_3
L22_3=L18_3.Distance
if L21_3<=L22_3 then
L22_3={}
L22_3.scene=L18_3
L22_3.object=L11_3
L22_3.sceneId=L17_3
L3_3=L22_3
end
end
end
end
if not L3_3 then
L13_3=GetEntityCoords
L14_3=L11_3
L13_3=L13_3(L14_3)
L14_3=L1_3-L13_3
L14_3=#L14_3
L15_3=GetEntityModel
L16_3=L11_3
L15_3=L15_3(L16_3)
L16_3=Config
L16_3=L16_3.BagAttachments
L16_3=L16_3[L15_3]
if L16_3 and L5_3>L14_3 then
L16_3=IsEntityAttachedToAnyPed
L17_3=L11_3
L16_3=L16_3(L17_3)
if not L16_3 then
L4_3=L11_3
L5_3=L14_3
end
end
end
end
L6_3=L3_3
if L6_3 then
L6_3=L6_3.object
end
L7_3=L13_1
if L7_3 then
L7_3=L7_3.object
end
if L6_3==L7_3 then
L6_3=L14_1
if L4_3==L6_3 then
goto lbl_129
end
end
L6_3=Config
L6_3=L6_3.EnableBins
if L6_3 then
L13_1=L3_3
end
L6_3=L13_1
L6_3=L4_3 or L6_3
if nil ~=L6_3 or not L4_3 then
L6_3=nil
end
L14_1=L6_3
L6_3=L13_1
if not L6_3 then
L6_3=L14_1
if not L6_3 then
goto lbl_129
end
end
L6_3=L34_1
L6_3()
::lbl_129::
L6_3=Citizen
L6_3=L6_3.Wait
L7_3=300
L6_3(L7_3)
end
end
L6_2(L7_2)
L6_2=Citizen
L6_2=L6_2.CreateThread
function L7_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3
L0_3=L20_1
if not(L0_3<=0)then
L0_3=Config
L0_3=L0_3.HighlightOnTutorial
if L0_3 then
goto lbl_9
end
end
do return end
::lbl_9::
L0_3={}
L1_3=pairs
L2_3=Config
L2_3=L2_3.BagAttachments
L1_3,L2_3,L3_3,L4_3=L1_3(L2_3)
for L5_3,L6_3 in L1_3,L2_3,L3_3,L4_3 do
L7_3=tostring
L8_3=L5_3
L7_3=L7_3(L8_3)
L0_3[L7_3]=true
end
L1_3=Config
L1_3=L1_3.EnableBins
if L1_3 then
L1_3=1
L2_3=Config
L2_3=L2_3.Scenes
L2_3=#L2_3
L3_3=1
for L4_3=L1_3,L2_3,L3_3 do
L5_3=pairs
L6_3=Config
L6_3=L6_3.Scenes
L6_3=L6_3[L4_3]
L6_3=L6_3.Models
L5_3,L6_3,L7_3,L8_3=L5_3(L6_3)
for L9_3,L10_3 in L5_3,L6_3,L7_3,L8_3 do
L11_3=tostring
L12_3=GetHashKey
L13_3=L10_3
L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3=L12_3(L13_3)
L11_3=L11_3(L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3)
L0_3[L11_3]=true
end
end
end
L1_3=L20_1
L2_3=10.0
L3_3=500
L4_3={}
while true do
L5_3=OnDuty
if not L5_3 then
break
end
L5_3=Citizen
L5_3=L5_3.Wait
L6_3=L3_3
L5_3(L6_3)
L5_3=PlayerPedId
L5_3=L5_3()
L6_3=GetEntityCoords
L7_3=L5_3
L6_3=L6_3(L7_3)
L7_3={}
L8_3=EnumerateObjects
L8_3,L9_3,L10_3,L11_3=L8_3()
for L12_3 in L8_3,L9_3,L10_3,L11_3 do
L13_3=GetEntityModel
L14_3=L12_3
L13_3=L13_3(L14_3)
L14_3=DoesEntityExist
L15_3=L12_3
L14_3=L14_3(L15_3)
if L14_3 then
L14_3=tostring
L15_3=L13_3
L14_3=L14_3(L15_3)
L14_3=L0_3[L14_3]
if L14_3 then
L14_3=tostring
L15_3=L13_3
L14_3=L14_3(L15_3)
L15_3=L21_1
L14_3=L15_3[L14_3]
if not L14_3 then
L14_3=GetEntityCoords
L15_3=L12_3
L14_3=L14_3(L15_3)
L15_3=L6_3-L14_3
L15_3=#L15_3
if L2_3>=L15_3 then
L16_3=Entity
L17_3=L12_3
L16_3=L16_3(L17_3)
L16_3=L16_3.state
L16_3=L16_3.GarbageBlock
if not L16_3 then
L16_3=IsEntityAttachedToAnyPed
L17_3=L12_3
L16_3=L16_3(L17_3)
if not L16_3 then
L16_3=#L7_3
L16_3=L16_3+1
L17_3={}
L17_3.object=L12_3
L17_3.distance=L15_3
L7_3[L16_3]=L17_3
end
end
end
end
end
end
end
L8_3=table
L8_3=L8_3.sort
L9_3=L7_3
function L10_3(A0_4,A1_4)
local L2_4,L3_4
L2_4=A0_4.distance
L3_4=A1_4.distance
L2_4=L2_4<L3_4
return L2_4
end
L8_3(L9_3,L10_3)
L8_3={}
L9_3=1
L10_3=math
L10_3=L10_3.min
L11_3=L1_3
L12_3=#L7_3
L10_3=L10_3(L11_3,L12_3)
L11_3=1
for L12_3=L9_3,L10_3,L11_3 do
L13_3=SetEntityDrawOutline
L14_3=L7_3[L12_3]
L14_3=L14_3.object
L15_3=true
L13_3(L14_3,L15_3)
L13_3=SetEntityDrawOutlineColor
L14_3=89
L15_3=198
L16_3=100
L17_3=130
L13_3(L14_3,L15_3,L16_3,L17_3)
L13_3=tostring
L14_3=L7_3[L12_3]
L14_3=L14_3.object
L13_3=L13_3(L14_3)
L8_3[L13_3]=true
end
L9_3=pairs
L10_3=L4_3
L9_3,L10_3,L11_3,L12_3=L9_3(L10_3)
for L13_3,L14_3 in L9_3,L10_3,L11_3,L12_3 do
L15_3=L8_3[L13_3]
if not L15_3 then
L15_3=tonumber
L16_3=L13_3
L15_3=L15_3(L16_3)
if L15_3 then
L16_3=SetEntityDrawOutline
L17_3=L15_3
L18_3=false
L16_3(L17_3,L18_3)
end
end
end
L4_3=L8_3
end
L5_3={}
L21_1=L5_3
end
L6_2(L7_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNetEvent
L36_1="17mov_GarbageCollector:client:fixRotation"
function L37_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2
L1_2=NetworkDoesEntityExistWithNetworkId
L2_2=A0_2
L1_2=L1_2(L2_2)
if not L1_2 then
return
end
L1_2=NetToObj
L2_2=A0_2
L1_2=L1_2(L2_2)
L2_2=json
L2_2=L2_2.decode
L3_2=Entity
L4_2=L1_2
L3_2=L3_2(L4_2)
L3_2=L3_2.state
L3_2=L3_2.validPos
L2_2=L2_2(L3_2)
L3_2=SetEntityCoordsNoOffset
L4_2=L1_2
L5_2=L2_2.coords
L5_2=L5_2.x
L6_2=L2_2.coords
L6_2=L6_2.y
L7_2=L2_2.coords
L7_2=L7_2.z
L8_2=true
L9_2=true
L10_2=true
L3_2(L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2)
L3_2=SetEntityRotation
L4_2=L1_2
L5_2=L2_2.rotation
L5_2=L5_2.x
L6_2=L2_2.rotation
L6_2=L6_2.y
L7_2=L2_2.rotation
L7_2=L7_2.z
L8_2=0
L9_2=false
L3_2(L4_2,L5_2,L6_2,L7_2,L8_2,L9_2)
end
L35_1(L36_1,L37_1)
L35_1=Citizen
L35_1=L35_1.CreateThread
function L36_1()
local L0_2,L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2
L0_2=Config
L0_2=L0_2.FixBinsPosition
if not L0_2 then
return
end
L0_2={}
L1_2=pairs
L2_2=Config
L2_2=L2_2.BagAttachments
L1_2,L2_2,L3_2,L4_2=L1_2(L2_2)
for L5_2,L6_2 in L1_2,L2_2,L3_2,L4_2 do
L7_2=tostring
L8_2=L5_2
L7_2=L7_2(L8_2)
L0_2[L7_2]=true
end
L1_2=1
L2_2=Config
L2_2=L2_2.Scenes
L2_2=#L2_2
L3_2=1
for L4_2=L1_2,L2_2,L3_2 do
L5_2=pairs
L6_2=Config
L6_2=L6_2.Scenes
L6_2=L6_2[L4_2]
L6_2=L6_2.Models
L5_2,L6_2,L7_2,L8_2=L5_2(L6_2)
for L9_2,L10_2 in L5_2,L6_2,L7_2,L8_2 do
L11_2=tostring
L12_2=GetHashKey
L13_2=L10_2
L12_2,L13_2=L12_2(L13_2)
L11_2=L11_2(L12_2,L13_2)
L0_2[L11_2]=true
end
end
L1_2=5000
L2_2={}
function L3_2(A0_3,A1_3)
local L2_3,L3_3
L2_3=Citizen
L2_3=L2_3.CreateThread
function L3_3()
local L0_4,L1_4,L2_4,L3_4,L4_4,L5_4
L0_4=Entity
L1_4=A0_3
L0_4=L0_4(L1_4)
L0_4=L0_4.state
L0_4=L0_4.validPos
if L0_4 then
L0_4=5000
L1_4=GetGameTimer
L1_4=L1_4()
while true do
L2_4=NetworkGetEntityOwner
L3_4=A0_3
L2_4=L2_4(L3_4)
if-1 ~=L2_4 then
break
end
L2_4=GetGameTimer
L2_4=L2_4()
L2_4=L2_4-L1_4
if L0_4<L2_4 then
return
end
L2_4=Citizen
L2_4=L2_4.Wait
L3_4=50
L2_4(L3_4)
end
L2_4=GetPlayerServerId
L3_4=NetworkGetEntityOwner
L4_4=A0_3
L3_4,L4_4,L5_4=L3_4(L4_4)
L2_4=L2_4(L3_4,L4_4,L5_4)
L3_4=GetPlayerServerId
L4_4=PlayerId
L4_4,L5_4=L4_4()
L3_4=L3_4(L4_4,L5_4)
if L2_4==L3_4 then
L2_4=DoesEntityExist
L3_4=A0_3
L2_4=L2_4(L3_4)
if L2_4 then
L2_4=TriggerServerEvent
L3_4="17mov_GarbageCollector:server:fixRotation"
L4_4=ObjToNet
L5_4=A0_3
L4_4,L5_4=L4_4(L5_4)
L2_4(L3_4,L4_4,L5_4)
end
end
end
end
L2_3(L3_3)
end
while true do
L4_2={}
L5_2=EnumerateObjects
L5_2,L6_2,L7_2,L8_2=L5_2()
for L9_2 in L5_2,L6_2,L7_2,L8_2 do
L10_2=GetEntityModel
L11_2=L9_2
L10_2=L10_2(L11_2)
L11_2=DoesEntityExist
L12_2=L9_2
L11_2=L11_2(L12_2)
if L11_2 then
L11_2=tostring
L12_2=L10_2
L11_2=L11_2(L12_2)
L11_2=L0_2[L11_2]
if L11_2 then
L11_2=tostring
L12_2=L9_2
L11_2=L11_2(L12_2)
L4_2[L11_2]=L10_2
L11_2=tostring
L12_2=L9_2
L11_2=L11_2(L12_2)
L11_2=L2_2[L11_2]
if not L11_2 then
L11_2=L3_2
L12_2=L9_2
L13_2=L10_2
L11_2(L12_2,L13_2)
end
end
end
end
L2_2=L4_2
L5_2=Citizen
L5_2=L5_2.Wait
L6_2=L1_2
L5_2(L6_2)
end
end
L35_1(L36_1)
function L35_1()
local L0_2,L1_2
L0_2=coroutine
L0_2=L0_2.wrap
function L1_2()
local L0_3,L1_3,L2_3,L3_3,L4_3
L0_3=FindFirstObject
L0_3,L1_3=L0_3()
if-1==L0_3 then
return
end
L2_3=nil
repeat
L3_3=coroutine
L3_3=L3_3.yield
L4_3=L1_3
L3_3(L4_3)
L3_3=FindNextObject
L4_3=L0_3
L3_3,L4_3=L3_3(L4_3)
L1_3=L4_3
L2_3=L3_3
until not L2_3
L3_3=EndFindObject
L4_3=L0_3
L3_3(L4_3)
end
return L0_2(L1_2)
end
EnumerateObjects=L35_1
L35_1=RegisterNetEvent
L36_1="multiplayerGarbage:searchDumpster"
function L37_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2
L1_2=GetEntityModel
L2_2=A0_2.entity
L1_2=L1_2(L2_2)
L2_2=Entity
L3_2=A0_2.entity
L2_2=L2_2(L3_2)
L2_2=L2_2.state
L2_2=L2_2.GarbageOccupied
if not L2_2 then
L2_2=IsHoldingTrash
L2_2=L2_2()
if not L2_2 then
goto lbl_16
end
end
do return end
::lbl_16::
L2_2=1
L3_2=Config
L3_2=L3_2.Scenes
L3_2=#L3_2
L4_2=1
for L5_2=L2_2,L3_2,L4_2 do
L6_2=pairs
L7_2=Config
L7_2=L7_2.Scenes
L7_2=L7_2[L5_2]
L7_2=L7_2.Models
L6_2,L7_2,L8_2,L9_2=L6_2(L7_2)
for L10_2,L11_2 in L6_2,L7_2,L8_2,L9_2 do
L12_2=GetHashKey
L13_2=L11_2
L12_2=L12_2(L13_2)
if L12_2==L1_2 then
L12_2=StartScene
L13_2=Config
L13_2=L13_2.Scenes
L13_2=L13_2[L5_2]
L14_2=L5_2
L15_2=A0_2.entity
L12_2(L13_2,L14_2,L15_2)
end
end
end
end
L35_1(L36_1,L37_1)
L35_1=RegisterNetEvent
L36_1="multiplayerGarbage:collectBag"
function L37_1(A0_2)
local L1_2,L2_2
L1_2=IsEntityAttachedToAnyPed
L2_2=A0_2.entity
L1_2=L1_2(L2_2)
if not L1_2 then
L1_2=Entity
L2_2=A0_2.entity
L1_2=L1_2(L2_2)
L1_2=L1_2.state
L1_2=L1_2.GarbageBlock
if not L1_2 then
goto lbl_14
end
end
do return end
::lbl_14::
L1_2=PickTrash
L2_2=A0_2.entity
L1_2(L2_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNetEvent
L36_1="multiplayerGarbage:PutIn"
function L37_1(...)
local L0_2,L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2
L0_2=IsHoldingTrash
L0_2=L0_2()
if not L0_2 then
return
end
L0_2=(...)
L1_2=PlayerPedId
L1_2=L1_2()
L2_2=GetEntityCoords
L3_2=L1_2
L2_2=L2_2(L3_2)
L3_2=GetModelDimensions
L4_2=Config
L4_2=L4_2.JobVehicleModel
L3_2,L4_2=L3_2(L4_2)
L5_2=GetOffsetFromEntityInWorldCoords
L6_2=L0_1
L7_2=0.0
L8_2=L3_2.y
L9_2=0.5
L5_2=L5_2(L6_2,L7_2,L8_2,L9_2)
L6_2=L2_2-L5_2
L6_2=#L6_2
L7_2=GetEntityHeading
L8_2=L0_1
L7_2=L7_2(L8_2)
L8_2=GetEntityHeading
L9_2=L1_2
L8_2=L8_2(L9_2)
L9_2=math
L9_2=L9_2.abs
L10_2=L7_2-L8_2
L9_2=L9_2(L10_2)
L10_2=JobVehicleNetId
if L10_2 then
L10_2=JobVehicleNetId
if not L10_2 then
goto lbl_55
end
L10_2=L0_2.entity
L11_2=L23_1
L12_2=JobVehicleNetId
L11_2=L11_2(L12_2)
if L10_2==L11_2 then
goto lbl_55
end
end
L10_2=Notify
L11_2=_L
L12_2="Job.Gameplay.InvalidVehicle"
L11_2,L12_2=L11_2(L12_2)
do return L10_2(L11_2,L12_2)end
::lbl_55::
L10_2=180
if L9_2>L10_2 then
L10_2=360
L9_2=L10_2-L9_2
end
if L6_2<1.0 then
L10_2=ThrowTrash
L11_2=L0_1
L12_2=L2_1
L10_2(L11_2,L12_2)
else
L10_2=Notify
L11_2=_L
L12_2="Job.Gameplay.InvalidPosition"
L11_2,L12_2=L11_2(L12_2)
L10_2(L11_2,L12_2)
end
end
L35_1(L36_1,L37_1)
function L35_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2
L1_2=PlayerPedId
L1_2=L1_2()
L2_2=GetEntityModel
L3_2=A0_2
L2_2=L2_2(L3_2)
L3_2=GetEntityCoords
L4_2=A0_2
L3_2=L3_2(L4_2)
L4_2=nil
L5_2=NetworkGetEntityIsNetworked
L6_2=A0_2
L5_2=L5_2(L6_2)
if L5_2 then
L5_2=ObjToNet
L6_2=A0_2
L5_2=L5_2(L6_2)
L4_2=L5_2
end
L5_2=CheckServerAllow
L6_2=L3_2
L7_2=NetworkGetEntityIsNetworked
L8_2=A0_2
L7_2=L7_2(L8_2)
L7_2=not L7_2
L8_2=L4_2
L5_2=L5_2(L6_2,L7_2,L8_2)
if not L5_2 then
return
end
L5_2=Config
L5_2=L5_2.BagAttachments
L5_2=L5_2[L2_2]
if not L5_2 then
L5_2=TriggerServerEvent
L6_2="17mov_GarbageCollector:server:clearRequest"
L5_2(L6_2)
L5_2=Functions
L5_2=L5_2.Print
L6_2="CANNOT FIND OFFSET DATA FOR THE PROVIDED BAG."
return L5_2(L6_2)
end
L5_2=Config
L5_2=L5_2.BagAttachments
L5_2=L5_2[L2_2]
L6_2=GetEntityCoords
L7_2=L1_2
L6_2=L6_2(L7_2)
L7_2=GetEntityHeading
L8_2=L1_2
L7_2=L7_2(L8_2)
L8_2=L3_2.x
L9_2=L6_2.x
L8_2=L8_2-L9_2
L9_2=L3_2.y
L10_2=L6_2.y
L9_2=L9_2-L10_2
L10_2=math
L10_2=L10_2.deg
L11_2=math
L11_2=L11_2.atan2
L12_2=L9_2
L13_2=L8_2
L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2=L11_2(L12_2,L13_2)
L10_2=L10_2(L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2)
L11_2=L10_2-L7_2
L11_2=L11_2-90
L11_2=-L11_2
L12_2=180
if L11_2>L12_2 then
L11_2=L11_2-360
else
L12_2=-180
if L11_2<L12_2 then
L11_2=L11_2+360
end
end
L12_2="pickup"
L13_2=16
if L11_2>=-15 and L11_2<=15 then
L12_2="pickup"
L13_2=16
elseif L11_2>15 and L11_2<=60 then
L12_2="pickup_45_r"
L13_2=14
elseif L11_2<-15 and L11_2>=-60 then
L12_2="pickup_45_l"
L13_2=15
elseif L11_2>60 and L11_2<=120 then
L12_2="pickup_90_r"
L13_2=14
elseif L11_2<-60 and L11_2>=-120 then
L12_2="pickup_90_l"
L13_2=14
end
L14_2=L13_2*33.333333333333336
L15_2=Functions
L15_2=L15_2.RequestAnimDict
L16_2="anim@heists@narcotics@trash"
L15_2(L16_2)
L15_2=TaskTurnPedToFaceEntity
L16_2=L1_2
L17_2=A0_2
L18_2=1000
L15_2(L16_2,L17_2,L18_2)
L15_2=Wait
L16_2=300
L15_2(L16_2)
L15_2=TaskPlayAnim
L16_2=L1_2
L17_2="anim@heists@narcotics@trash"
L18_2=L12_2
L19_2=2.0
L20_2=2.0
L21_2=-1
L22_2=49
L23_2=0
L24_2=false
L25_2=false
L26_2=false
L15_2(L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2)
L15_2=Citizen
L15_2=L15_2.Wait
L16_2=L14_2 or L16_2
if not L14_2 then
L16_2=500
end
L15_2(L16_2)
L15_2={}
L16_2=GetEntityCoords
L17_2=PlayerPedId
L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2=L17_2()
L16_2=L16_2(L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2)
L17_2=pairs
L18_2=GetActivePlayers
L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2=L18_2()
L17_2,L18_2,L19_2,L20_2=L17_2(L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2)
for L21_2,L22_2 in L17_2,L18_2,L19_2,L20_2 do
L23_2=GetPlayerPed
L24_2=L22_2
L23_2=L23_2(L24_2)
if L23_2 ~=L1_2 then
L24_2=GetEntityCoords
L25_2=GetPlayerPed
L26_2=L22_2
L25_2,L26_2,L27_2=L25_2(L26_2)
L24_2=L24_2(L25_2,L26_2,L27_2)
L24_2=L24_2-L16_2
L24_2=#L24_2
L25_2=200.0
if L24_2<L25_2 then
L24_2=table
L24_2=L24_2.insert
L25_2=L15_2
L26_2=GetPlayerServerId
L27_2=L22_2
L26_2,L27_2=L26_2(L27_2)
L24_2(L25_2,L26_2,L27_2)
end
end
end
L17_2=NetworkGetEntityOwner
L18_2=A0_2
L17_2=L17_2(L18_2)
if-1==L17_2 then
L17_2=Functions
L17_2=L17_2.DeleteEntity
L18_2=A0_2
L17_2(L18_2)
L17_2=TriggerServerEvent
L18_2="17mov_GarbageCollector:BagCollected"
L19_2=L15_2
L20_2={}
L20_2.coords=L3_2
L20_2.model=L2_2
L17_2(L18_2,L19_2,L20_2)
else
L17_2=NetworkGetEntityOwner
L18_2=A0_2
L17_2=L17_2(L18_2)
L18_2=PlayerId
L18_2=L18_2()
if L17_2 ~=L18_2 then
L17_2=ObjToNet
L18_2=A0_2
L17_2=L17_2(L18_2)
if L17_2 then
L18_2=TriggerServerEvent
L19_2="17mov_GarbageCollector:server:BagCollected"
L20_2=L17_2
L18_2(L19_2,L20_2)
end
else
L17_2=NetworkGetEntityOwner
L18_2=A0_2
L17_2=L17_2(L18_2)
L18_2=PlayerId
L18_2=L18_2()
if L17_2==L18_2 then
L17_2=Functions
L17_2=L17_2.DeleteEntity
L18_2=A0_2
L17_2(L18_2)
end
end
end
while true do
L17_2=DoesEntityExist
L18_2=A0_2
L17_2=L17_2(L18_2)
if not L17_2 then
break
end
L17_2=Wait
L18_2=1
L17_2(L18_2)
end
L17_2=Functions
L17_2=L17_2.SpawnObject
L18_2=L2_2
function L19_2(A0_3)
local L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3
L1_3=GetEntityRotation
L2_3=A0_2
L1_3=L1_3(L2_3)
L2_3=Functions
L2_3=L2_3.GetBoneIndexByName
L3_3=L1_2
L4_3="SKEL_R_HAND"
L2_3=L2_3(L3_3,L4_3)
if nil==L2_3 then
L3_3=Functions
L3_3=L3_3.DeleteEntity
L4_3=A0_3
L3_3(L4_3)
L3_3=Functions
L3_3=L3_3.DeleteEntity
L4_3=A0_2
return L3_3(L4_3)
end
L2_1=A0_3
L3_3=OnBagPickup
L4_3=L2_1
L3_3(L4_3)
L3_3=SetEntityRotation
L4_3=A0_3
L5_3=L1_3.x
L6_3=L1_3.y
L7_3=L1_3.z
L8_3=2
L9_3=false
L3_3(L4_3,L5_3,L6_3,L7_3,L8_3,L9_3)
L3_3=AttachEntityToEntity
L4_3=A0_3
L5_3=L1_2
L6_3=L2_3
L7_3=L5_2.offset
L7_3=L7_3.x
L8_3=L5_2.offset
L8_3=L8_3.y
L9_3=L5_2.offset
L9_3=L9_3.z
L10_3=L5_2.rotation
L10_3=L10_3.x
L11_3=L5_2.rotation
L11_3=L11_3.y
L12_3=L5_2.rotation
L12_3=L12_3.z
L13_3=false
L14_3=false
L15_3=false
L16_3=true
L17_3=1
L18_3=true
L3_3(L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3)
end
L20_2=L3_2
L21_2=true
L22_2=false
L17_2(L18_2,L19_2,L20_2,L21_2,L22_2)
L17_2=Citizen
L17_2=L17_2.Wait
L18_2=L14_2 or L18_2
if not L14_2 then
L18_2=500
end
L17_2(L18_2)
L17_2=TriggerServerEvent
L18_2="17mov_GarbageCollector:server:clearRequest"
L17_2(L18_2)
L17_2=PlayBagWearingAnim
L17_2()
end
PickTrash=L35_1
L35_1=Functions
function L36_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2
L2_2=nil
L3_2=5
L4_2=GetGamePool
L5_2="CObject"
L4_2=L4_2(L5_2)
L5_2=ipairs
L6_2=L4_2
L5_2,L6_2,L7_2,L8_2=L5_2(L6_2)
for L9_2,L10_2 in L5_2,L6_2,L7_2,L8_2 do
L11_2=GetEntityModel
L12_2=L10_2
L11_2=L11_2(L12_2)
if L11_2==A1_2 then
L12_2=GetEntityCoords
L13_2=L10_2
L12_2=L12_2(L13_2)
L13_2=L12_2-A0_2
L13_2=#L13_2
if nil==L3_2 or L3_2>L13_2 then
L2_2=L10_2
L3_2=L13_2
end
end
end
L5_2=L2_2
L6_2=L3_2
return L5_2,L6_2
end
L35_1.GetObjectOfTypeAtGivenCoords=L36_1
L35_1=RegisterNetEvent
L36_1="17mov_GarbageCollector:BagCollected"
function L37_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2
L1_2=nil
L2_2=5
L3_2=GetGamePool
L4_2="CObject"
L3_2=L3_2(L4_2)
L4_2=ipairs
L5_2=L3_2
L4_2,L5_2,L6_2,L7_2=L4_2(L5_2)
for L8_2,L9_2 in L4_2,L5_2,L6_2,L7_2 do
L10_2=GetEntityModel
L11_2=L9_2
L10_2=L10_2(L11_2)
L11_2=A0_2.model
if L10_2==L11_2 then
L11_2=NetworkGetEntityOwner
L12_2=L9_2
L11_2=L11_2(L12_2)
if-1==L11_2 then
L11_2=GetEntityCoords
L12_2=L9_2
L11_2=L11_2(L12_2)
L12_2=vector3
L13_2=A0_2.coords
L13_2=L13_2.x
L14_2=A0_2.coords
L14_2=L14_2.y
L15_2=A0_2.coords
L15_2=L15_2.z
L12_2=L12_2(L13_2,L14_2,L15_2)
L12_2=L11_2-L12_2
L12_2=#L12_2
if nil==L2_2 or L2_2>L12_2 then
L1_2=L9_2
L2_2=L12_2
end
end
end
end
if L1_2 and L2_2 then
L4_2=Functions
L4_2=L4_2.RequestControlOfEntity
L5_2=L1_2
L4_2(L5_2)
L4_2=Functions
L4_2=L4_2.DeleteEntity
L5_2=L1_2
L4_2(L5_2)
end
L4_2=Config
L4_2=L4_2.BlockBagsRespawning
if L4_2 then
L4_2=table
L4_2=L4_2.insert
L5_2=L11_1
L6_2={}
L7_2=A0_2.model
L6_2.model=L7_2
L7_2=A0_2.coords
L6_2.coords=L7_2
L7_2=GetGameTimer
L7_2=L7_2()
L6_2.time=L7_2
L4_2(L5_2,L6_2)
end
end
L35_1(L36_1,L37_1)
L35_1=Config
L35_1=L35_1.BlockBagsRespawning
if L35_1 then
L35_1=CreateThread
function L36_1()
local L0_2,L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2
while true do
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=1000
L0_2(L1_2)
L0_2=pairs
L1_2=L11_1
L0_2,L1_2,L2_2,L3_2=L0_2(L1_2)
for L4_2,L5_2 in L0_2,L1_2,L2_2,L3_2 do
L6_2=GetGameTimer
L6_2=L6_2()
L7_2=L5_2.time
L6_2=L6_2-L7_2
L7_2=Config
L7_2=L7_2.BagRespawnTime
if L6_2<L7_2 then
L6_2=GetGamePool
L7_2="CObject"
L6_2=L6_2(L7_2)
L7_2=ipairs
L8_2=L6_2
L7_2,L8_2,L9_2,L10_2=L7_2(L8_2)
for L11_2,L12_2 in L7_2,L8_2,L9_2,L10_2 do
L13_2=GetEntityModel
L14_2=L12_2
L13_2=L13_2(L14_2)
L14_2=GetEntityCoords
L15_2=L12_2
L14_2=L14_2(L15_2)
L15_2=vector3
L16_2=L5_2.coords
L16_2=L16_2.x
L17_2=L5_2.coords
L17_2=L17_2.y
L18_2=L5_2.coords
L18_2=L18_2.z
L15_2=L15_2(L16_2,L17_2,L18_2)
L15_2=L14_2-L15_2
L15_2=#L15_2
L16_2=L5_2.model
if L13_2==L16_2 then
L16_2=0.1
if L15_2<L16_2 then
L16_2=NetworkGetEntityOwner
L17_2=L12_2
L16_2=L16_2(L17_2)
if-1==L16_2 then
L16_2=Functions
L16_2=L16_2.RequestControlOfEntity
L17_2=L12_2
L16_2(L17_2)
L16_2=Functions
L16_2=L16_2.DeleteEntity
L17_2=L12_2
L16_2(L17_2)
end
end
end
end
else
L6_2=table
L6_2=L6_2.remove
L7_2=L11_1
L8_2=L4_2
L6_2(L7_2,L8_2)
end
end
end
end
L35_1(L36_1)
end
function L35_1()
local L0_2,L1_2,L2_2,L3_2
L0_2=0
L1_2=false
L2_2=Functions
L2_2=L2_2.RequestAnimDict
L3_2="anim@heists@narcotics@trash"
L2_2(L3_2)
L2_2=Citizen
L2_2=L2_2.CreateThread
function L3_2()
local L0_3,L1_3,L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3
while true do
L0_3=L2_1
if 0==L0_3 then
break
end
L0_3=DoesEntityExist
L1_3=L2_1
L0_3=L0_3(L1_3)
if not L0_3 then
break
end
L0_3=PlayerPedId
L0_3=L0_3()
L1_3=IsPedInAnyVehicle
L2_3=L0_3
L3_3=false
L1_3=L1_3(L2_3,L3_3)
if not L1_3 then
L1_3=IsPedOnFoot
L2_3=L0_3
L1_3=L1_3(L2_3)
if L1_3 then
L1_3=IsPedFalling
L2_3=L0_3
L1_3=L1_3(L2_3)
if not L1_3 then
L1_3=IsPedRagdoll
L2_3=L0_3
L1_3=L1_3(L2_3)
if not L1_3 then
L1_3=IsPedDeadOrDying
L2_3=L0_3
L3_3=false
L1_3=L1_3(L2_3,L3_3)
if not L1_3 then
L1_3=IsPedClimbing
L2_3=L0_3
L1_3=L1_3(L2_3)
if not L1_3 then
L1_3=IsPedStill
L2_3=L0_3
L1_3=L1_3(L2_3)
if L1_3 then
L1_3=L0_2
L2_3=GetFrameTime
L2_3=L2_3()
L1_3=L1_3+L2_3
L0_2=L1_3
L1_3=L1_2
if L1_3 then
L1_3=IsEntityPlayingAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle_fidget"
L5_3=3
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3)
if not L1_3 then
L1_3=false
L1_2=L1_3
L1_3=0
L0_2=L1_3
end
else
L1_3=L0_2
if L1_3>=10.0 then
L1_3=math
L1_3=L1_3.random
L2_3=1
L3_3=100
L1_3=L1_3(L2_3,L3_3)
if L1_3<=10 then
L1_3=TaskPlayAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle_fidget"
L5_3=1.0
L6_3=1.0
L7_3=-1
L8_3=49
L9_3=0
L10_3=false
L11_3=false
L12_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3)
L1_3=true
L1_2=L1_3
else
L1_3=IsEntityPlayingAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle"
L5_3=3
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3)
if not L1_3 then
L1_3=TaskPlayAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle"
L5_3=1.0
L6_3=1.0
L7_3=-1
L8_3=49
L9_3=0
L10_3=false
L11_3=false
L12_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3)
end
end
else
L1_3=IsEntityPlayingAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle"
L5_3=3
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3)
if not L1_3 then
L1_3=L1_2
if not L1_3 then
L1_3=TaskPlayAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle"
L5_3=1.0
L6_3=1.0
L7_3=-1
L8_3=49
L9_3=0
L10_3=false
L11_3=false
L12_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3)
end
end
end
end
else
L1_3=IsPedWalking
L2_3=L0_3
L1_3=L1_3(L2_3)
if L1_3 then
L1_3=0
L0_2=L1_3
L1_3=IsEntityPlayingAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="walk"
L5_3=3
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3)
if not L1_3 then
L1_3=TaskPlayAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="walk"
L5_3=2.5
L6_3=2.5
L7_3=-1
L8_3=49
L9_3=0
L10_3=false
L11_3=false
L12_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3)
end
L1_3=false
L1_2=L1_3
else
L1_3=IsPedRunning
L2_3=L0_3
L1_3=L1_3(L2_3)
if not L1_3 then
L1_3=IsPedSprinting
L2_3=L0_3
L1_3=L1_3(L2_3)
if not L1_3 then
goto lbl_210
end
end
L1_3=0
L0_2=L1_3
L1_3=IsEntityPlayingAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="run"
L5_3=3
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3)
if not L1_3 then
L1_3=TaskPlayAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="run"
L5_3=1.0
L6_3=1.0
L7_3=-1
L8_3=49
L9_3=0
L10_3=false
L11_3=false
L12_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3)
end
L1_3=false
L1_2=L1_3
goto lbl_241
::lbl_210::
L1_3=0
L0_2=L1_3
L1_3=IsEntityPlayingAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle"
L5_3=3
L1_3=L1_3(L2_3,L3_3,L4_3,L5_3)
if not L1_3 then
L1_3=L1_2
if not L1_3 then
L1_3=TaskPlayAnim
L2_3=L0_3
L3_3="anim@heists@narcotics@trash"
L4_3="idle"
L5_3=1.0
L6_3=1.0
L7_3=-1
L8_3=49
L9_3=0
L10_3=false
L11_3=false
L12_3=false
L1_3(L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3)
end
end
end
end
end
end
end
end
end
else
L1_3=0
L0_2=L1_3
L1_3=false
L1_2=L1_3
end
::lbl_241::
L1_3=Config
L1_3=L1_3.UseTarget
if not L1_3 then
L1_3=GetEntityCoords
L2_3=L0_3
L1_3=L1_3(L2_3)
L2_3=GetOffsetFromEntityInWorldCoords
L3_3=L0_1
L4_3=0.0
L5_3=-5.0
L6_3=0.5
L2_3=L2_3(L3_3,L4_3,L5_3,L6_3)
L3_3=L1_3-L2_3
L3_3=#L3_3
L4_3=GetEntityHeading
L5_3=L0_1
L4_3=L4_3(L5_3)
L5_3=GetEntityHeading
L6_3=L0_3
L5_3=L5_3(L6_3)
L6_3=math
L6_3=L6_3.abs
L7_3=L4_3-L5_3
L6_3=L6_3(L7_3)
L7_3=180
if L6_3>L7_3 then
L7_3=360
L6_3=L7_3-L6_3
end
if L3_3<1.0 then
L7_3=DrawText3Ds
L8_3=L2_3.x
L9_3=L2_3.y
L10_3=L2_3.z
L11_3=Config
L11_3=L11_3.KeybindSettings
L11_3=L11_3.bagsInteractionkeyString
L12_3=_L
L13_3="Job.Gameplay.Throw"
L12_3=L12_3(L13_3)
L11_3=L11_3 .. L12_3
L7_3(L8_3,L9_3,L10_3,L11_3)
L7_3=IsControlJustReleased
L8_3=0
L9_3=Config
L9_3=L9_3.KeybindSettings
L9_3=L9_3.bagsInteractionKey
L7_3=L7_3(L8_3,L9_3)
if L7_3 then
L7_3=ThrowTrash
L8_3=L0_1
L9_3=L2_1
L7_3(L8_3,L9_3)
end
else
L7_3=IsControlJustReleased
L8_3=0
L9_3=Config
L9_3=L9_3.KeybindSettings
L9_3=L9_3.bagsInteractionKey
L7_3=L7_3(L8_3,L9_3)
if L7_3 then
L7_3=DetachEntity
L8_3=L2_1
L9_3=true
L10_3=true
L7_3(L8_3,L9_3,L10_3)
L7_3=OnBagDetach
L8_3=L2_1
L7_3(L8_3)
L7_3=Citizen
L7_3=L7_3.CreateThread
function L8_3()
local L0_4,L1_4
L0_4=Wait
L1_4=2
L0_4(L1_4)
L0_4=0
L2_1=L0_4
L0_4=ClearPedTasks
L1_4=L0_3
L0_4(L1_4)
end
L7_3(L8_3)
end
end
else
L1_3=IsControlJustReleased
L2_3=0
L3_3=Config
L3_3=L3_3.KeybindSettings
L3_3=L3_3.bagsInteractionKey
L1_3=L1_3(L2_3,L3_3)
if L1_3 then
L1_3=DetachEntity
L2_3=L2_1
L3_3=true
L4_3=true
L1_3(L2_3,L3_3,L4_3)
L1_3=OnBagDetach
L2_3=L2_1
L1_3(L2_3)
L1_3=Citizen
L1_3=L1_3.CreateThread
function L2_3()
local L0_4,L1_4
L0_4=Wait
L1_4=2
L0_4(L1_4)
L0_4=0
L2_1=L0_4
L0_4=ClearPedTasks
L1_4=L0_3
L0_4(L1_4)
end
L1_3(L2_3)
end
end
L1_3=Citizen
L1_3=L1_3.Wait
L2_3=0
L1_3(L2_3)
end
end
L2_2(L3_2)
end
PlayBagWearingAnim=L35_1
L35_1=RegisterNetEvent
L36_1="17mov_GarbageCollector:ToggleTrunk"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2
L2_2=NetworkGetEntityFromNetworkId
L3_2=A0_2
L2_2=L2_2(L3_2)
if L2_2 then
L3_2=DoesEntityExist
L4_2=L2_2
L3_2=L3_2(L4_2)
if L3_2 then
L3_2=GetEntityModel
L4_2=L2_2
L3_2=L3_2(L4_2)
if 1917016601==L3_2 then
if A1_2 then
L3_2=SetVehicleDoorOpen
L4_2=L2_2
L5_2=5
L6_2=false
L7_2=false
L3_2(L4_2,L5_2,L6_2,L7_2)
else
L3_2=SetVehicleDoorShut
L4_2=L2_2
L5_2=5
L6_2=false
L3_2(L4_2,L5_2,L6_2)
end
end
end
end
end
L35_1(L36_1,L37_1)
function L35_1()
local L0_2,L1_2
L0_2=L2_1
L0_2=0 ~=L0_2
return L0_2
end
IsHoldingTrash=L35_1
function L35_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2
L2_2=Functions
L2_2=L2_2.RequestControlOfEntity
L3_2=A1_2
L2_2=L2_2(L3_2)
if not L2_2 then
L2_2=Functions
L2_2=L2_2.Print
L3_2="CANNOT CHANGE PROP OWNERSHIP"
L2_2(L3_2)
end
L2_2=VehToNet
L3_2=A0_2
L2_2=L2_2(L3_2)
L3_2=TriggerServerEvent
L4_2="17mov_GarbageCollector:ToggleTrunk"
L5_2=L2_2
L6_2=true
L3_2(L4_2,L5_2,L6_2)
L3_2=PlayerPedId
L3_2=L3_2()
L4_2=GetEntityHeading
L5_2=L3_2
L4_2=L4_2(L5_2)
L5_2=GetEntityHeading
L6_2=A0_2
L5_2=L5_2(L6_2)
L6_2=GetGameTimer
L6_2=L6_2()
L7_2=300
L8_2=CreateThread
function L9_2()
local L0_3,L1_3,L2_3
while true do
L0_3=GetGameTimer
L0_3=L0_3()
L1_3=L6_2
L0_3=L0_3-L1_3
L1_3=2000
if not(L0_3<L1_3)then
break
end
L0_3=GetVehicleDoorAngleRatio
L1_3=A0_2
L2_3=5
L0_3=L0_3(L1_3,L2_3)
L1_3=0.1
if L0_3>L1_3 then
break
end
L0_3=Citizen
L0_3=L0_3.Wait
L1_3=100
L0_3(L1_3)
end
end
L8_2(L9_2)
while true do
L8_2=GetGameTimer
L8_2=L8_2()
L8_2=L8_2-L6_2
if not(L7_2>L8_2)then
break
end
L8_2=GetGameTimer
L8_2=L8_2()
L8_2=L8_2-L6_2
L8_2=L8_2/L7_2
L9_2=L5_2-L4_2
L10_2=180
if L9_2>L10_2 then
L9_2=L9_2-360
else
L10_2=-180
if L9_2<L10_2 then
L9_2=L9_2+360
end
end
L10_2=nil
if L9_2>0 then
L11_2=Functions
L11_2=L11_2.Lerp
L12_2=L4_2
L13_2=L4_2+L9_2
L14_2=L8_2
L11_2=L11_2(L12_2,L13_2,L14_2)
L10_2=L11_2
else
L11_2=Functions
L11_2=L11_2.Lerp
L12_2=L4_2
L13_2=L4_2+L9_2
L14_2=L8_2
L11_2=L11_2(L12_2,L13_2,L14_2)
L10_2=L11_2
end
L11_2=SetEntityHeading
L12_2=L3_2
L13_2=L10_2
L11_2(L12_2,L13_2)
L11_2=Citizen
L11_2=L11_2.Wait
L12_2=0
L11_2(L12_2)
end
L8_2=SetEntityHeading
L9_2=L3_2
L10_2=L5_2
L8_2(L9_2,L10_2)
L8_2=Functions
L8_2=L8_2.RequestAnimDict
L9_2="anim@heists@narcotics@trash"
L8_2(L9_2)
L8_2=0
L2_1=L8_2
L8_2=OnBagDetach
L9_2=L2_1
L8_2(L9_2)
L8_2=833.3333333333334
L9_2=GetEntityModel
L10_2=A1_2
L9_2=L9_2(L10_2)
L10_2=TaskPlayAnim
L11_2=L3_2
L12_2="anim@heists@narcotics@trash"
L13_2="throw_ranged_b"
L14_2=2.0
L15_2=2.0
L16_2=-1
L17_2=32
L18_2=0
L19_2=false
L20_2=false
L21_2=false
L10_2(L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2)
L10_2=Citizen
L10_2=L10_2.Wait
L11_2=L8_2 or L11_2
if not L8_2 then
L11_2=500
end
L10_2(L11_2)
L10_2=Functions
L10_2=L10_2.DeleteEntity
L11_2=A1_2
L10_2(L11_2)
L10_2=Citizen
L10_2=L10_2.Wait
L11_2=L8_2 or L11_2
if not L8_2 then
L11_2=500
end
L10_2(L11_2)
L10_2=ClearPedTasks
L11_2=L3_2
L10_2(L11_2)
L10_2=TriggerServerEvent
L11_2="17mov_Garbage:UpdateServerPartyBagsCounter"
L12_2=L9_2
L10_2(L11_2,L12_2)
L10_2=TriggerServerEvent
L11_2="17mov_GarbageCollector:ToggleTrunk"
L12_2=L2_2
L13_2=false
L10_2(L11_2,L12_2,L13_2)
end
ThrowTrash=L35_1
function L35_1(A0_2,A1_2,A2_2)
local L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2
L3_2=promise
L3_2=L3_2.new
L3_2=L3_2()
L4_2=Functions
L4_2=L4_2.TriggerServerCallback
L5_2="17mov_GarbageCollector:CheckAllow"
function L6_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=L3_2
L2_3=L1_3
L1_3=L1_3.resolve
L3_3=A0_3
L1_3(L2_3,L3_3)
end
L7_2=A0_2
L8_2=A1_2
L9_2=A2_2
L4_2(L5_2,L6_2,L7_2,L8_2,L9_2)
L4_2=Citizen
L4_2=L4_2.Await
L5_2=L3_2
return L4_2(L5_2)
end
CheckServerAllow=L35_1
function L35_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2
L1_2=promise
L1_2=L1_2.new
L1_2=L1_2()
L2_2=Functions
L2_2=L2_2.TriggerServerCallback
L3_2="17mov_GarbageCollector:server:GarbageGetOcupied"
function L4_2(A0_3)
local L1_3,L2_3,L3_3
L1_3=L1_2
L2_3=L1_3
L1_3=L1_3.resolve
L3_3=A0_3
L1_3(L2_3,L3_3)
end
L5_2=A0_2
L2_2(L3_2,L4_2,L5_2)
L2_2=Citizen
L2_2=L2_2.Await
L3_2=L1_2
return L2_2(L3_2)
end
IsGarbageOccupied=L35_1
function L35_1(A0_2,A1_2,A2_2)
local L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2
L3_2=Functions
L3_2.IsInAnim=true
L3_2=GetEntityModel
L4_2=A2_2
L3_2=L3_2(L4_2)
L4_2=1
L5_2=3
L6_2=A0_2.Stages
L6_2=#L6_2
L7_2=NetworkGetEntityIsNetworked
L8_2=A2_2
L7_2=L7_2(L8_2)
if not L7_2 then
L7_2=NetworkRegisterEntityAsNetworked
L8_2=A2_2
L7_2(L8_2)
while true do
L7_2=NetworkGetEntityIsNetworked
L8_2=A2_2
L7_2=L7_2(L8_2)
if L7_2 then
break
end
L7_2=Wait
L8_2=1
L7_2(L8_2)
end
L7_2=ObjToNet
L8_2=A2_2
L7_2=L7_2(L8_2)
while not L7_2 do
L8_2=ObjToNet
L9_2=A2_2
L8_2=L8_2(L9_2)
L7_2=L8_2
L8_2=Wait
L9_2=1
L8_2(L9_2)
end
L8_2=SetNetworkIdCanMigrate
L9_2=L7_2
L10_2=true
L8_2(L9_2,L10_2)
L8_2=SetNetworkIdExistsOnAllMachines
L9_2=L7_2
L10_2=true
L8_2(L9_2,L10_2)
L8_2=TriggerServerEvent
L9_2="17mov_GarbageCollector:server:GarbageSetOcupied"
L10_2=L7_2
L11_2=nil
L12_2={}
L13_2=GetEntityCoords
L14_2=A2_2
L13_2=L13_2(L14_2)
L12_2.coords=L13_2
L13_2=GetEntityRotation
L14_2=A2_2
L15_2=0
L13_2=L13_2(L14_2,L15_2)
L12_2.rotation=L13_2
L8_2(L9_2,L10_2,L11_2,L12_2)
else
L7_2=IsGarbageOccupied
L8_2=ObjToNet
L9_2=A2_2
L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2=L8_2(L9_2)
L7_2=L7_2(L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2)
if L7_2 then
L7_2=Functions
L7_2.IsInAnim=false
L7_2=print
L8_2="This is occupied"
return L7_2(L8_2)
end
end
L7_2=Entity
L8_2=A2_2
L7_2=L7_2(L8_2)
L7_2=L7_2.state
L7_2=L7_2.currentStage
if L7_2 then
L7_2=Entity
L8_2=A2_2
L7_2=L7_2(L8_2)
L7_2=L7_2.state
L4_2=L7_2.currentStage
end
L7_2=Config
L7_2=L7_2.Debug
L7_2=L7_2.enabled
if L7_2 then
L7_2=Config
L7_2=L7_2.Debug
L7_2=L7_2.bin_stage
L4_2=L7_2 or L4_2
if not L7_2 then
end
end
L7_2=Functions
L7_2=L7_2.DeepCopy
L8_2=A0_2.Stages
L8_2=L8_2[L4_2]
L7_2=L7_2(L8_2)
L8_2=GetOffsetFromEntityInWorldCoords
L9_2=A2_2
L10_2=L7_2.PlayerOffset
L10_2=L10_2.x
L11_2=L7_2.PlayerOffset
L11_2=L11_2.y
L12_2=L7_2.PlayerOffset
L12_2=L12_2.z
L8_2=L8_2(L9_2,L10_2,L11_2,L12_2)
L9_2=GetOffsetFromEntityInWorldCoords
L10_2=A2_2
L11_2=L7_2.Objects
L11_2=L11_2[2]
L11_2=L11_2.offset
L11_2=L11_2.x
L12_2=L7_2.Objects
L12_2=L12_2[2]
L12_2=L12_2.offset
L12_2=L12_2.y
L13_2=L7_2.Objects
L13_2=L13_2[2]
L13_2=L13_2.offset
L13_2=L13_2.z
L9_2=L9_2(L10_2,L11_2,L12_2,L13_2)
L10_2=nil
L11_2=pairs
L12_2=L7_2.Objects
L11_2,L12_2,L13_2,L14_2=L11_2(L12_2)
for L15_2,L16_2 in L11_2,L12_2,L13_2,L14_2 do
L17_2=L16_2.object
if "PlayerPed"==L17_2 then
L17_2=L7_2.Objects
L17_2=L17_2[L15_2]
L17_2.coords=L8_2
L17_2=L7_2.Objects
L17_2=L17_2[L15_2]
L18_2=GetEntityHeading
L19_2=A2_2
L18_2=L18_2(L19_2)
L17_2.heading=L18_2
else
L17_2=L16_2.object
if "SceneModel"==L17_2 then
L17_2=A0_2.Models
L17_2=L17_2[1]
L18_2=1
L19_2=A0_2.Models
L19_2=#L19_2
L20_2=1
for L21_2=L18_2,L19_2,L20_2 do
L22_2=GetEntityModel
L23_2=A2_2
L22_2=L22_2(L23_2)
L23_2=GetHashKey
L24_2=A0_2.Models
L24_2=L24_2[L21_2]
L23_2=L23_2(L24_2)
if L22_2==L23_2 then
L22_2=A0_2.Models
L17_2=L22_2[L21_2]
end
end
L18_2=L7_2.Objects
L18_2=L18_2[L15_2]
L18_2.model=L17_2
L18_2=L7_2.Objects
L18_2=L18_2[L15_2]
L18_2.object=A2_2
L18_2=L7_2.Objects
L18_2=L18_2[L15_2]
L18_2.coords=L9_2
L18_2=L7_2.Objects
L18_2=L18_2[L15_2]
L18_2.IsSceneObject=true
end
end
end
L11_2=pairs
L12_2=L7_2.Objects
L11_2,L12_2,L13_2,L14_2=L11_2(L12_2)
for L15_2,L16_2 in L11_2,L12_2,L13_2,L14_2 do
L17_2=L16_2.object
if "PlayerPed" ~=L17_2 then
L17_2=L16_2.object
if "SceneModel" ~=L17_2 then
L17_2=L16_2.attachment
if L17_2 then
L5_2=L15_2
L17_2=GetHashKey
L18_2=L16_2.model
L17_2=L17_2(L18_2)
L10_2=L17_2
end
end
end
end
L11_2=L7_2.PlayerOffset
L12_2=vec3
L13_2=0
L14_2=0
L15_2=1.0
L12_2=L12_2(L13_2,L14_2,L15_2)
L11_2=L11_2+L12_2
L12_2=AttachEntityToEntity
L13_2=PlayerPedId
L13_2=L13_2()
L14_2=A2_2
L15_2=0
L16_2=L11_2.x
L17_2=L11_2.y
L18_2=L11_2.z
L19_2=0.0
L20_2=0.0
L21_2=0.0
L22_2=false
L23_2=true
L24_2=true
L25_2=false
L26_2=2
L27_2=true
L12_2(L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2)
L12_2={}
L12_2.coords=L8_2
L13_2=GetEntityRotation
L14_2=A2_2
L13_2=L13_2(L14_2)
L12_2.rotation=L13_2
L13_2=promise
L13_2=L13_2.new
L13_2=L13_2()
L14_2=Functions
L14_2=L14_2.StartScene
L15_2=L12_2
L16_2=L7_2.Objects
L17_2=A1_2
function L18_2(A0_3,A1_3)
local L2_3,L3_3,L4_3,L5_3,L6_3,L7_3,L8_3,L9_3,L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3
L2_3=DetachEntity
L3_3=PlayerPedId
L3_3=L3_3()
L4_3=false
L5_3=false
L2_3(L3_3,L4_3,L5_3)
L2_3=L20_1
if L2_3>0 then
L2_3=tostring
L3_3=L3_2
L2_3=L2_3(L3_3)
L3_3=L21_1
L3_3[L2_3]=true
end
L2_3=L4_2
L3_3=L6_2
if L2_3<L3_3 then
L2_3=A0_3.objects
L3_3=L5_2
L2_3=L2_3[L3_3]
L2_3=L2_3.object
if not A1_3 then
L3_3=DoesEntityExist
L4_3=L2_3
L3_3=L3_3(L4_3)
if L3_3 then
L3_3=L13_2
L4_3=L3_3
L3_3=L3_3.resolve
L3_3(L4_3)
L3_3=Functions
L3_3=L3_3.DeleteEntity
L4_3=L2_3
return L3_3(L4_3)
end
end
L3_3=L10_2
if not L3_3 then
L3_3=GetEntityModel
L4_3=L2_3
L3_3=L3_3(L4_3)
L10_2=L3_3
end
L3_3=GetEntityRotation
L4_3=L2_3
L3_3=L3_3(L4_3)
L4_3=GetEntityCoords
L5_3=L2_3
L4_3=L4_3(L5_3)
L5_3=CheckServerAllow
L6_3=L4_3
L5_3=L5_3(L6_3)
if not L5_3 then
L5_3=L13_2
L6_3=L5_3
L5_3=L5_3.resolve
L5_3(L6_3)
L5_3=Functions
L5_3=L5_3.DeleteEntity
L6_3=L2_3
return L5_3(L6_3)
end
L5_3=Functions
L5_3=L5_3.DeleteEntity
L6_3=L2_3
L5_3(L6_3)
L5_3=Functions
L5_3=L5_3.SpawnObject
L6_3=L10_2
L7_3=nil
L8_3=L4_3
L9_3=true
L10_3=false
L5_3=L5_3(L6_3,L7_3,L8_3,L9_3,L10_3)
if L5_3 then
L6_3=PlayerPedId
L6_3=L6_3()
L7_3=Config
L7_3=L7_3.BagAttachments
L8_3=L10_2
L7_3=L7_3[L8_3]
L8_3=Functions
L8_3=L8_3.GetBoneIndexByName
L9_3=L6_3
L10_3="SKEL_R_HAND"
L8_3=L8_3(L9_3,L10_3)
if nil==L8_3 then
L9_3=L13_2
L10_3=L9_3
L9_3=L9_3.resolve
L9_3(L10_3)
L9_3=Functions
L9_3=L9_3.DeleteEntity
L10_3=L5_3
return L9_3(L10_3)
end
L2_1=L5_3
L9_3=OnBagPickup
L10_3=L2_1
L9_3(L10_3)
L9_3=SetEntityRotation
L10_3=L2_1
L11_3=L3_3.x
L12_3=L3_3.y
L13_3=L3_3.z
L14_3=2
L15_3=false
L9_3(L10_3,L11_3,L12_3,L13_3,L14_3,L15_3)
L9_3=AttachEntityToEntity
L10_3=L2_1
L11_3=L6_3
L12_3=L8_3
L13_3=L7_3.offset
L13_3=L13_3.x
L14_3=L7_3.offset
L14_3=L14_3.y
L15_3=L7_3.offset
L15_3=L15_3.z
L16_3=L7_3.rotation
L16_3=L16_3.x
L17_3=L7_3.rotation
L17_3=L17_3.y
L18_3=L7_3.rotation
L18_3=L18_3.z
L19_3=true
L20_3=true
L21_3=false
L22_3=true
L23_3=1
L24_3=true
L9_3(L10_3,L11_3,L12_3,L13_3,L14_3,L15_3,L16_3,L17_3,L18_3,L19_3,L20_3,L21_3,L22_3,L23_3,L24_3)
L9_3=PlayBagWearingAnim
L9_3()
end
end
L2_3=L13_2
L3_3=L2_3
L2_3=L2_3.resolve
L2_3(L3_3)
end
L19_2=L4_2
L14_2(L15_2,L16_2,L17_2,L18_2,L19_2)
L14_2=Citizen
L14_2=L14_2.Await
L15_2=L13_2
L14_2(L15_2)
L14_2=Functions
L14_2.IsInAnim=false
L14_2=TriggerServerEvent
L15_2="17mov_GarbageCollector:server:clearRequest"
L14_2(L15_2)
end
StartScene=L35_1
L35_1=RegisterNetEvent
L36_1="17mov_Garbage:UpdateBagsCounter"
function L37_1(A0_2)
local L1_2,L2_2
L3_1=A0_2
L1_2=SendNUIMessage
L2_2={}
L2_2.action="updateCounter"
L2_2.value=A0_2
L1_2(L2_2)
end
L35_1(L36_1,L37_1)
function L35_1()
local L0_2,L1_2,L2_2,L3_2,L4_2
L0_2=L19_1
if not L0_2 then
return
end
L0_2=false
L19_1=L0_2
L0_2=L3_1
if L0_2<100 then
L0_2=Config
L0_2=L0_2.RequireFullJob
if L0_2 then
L0_2=true
L19_1=L0_2
L0_2=Notify
L1_2=_L
L2_2="Lobby.EndJob.DoEverything"
L1_2,L2_2,L3_2,L4_2=L1_2(L2_2)
return L0_2(L1_2,L2_2,L3_2,L4_2)
end
end
L0_2=GetPedInVehicleSeat
L1_2=GetVehiclePedIsIn
L2_2=PlayerPedId
L2_2=L2_2()
L3_2=false
L1_2=L1_2(L2_2,L3_2)
L2_2=-1
L0_2=L0_2(L1_2,L2_2)
L1_2=PlayerPedId
L1_2=L1_2()
if L0_2 ~=L1_2 then
L0_2=IsPedInAnyVehicle
L1_2=PlayerPedId
L1_2=L1_2()
L2_2=false
L0_2=L0_2(L1_2,L2_2)
if L0_2 then
L0_2=true
L19_1=L0_2
L0_2=Notify
L1_2=_L
L2_2="Lobby.EndJob.NotDriver"
L1_2,L2_2,L3_2,L4_2=L1_2(L2_2)
return L0_2(L1_2,L2_2,L3_2,L4_2)
end
end
L0_2=GetVehiclePedIsIn
L1_2=PlayerPedId
L1_2=L1_2()
L2_2=false
L0_2=L0_2(L1_2,L2_2)
L1_2=L23_1
L2_2=JobVehicleNetId
L1_2=L1_2(L2_2)
if L0_2==L1_2 then
L1_2=Config
L1_2=L1_2.EnableUnloadStage
if L1_2 then
L1_2=L3_1
if L1_2>0 then
L1_2=GetResourceKvpInt
L2_2="17mov_Tutorials:"
L3_2="endStageTutorial"
L2_2=L2_2 .. L3_2
L1_2=L1_2(L2_2)
if 0==L1_2 then
L1_2="endStageTutorial"
L7_1=L1_2
L1_2=SetNuiFocus
L2_2=true
L3_2=true
L1_2(L2_2,L3_2)
L1_2=SendNUIMessage
L2_2={}
L2_2.action="showTutorial"
L3_2=_L
L4_2="Job.Gameplay.EndStageTutorial"
L3_2=L3_2(L4_2)
L2_2.customText=L3_2
L1_2(L2_2)
end
L1_2=TriggerServerEvent
L2_2="17mov_Garbage:server:endStage"
return L1_2(L2_2)
end
end
L1_2=true
L19_1=L1_2
L1_2=TriggerServerEvent
L2_2="17mov_Garbage:endJob_sv"
L3_2=true
return L1_2(L2_2,L3_2)
end
L1_2=SetNuiFocus
L2_2=true
L3_2=true
L1_2(L2_2,L3_2)
L1_2=SendNUIMessage
L2_2={}
L2_2.action="openWarning"
L1_2(L2_2)
L1_2=true
L19_1=L1_2
end
EndJob=L35_1
L35_1=RegisterNetEvent
L36_1="17mov_Garbage:endJob_cl"
function L37_1()
local L0_2,L1_2,L2_2
L0_2=RemoveKeys
if nil ~=L0_2 then
L0_2=RemoveKeys
L0_2()
end
L0_2=SendNUIMessage
L1_2={}
L1_2.action="updateCounter"
L1_2.value=0
L0_2(L1_2)
L0_2=Config
L0_2=L0_2.RequireWorkClothes
if L0_2 then
L0_2=Config
L0_2=L0_2.EnableCloakroom
if not L0_2 then
L0_2=false
L18_1=L0_2
L0_2=ChangeClothes
L1_2="citizen"
L0_2(L1_2)
end
end
L0_2=Config
L0_2=L0_2.UseTarget
if L0_2 then
L0_2=DeleteEntityFromTarget
L1_2=L0_1
L0_2(L1_2)
end
L0_2=false
L1_2=0
L2_2=0
L3_1=L2_2
L2_1=L1_2
OnDuty=L0_2
L0_2=SendNUIMessage
L1_2={}
L1_2.action="hideCounter"
L0_2(L1_2)
end
L35_1(L36_1,L37_1)
L35_1=Config
L35_1=L35_1.LetBossSplitReward
if L35_1 then
L35_1=RegisterNUICallback
L36_1="checkIfThisRewardIsFine"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2
L2_2=math
L2_2=L2_2.floor
L3_2=A0_2.value
L2_2=L2_2(L3_2)
L3_2=A0_2.plyId
if L2_2>100 or L2_2<0 then
L4_2=Notify
L5_2=_L
L6_2="Lobby.Reward.InvalidPerect"
L5_2,L6_2,L7_2,L8_2=L5_2(L6_2)
L4_2(L5_2,L6_2,L7_2,L8_2)
L4_2=A1_2
L5_2=false
return L4_2(L5_2)
end
L4_2=Functions
L4_2=L4_2.TriggerServerCallback
L5_2="17mov_Garbage:CheckThisReward"
function L6_2(A0_3)
local L1_3,L2_3,L3_3
if A0_3 then
L1_3=A1_2
L2_3=true
L1_3(L2_3)
else
L1_3=Notify
L2_3=_L
L3_3="Lobby.Reward.TooMuchPerect"
L2_3,L3_3=L2_3(L3_3)
L1_3(L2_3,L3_3)
L1_3=A1_2
L2_3=false
L1_3(L2_3)
end
end
L7_2=L2_2
L8_2=L3_2
L4_2(L5_2,L6_2,L7_2,L8_2)
end
L35_1(L36_1,L37_1)
else
L35_1=CreateThread
function L36_1()
local L0_2,L1_2
while true do
L0_2=L10_1
if L0_2 then
break
end
L0_2=Citizen
L0_2=L0_2.Wait
L1_2=100
L0_2(L1_2)
end
L0_2=SendNUIMessage
L1_2={}
L1_2.action="hideManageRewards"
L0_2(L1_2)
end
L35_1(L36_1)
end
L35_1=RegisterNUICallback
L36_1="driverLoaded"
function L37_1(A0_2,A1_2)
local L2_2,L3_2
L2_2=true
L9_1=L2_2
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="nuiLoaded"
function L37_1(A0_2,A1_2)
local L2_2,L3_2
L2_2=true
L10_1=L2_2
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="acceptWarning"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2
L2_2=TriggerServerEvent
L3_2="17mov_Garbage:endJob_sv"
L4_2=false
L5_2=true
L2_2(L3_2,L4_2,L5_2)
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="tutorialClosed"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=SetNuiFocus
L3_2=false
L4_2=false
L2_2(L3_2,L4_2)
L2_2=""
L7_1=L2_2
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="menuClosed"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=false
L6_1=L2_2
L2_2=SetNuiFocus
L3_2=false
L4_2=false
L2_2(L3_2,L4_2)
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="dontShowTutorialAgain"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=SetResourceKvpInt
L3_2="17mov_Tutorials:"
L4_2=L7_1
L3_2=L3_2 .. L4_2
L4_2=1
L2_2(L3_2,L4_2)
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="startJob"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=OnDuty
if not L2_2 then
L2_2=Functions
L2_2=L2_2.IsSpawnPointClear
L3_2=Config
L3_2=L3_2.SpawnPoint
L2_2=L2_2(L3_2)
if L2_2 then
L2_2=TriggerServerEvent
L3_2="17mov_Garbage:StartJob_sv"
L2_2(L3_2)
else
L2_2=Notify
L3_2=_L
L4_2="Lobby.StartJob.SpawnpointBusy"
L3_2,L4_2=L3_2(L4_2)
L2_2(L3_2,L4_2)
end
else
L2_2=Notify
L3_2=_L
L4_2="Lobby.StartJob.AlreadyWorking"
L3_2,L4_2=L3_2(L4_2)
L2_2(L3_2,L4_2)
end
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="leaveLobby"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2
L2_2=OnDuty
if L2_2 then
L2_2=Notify
L3_2=_L
L4_2="Lobby.Player.CantExit"
L3_2,L4_2,L5_2,L6_2,L7_2,L8_2=L3_2(L4_2)
return L2_2(L3_2,L4_2,L5_2,L6_2,L7_2,L8_2)
end
L2_2=tonumber
L3_2=A0_2.id
L2_2=L2_2(L3_2)
L3_2=TriggerServerEvent
L4_2="17mov_Garbage:KickPlayerFromLobby"
L5_2=L2_2
L6_2=false
L7_2=GetPlayerServerId
L8_2=PlayerId
L8_2=L8_2()
L7_2,L8_2=L7_2(L8_2)
L3_2(L4_2,L5_2,L6_2,L7_2,L8_2)
L3_2=Notify
L4_2=_L
L5_2="Lobby.Player.Quit"
L4_2,L5_2,L6_2,L7_2,L8_2=L4_2(L5_2)
L3_2(L4_2,L5_2,L6_2,L7_2,L8_2)
L3_2=A1_2
L4_2={}
L3_2(L4_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="focusOff"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=SetNuiFocus
L3_2=false
L4_2=false
L2_2(L3_2,L4_2)
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="notify"
function L37_1(A0_2,A1_2)
local L2_2,L3_2
L2_2=Notify
L3_2=A0_2.msg
L2_2(L3_2)
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="changeClothes"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2
L2_2=A0_2.type
if "work"==L2_2 then
L3_2=true
L18_1=L3_2
L3_2=ChangeClothes
L4_2="work"
L3_2(L4_2)
else
L3_2=false
L18_1=L3_2
L3_2=ChangeClothes
L4_2="citizen"
L3_2(L4_2)
end
L3_2=A1_2
L4_2={}
L3_2(L4_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="GetClosestPlayers"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2
L2_2=GetActivePlayers
L2_2=L2_2()
L3_2=GetEntityCoords
L4_2=PlayerPedId
L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2=L4_2()
L3_2=L3_2(L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2)
L4_2={}
L5_2=pairs
L6_2=L2_2
L5_2,L6_2,L7_2,L8_2=L5_2(L6_2)
for L9_2,L10_2 in L5_2,L6_2,L7_2,L8_2 do
L11_2=PlayerId
L11_2=L11_2()
if L11_2 ~=L10_2 then
L11_2=GetPlayerPed
L12_2=L10_2
L11_2=L11_2(L12_2)
L12_2=GetEntityCoords
L13_2=L11_2
L12_2=L12_2(L13_2)
L12_2=L3_2-L12_2
L12_2=#L12_2
if L12_2<20.0 then
L12_2=table
L12_2=L12_2.insert
L13_2=L4_2
L14_2=GetPlayerServerId
L15_2=L10_2
L14_2,L15_2=L14_2(L15_2)
L12_2(L13_2,L14_2,L15_2)
end
end
end
L5_2=Functions
L5_2=L5_2.TriggerServerCallback
L6_2="17mov_Garbage:IfPlayerIsHost"
function L7_2(A0_3)
local L1_3,L2_3,L3_3,L4_3
if A0_3 then
L1_3=Functions
L1_3=L1_3.TriggerServerCallback
L2_3="17mov_Garbage:GetPlayersNames"
function L3_3(A0_4)
local L1_4,L2_4,L3_4
L1_4=A1_2
L2_4=A0_4
L1_4(L2_4)
L1_4=#A0_4
if 0==L1_4 then
L1_4=Notify
L2_4=_L
L3_4="Lobby.StartJob.NobodyNearby"
L2_4,L3_4=L2_4(L3_4)
L1_4(L2_4,L3_4)
end
end
L4_3=L4_2
L1_3(L2_3,L3_3,L4_3)
else
L1_3=Notify
L2_3=_L
L3_3="Lobby.EndJob.NoPermission"
L2_3,L3_3,L4_3=L2_3(L3_3)
L1_3(L2_3,L3_3,L4_3)
end
end
L5_2(L6_2,L7_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="requestReacted"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2
L2_2=A0_2.boolean
L3_2=SetNuiFocus
L4_2=false
L5_2=false
L3_2(L4_2,L5_2)
L3_2=TriggerServerEvent
L4_2="17mov_Garbage:ClientReactRequest"
L5_2=L2_2
L3_2(L4_2,L5_2)
L3_2=A1_2
L4_2={}
L3_2(L4_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="sendRequest"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2
L2_2=OnDuty
if L2_2 then
L2_2=Notify
L3_2=_L
L4_2="Lobby.StartJob.CantInvite"
L3_2,L4_2,L5_2=L3_2(L4_2)
return L2_2(L3_2,L4_2,L5_2)
end
L2_2=Config
L2_2=L2_2.UseModernUI
if L2_2 then
L2_2=TriggerServerEvent
L3_2="17mov_Garbage:SendRequestToClient_sv"
L4_2=tonumber
L5_2=A0_2.id
L4_2,L5_2=L4_2(L5_2)
L2_2(L3_2,L4_2,L5_2)
else
L2_2=Notify
L3_2=_L
L4_2="Lobby.StartJob.InviteSent"
L3_2,L4_2,L5_2=L3_2(L4_2)
L2_2(L3_2,L4_2,L5_2)
L2_2=TriggerServerEvent
L3_2="17mov_Garbage:SendRequestToClient_sv"
L4_2=A0_2.id
L2_2(L3_2,L4_2)
end
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=RegisterNUICallback
L36_1="kickPlayerFromLobby"
function L37_1(A0_2,A1_2)
local L2_2,L3_2,L4_2,L5_2,L6_2
L2_2=Config
L2_2=L2_2.UseModernUI
if L2_2 then
L2_2=tonumber
L3_2=A0_2.id
L2_2=L2_2(L3_2)
L3_2=Notify
L4_2=_L
L5_2="Lobby.Player.MemberKicked"
L6_2=L5_1
L6_2=L6_2[L2_2]
L6_2=L6_2.name
L4_2,L5_2,L6_2=L4_2(L5_2,L6_2)
L3_2(L4_2,L5_2,L6_2)
L3_2=TriggerServerEvent
L4_2="17mov_Garbage:KickPlayerFromLobby"
L5_2=L2_2
L6_2=true
L3_2(L4_2,L5_2,L6_2)
else
L2_2=Notify
L3_2=_L
L4_2="Lobby.Player.MemberKicked"
L5_2=A0_2.name
L3_2,L4_2,L5_2,L6_2=L3_2(L4_2,L5_2)
L2_2(L3_2,L4_2,L5_2,L6_2)
L2_2=TriggerServerEvent
L3_2="17mov_Garbage:KickPlayerFromLobby"
L4_2=A0_2.id
L5_2=true
L2_2(L3_2,L4_2,L5_2)
end
L2_2=A1_2
L3_2={}
L2_2(L3_2)
end
L35_1(L36_1,L37_1)
L35_1=Config
L35_1=L35_1.Debug
L35_1=L35_1.enabled
if L35_1 then
L35_1=CreateThread
function L36_1()
local L0_2,L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2,L13_2,L14_2,L15_2,L16_2,L17_2,L18_2,L19_2,L20_2,L21_2,L22_2,L23_2,L24_2,L25_2,L26_2,L27_2
while true do
L0_2=Config
L0_2=L0_2.UseTarget
if L0_2 then
break
end
L0_2=PlayerPedId
L0_2=L0_2()
L1_2=GetEntityCoords
L2_2=L0_2
L1_2=L1_2(L2_2)
L2_2=GetGamePool
L3_2="CObject"
L2_2=L2_2(L3_2)
L3_2=nil
L4_2=nil
L5_2=1.5
L6_2=pairs
L7_2=L2_2
L6_2,L7_2,L8_2,L9_2=L6_2(L7_2)
for L10_2,L11_2 in L6_2,L7_2,L8_2,L9_2 do
L12_2=GetEntityModel
L13_2=L11_2
L12_2=L12_2(L13_2)
L13_2=pairs
L14_2=Config
L14_2=L14_2.Scenes
L13_2,L14_2,L15_2,L16_2=L13_2(L14_2)
for L17_2,L18_2 in L13_2,L14_2,L15_2,L16_2 do
L19_2=false
L20_2=pairs
L21_2=L18_2.Models
L20_2,L21_2,L22_2,L23_2=L20_2(L21_2)
for L24_2,L25_2 in L20_2,L21_2,L22_2,L23_2 do
L26_2=GetHashKey
L27_2=L25_2
L26_2=L26_2(L27_2)
if L12_2==L26_2 then
L19_2=true
end
end
if L19_2 then
L20_2=GetEntityCoords
L21_2=L11_2
L20_2=L20_2(L21_2)
L21_2=L1_2-L20_2
L21_2=#L21_2
L22_2=L18_2.Distance
if L21_2<=L22_2 then
L22_2={}
L22_2.scene=L18_2
L22_2.object=L11_2
L22_2.sceneId=L17_2
L3_2=L22_2
end
end
end
if not L3_2 then
L13_2=GetEntityCoords
L14_2=L11_2
L13_2=L13_2(L14_2)
L14_2=L1_2-L13_2
L14_2=#L14_2
L15_2=GetEntityModel
L16_2=L11_2
L15_2=L15_2(L16_2)
L16_2=Config
L16_2=L16_2.BagAttachments
L16_2=L16_2[L15_2]
if L16_2 and L5_2>L14_2 then
L16_2=IsEntityAttachedToAnyPed
L17_2=L11_2
L16_2=L16_2(L17_2)
if not L16_2 then
L4_2=L11_2
L5_2=L14_2
end
end
end
end
L6_2=L3_2
if L6_2 then
L6_2=L6_2.object
end
L7_2=L13_1
if L7_2 then
L7_2=L7_2.object
end
if L6_2==L7_2 then
L6_2=L14_1
if L4_2==L6_2 then
goto lbl_118
end
end
L13_1=L3_2
L6_2=L13_1
L6_2=L4_2 or L6_2
if nil ~=L6_2 or not L4_2 then
L6_2=nil
end
L14_1=L6_2
L6_2=L13_1
if not L6_2 then
L6_2=L14_1
if not L6_2 then
goto lbl_118
end
end
L6_2=L34_1
L6_2()
::lbl_118::
L6_2=Citizen
L6_2=L6_2.Wait
L7_2=300
L6_2(L7_2)
end
end
L35_1(L36_1)
end
