function onCreate()
    addCharacterToList('Random_ass_characters/spongebob', 'dad')
    addCharacterToList('Random_ass_characters/Mega_sponge', 'dad')

    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)

    setProperty('boyfriend.color', getColorFromHex('000000'))
    setProperty('gf.color', getColorFromHex('000000'))
    setProperty('gary.color', getColorFromHex('000000'))
    setProperty('bg.color', getColorFromHex('252525'))


    makeAnimatedLuaSprite('bobfake', 'characters/Random_ass_characters/shadow-sponge')
    addAnimationByPrefix('bobfake', 'singLEFT', 'Shadow_Left', 24, false)
    addAnimationByPrefix('bobfake', 'singDOWN', 'Shadow_Down', 24, false)
    addAnimationByPrefix('bobfake', 'singUP', 'Shadow_Up', 24, false)
    addAnimationByPrefix('bobfake', 'singRIGHT', 'Shadow_Right', 24, false)
    scaleObject('bobfake', 1.2, 1.2)
    setProperty('bobfake.color', getColorFromHex('000000'))
    addOffset('bobfake','singLEFT',70,-367)
    addOffset('bobfake','singDOWN',-4,-463)
    addOffset('bobfake','singUP',60,-362)
    addOffset('bobfake','singRIGHT',-96,-414)
    addLuaSprite('bobfake', true)


    makeAnimatedLuaSprite('ready', 'special_Anims/im-ready')
    addAnimationByPrefix('ready', 'line', 'Symbol 2', 24, false)
    addLuaSprite('ready', true)


    makeAnimatedLuaSprite('bobanim1', 'special_Anims/crustaceous-one')
    addAnimationByPrefix('bobanim1', 'dialogue', 'Spongebob FirstPart', 24, false)
    scaleObject('bobanim1', 1.5,1.5)
    addLuaSprite('bobanim1', true)

    makeAnimatedLuaSprite('bobanim2', 'special_Anims/crustaceous-two')
    addAnimationByPrefix('bobanim2', 'dialogue', 'Spongebob SecondPart', 24, false)
    scaleObject('bobanim2', 1.5,1.5)
    addLuaSprite('bobanim2', true)


    makeAnimatedLuaSprite('bobdia', 'special_Anims/laughing_sponge')
    addAnimationByPrefix('bobdia', 'dialogue', 'Shadow_Transition', 24, false)
    scaleObject('bobdia', 1.5,1.5)
    addOffset('bobdia','dialogue',248,-15)
    addLuaSprite('bobdia', true)

    makeAnimatedLuaSprite('die', 'special_Anims/Sponge_Dies')
    addAnimationByPrefix('die', 'dialogue', 'Sponge_dead', 24, false)
    addLuaSprite('die', true)

    makeAnimatedLuaSprite('space', 'Spacebar_Event')
    addAnimationByPrefix('space', 'wait', 'Space_Wait', 3, true)
    addAnimationByPrefix('space', 'hit', 'Space_Now', 6, true)
    screenCenter('space', 'xy')
    setObjectCamera('space','other')
    addLuaSprite('space', true)

end


local bgs = {'GlitchBehindChair', 'GlitchInFishEye', 'GlitchInFishMouth', 'GlitchOnDaFishTail', 'GlitchOnDaCeiling', 'GlitchOnDaChair', 'GlitchOnDaSeat', 'GlitchUnderDoor', 'GlitchOnDaMiddleWall', 'GlitchOnDaLeftWall', 'gary'}

function onCreatePost()
    setProperty('bobfake.x',getProperty('dad.x'))
    setProperty('bobfake.y',getProperty('dad.y'))

    setProperty('bobdia.x',getProperty('dad.x'))
    setProperty('bobdia.y',getProperty('dad.y'))

    setProperty('bobfake.alpha', 0)

    setProperty('ready.alpha', 0)

    setProperty('bobdia.alpha', 0)

    setProperty('bobanim1.alpha', 0)

    setProperty('bobanim2.alpha', 0)

    setProperty('die.alpha', 0)

    setProperty('space.alpha', 0)

    for i = 1,#bgs do
        setProperty(bgs[i]..'.visible', false)
    end
    setProperty('dad.visible',false)
    setProperty('JellyDance1.visible',false)
    setProperty('JellyDance2.visible',false)
    setProperty('JellyDance3.visible',false)
    setProperty('JellyDance4.visible',false)
    setProperty('Jelly Gang1.visible',false)
    setProperty('Jelly Gang2.visible',false)
    setProperty('Jelly Gang3.visible',false)
end


function onSongStart()
    doTweenAlpha('3', 'camGame', 1, 15)
end


