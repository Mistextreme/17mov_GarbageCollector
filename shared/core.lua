Functions = {}
Functions.ResourceName = GetCurrentResourceName()

Config.Debug = {
  enabled = false,
  base_progress = 100,
  bin_stage = 1
}

function Functions.Print(...)
  local first = true
  local args = table.pack(...)
  local message = ""
  
  for i, arg in ipairs(args) do
    if first then
      first = false
    else
      message = message .. " "
    end
    message = message .. tostring(arg)
  end
  
  print("^5[" .. Functions.ResourceName .. "]:^7 " .. message .. "^0")
end

function Functions.Debug(...)
  if not Config.Debug then
    return
  end
  
  local first = true
  local args = table.pack(...)
  local message = ""
  
  for i, arg in ipairs(args) do
    if first then
      first = false
    else
      message = message .. " "
    end
    message = message .. tostring(arg)
  end
  
  print("^5[" .. Functions.ResourceName .. "](DEBUG MODE):^5 " .. message .. "^0")
end

function Functions.Error(...)
  local first = true
  local args = table.pack(...)
  local message = ""
  
  for i, arg in ipairs(args) do
    if first then
      first = false
    else
      message = message .. " "
    end
    message = message .. tostring(arg)
  end
  
  print("^5[ERROR]:^1 " .. message .. "^0")
end

function Functions.Lerp(startValue, endValue, alpha)
  return startValue + (endValue - startValue) * alpha
end

function Functions.CorrectLerp(startValue, endValue, alpha)
  return startValue * (1 - alpha) + endValue * alpha
end

function Functions.RandomFloat(min, max)
  return min + math.random() * (max - min)
end

function Functions.DeepCopy(original)
  local originalType = type(original)
  local copy
  
  if originalType == "table" then
    copy = {}
    for key, value in next, original, nil do
      copy[Functions.DeepCopy(key)] = Functions.DeepCopy(value)
    end
    setmetatable(copy, Functions.DeepCopy(getmetatable(original)))
  else
    copy = original
  end
  
  return copy
end