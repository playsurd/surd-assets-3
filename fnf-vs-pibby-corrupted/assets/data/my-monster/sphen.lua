local lockcam = false
local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt','ground', 'sky', 'lion', 'goofyAhhDarkness', 'stevensword', 'clusterhand', 'moon', 'water', 'clouds'}
function onCreate()
    addCharacterToList('SU/shield-steven', 'dad')
    makeLuaSprite('Vig', 'vig')
    setObjectCamera('Vig', 'other')
    setProperty('Vig.alpha', 0.8)
    addLuaSprite('Vig')
    setProperty('gf.visible',false)
    setProperty("skipArrowStartTween", true)
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)

    makeAnimatedLuaSprite('stevanim', 'special_Anims/imamonster')
    addAnimationByPrefix('stevanim', 'dialogue', 'Im A Monster', 24, true)
    scaleObject('stevanim', 0.8,0.8)
    addOffset('stevanim','dialogue',63,180)
    addLuaSprite('stevanim', true)
end

function onCreatePost()
    triggerEvent('hud','1')
    setProperty('cameraSpeed', 100)
    setProperty('boyfriend.color', getColorFromHex('565656'))
    setProperty('dad.color', getColorFromHex('565656'))

    setProperty('stevanim.x', getProperty('dad.x'))
    setProperty('stevanim.y', getProperty('dad.y'))
    setProperty('stevanim.visible',false)
end


function onSongStart()
    for i = 0,3 do
        noteTweenAlpha("yes"..i, i, 0, 0.01)
    end

setPropertyFromGroup('strumLineNotes', 4, 'x',412)
setPropertyFromGroup('strumLineNotes', 5, 'x',524)
setPropertyFromGroup('strumLineNotes', 6, 'x',636)
setPropertyFromGroup('strumLineNotes', 7, 'x',748)

    doTweenAlpha('sechid','camGame',1,1.33,'quadIn')
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

end

