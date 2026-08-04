
function onCreatePost()

    makeLuaSprite('blackscreen', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackscreen', 0, 0);
    scaleObject('blackscreen', 3, 3);
    setProperty('blackscreen.alpha', 1)
    setObjectCamera('blackscreen', 'other')
    addLuaSprite('blackscreen', true)
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)
    setProperty('camHUD.alpha', 0)
    setProperty('defaultCamZoom', 0.87)
    setProperty('camGame.zoom', 0.87)

    makeLuaSprite('whiteflash', 'white', -800, -500);
    setLuaSpriteScrollFactor('whiteflash', 0, 0);
    scaleObject('whiteflash', 3, 3);
    setProperty('whiteflash.alpha', 0)
    setObjectCamera('whiteflash', 'other')
    addLuaSprite('whiteflash', true)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end

    for i = 0,3 do

        local p = getPropertyFromGroup('opponentStrums', i, 'x') setPropertyFromGroup('opponentStrums',i,'x',getPropertyFromGroup('playerStrums', i, 'x'))
         setPropertyFromGroup('playerStrums',i,'x',p)
     end




end


function onUpdatePost()
    setProperty('iconP2.offset.x', getRandomInt(-1, 1))
    setProperty('iconP2.offset.y', getRandomInt(-1, 1))

    setProperty('healthBarBG.flipX', true)
    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
    setProperty('iconP1.x',P1Mult - 110)
    setProperty('iconP1.origin.x',240)
    setProperty('iconP1.flipX', true)
    setProperty('iconP2.flipX', true)
    setProperty('iconP2.x',P2Mult + 110)
    setProperty('iconP2.origin.x',-100)
    setProperty('healthBar.flipX', true)

end
  

    function onStepHit()

        if curStep == 1 then

            setProperty('iconP2.alpha', 0)
            setProperty('blackthing.alpha', 0)
            setProperty('foreverScore.alpha', 0)
            setProperty('tabihealthbar2.alpha', 0)
            setProperty('tabihealthbar3.alpha', 0)
            setProperty('healthBar.alpha', 0)
            setProperty('healthBarBG.alpha', 0)


            setProperty('defaultCamZoom', 1.2)
            setProperty('camGame.zoom', 1.2)
            triggerEvent('Camera Follow Pos', 800, 450) 
            doTweenAlpha('nightmare', 'blackscreen', 0, 5, 'linear')
            doTweenZoom('introcam', 'camGame', 1, 12, 'linear')

        end

        if curStep == 121 then

        doTweenAlpha('hudshow', 'camHUD', 1, 4, 'linear')
        
        end

        if curStep == 260 then


            for i = 0,3 do
                setPropertyFromGroup('strumLineNotes', i, 'visible', true)
            end
        
            
            setProperty('iconP2.alpha', 1)
            setProperty('blackthing.alpha', 1)
            setProperty('foreverScore.alpha', 1)
            setProperty('tabihealthbar2.alpha', 1)
            setProperty('tabihealthbar3.alpha', 1)
            setProperty('healthBar.alpha', 1)
            setProperty('healthBarBG.alpha', 1)




    setProperty('dad.visible', true)
    setProperty('defaultCamZoom', 1.1)
    setProperty('camGame.zoom', 1.1)       
    triggerEvent('Camera Follow Pos', 650, 450) 
    triggerEvent('Change Character', 0, 'tabi-door')
    triggerEvent('Change Character', 1, 'gfscare')
    setProperty('boyfriend.x', 100)
    setProperty('boyfriend.y', 150)
    setProperty('dad.x', 650)
    setProperty('dad.y', 300)
        
    end

    if curStep == 1412 then

        setProperty('blackscreen.alpha', 1)
    
    end
    
    if curStep == 1416 then
        triggerEvent('Change Character', 0, 'tabi-door')
        triggerEvent('Change Character', 1, 'dd')
    end
    
    
    if curStep == 1516 then
        setProperty('dad.alpha', 1);
        setProperty('dad.x', 650)
        setProperty('dad.y', 150)
        doTweenAlpha('blacktake', 'blackscreen', 0, 4, 'linear') 
    
    end

    if curStep == 2947 then
        setProperty('blackscreen.alpha', 1)
    end
end