local placeid = game.PlaceId

if placeid == 2753915549 or placeid == 4442272183 or placeid == 7449423635 then 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CFrame3310/CFrameHub/main/BloxFruit.lua"))()
else
  game.Players.LocalPlayer:Kick('Script doesn\'t support this game.')
  wait(3)
  game:Shutdown()
end
