function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setObjectCamera('GBG', 'hud')
    setObjectCamera('dad', 'hud')
    setProperty('dad.x', 0)
    setProperty('dad.y', 400)


    makeAnimatedLuaSprite('kidsanim', 'special_Anims/spooky month')
    addAnimationByPrefix('kidsanim', 'dialogue', 'spooky', 24, false)
    addLuaSprite('kidsanim', true)
end

function onCreatePost()
    triggerEvent('hud','1')
    setProperty('kidsanim.visible',false)
    setProperty('kidsanim.offset.x',553)
    setProperty('kidsanim.offset.y',377)
end

function onSongStart()
    doTweenAlpha('1', 'camHUD', 1, 5)
    setProperty('dad.velocity.x', 80)
end

local chrColor = {'red', 'green', 'blue'}
function onStepHit()
    if curStep == 64 then
        setObjectCamera('boyfriend', 'hud')
        setProperty('boyfriend.x', 1150)
        setProperty('boyfriend.y', 250)
        setProperty('boyfriend.velocity.x', -80)
        setObjectCamera('dad', 'game')
        setProperty('dad.velocity.x', 0)
        setProperty('dad.x', defaultOpponentX)
        setProperty('dad.y', defaultOpponentY)
        switching = false

    elseif curStep == 128 then
        setProperty('boyfriend.velocity.x', 0)
        setObjectCamera('boyfriend', 'game')
        setObjectCamera('GBG', 'game')
        setProperty('boyfriend.x', defaultBoyfriendX + 100)
        setProperty('boyfriend.y', defaultBoyfriendY + 350)
        setProperty('camGame.alpha', 1)
        setProperty('GBG.visible', false)

    elseif curStep == 129 then
        for i = 1,#chrColor do
            setProperty('dad.colorTransform.'..chrColor[i]..'Multiplier', 1)
            setProperty('boyfriend.colorTransform.'..chrColor[i]..'Multiplier',1)
        end

        setProperty('kidsanim.x', getProperty('dad.x'))
        setProperty('kidsanim.y', getProperty('dad.y'))

    elseif curStep == 240 then

        playAnim('kidsanim','dialogue',true)
        setProperty('kidsanim.visible',true)
        setProperty('dad.visible',false)
        setProperty('GBG.visible', true)
        setProperty('boyfriend.visible', false)
        folowcam = true
        camX = 300
        camY = 530

        for i = 1,#chrColor do
            setProperty('dad.colorTransform.'..chrColor[i]..'Offset', 0)
            setProperty('halloweenBG.colorTransform.'..chrColor[i]..'Offset', 0)
            setProperty('SpookyBG.colorTransform.'..chrColor[i]..'Offset', 0)
            setProperty('boyfriend.colorTransform.'..chrColor[i]..'Offset', 0)
        end

    elseif curStep == 256 then
        setProperty('boyfriend.visible', true)
        setProperty('dad.visible',true)
        removeLuaSprite('kidsanim',true)
        camX = 700
        camY = 490
    elseif curStep == 512 then
        setProperty('halloweenBG.visible',false)
        setProperty('halloweenWhite.visible',false)
        triggerEvent('hud','1')

        switching = true
    elseif curStep == 639 then
        switching = false
    elseif curStep == 640 then
        setProperty('halloweenBG.visible',true)
        setProperty('halloweenWhite.visible',true)
        triggerEvent('hud',0)
        setProperty('GBG.visible',false)

    elseif curStep == 959 then
        switching = true
    elseif curStep == 960 then
        setObjectCamera('GBG', 'hud')
        setProperty('halloweenBG.visible',false)
        setProperty('halloweenWhite.visible',false)
        triggerEvent('hud','1')
        setObjectCamera('dad', 'hud')
        setProperty('dad.x', 0)
        setProperty('dad.y', 400)
        setProperty('dad.velocity.x', 80)
        setProperty('boyfriend.visible', false)

    elseif curStep == 1024 then
        setProperty('dad.visible', false)
        setObjectCamera('boyfriend', 'hud')
        setProperty('boyfriend.x', 1150)
        setProperty('boyfriend.y', 250)
        setProperty('boyfriend.velocity.x', -80)
        setProperty('boyfriend.visible', true)
        setObjectCamera('dad', 'game')
        setProperty('dad.velocity.x', 0)
        setProperty('dad.x', defaultOpponentX)
        setProperty('dad.y', defaultOpponentY)
        switching = false
    elseif curStep == 1089 then
        setObjectCamera('GBG', 'game')
        setProperty('dad.visible', true)
        setProperty('boyfriend.velocity.x', 0)
        setObjectCamera('boyfriend', 'game')
        setProperty('boyfriend.x', defaultBoyfriendX + 100)
        setProperty('boyfriend.y', defaultBoyfriendY + 350)
        setProperty('camGame.alpha', 1)
        switching = true
    end
end

switching = true
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
camX = 700
camY = 500
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end