local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt'}
function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
            camX = 900
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
            for i = 1,#bgs do
                setProperty(bgs[i]..'.visible', false)
            end
        else
            for i = 1,#bgs do
                setProperty(bgs[i]..'.visible', true)
            end
        end
    end
end

folowcam = false
camX = 900
camY = 600
spaceHit = 0
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end

    if spaceHit == 1 and keyJustPressed('space') then
        spaceHit = 2
    end
end


function onStepHit()
    if curStep == 120 or curStep == 248 then
        doTweenAlpha('3', 'camGame', 0, 0.8)

    elseif curStep == 127 then
    setProperty('dad.visible',true)
    setProperty('dad.color', getColorFromHex('000000'))
    setProperty('bg.visible',true)
    setProperty('gary.visible',true)

    elseif curStep == 128 then
        doTweenAlpha('3', 'camGame', 1, 0.8)

    elseif curStep == 271 then
        removeLuaSprite('bobfake', true)
        setProperty('boyfriend.visible', false)
        setProperty('gf.visible', false)
        folowcam = true
        camX = 500
        camY = 580
        setProperty('boyfriend.color', getColorFromHex('ffffff'))
        setProperty('gf.color', getColorFromHex('ffffff'))
        setProperty('bg.color', getColorFromHex('ffffff'))
        setProperty('dad.color', getColorFromHex('ffffff'))
        setProperty('gary.color', getColorFromHex('ffffff'))



    elseif curStep == 376 then
        setProperty('dad.visible', false)
        playAnim('bobdia','dialogue',true)
        setProperty('bobdia.alpha', 1)

    elseif curStep == 416 then
        camY = 470
        setProperty('boyfriend.visible', true)
        setProperty('gf.visible',true)
        setProperty('dad.visible',true)
        removeLuaSprite('bobdia',true)

    elseif curStep == 791 then
        setProperty('ready.x', getProperty('dad.x') - 300)
        setProperty('ready.y', getProperty('dad.y') - 200)

    elseif curStep == 792 then
        folowcam = true
        camX = 500
        camY = 580
        setProperty('camHUD.alpha', 0)
        playAnim('ready', 'line', true)
        setProperty('ready.alpha', 1)
        setProperty('dad.visible', false)
        setProperty('boyfriend.visible', false)

    elseif curStep == 800 then
        folowcam = false
        camY = 360
        setProperty('dad.visible', true)
        setProperty('camHUD.alpha', 1)
        setProperty('boyfriend.visible', true)
        removeLuaSprite('ready', true)
        partymode = true
        setProperty('Jelly Gang1.visible', true)
        setProperty('Jelly Gang2.visible', true)
        setProperty('Jelly Gang3.visible', true)

    elseif curStep == 928 or curStep == 1048 then
        triggerEvent('hud','1')

    elseif curStep == 929 then
        partymode = false
        setProperty('Jelly Gang1.visible', false)
        setProperty('Jelly Gang2.visible', false)
        setProperty('Jelly Gang3.visible', false)

    elseif curStep == 930 then
        camY = 470

        for i = 1,#bgs do
            setProperty(bgs[i]..'.color', getColorFromHex('ffffff'))
        end
        setProperty('bg.color', getColorFromHex('ffffff'))
        setProperty('boyfriend.color', getColorFromHex('ffffff'))
        setProperty('gf.color', getColorFromHex('ffffff'))

    elseif curStep == 937 then
        setProperty('dad.visible',true)
        setProperty('dad.color', getColorFromHex('ffffff'))
        setProperty('dad.alpha',1)

    elseif curStep == 940 or curStep == 1056 then
        triggerEvent('hud',0)

    elseif curStep == 1184 then

        for i = 1,4 do
            setProperty('JellyDance'..i..'.visible',true)
            setProperty("JellyDance"..i..".colorTransform.color", 0xFEA4C9)
        end
        setProperty('bg.visible',false)

    elseif curStep == 1307 then
        setProperty('boyfriend.visible', false)
        setProperty('gf.visible', false)
        setProperty('dad.visible', false)
        folowcam = true
        camX = 650
        camY = 580

        for i = 1,4 do
            setProperty('JellyDance'..i..'.visible',false)
        end

    elseif curStep == 1308 then
        setProperty('bobanim1.x', getProperty('dad.x'))
        setProperty('bobanim1.y', getProperty('dad.y'))
        setProperty('bobanim1.alpha', 1)
        playAnim('bobanim1', 'dialogue', true)


    elseif curStep == 1340 then
        removeLuaSprite('bobanim1', true)
        setProperty('bobanim2.x', getProperty('dad.x') - 100)
        setProperty('bobanim2.y', getProperty('dad.y') - 300)
        setProperty('bobanim2.alpha', 1)
        playAnim('bobanim2', 'dialogue', true)

    elseif curStep == 1376 then
        for i = 1,4 do
            setProperty('JellyDance'..i..'.visible',true)
            setProperty("JellyDance"..i..".colorTransform", nil)
            setProperty('JellyDance'..i..'.alpha',0)
            setProperty('JellyDance'..i..'.alpha',1)
        end

        setProperty('bg.visible',true)

        camX = 900
        camY = 470

        setProperty('dad.visible', true)

        partymode = true
        setProperty('Jelly Gang1.visible', true)
        setProperty('Jelly Gang2.visible', true)
        setProperty('Jelly Gang3.visible', true)
        removeLuaSprite('bobanim2', true)
        setProperty('boyfriend.visible', true)
        setProperty('gf.visible', true)

    elseif curStep == 1488 then
        playAnim('space','wait',true)
        doTweenAlpha('sp','space',1,1,'expoOut')

    elseif curStep == 1500 then
        playAnim('space','hit',true)
        setProperty('GBG.alpha',0)
        setProperty('GBG.visible',true)
        spaceHit = 1

    elseif curStep == 1504 then
        if spaceHit == 2 then
            setProperty('die.x',getProperty('dad.x') - 350)
            setProperty('die.y',getProperty('dad.y') - 200)

            partymode = false
            triggerEvent('Play Animation','attack','bf')
            playAnim('die','dialogue',true)
            setProperty('die.alpha',1)
            setProperty('dad.visible',false)


            doTweenAlpha("JD1",'JellyDance1',0,1,'expoOut')
            doTweenAlpha("JD2",'JellyDance2',0,1,'expoOut')
            doTweenAlpha("JD3",'JellyDance3',0,1,'expoOut')
            doTweenAlpha("JD4",'JellyDance4',0,1,'expoOut')
            doTweenAlpha("JG1",'Jelly Gang1',0,1,'expoOut')
            doTweenAlpha("JG2",'Jelly Gang2',0,1,'expoOut')
            doTweenAlpha("JG3",'Jelly Gang3',0,1,'expoOut')
            doTweenAlpha("bg",'bg',0,1,'expoOut')
            doTweenAlpha("camg",'camHUD',0,1,'expoOut')
            doTweenAlpha("sp",'space',0,1,'expoOut')
            doTweenAlpha("GBG",'GBG',1,1,'expoOut')
            doTweenColor('dad','dad','ffffff',1,'expoOut')
            doTweenColor('bf','boyfriend','ffffff',1,'expoOut')
            doTweenColor('gf','gf','ffffff',1,'expoOut')

        else
            triggerEvent('Play Animation','singRIGHT','dad')
            doTweenX('d','dad',getProperty('die.x') + 300,1,'expoOut')
        end

    elseif curStep == 1505 and spaceHit == 1 then
        addHealth(-3)

    elseif curStep == 1539 then
        triggerEvent('Play Animation','attack','bf')
        doTweenAlpha('cjw','camGame',0,1,'expoOut')

    elseif curStep == 1551 then
        setProperty('camGame.visible',false)

    end
