function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
end

function onSongStart()
    doTweenAlpha('1','camGame', 1, 10)
end

local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt'}
function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
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
            setProperty('bg.visible', false)
            setProperty('bg2.visible', false)
            setProperty('bg3.visible', false)
        else
            setProperty('bg.visible', true)
            setProperty('bg2.visible', true)
            setProperty('bg3.visible', true)
        end
    end
end

folowcam = false
camX = 1500
camY = 900
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end

function onStepHit()
    if curStep == 64 then
        setShaderFloat("Shader1", "AMT", 0.5)
        setShaderFloat("Shader1", "SPEED", 1)
        runTimer('remove', 0.1)
        doTweenAlpha('1','camGame', 1, 0.01)
        doTweenAlpha('2','camHUD', 1, 0.01)
    elseif curStep == 440 or curStep == 696 or curStep == 816 or curStep == 1082 then
        triggerEvent('hud','1')
    elseif curStep == 448 or curStep == 704 or curStep == 832 then
        triggerEvent('hud',0)

        elseif curStep == 1088 then
        triggerEvent('hud',0)
        setShaderFloat("Shader1", "AMT", 0.5)
        setShaderFloat("Shader1", "SPEED", 1)
        runTimer('remove', 0.1)
        doTweenAlpha('1','camGame', 1, 0.01)

    end
end