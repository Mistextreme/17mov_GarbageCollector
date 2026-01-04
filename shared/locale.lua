Locale = {}

CreateThread(function()
  Wait(1000)
  
  if Locale[Config.Lang] == nil then
    while true do
      Functions.Print("You set Config.Lang to " .. Config.Lang .. ", but there is no such language in the locale directory!")
      Wait(1000)
    end
  end
end)

function _L(key, ...)
  local translation = "Unknown"
  
  if Locale[Config.Lang] then
    if Locale[Config.Lang][key] then
      translation = Locale[Config.Lang][key]
    else
      if Locale.en then
        translation = Locale.en[key]
      end
    end
  end
  
  local args = table.pack(...)
  if #args > 0 then
    translation = string.format(translation, ...)
  end
  
  if not translation then
    translation = "Missing Translation"
  end
  
  return translation
end