end



partymode = false
local colors = {'F794F7', '31A2FD', '31FD8C', 'F96D63'}
function opponentNoteHit(id, dir, noteType, isSustainNote)
    if noteType == '3rd Player' and not isSustainNote then
        playAnim('bobfake', getProperty('singAnimations')[dir + 1], true)
        setProperty('bobfake.alpha', 0.5)
        doTweenAlpha('9sj', 'bobfake', 0, 1)
    end

    if partymode and not isSustainNote then
        for i = 1,#bgs do
            setProperty(bgs[i]..'.color', getColorFromHex(colors[dir + 1]))
        end

        setProperty('Jelly Gang1.color', getColorFromHex(colors[dir + 1]))
        setProperty('Jelly Gang2.color', getColorFromHex(colors[dir + 1]))
        setProperty('Jelly Gang3.color', getColorFromHex(colors[dir + 1]))
        setProperty('bg.color', getColorFromHex(colors[dir + 1]))
        setProperty('boyfriend.color', getColorFromHex(colors[dir + 1]))
        setProperty('gf.color', getColorFromHex(colors[dir + 1]))
        setProperty('dad.color', getColorFromHex(colors[dir + 1]))

        if curStep > 1375 and curStep <= 1500 then
            setProperty('JellyDance1.color', getColorFromHex(colors[dir + 1]))
            setProperty('JellyDance2.color', getColorFromHex(colors[dir + 1]))
            setProperty('JellyDance3.color', getColorFromHex(colors[dir + 1]))
            setProperty('JellyDance4.color', getColorFromHex(colors[dir + 1]))
        end
    end
end