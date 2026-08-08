function onCreatePost()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
end


local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt','bg','HM','HL','HR','LeavesL','LeavesR','Tiff','Brit','killgore','tiger','smytus','idfk','krakus','Glen'}
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
            triggerEvent('hud','1')
            else
            triggerEvent('hud',0)

        end
    end
end


folowcam = false
camX = 1400
camY = 900
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end

function onStepHit()
    if curStep == 1 then
        setProperty('camGame.alpha', 1)

    elseif curStep == 128 or curStep == 192 or curStep == 256 or curStep == 320 or curStep == 384 or curStep == 896 or curStep == 960 or curStep == 1024 or curStep == 1088 or curStep == 1152 or curStep == 1216 or curStep == 1280 or curStep == 1344 then
        beat = 1

    elseif curStep == 180 or curStep == 240 or curStep == 308 or curStep == 368 or curStep == 944 or curStep == 1008 or curStep == 1072 or curStep == 1136 or curStep == 1200 or curStep == 1264 or curStep == 1328 or curStep == 1392 then
        beat = 0


    elseif curStep == 640 then
        beat = 2

    elseif curStep == 1416 then
        doTweenAlpha('1','camGame',0,2.06)
        doTweenAlpha('2','camHUD',0,2.06)
    end
end


beat = 0
function onBeatHit()
    if curBeat %4 == 2 and beat == 1 then
        triggerEvent('AddChrom',1.5)
    elseif curBeat %8 == 4 and beat == 2 then
        triggerEvent('AddChrom',1.5)
    end
end