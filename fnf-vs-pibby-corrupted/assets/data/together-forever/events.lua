function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
end

function onCreatePost()
end

function onSongStart()
    setObjectOrder('finn_attack', getObjectOrder('JH1') - 1)
    setProperty('camGame.alpha', 1)
    setProperty('camHUD.alpha', 1)
    setShaderFloat("Shader1", "AMT", 0.3)
    setShaderFloat("Shader1", "SPEED", 1)
    runTimer('remove', 0.1)
end

local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt'}
function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
            camX = 1300
        elseif v1 == 'all2' then
            folowcam = true
            camX = 900
        else
            folowcam = false
        end
    end

    if n == 'hud' then
        for i = 1,#hideHud do
            if v1 == '1' then
            setProperty(hideHud[i]..'.visible', false)
            else
            setProperty(hideHud[i]..'.visible', true)
            end
        end
    end

    if n == 'GBG' then
        if v1 == 'on' then
            setProperty('laboratory.visible',false)
        else
            setProperty('laboratory.visible',true)
        end
    end
end

folowcam = false
camX = 900
camY = 600
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    elseif curStep == 20 then
        setProperty('camFollow.x', 2250)
        setProperty('camFollow.y', 750)
    end
end

function onStepHit()
    if curStep == 8 or curStep == 16 or curStep == 20 or curStep == 28 then
        setShaderFloat("Shader1", "AMT", 0.3)
        setShaderFloat("Shader1", "SPEED", 1)
        runTimer('remove', 0.1)

    elseif curStep == 828 then
        doTweenAlpha('1', 'camGame', 0, 0.5, 'expoOut')
        doTweenAlpha('2', 'camHUD', 0, 0.5, 'expoOut')

    elseif curStep == 831 then
        setProperty("gf.colorTransform.color", 0xff0707)
        setProperty('JH2.alpha',0)

    elseif curStep == 832 then
        setProperty('boyfriend.visible', false)
        setProperty('dad.visible', false)
        setProperty('laboratory.visible', false)
        setProperty('pibby.visible', false)
        doTweenAlpha('1', 'camGame', 1, 1, 'expoOut')

    elseif curStep == 845 then
        active = true

    elseif curStep == 1023 then
        active = false
        setProperty('JH2.alpha',1)

    elseif curStep == 1024 then
        setProperty("gf.colorTransform", nil)
        setProperty("gf.alpha", 0)
        setProperty("gf.alpha", 1)
        setProperty('boyfriend.visible', true)
        setProperty('dad.visible', true)
        setProperty('laboratory.visible', true)
        setProperty('pibby.visible', true)
        setProperty('camHUD.alpha', 1)
        doTweenAlpha('1', 'camGame', 1, 0.01)

    elseif curStep == 2168 then
        setProperty('boyfriend.visible', false)
        setProperty('dad.visible', false)
        setProperty('laboratory.visible', false)
        setProperty('GBG.visible',true)
        setProperty('pibby.visible', false)
        setProperty('camHUD.alpha', 0)
        setProperty("gf.colorTransform.color", 0xff0707)

    elseif curStep == 2172 then
        setProperty('gf.colorTransform.redOffset', 255)
        setProperty('gf.colorTransform.greenOffset', 255)
        setProperty('gf.colorTransform.blueOffset', 255)

        setProperty('gf.colorTransform.redMultiplier', -1)
        setProperty('gf.colorTransform.greenMultiplier', -1)
        setProperty('gf.colorTransform.blueMultiplier', -1)

    elseif curStep == 2174 then
        setProperty("gf.colorTransform.color", 0x1434ff)

    elseif curStep == 2176 then
        setProperty("gf.colorTransform.color", 0xffffff)
        setProperty('pibby.visible', true)
        setProperty('boyfriend.visible', true)
        setProperty('dad.visible', true)
        setProperty('camHUD.alpha', 1)
    elseif curStep == 2928 or curStep == 3192 then
        triggerEvent('hud','1')
    elseif curStep == 2944 or curStep == 3200 then
        triggerEvent('hud',0)
    elseif curStep == 3496 then
        doTweenAlpha('1', 'camGame', 0, 0.5, 'expoOut')
        doTweenAlpha('2', 'camHUD', 0, 0.5, 'expoOut')

    end
end

active = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
    if active then
        doTweenAlpha('1', 'camGame', getRandomFloat(0.7,1), 1, 'expoOut')
        runTimer('hide', 0.2)
    end
end

function onTimerCompleted(tag)
    if tag == 'hide' then
        doTweenAlpha('1', 'camGame', 0, 0.5, 'expoOut')
    end
end