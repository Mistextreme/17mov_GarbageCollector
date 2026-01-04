local L0_1,L1_1,L2_1,L3_1
L0_1={}
L1_1=Functions
function L2_1(A0_2,A1_2)
local L2_2
L2_2=L0_1
L2_2[A0_2]=A1_2
end
L1_1.RegisterServerCallback=L2_1
L1_1=RegisterNetEvent
L2_1="17mov_Callbacks:GetResponse"
L3_1=Functions
L3_1=L3_1.ResourceName
L2_1=L2_1 .. L3_1
function L3_1(A0_2,A1_2,...)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2
L2_2=source
L3_2=L0_1
L3_2=L3_2[A0_2]
if nil==L3_2 then
return
end
L3_2=TriggerClientEvent
L4_2="17mov_Callbacks:receiveData"
L5_2=Functions
L5_2=L5_2.ResourceName
L4_2=L4_2 .. L5_2
L5_2=L2_2
L6_2=A0_2
L7_2=A1_2
L8_2=L0_1
L8_2=L8_2[A0_2]
L9_2=L2_2
L10_2=...
L8_2,L9_2,L10_2=L8_2(L9_2,L10_2)
L3_2(L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2)
end
L1_1(L2_1,L3_1)
function L1_1(A0_2)
local L1_2,L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2,L11_2,L12_2
L1_2=0
L2_2=pairs
L3_2=PlayersPairs
L2_2,L3_2,L4_2,L5_2=L2_2(L3_2)
for L6_2,L7_2 in L2_2,L3_2,L4_2,L5_2 do
L8_2=L7_2.host
if L8_2==A0_2 then
L1_2=L6_2
break
end
L8_2=1
L9_2=L7_2.clients
L9_2=#L9_2
L10_2=1
for L11_2=L8_2,L9_2,L10_2 do
L12_2=L7_2.clients
L12_2=L12_2[L11_2]
if L12_2==A0_2 then
L1_2=L6_2
break
end
end
end
return L1_2
end
GetLobbyIndex=L1_1
function L1_1(A0_2,A1_2,...)
local L2_2,L3_2,L4_2,L5_2,L6_2,L7_2,L8_2,L9_2,L10_2
L2_2=PlayersPairs
L2_2=L2_2[A0_2]
L2_2=L2_2.clients
L3_2=1
L4_2=#L2_2
L5_2=1
for L6_2=L3_2,L4_2,L5_2 do
L7_2=TriggerClientEvent
L8_2=A1_2
L9_2=L2_2[L6_2]
L10_2=...
L7_2(L8_2,L9_2,L10_2)
end
end
TriggerForClients=L1_1
