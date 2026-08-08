function onCreate()
    addCharacterToList('SB/minnie', 'dad')
    addCharacterToList('SB/pete', 'dad')
end

function onCreatePost()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)

    setProperty('bg6.x', -1000)
    setProperty('bg7.x', -1000)
    setProperty('bg8.x', 635)
    setProperty('dad.x', defaultOpponentX - 1210)

    setProperty('gf.x', 2350)
    setProperty('gf.y', 1100)
end


function onSongStart()
    setProperty('songLength', 144000)
    doTweenAlpha('1', 'camGame', 1, 1.5, 'sineInOut')
end

function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
            camX = 1500
            camY = 900
        else
            folowcam = false
        end
    end

    if n == 'GBG' then
        if v1 == 'on' then
        setProperty("dad.colorTransform.color", 0xffffff)
            for i = 1,10 do
                setProperty('bg'..i..'.visible', false)
            end
        else
            for i = 1,10 do
                setProperty('bg'..i..'.visible', true)
            end
        end
    end
end

folowcam = true
camX = 1950
camY = 1170
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end

    if not mustHitSection and not folowcam then--makes dad camera not delayed anymore
        cameraSetTarget('dad')
    end
end



function onStepHit()
    if curStep == 124 then
        folowcam = true
        camX = 1300
        camY = 800
        doTweenX('cutscenebg6', 'bg6', 0, 1.8,'sineInOut')
        doTweenX('cutscenebg7', 'bg7', 0, 1.8,'sineInOut')
        doTweenX('cutscenebg8', 'bg8', 1635, 1.8,'sineInOut')
        doTweenX('cutscenedad', 'dad', defaultOpponentX - 210, 1.8,'sineInOut')

    elseif curStep == 144 then
        doTweenAlpha('1A', 'camHUD', 1, 1, 'sineInOut')

    elseif curStep == 272 or curStep == 784 or curStep == 1296 or curStep == 1424 or curStep == 1552 or curStep == 2064 then
        beat = 1

    elseif curStep == 400 or curStep == 912 or curStep == 1040 then
        beat = 2

    elseif curStep == 639 or curStep == 848 or curStep == 1024 or curStep == 1136 or curStep == 1408 or curStep == 1536 or curStep == 1648 or curStep == 2047 or curStep == 2175 or curStep == 2303 or curStep == 2559 or curStep == 2943 or curStep == 3070 or curStep == 3199 or curStep == 3327 or curStep == 3983 then
        beat = 0

    elseif curStep == 897 then
        setProperty('dad.x', 450)

    elseif curStep == 880 then
        doTweenAlpha('1', 'camGame', 0, 1)
        doTweenAlpha('2', 'camHUD', 0, 1)

    elseif curStep == 896 then
        doTweenAlpha('1', 'camGame', 1, 1)
        doTweenAlpha('2', 'camHUD', 1, 1)

    elseif curStep == 1711 then
        setProperty('songLength', 184650 + 144000)

    elseif curStep == 1731 then
        setProperty('dad.x', defaultOpponentX - 340 - 90)

    elseif curStep == 1792 then
        doTweenAlpha('}€[', 'camGame', 1,1.5)

    elseif curStep == 1935 or curStep == 2319 or curStep == 2575 or curStep == 3599 then
        beat = 3

    elseif curStep == 2063 or curStep == 2191 or curStep == 2831 or curStep == 2959 or curStep == 3087 or curStep == 3215 or curStep == 3855 or curStep == 4047 then
        beatval = 0
        beat = 4

end
end

beat = 0
beatval = 0
function onBeatHit()
    if curBeat % 4 == 2 and beat == 1 then
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
    end

    if curBeat % 2 == 1 and beat == 2 then
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
    end

    if curBeat % 2 == 0 and beat == 3 then
        triggerEvent('Add Camera Zoom', 0.05, 0.05)
    end

    if curBeat % 2 == 0 and beat == 4 then
        if beatval == 0 then
            triggerEvent('Add Camera Zoom', 0.05, 0.05)
            beatval = 1
    else
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
        beatval = 0
        end
    end
end


function onUpdatePost()
    if dadName == 'SB/willie' then
        setProperty('dad.y', getProperty('bg6.y') + 570)
    elseif dadName == 'SB/minnie' then
        setProperty('dad.y', getProperty('bg6.y') + 710)
    elseif dadName == 'SB/pete' then--different Y(s) for all 3 opponents
        setProperty('dad.y', getProperty('bg6.y') + 550)
    end
end