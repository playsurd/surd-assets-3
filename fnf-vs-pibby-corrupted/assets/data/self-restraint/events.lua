function onCreate()
    addCharacterToList('FNF/normal gf', 'dad')
    addCharacterToList('FNF/corrupted-gf', 'dad')
    addCharacterToList('FNF/corrupted-bf', 'dad')
    addCharacterToList('FNF/corrupted-gf', 'gf')
    setProperty('cameraSpeed', 10000)
    folowcam = true
    camX = 300
    camY = 600

    makeLuaSprite("vig",'vig',0, 0)
    setObjectCamera('vig', 'other')
    addLuaSprite("vig");

    makeAnimatedLuaSprite('gfanim', 'special_Anims/gf-giggle')
    addAnimationByPrefix('gfanim', 'dialogue', 'GF_GIGGLE', 24, false)
    setProperty('gfanim.offset.x',300)
    setProperty('gfanim.offset.y',280)
    addLuaSprite('gfanim', true)
end

local hideall = {'stageback', 'stagelight_left', 'stagefront', 'stagelight_right', 'stagecurtains', 'bottomFloor', 'leftCorner', 'rightCorner', 'iconP1', 'iconP2', 'healthBar', 'healthBarBG', 'scoreTxt', 'timeBar', 'timeBarBG', 'timeTxt'}

function onCreatePost()
    setProperty('vig.alpha', 0)
    doTweenZoom('d', 'camGame', 1,0.01)
    triggerEvent('hud','1')
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setProperty('boyfriend.visible', false)
    setProperty('gfanim.visible', false)
    setProperty('gf.alpha', 0)
end


function onSongStart()
    setProperty('camGame.alpha', 1)
    setProperty('camHUD.alpha', 1)
end

function rgbToHex(array)
    return (array[1] * 65536) + (array[2] * 256) + array[3]
end

