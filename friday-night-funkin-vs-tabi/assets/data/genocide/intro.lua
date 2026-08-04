function onCreatePost()


end


function onStepHit()

    if curStep == 2 then
        doTweenZoom('introcam', 'camGame', 0.57, 0.9, 'circInOut')
    end

    if curStep == 1 or curStep == 34 or curStep == 66 or curStep == 81 or curStep == 97 or curStep == 107 then
        setProperty('blackintro.alpha', 1)
    runTimer('flashremoval', 0.4)
    end

    if curStep == 113 then
    doTweenAlpha('blackflash2', 'blackintro', 1, 0.5, 'linear');
    doTweenZoom('introcam2', 'camGame', 0.78, 0.9, 'circInOut')

    end

    if curStep == 128 then
    setProperty('blackintro.alpha', 0)
    setProperty('defaultCamZoom', 0.56)
	setProperty('camGame.zoom', 0.56)
    setProperty('camHUD.visible', true)
    end
    if curStep == 1996 then
        setProperty('blackintro.alpha', 1)
        setProperty('camHUD.visible', false)
        end
end
  function onTimerCompleted(t)
        if t == 'flashremoval' then
        doTweenAlpha('blackflash2', 'blackintro', 0.4, 0.2, 'linear');
    end
    end