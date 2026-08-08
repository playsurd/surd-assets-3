function onCreate()
    addCharacterToList('SU/NORMAL_Steven', 'dad')
    addCharacterToList('SU/shield-steven', 'dad')

    makeLuaSprite('Vig', 'vig')
    setObjectCamera('Vig', 'other')
    addLuaSprite('Vig')
end

local hideHud = {'ground', 'sky', 'lion', 'goofyAhhDarkness', 'stevensword', 'clusterhand', 'moon', 'water', 'clouds', 'iconP1', 'iconP2', 'healthBar', 'healthBarBG', 'scoreTxt', 'timeBar', 'timeBarBG', 'timeTxt'}

function onCreatePost()
    setProperty('gf.visible',false)
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setProperty('Vig.alpha', 0)
end



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



folowcam = true
camX = 550
camY = 400
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end



function onStepHit()
    if curStep == 248 then
        doTweenAlpha('1','camGame',0,0.6,'expoIn')

    elseif curStep == 256 then
        doTweenAlpha('1','camGame',1,1,'expoOut')
        doTweenAlpha('2','camHUD',1,1,'expoOut')

    elseif curStep == 512 then
        beat = 1

    elseif curStep == 764 then
        beat = 0
        doTweenAlpha('1','camGame',0,0.33)
        for i = 1,#hideHud do
            doTweenAlpha('2'..i,hideHud[i],0,0.33)
        end

    elseif curStep == 769 then
        setProperty('gf.visible',true)
        setProperty('dad.visible',false)
        setProperty('boyfriend.visible',false)
        setProperty('pibby.visible',false)
    elseif curStep == 771 then
        doTweenAlpha('1','camGame',1,1,'expoOut')

    elseif curStep == 832 then
        setProperty('dad.visible',true)
        setProperty('boyfriend.visible',true)
        setProperty('pibby.visible',true)
        for i = 1,#hideHud do
            setProperty(hideHud[i]..'.alpha',1)
        end
        beat = 2

    elseif curStep == 1088 then
        beat = 0
        setProperty('gf.visible',false)
        setProperty('boyfriend.visible',false)
        setProperty('Vig.alpha', 0.8)

    for i = 0,3 do
        noteTweenAlpha("yes"..i, i, 0, 0.01)
    end

        setPropertyFromGroup('strumLineNotes', 4, 'x',412)
        setPropertyFromGroup('strumLineNotes', 5, 'x',524)
        setPropertyFromGroup('strumLineNotes', 6, 'x',636)
        setPropertyFromGroup('strumLineNotes', 7, 'x',748)

    elseif curStep == 1212 or curStep == 1340 or curStep == 1356 or curStep == 1372 or curStep == 1388 or curStep == 1420 or curStep == 1404 or curStep == 1435 or curStep == 1468 or curStep == 1484 or curStep == 1500 or curStep == 1516 or curStep == 1532 or curStep == 1548 or curStep == 1564 or curStep == 1580 or curStep == 2108 or curStep == 2236 or curStep == 2364 or curStep == 2492 or curStep == 2620 or curStep == 3004 then
        doTweenAlpha('id','camGame',0,0.25,'expoIn')

    elseif curStep == 1216 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('boyfriend.visible',true)

    elseif curStep == 1344 or curStep == 1408 or curStep == 1488 or curStep == 1520 or curStep == 1552 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('gf.visible',true)
        setProperty('dad.visible',false)

    elseif curStep == 1360 or curStep == 1392 or curStep == 1536 or curStep == 1424 or curStep == 1472 or curStep == 1504 or curStep == 1536 or curStep == 1568 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('gf.visible',false)

    elseif curStep == 1376 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('dad.visible',true)
        setProperty('gf.visible',false)

    elseif curStep == 1440 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('gf.visible',true)
        setProperty('boyfriend.visible',false)
        setProperty('dad.visible',true)

    elseif curStep == 1456 then
        setProperty('boyfriend.visible',true)

    elseif curStep == 1584 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('gf.visible',true)
        setProperty('dad.visible',true)

    elseif curStep == 1600 then
        setProperty('Vig.alpha',0)
        beat = 2
        for i = 0,3 do
            noteTweenAlpha("yes"..i, i, 1, 0.1)
        end

        setPropertyFromGroup('strumLineNotes', 4, 'x',732)
        setPropertyFromGroup('strumLineNotes', 5, 'x',844)
        setPropertyFromGroup('strumLineNotes', 6, 'x',956)
        setPropertyFromGroup('strumLineNotes', 7, 'x',1068)

    elseif curStep == 2080 then
        beat = 0

    elseif curStep == 2112 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        beat = 0
        setProperty('boyfriend.visible',false)
        setProperty('pibby.visible',false)
        setProperty('gf.visible',false)
        triggerEvent('hud','1')

    elseif curStep == 2240 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('dad.visible',false)
        setProperty('boyfriend.visible',true)
        setProperty('pibby.visible',true)

    elseif curStep == 2368 then
        doTweenAlpha('id','camGame',1,0.01)
        beat = 1
        setProperty('boyfriend.visible',false)
        setProperty('pibby.visible',false)
        setProperty('gf.visible',true)

    elseif curStep == 2496 then
        doTweenAlpha('id','camGame',1,0.01)
        setProperty('boyfriend.visible',true)
        setProperty('pibby.visible',true)
        setProperty('gf.visible',false)

    elseif curStep == 2624 then
        triggerEvent('hud',0)
        doTweenAlpha('id','camGame',1,0.7,'expoOut')
        setProperty('gf.visible',true)
        setProperty('dad.visible',true)

    elseif curStep == 2752 then
        beat = 2

    elseif curStep == 2880 then
        beat = 0
        setProperty('gf.visible',false)
        setProperty('dad.visible',true)
        setProperty('Vig.alpha', 0.8)

    for i = 0,3 do
        noteTweenAlpha("yes"..i, i, 0, 0.01)
    end

        setPropertyFromGroup('strumLineNotes', 4, 'x',412)
        setPropertyFromGroup('strumLineNotes', 5, 'x',524)
        setPropertyFromGroup('strumLineNotes', 6, 'x',636)
        setPropertyFromGroup('strumLineNotes', 7, 'x',748)

    elseif curStep == 3008 then
        doTweenAlpha('id','camGame',1,0.4,'expoIn')
        setProperty('boyfriend.visible',true)

    elseif curStep == 3132 then
        doTweenAlpha('id','camGame',0,0.25,'expoIn')
        doTweenAlpha('idf','camHUD',0,0.25,'expoIn')

    end
end


beat = 0
function onBeatHit()
    if curBeat %4 == 2 and beat == 1 then
        triggerEvent('AddChrom',1.5)
    elseif curBeat %2 == 1 and beat == 2 then
        triggerEvent('AddChrom',1.5)
    end
end