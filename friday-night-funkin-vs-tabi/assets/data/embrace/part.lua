function onStepHit()
    Particle()
  end
    f = 1
  
    function Particle()
    songPos = getSongPosition()
    currentBeat = (songPos/500)
      f = f + 1
      sus = math.random(2, 300)
      sus2 = math.random(2, 300)
      makeLuaSprite('part' .. f, 'beach/heartpart', math.random(2300, 2000), 1900)
      doTweenY(sus, 'part' .. f, -900*math.tan((currentBeat+1*0.1)*math.pi), 9)
      doTweenX(sus2, 'part' .. f, -900*math.sin((currentBeat+1*0.1)*math.pi), 9)
      scaleObject('part' .. f, 0.060, 0.060);

      
      addLuaSprite('part' .. f, false)
  
      if f >= 50 then
      f = 1
      end
    end