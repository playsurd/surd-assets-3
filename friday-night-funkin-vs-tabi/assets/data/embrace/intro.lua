function onCreatePost()

    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end
    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 1)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('dad.visible', false)
    setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)
    setProperty('camZoomingMult', 0)
    doTweenZoom('introcammain', 'camGame', 0.9, 0.1, 'linear')

end

function onStepHit()

    if curStep == 1 then
    doTweenAlpha('lovefade', 'blackintro', 0.5, 9, 'linear');
    doTweenZoom('introcam', 'camGame', 0.45, 12, 'linear')

    end

    if curStep == 112 then
        for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', true)
    end

    end

    if curStep == 129 then
    cameraFlash("game", "ffffff", 0.45, true)    
    setProperty('camZoomingMult', 1)
    removeLuaSprite('blackintro', false)
    setProperty('camHUD.visible', true)
    setProperty('defaultCamZoom', 0.45)
	setProperty('camGame.zoom', 0.45)

end
end