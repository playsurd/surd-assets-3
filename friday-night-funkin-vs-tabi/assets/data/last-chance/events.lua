function onCreatePost()


    makeAnimatedLuaSprite('tabisnapping', 'special/tabi snap', -120, 0)
	addAnimationByPrefix('tabisnapping','snap','tabi snap snapping',24,true)
	addAnimationByPrefix('tabisnapping','lookup','tabi snap lookup',24,true)
	addLuaSprite('tabisnapping', false);
    scaleObject('tabisnapping', 0.8, 0.8);

    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 1)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('dad.visible', false)
    setProperty('camHUD.visible', false)
    setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)

    makeLuaSprite('whiteflash', 'white', -800, -500);
    setLuaSpriteScrollFactor('whiteflash', 0, 0);
    scaleObject('whiteflash', 3, 3);
    setProperty('whiteflash.alpha', 0)
    setObjectCamera('whiteflash', 'other')
    addLuaSprite('whiteflash', true)

end

function onStepHit()

    if curStep == 1 then
		doTweenAlpha('lastchance', 'blackintro', 0.5, 9, 'linear');
    end
    if curStep == 123 then

		objectPlayAnimation('tabisnapping', 'lookup')

    end
    if curStep == 120 then
        doTweenZoom('introcam', 'camGame', 0.7, 0.9, 'circInOut')
    end
    if curStep == 129 then
        setProperty('blackintro.alpha', 0)
        setProperty('defaultCamZoom', 0.55)
        setProperty('camGame.zoom', 0.55)
        cameraShake('game',0.005, 0.5)
        cameraShake('hud',0.003, 0.5)
        triggerEvent('Add Camera Zoom', '0.098', '0.05')
        cameraFlash("game", "ffffff", 0.15, true)    
		setProperty('tabisnapping.visible', false);
        setProperty('dad.visible', true)
        setProperty('camHUD.visible', true)

    end
    if curStep == 384 or curStep == 1024 or curStep == 1200 or curStep == 1280 then
    cameraFlash("game", "ffffff", 0.15, true)    
    cameraShake('game',0.005, 0.5)
    cameraShake('hud',0.003, 0.5)
    triggerEvent('Add Camera Zoom', '0.098', '0.05')
    end
    if curStep == 1537 then
        setProperty('whiteflash.alpha', 1)
        runTimer('flashremoval', 0.3)
        setProperty('camHUD.visible', false)
        setProperty('blackintro.alpha', 1)
end
   if curStep == 945 or curStep == 1009 then
    cameraFlash("game", "ffffff", 0.15, true)    
end
   if curStep == 1280 or curStep == 1410 then
    cameraFlash("game", "ffffff", 0.78, true)    
  end
  end

function onTimerCompleted(t)
    if t == 'flashremoval' then
    doTweenAlpha('flashy', 'whiteflash', 0, 0.6, 'linear');
end
end