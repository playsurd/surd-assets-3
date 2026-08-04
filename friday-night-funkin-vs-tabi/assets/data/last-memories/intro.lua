function onCreatePost()

    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 1)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('camHUD.visible', true)
    setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)
    triggerEvent('Camera Follow Pos', 1180, 520) 
    setProperty('camZoomingMult', 0)
end


function onStepHit()

    if curStep == 1 then

    doTweenZoom('introcam', 'camGame', 0.66, 12, 'linear')
    setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)
    setProperty('camZoomingMult', 0)
    doTweenAlpha('restaraunt', 'blackintro', 0, 9, 'linear');

    end

    if curStep == 128 then
    setProperty('defaultCamZoom', 0.66)
    setProperty('camGame.zoom', 0.66)
    setProperty('camZoomingMult', 1)
    end

    if curStep == 756 then
        doTweenAlpha('restaraunt', 'blackintro', 1, 0.4, 'linear');
    end

    if curStep == 761 then
        triggerEvent('Change Character', 0, 'tabidatesad')
    end

    if curStep == 768 then

        doTweenAlpha('restaraunt', 'blackintro', 0, 1.2, 'linear');
    end

    if curStep == 1280 then
        setProperty('blackintro.alpha', 1)
    end

end

function onBeatHit()
    if curBeat >= 95 and curBeat < 125 then
        triggerEvent('Add Camera Zoom', '0.017', '0.02')

    end
    if curBeat >= 224 and curBeat < 256 then
        triggerEvent('Add Camera Zoom', '0.017', '0.02')

    end
end
