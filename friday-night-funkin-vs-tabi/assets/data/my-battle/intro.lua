function onCreatePost()

    makeLuaSprite('blackscreen', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackscreen', 0, 0);
    scaleObject('blackscreen', 3, 3);
    setProperty('blackscreen.alpha', 1)
    setObjectCamera('blackscreen', 'other')
    addLuaSprite('blackscreen', true)

    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 0)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('camHUD.visible', false)
    setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)

end

function onBeatHit()

    if curBeat == 16 then
        setProperty('camHUD.visible', true)
        cameraFlash("game", "ffffff", 0.25, true)    
        triggerEvent('Add Camera Zoom', '0.098', '0.05')
        removeLuaSprite('blackintro', false)
        setProperty('defaultCamZoom', 0.55)
        setProperty('camGame.zoom', 0.55)
    end

    if curBeat >= 0 and curBeat < 16 then

    runTimer('shadowintro', 0.3)
    doTweenAlpha('blackflash', 'blackintro', 0.9, 0.3, 'circInOut');

    function onTimerCompleted(t)
        if t == 'shadowintro' then
        doTweenAlpha('blackflash2', 'blackintro', 0.4, 0.4, 'circInOut');
end
end
end
end

function onStepHit()

    if curStep == 1 then
        setProperty('blackscreen.alpha', 0)
        doTweenAlpha('blackflash', 'blackintro', 0.9, 0.3, 'circInOut');
        doTweenZoom('introcam', 'camGame', 0.55, 9, 'circInOut')
    end
    if curStep == 1152 then
        doTweenAlpha('blackflash2', 'blackscreen', 1, 0.9, 'circInOut');
    end

end