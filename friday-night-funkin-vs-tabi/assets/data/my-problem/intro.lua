function onCreatePost()

    makeLuaSprite('blackscreen', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackscreen', 0, 0);
    scaleObject('blackscreen', 3, 3);
    setProperty('blackscreen.alpha', 1)
    setObjectCamera('blackscreen', 'other')
    setProperty('gf.visible', false)
    addLuaSprite('blackscreen', true)
    setProperty('camHUD.visible', false)
    setProperty('defaultCamZoom', 0.87)
    setProperty('camGame.zoom', 0.87)

end

function onBeatHit()

    if curBeat == 16 then
        setProperty('blackscreen.alpha', 0)
        setProperty('camHUD.visible', true)
        cameraFlash("game", "ffffff", 0.25, true)    
        triggerEvent('Add Camera Zoom', '0.098', '0.05')
        setProperty('defaultCamZoom', 0.55)
        setProperty('camGame.zoom', 0.55)
        removeLuaSprite('blackscreen', false)
    end

    if curBeat >= 160 and curBeat < 224 and curBeat % 2 == 0 then
        triggerEvent('Add Camera Zoom', '0.016', '0.02')
    end
end

function onStepHit()

    if curStep == 1 then
        doTweenAlpha('blackintro', 'blackscreen', 0.4, 9, 'linear');
        doTweenZoom('introcam', 'camGame', 0.57, 10, 'circInOut')
    end
    if curStep == 64 then
    setProperty('blackscreen.alpha', 0)
    end
    if curStep == 896 then
        addLuaSprite('blackscreen', true)
        setProperty('blackscreen.alpha', 1)
    end
    
end
