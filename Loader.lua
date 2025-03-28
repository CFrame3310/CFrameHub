local placeid = game.PlaceId

if placeid == 87039211657390 or placeid == 4442272183 or placeid == 128336380114944 then 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CFrame3310/CFrameHub/main/Arise.lua"))()
else
  game.Players.LocalPlayer:Kick('Script doesn\'t support this game.')
  wait(3)
  game:Shutdown()
end
