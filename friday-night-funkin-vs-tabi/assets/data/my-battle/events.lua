

function onStepHit()

    if curStep == 112 then
        doTweenZoom('zoomeffect', 'camGame', 0.7, 2.1, 'circInOut')
    end

    if curStep == 128 or curStep == 256 or curStep == 512 or curStep == 640 or curStep == 896 then
        cameraFlash("game", "ffffff", 0.15, true)    
        cameraShake('game',0.005, 0.5)
        cameraShake('hud',0.003, 0.5)
        doTweenZoom('zoomeffect', 'camGame', 0.55, 0.2, 'circInOut')
    end

    if curStep == 631 then
        doTweenZoom('zoomeffect', 'camGame', 0.7, 0.8, 'circInOut')
    end

    if curStep == 1135 then
        doTweenZoom('zoomeffect', 'camGame', 0.7, 1.5, 'circInOut')
    end
    if curStep == 1152 then
        cameraFlash("game", "ffffff", 1.2, true)    
        doTweenZoom('zoomeffect', 'camGame', 0.55, 0.2, 'circInOut')
    end
end