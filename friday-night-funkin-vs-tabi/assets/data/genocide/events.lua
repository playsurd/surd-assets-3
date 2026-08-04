function onCreatePost()

    makeLuaSprite('blackshadow', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackshadow', 0, 0);
    scaleObject('blackshadow', 3, 3);
    setProperty('blackshadow.alpha', 0.4)
    setObjectOrder('blackshadow', 2)
    addLuaSprite('blackshadow', true)

end



function onStepHit()

    if curStep % 16 == 0 then

        doTweenAlpha('blackfire', 'blackshadow', 0.7, 1, 'linear')
        runTimer('bringtheshadow', 1)
    
    end


    if curStep == 129 or curStep == 256 or curStep == 387 or curStep == 901 or curStep == 1030 or curStep == 1158 or curStep == 1288 or curStep == 1417 or curStep == 1673 then
        cameraFlash("game", "ffffff", 0.15, true)    
        cameraShake('game',0.005, 0.5)
        cameraShake('hud',0.003, 0.5)
    end
end
function onBeatHit()



    if curBeat >= 426 and curBeat < 490 then
        triggerEvent('Add Camera Zoom', '0.009', '0.02')
    end

end


function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'bringtheshadow' then
        doTweenAlpha('blackfire', 'blackshadow', 0, 0.6, 'linear')
    end
end