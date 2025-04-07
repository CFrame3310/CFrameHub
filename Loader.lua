function loadScript(url)
  local success, response = pcall(function ()
    return game:HttpGet(url)
  end)

  if response == '404: Not Found' then
    game.StarterGui:SetCore("SendNotification", {Title = 'CFrame Hub', Text = 'Updating Script, please try again in few minutes',Duration = 8})
  else
    loadstring(response)()
  end
end

local placeid = game.PlaceId

if placeid == 87039211657390 or placeid == 4442272183 or placeid == 128336380114944 then 
  loadScript(game:HttpGet("https://raw.githubusercontent.com/CFrame3310/CFrameHub/main/Arise.lua"))()
else
  game.Players.LocalPlayer:Kick('Script doesn\'t support this game.')
  wait(3)
  game:Shutdown()
end
