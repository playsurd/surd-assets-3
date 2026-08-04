local destinypoint = -999999999
local allowCountdown = false
local canskip = true

function onCreatePost()

    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 0)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('camHUD.visible', true)
    setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)


    makeAnimatedLuaSprite('textintro', 'showdown/finalpart', 0, 0);
    setObjectCamera('textintro', 'hud')
    addAnimationByPrefix('textintro', 'move', 'finalpart movement', 24, true)
    objectPlayAnimation('textintro', 'move', false)
    addLuaSprite('textintro', true)
    runTimer('removeintro', 1.3)

    makeAnimatedLuaSprite('textintro2', 'showdown/choose', 0, 0);
    setObjectCamera('textintro2', 'hud')
    addAnimationByPrefix('textintro2', 'move2', 'choose tabiandbf', 24, true)
    objectPlayAnimation('textintro2', 'move2', false)
    setProperty('textintro2.alpha', 0)
    addLuaSprite('textintro2', true)
    setProperty('cameraSpeed', 1.5)



end



function onStartCountdown()
    if not allowCountdown then
        playSound('finalshowdown', 1, 'atmosphere')
        runTimer('chooseyourdestiny', 0.2)
    return Function_Stop
    end
    return Function_Continue;
end



function onTimerCompleted(tag)
        if tag == 'chooseyourdestiny' then
        allowCountdown = true
        startCountdown()
    end
end

function onUpdate()
    if keyJustPressed('space') and canskip == true then
        allowCountdown = true
        destinypoint = 1
        runTimer('genocidestart', 0.2)
        stopSound('atmosphere', false)
        setProperty('textintro2.alpha', 0)
        setProperty('blackintro.alpha', 1)
        setProperty('camHUD.visible', false)

        P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
        P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
        setProperty('iconP1.x',P1Mult - 110)
        setProperty('iconP1.origin.x',240)
        setProperty('iconP1.flipX',false)
        setProperty('iconP2.x',P2Mult + 110)
        setProperty('iconP2.origin.x',-100)
        setProperty('healthBar.flipX', false)

    end
    if keyJustPressed('back') and canskip == true then
        canskip = true
        allowCountdown = true
        destinypoint = 2
        runTimer('genocidestart', 0.2)
        stopSound('finalshowdown', false)
        setProperty('blackintro.alpha', 1)
        setProperty('camHUD.visible', false)
    end
end

function onStepHit()

 if destinypoint == 1 and curStep == 1 then
    stopSound('atmosphere', false)
    triggerEvent('Change Character', 0, 'tabigenocide')
    triggerEvent('Change Character', 1, 'bf-tabi-crazy')
    triggerEvent('Camera Follow Pos', 800, 400) 
    setProperty('dad.x', 1150)
    setProperty('dad.y', 480)
    setProperty('dad.flipX', false)
    setProperty('boyfriend.x', 150)
    setProperty('boyfriend.y', 540)
    setProperty('boyfriend.flipX', false)
    setProperty('healthBarBG.flipX', true)



    for i = 0,3 do

        local p = getPropertyFromGroup('opponentStrums', i, 'x') setPropertyFromGroup('opponentStrums',i,'x',getPropertyFromGroup('playerStrums', i, 'x'))
         setPropertyFromGroup('playerStrums',i,'x',p)
     end
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        setPropertyFromGroup('unspawnNotes', i, 'mustPress', not getPropertyFromGroup('unspawnNotes', i, 'mustPress'))
              if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                  setPropertyFromGroup('unspawnNotes', i, 'noMissAnimation', true)
               end
        end
  end

  if destinypoint == 2 and curStep == 1 then
    stopSound('atmosphere', false)
    setProperty('textintro2.alpha', 0)

end
end


function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'genocidestart' then
        stopSound('atmosphere', false)
        startCountdown()
        stopSound('finalshowdown', true)
        stopMusic('finalshowdown', true)
    end
    if tag == 'removeintro' then
        removeLuaSprite('textintro', true)
        setProperty('textintro2.alpha', 1)
end

    if tag == 'tabitimer' then
        allowEnd = true
	end
end