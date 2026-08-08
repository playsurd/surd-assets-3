function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setProperty('dad.visible', false)
    setProperty('gf.visible', false)
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
end


folowcam = false
camX = 1430
camY = 750
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenAlpha('1','camGame',1,17)
        setProperty('bg.visible',false)

    elseif curStep == 224 then
        setProperty('camGame.alpha',0.5)

    elseif curStep == 240 or curStep == 304 then
        setProperty('camGame.alpha',0)

    elseif curStep == 251 then
        setProperty('dad.visible',true)
        setProperty('boyfriend.visible',false)
        setProperty('pibby.visible',false)

    elseif curStep == 256 or curStep == 320 then
        setProperty('camGame.alpha',1)

    elseif curStep == 384 then
        setProperty('bg.visible',true)
        setProperty('boyfriend.visible',true)
        setProperty('pibby.visible',true)
        setProperty('camHUD.alpha',1)

    elseif curStep == 632 then
        setProperty('camGame.visible',false)
        triggerEvent('hud','1')

    elseif curStep == 640 then
        setProperty('camGame.visible',true)
        triggerEvent('hud',0)
        beat = 1

    elseif curStep == 1014 or curStep == 1407 then
        beat = 0

    elseif curStep == 1024 then
        beat = 1



    elseif curStep == 1408 then
        setProperty('camHUD.visible',false)
        setProperty('dad.visible',false)
        setProperty('boyfriend.visible',false)
        setProperty('gf.visible',true)

    elseif curStep == 1440 then
        setProperty('camHUD.visible',true)
        setProperty('dad.visible',true)
        setProperty('boyfriend.visible',true)


    elseif curStep == 2064 then
        doTweenAlpha('ow','camHUD',0,1,'expoOut')

    end
end


beat = 0
turn = false
function onBeatHit()
    if beat == 1 then
        if curBeat %1 == 0 then
            turn = (turn == true and false or turn == false and true)
            setProperty('camGame.angle', (turn == true and -3 or 3))
            setProperty('camHUD.angle',(turn == true and -3 or 3))

            doTweenAngle('ang1','camGame',0,0.5,'expoOut')
            doTweenAngle('ang2','camHUD',0,0.5,'expoOut')
        end
        if curBeat %2 == 1 then
            triggerEvent('AddChrom',1.5)
        end
    end
end