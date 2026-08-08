function onCreate()
    addCharacterToList('livesey/livesey-boss', 'dad')
    addCharacterToList('PLAYABLE/bf-pirate-final', 'boyfriend')

    makeAnimatedLuaSprite('markanim', 'special_Anims/cool talk livesey')
    addAnimationByPrefix('markanim','dialogue', 'cool talk livesey', 24,false);
    scaleObject('markanim',1.1,1.1)
    addLuaSprite('markanim',true)
end

function onCreatePost()
    setProperty('gf.alpha', 0)
    setProperty('markanim.x',getProperty('dad.x') - 520)
    setProperty('markanim.y',getProperty('dad.y') - 330)

makeLuaSprite('flashbla', '', -2, -2);
makeGraphic('flashbla',screenWidth+4,screenHeight+4,'ffffff')
addLuaSprite('flashbla', true);
setBlendMode('flashbla', 'SUBTRACT')
setObjectCamera('flashbla', 'other')
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
            triggerEvent('hud','1')
            else
            triggerEvent('hud',0)

        end
    end
end


folowcam = true
camX = 1650
camY = 3000
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end

function onStepHit()
    if curStep == 1 then
        setProperty('markanim.visible',false)
        doTweenAlpha('flashbla','flashbla',0,5)
        doTweenX('3','camFollow',1650,5.5,'quadOut')
        doTweenY('4','camFollow',1900,5.5,'quadOut')
        folowcam = false
        camX = 1750
        camY = 1900
    elseif curStep == 192 then
        beat = 1
        playAnim('gf','fall',true)
        setProperty('gf.alpha', 1)
    elseif curStep == 438 then
        beat = 0

    elseif curStep == 576 then
        setProperty('gf.visible',false)
    elseif curStep == 696 then
        doTweenAlpha('1c','flashbla',1,0.75)
    elseif curStep == 704 then
        doTweenAlpha('1c','flashbla',0,0.75)
        setProperty('gf.visible',true)
    elseif curStep == 832 or curStep == 1536 or curStep == 1856 then
        beat = 1
    elseif curStep == 1088 or curStep == 1720 then
        beat = 0
    elseif curStep == 1156 then
        playAnim('markanim','dialogue',true)
        setProperty('markanim.visible',true)
        setProperty('dad.visible',false)
    elseif curStep == 1208 or curStep == 2016 then
        doTweenAlpha('1c','flashbla',1,0.75)
    elseif curStep == 1216 then
        doTweenAlpha('1c','flashbla',0,0.75)
        removeLuaSprite('sky',true)
        removeLuaSprite('boat',true)
        removeLuaSprite('pillars',true)
        removeLuaSprite('p1',true)
        removeLuaSprite('p2',true)
        removeLuaSprite('p3',true)
        removeLuaSprite('markanim',true)
        setProperty('gf.visible',false)
        setProperty('hand.visible',true)
        setProperty('fire.visible',true)
        setProperty('floor.visible',true)
    elseif curStep == 1472 then
        beat = 2
    elseif curStep == 1984 then
        doTweenAlpha('1c','camHUD',0,0.75)
        beat = 0
    end
end

beat = 0
turn = false
function onBeatHit()
    if curBeat %1 == 0 and beat == 1 then
        turn = (turn == true and false or turn == false and true)
        setProperty('camGame.angle', (turn == true and -3 or 3))
        setProperty('camHUD.angle',(turn == true and -3 or 3))

        setProperty('camGame.x',(turn == true and -10 or 10))
        setProperty('camHUD.x',(turn == true and -10 or 10))

        doTweenX('x1','camGame',0,1,'expoOut')
        doTweenAngle('ang1','camGame',0,1,'expoOut')
        doTweenAngle('ang2','camHUD',0,1,'expoOut')
    end

    if curBeat %2 == 1 and beat == 2 then
        turn = (turn == true and false or turn == false and true)
        setProperty('camGame.angle', (turn == true and -3 or 3))
        setProperty('camHUD.angle',(turn == true and -3 or 3))

        setProperty('camGame.x',(turn == true and -10 or 10))
        setProperty('camHUD.x',(turn == true and -10 or 10))

        doTweenX('x1','camGame',0,1,'expoOut')
        doTweenAngle('ang1','camGame',0,1,'expoOut')
        doTweenAngle('ang2','camHUD',0,1,'expoOut')
    end


end
