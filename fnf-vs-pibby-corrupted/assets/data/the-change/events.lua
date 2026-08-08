function onCreate()
    addCharacterToList('SU/shield-steven', 'dad')
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)

    makeAnimatedLuaSprite('stevanim', 'special_Anims/pussy2')
    addAnimationByPrefix('stevanim', 'dialogue', 'Shield Transition', 24, false)
    scaleObject('stevanim', 0.8,0.8)
    addOffset('stevanim','dialogue',-158,130)
    addLuaSprite('stevanim', true)
end

local hideHud = {'ground', 'sky', 'lion', 'goofyAhhDarkness', 'stevensword', 'clusterhand', 'moon', 'water', 'clouds', 'iconP1', 'iconP2', 'healthBar', 'healthBarBG', 'scoreTxt', 'timeBar', 'timeBarBG', 'timeTxt'}

function onCreatePost()
    setProperty('gf.visible',false)

    setProperty('stevanim.x', getProperty('dad.x'))
    setProperty('stevanim.y', getProperty('dad.y'))
    setProperty('stevanim.visible',false)
end


function onSongStart()
    doTweenAlpha('1', 'camGame',1,1.5,'sineInOut')
    doTweenAlpha('2', 'camHUD',1,1.5,'sineInOut')
end


function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
            camX = 500
            camY = 400
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
            setProperty('ground.visible', false)
            triggerEvent('hud','1')
        else
            triggerEvent('hud',0)
        end
    end
end



folowcam = false
camX = 500
camY = 400
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end



function onStepHit()
    if curStep == 248 then
        playAnim('stevanim','dialogue',true)
        setProperty('stevanim.visible',true)
        setProperty('dad.visible',false)
    elseif curStep == 256 then
        removeLuaSprite('stevanim',true)
        setProperty('dad.visible',true)
    elseif curStep == 592 then

        doTweenAlpha('2', 'camHUD',0,1,'expoOut')
        invertNote = 1
        folowcam = true
        camX = -180
        camY = 400

    elseif curStep == 608 then
        setProperty('camHUD.alpha',1)

    elseif curStep == 672 then
        folowcam = true
        camX = -180
        camY = 400

    elseif curStep == 738 then
        folowcam = true
        camX = -200
        camY = 100

    elseif curStep == 864 then
        setProperty('gf.visible', true)
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        setProperty('dad.y', defaultOpponentY + 310)

    elseif curStep == 993 then
        setProperty('boyfriend.visible', false)
        setProperty('pibby.visible', false)

    elseif curStep == 994 then
        folowcam = true
        camX = -200
        camY = 300

    elseif curStep == 1088 then
        setProperty('boyfriend.visible', true)
        setProperty('pibby.visible', true)
        setProperty('camHUD.alpha', 1)

    elseif curStep == 1208 then
        for i = 1,#hideHud do
            doTweenAlpha(hideHud[i], hideHud[i], 0, 0.3,'expoOut')
        end
        doTweenAlpha('oddbe', 'dad', 0, 0.3,'expoOut')

        folowcam = true
        camX = -200
        camY = 100
        invertNote = 2
    elseif curStep == 1280 then
        doTweenAlpha('oddbe', 'dad', 1, 0.5,'expoOut')
        invertNote = 3

    elseif curStep == 1344 then
        doTweenAlpha('d', 'camGame', 0, 2,'sineInOut')
        doTweenAlpha('df', 'camHUD', 0, 2,'sineInOut')

    end
end



invertNote = 0
color = {'red','green','blue'}
function opponentNoteHit(id, direction, noteType)
    if noteType == 'glitch_note' and getProperty('GBG.visible') == false then
        for i = 1,3 do
            if invertNote == 1 or invertNote == 3 then
                setProperty('dad.colorTransform.'..color[i]..'Offset', 255)
                setProperty('dad.colorTransform.'..color[i]..'Multiplier', -1)
            runTimer('removeInv', 0.1)
            elseif invertNote == 2 or invertNote == 3 then
                setProperty('gf.colorTransform.'..color[i]..'Offset', 255)
                setProperty('gf.colorTransform.'..color[i]..'Multiplier', -1)
            runTimer('removeInv2', 0.1)
            end
        end
    end
end

function onTimerCompleted(t)
    if t == 'removeInv' then
        setProperty("dad.colorTransform", nil)
        setProperty("dad.alpha", 0)
        setProperty("dad.alpha", 1)
    elseif t == 'removeInv2' then
        setProperty("gf.colorTransform", nil)
        setProperty("gf.alpha", 0)
        setProperty("gf.alpha", 1)
    end
end