function onStepHit()
    if curStep == 128 then
        setProperty('camGame.alpha',1)
        setProperty('boyfriend.color', getColorFromHex('ffffff'))
        setProperty('dad.color', getColorFromHex('ffffff'))
        setProperty('camHUD.alpha',1)
    end

    if curStep == 252 then
        setProperty('camGame.alpha',0)
    end

    if curStep == 380 or curStep == 636 then
        doTweenAlpha('odbe','camGame',0,0.32)
    end

    if curStep == 256 or curStep == 384 or curStep == 512 then
        doTweenAlpha('s','camGame',1,1.33,'quadIn')
    end

    if curStep == 408 or curStep == 440 then
        setProperty('boyfriend.x', 1400)
        setProperty('boyfriend.y', 150)
        setObjectCamera('boyfriend', 'hud')
        doTweenAlpha('1f', 'boyfriend', 1, 1,'quadOut')
        doTweenX('2f', 'boyfriend', 380, 1,'quadOut')
    end

    if curStep == 419 or curStep == 452 then
        doTweenAlpha('1f', 'boyfriend', 0, 1,'quadIn')
        doTweenX('2f', 'boyfriend', -300, 1,'quadIn')
    end

    if curStep == 467 then
        setObjectCamera('boyfriend', 'game')
        setProperty('boyfriend.x', defaultBoyfriendX + 100)
        setProperty('boyfriend.y', defaultBoyfriendY + 350)
        setProperty('boyfriend.alpha',1)
    end

    if curStep == 504 then
        doTweenAlpha('odbe','camGame',0,0.63)
    end


    if curStep == 536 or curStep == 568 then
        setProperty('dad.x', -300)
        setProperty('dad.y', 200)
        setObjectCamera('dad', 'hud')
        doTweenAlpha('1f', 'dad', 1, 1,'quadOut')
        doTweenX('2f', 'dad', 300, 1,'quadOut')
    end

    if curStep == 548 or curStep == 580 then
        doTweenAlpha('1f', 'dad', 0, 1,'quadIn')
        doTweenX('2f', 'dad', 1200, 1,'quadIn')
    end

    if curStep == 594 then
        setObjectCamera('dad', 'game')
        setProperty('dad.x', defaultOpponentX - 190)
        setProperty('dad.y', defaultOpponentY + 180)
        setProperty('dad.alpha',1)
    end

    if curStep == 896 then
        doTweenAlpha('ns','camGame',1,0.5,'sineInOut')
        doTweenAlpha('nfs','camHUD',0,0.5,'sineInOut')
        setProperty('dad.alpha',0)
        playAnim('stevanim','dialogue',true)
        setProperty('stevanim.visible',true)
        setProperty('vocals.volume', 1)
    end

    if curStep == 947 or curStep == 968 or curStep == 1010 or curStep == 1017 then
        setShaderFloat("Shader1", "AMT", 0.03)
        setShaderFloat("Shader1", "SPEED", 1)
    end
    if curStep == 953 or curStep == 971 or curStep == 1014 then
        setShaderFloat("Shader1", "AMT", 0)
        setShaderFloat("Shader1", "SPEED", 0)
    end

    if curStep == 1024 then
        setProperty('gf.visible', true)
        for i = 0,3 do
            noteTweenAlpha("yes"..i, i, 1, 0.1)
        end

        setPropertyFromGroup('strumLineNotes', 4, 'x',732)
        setPropertyFromGroup('strumLineNotes', 5, 'x',844)
        setPropertyFromGroup('strumLineNotes', 6, 'x',956)
        setPropertyFromGroup('strumLineNotes', 7, 'x',1068)

        setProperty('cameraSpeed', 1.2)
        doTweenAlpha('alsndsankasfgsd', 'Vig', 0.2, 0.1);
        triggerEvent('hud',0)
        removeLuaSprite('stevanim',true)
        setProperty('dad.alpha',1)
        setProperty('camHUD.alpha',1)
        setShaderFloat("Shader1", "AMT", 0)
        setShaderFloat("Shader1", "SPEED", 0)
        lockcam = false
    end
    if curStep == 1041 or curStep == 1073 or curStep == 1105 or curStep == 1137 or curStep == 1416 or curStep == 1432 or curStep == 1480 or curStep == 1496 or curStep == 1792 then
        setProperty('defaultCamZoom', 0.85)
    end
    if curStep == 1057 or curStep == 1089 or curStep == 1121 or curStep == 1152 or curStep == 1440 or curStep == 1536 or curStep == 1920 then
        setProperty('defaultCamZoom', 0.75)
    end

    if curStep == 1146 or curStep == 1280 or curStep == 1296 or curStep == 1344 or curStep == 1360 or curStep == 1418 or curStep == 1434 or curStep == 1482 or curStep == 1498 or curStep == 1904 then
        setProperty('defaultCamZoom', 1)
    end
    if curStep == 1288 or curStep == 1304 or curStep == 1352 or curStep == 1368 then
        setProperty('defaultCamZoom', 1.2)
    end
    if curStep == 1292 or curStep == 1308 or curStep == 1356 or curStep == 1372 then
        setProperty('defaultCamZoom', 1.4)
    end

    if curStep == 1408 or curStep == 1424 or curStep == 1472 or curStep == 1488 or curStep == 1504 or curStep == 1664 then
        setProperty('defaultCamZoom', 0.7)
    end
end

function onTweenCompleted(tag)
    if tag == 'sechid' then
        setProperty('camGame.alpha',0)
    end
end


function onSectionHit()
    if curSection %2 == 0 and curStep < 112 then
        doTweenAlpha('sechid','camGame',1,1.33,'quadIn')
    end
end

function onStartCountdown()
    setProperty('defaultCamZoom', 2.5)
    setProperty('camZooming', true)
end

function onUpdatePost(el)
	if lockcam then
		setProperty('camZooming', false)
	end
end