function onStepHit()
    if curStep == 28 or curStep == 92 then
        setProperty('dad.visible', false)
        camX = 1100
        setProperty('boyfriend.visible', true)

    elseif curStep == 64 then
        setProperty('boyfriend.visible', false)
        camX = 300
        setProperty('dad.visible', true)

    elseif curStep == 127 then
        setProperty('dad.visible', true)

    elseif curStep == 128 or curStep == 446 then
        beat = 1

    elseif curStep == 319 or curStep == 1056 then
        beat = 2

    elseif curStep == 592 then
        beat = 0
        setProperty('vig.alpha', 1)
        setProperty('boyfriend.alpha', 0)
        triggerEvent('hud','1')

        setProperty("dad.colorTransform.color", 0x000000)

        folowcam = true
        camX = 470
        camY = 300
        setProperty('Light.visible', true)

    elseif curStep == 656 then
        doTweenAlpha('cam1', 'camGame', 0.3, 2, 'sineInOut')
        doTweenAlpha('2', 'camHUD', 0.5, 2, 'sineInOut')
    elseif curStep == 668 then

        for i = 0,3 do
        noteTweenAlpha('e'..i,i,0,1,'sineInOut')
        end

        noteTweenX('2',4,412,1,'sineInOut')
        noteTweenX('3',5,524,1,'sineInOut')
        noteTweenX('4',6,636,1,'sineInOut')
        noteTweenX('5',7,748,1,'sineInOut')

    elseif curStep == 899 then
        tweenrando = false
        cancelTween('cam1')

    elseif curStep == 900 then
        doTweenAlpha('cam1', 'camGame', 0, 1, 'sineInOut')
        doTweenAlpha('2', 'camHUD', 0, 1, 'sineInOut')

    elseif curStep == 912 then

        for i = 0,3 do
            noteTweenAlpha('e'..i,i,1,0.1)
        end

        setProperty('Light.visible', false)
        noteTweenX('24',4,defaultPlayerStrumX0,0.01)
        noteTweenX('ed3',5,defaultPlayerStrumX1,0.01)
        noteTweenX('4d',6,defaultPlayerStrumX2,0.01)
        noteTweenX('5d',7,defaultPlayerStrumX3,0.01)

    elseif curStep == 916 then
        doTweenAlpha('1', 'camGame', 0.5, 1, 'expoOut')
        setProperty('gfanim.x',getProperty('dad.x'))
        setProperty('gfanim.y',getProperty('dad.y'))
        playAnim('gfanim','dialogue',true)
        setProperty('gfanim.visible',true)
        setProperty('dad.visible',false)

    elseif curStep == 928 then
        setProperty('dad.visible',true)
        removeLuaSprite('gfanim',true)
        setProperty('boyfriend.alpha', 1)
        beat = 1
        setProperty('vig.visible', false)
        playAnim('rightCorner', 'Spreading', true)
        playAnim('leftCorner', 'Spreading', true)
        playAnim('bottomFloor', 'Spreading', true)

    elseif curStep == 929 then
        setProperty('dad.x', defaultOpponentX + 450)
        setProperty('dad.y', defaultOpponentY + 550)
        setProperty('vocals.volume', 1)
    elseif curStep == 1320 then
        folowcam = true
        camX = 200
        camY = 530
        setProperty('boyfriend.alpha', 0)
        setProperty('Light.visible', true)
        setProperty('Light.x', -200)
        setProperty('Light.y', 0)
        setProperty('vig.visible', true)

        triggerEvent('hud','1')

        setProperty("dad.color", getColorFromHex('000000'))
        setProperty("boyfriend.color", getColorFromHex('000000'))

        setProperty('boyfriend.x', defaultOpponentX - 210)
        setProperty('boyfriend.y', defaultOpponentY + 370)

        setProperty('dad.x', defaultOpponentX + 230)
        setProperty('dad.y', defaultOpponentY + 600)

        beat = 0

    elseif curStep == 1328 then
        doTweenAlpha('1', 'camGame', 0.5, 1, 'sineInOut')

    elseif curStep == 1440 then
        doTweenAlpha('osn', 'camHUD', 0.7, 1, 'sineInOut')

    elseif curStep == 1456 then
        for i = 0,3 do
            noteTweenAlpha('e'..i,i,0,1,'sineInOut')
        end

        noteTweenX('2r',4,412,1,'sineInOut')
        noteTweenX('3r',5,524,1,'sineInOut')
        noteTweenX('4r',6,636,1,'sineInOut')
        noteTweenX('5r',7,748,1,'sineInOut')

    elseif curStep == 1488 or curStep == 1552 then
        doTweenAlpha('1', 'boyfriend', 1, 1.5, 'sineInOut')
        doTweenAlpha('2', 'dad', 0, 1.5, 'sineInOut')

    elseif curStep == 1520 then
        doTweenAlpha('1', 'boyfriend', 0, 1.5, 'sineInOut')
        doTweenAlpha('2', 'dad', 1, 1.5, 'sineInOut')

    elseif curStep == 1584 then
        doTweenAlpha('1', 'camGame', 0, 1.5, 'sineInOut')

    elseif curStep == 1600 then
        setProperty('dad.alpha', 1)
        setProperty('gf.alpha', 1)
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)

        setProperty('boyfriend.x', defaultBoyfriendX + 100)
        setProperty('boyfriend.y', defaultBoyfriendY + 350)

        for i = 0,3 do
            noteTweenAlpha('e'..i,i,1,0.1)
        end

        setProperty("boyfriend.color", getColorFromHex('ffffff'))

        setProperty('Light.visible', false)
        noteTweenX('24',4,defaultPlayerStrumX0,0.01)
        noteTweenX('ed3',5,defaultPlayerStrumX1,0.01)
        noteTweenX('4d',6,defaultPlayerStrumX2,0.01)
        noteTweenX('5d',7,defaultPlayerStrumX3,0.01)

        beat = 2
        removeLuaSprite('vig', true)

    elseif curStep == 1855 then
        beat = 0

    elseif curStep == 1864 then
        doTweenAlpha('osh', 'camHUD', 0, 0.7, 'sineInOut')
    end
end

tweenrando = true
function onTweenCompleted(tag)
    if tag == 'cam1' and tweenrando then
        doTweenAlpha('cam1', 'camGame', getRandomFloat(0.1,0.5), 1, 'sineInOut')
    end
end


function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
            camX = 740
            camY = 500
        else
            folowcam = false
        end
    end

    if n == 'hud' then
        for i = 1,#hideall do
            if v1 == '1' then
            setProperty(hideall[i]..'.visible', false)
            else
            setProperty(hideall[i]..'.visible', true)
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
camX = 700
camY = 500
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end

beat = 0
function onBeatHit()
    if curBeat %2 == 1 and beat == 1 then
        triggerEvent('AddChrom', 1.5)
    elseif curBeat %1 == 0 and beat == 2 then
        triggerEvent('AddChrom', 1.5)
    end
end