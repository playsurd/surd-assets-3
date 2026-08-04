function onCreatePost()

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end

    makeLuaSprite('blackintro', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackintro', 0, 0);
    scaleObject('blackintro', 3, 3);
    setProperty('blackintro.alpha', 1)
    setObjectCamera('blackintro', 'other')
    addLuaSprite('blackintro', true)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)
    playSound('rainsound', 0.4)
    setProperty('defaultCamZoom', 0.88)
    setProperty('camGame.zoom', 0.88)
    setProperty('camHUD.alpha', 0)


end


function onStepHit()

    if curStep == 40 then
        doTweenAlpha('blackfade', 'blackintro', 0.3, 9, 'linear');
        doTweenZoom('introcam', 'camGame', 0.6, 20, 'linear')
    end

    if curStep == 110 then
    doTweenAlpha('HUDappear', 'camHUD', 1, 7, 'linear')

end

   if curStep == 128 then
    setProperty('defaultCamZoom', 0.6)
    setProperty('camGame.zoom', 0.6)
   end

   if curStep == 405 then

    doTweenAlpha('HUDappear2', 'camHUD', 0, 5, 'linear')

    doTweenAlpha('blackfade2', 'blackintro', 1, 1, 'linear');
end

   if curStep == 410 then
    startVideo('Heartbroken')
end
end