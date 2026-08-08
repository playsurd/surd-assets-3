function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    folowcam = true
    camX = 300
    camY = 460
end

function onStepHit()
    if curStep == 34 or curStep == 68 or curStep == 102 or curStep == 136 or curStep == 158 then
        doTweenAlpha('1', 'camGame', 0, 0.48)

    elseif curStep == 8 or curStep == 42 or curStep == 76 or curStep == 110 or curStep == 146 then
        doTweenAlpha('1', 'camGame', 0.5, 0.48)

    elseif curStep == 170 then
        camX = 700
        camY = 500
        setProperty('boyfriend.visible', true)

    elseif curStep == 176 then
        doTweenAlpha('1', 'camGame', 1, 0.7)

    elseif curStep == 784 then
        setProperty('halloweenBG.visible', false)
        setProperty('halloweenWhite.visible', false)
        setProperty('SpookyBG.visible', false)
        camX = 1200
        camY = 500

    elseif curStep == 816 then
        setProperty('halloweenBG.visible', true)
        setProperty('halloweenWhite.visible', true)
        setProperty('SpookyBG.visible', true)
        camX = 750
        camY = 500

    elseif curStep == 1584 then
        shakeGlit = true


    elseif curStep == 2116 then
        doTweenAlpha('1', 'camHUD', 0, 0.5)

    end
end


function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
        else
            folowcam = false
        end
    end

    if n == 'GBG' then
        if v1 == 'on' then
            setProperty('halloweenBG.visible', false)
            setProperty('halloweenWhite.visible', false)
            setProperty('SpookyBG.visible', false)
            switching = true
            setProperty('dad.colorTransform.redOffset', 255)
            setProperty('dad.colorTransform.greenOffset', 255)
            setProperty('dad.colorTransform.blueOffset', 255)
        else
            setProperty('halloweenBG.visible', true)
            setProperty('halloweenWhite.visible', true)
            setProperty('SpookyBG.visible', true)
            switching = false
        end
    end
end


folowcam = false
camX = 750
camY = 500
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end


switching = true
shakeGlit = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
   if switching == true and not isSustainNote then
        if direction == 0 or direction == 3 then
            setProperty('dad.colorTransform.redOffset', 255)
            setProperty('dad.colorTransform.greenOffset', 144)
            setProperty('dad.colorTransform.blueOffset', 0)
        elseif direction == 1 or direction == 2 then
            setProperty('dad.colorTransform.redOffset', 255)
            setProperty('dad.colorTransform.greenOffset', 255)
            setProperty('dad.colorTransform.blueOffset', 255)
        end
   end

    if shakeGlit then
        luckyRoll = getRandomInt(1,50)
        luckyRoll2 = getRandomInt(1,50)


        if luckyRoll >= 48 then
            cameraShake('hud', 0.08, 0.05);
        end

        if luckyRoll2 >= 48 then
            cameraShake('game', 0.08, 0.05);
        end
    end
end