function onCreatePost()

    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 1)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('camHUD.visible', true)
    setProperty('camHUD.alpha', 0)


end
function onStepHit()

    if curStep == 60 then
        doTweenAlpha('blackremoval', 'blackintro', 0, 10, 'linear') 
    end   

    if curStep == 120 then
    
    doTweenAlpha('hudenters', 'camHUD', 1, 0.5, 'linear') 
    end

    if curStep == 128 or curStep == 256 then

    setProperty('blackintro.alpha', 0)
    cameraFlash("game", "ffffff", 0.15, true)   

    end

    if curStep == 1192 then
        setProperty('blackintro.alpha', 1)
    end
end

function onBeatHit()

    if curBeat >= 96 and curBeat < 160 and curBeat % 2 == 0 then
        triggerEvent('Add Camera Zoom', '0.006', '0.02') 

    end

    if curBeat >= 224 and curBeat < 288 and curBeat % 2 == 0 then
        triggerEvent('Add Camera Zoom', '0.006', '0.02') 

    end
end