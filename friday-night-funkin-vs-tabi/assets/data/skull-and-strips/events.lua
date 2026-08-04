function onCreatePost()

    makeLuaSprite('blackscreen', 'blac', -800, -500);
    setLuaSpriteScrollFactor('blackscreen', 0, 0);
    scaleObject('blackscreen', 3, 3);
    setProperty('blackscreen.alpha', 1)
    setObjectCamera('blackscreen', 'other')
    setProperty('gf.visible', false)
    addLuaSprite('blackscreen', true)
    setProperty('camHUD.visible', false)
    setProperty('defaultCamZoom', 0.87)
    setProperty('camGame.zoom', 0.87)

    makeLuaSprite('whiteflash', 'white', -800, -500);
    setLuaSpriteScrollFactor('whiteflash', 0, 0);
    scaleObject('whiteflash', 3, 3);
    setProperty('whiteflash.alpha', 0)
    setObjectCamera('whiteflash', 'other')
    addLuaSprite('whiteflash', true)




end


    function onStepHit()

        if curStep == 1 then
            doTweenZoom('introcam', 'camGame', 0.6, 12, 'linear')
            setProperty('whiteflash.alpha', 1)
            doTweenAlpha('creatures2', 'whiteflash', 0, 2, 'linear');
            doTweenAlpha('creatures', 'blackscreen', 0, 13, 'linear');
        end

        if curStep == 112 then

            setProperty('defaultCamZoom', 0.6)
            setProperty('camGame.zoom', 0.6)
        end

        if curStep == 129 then

            setProperty('camHUD.visible', true)
        end
    
        if curStep == 128 or curStep == 160 or curStep == 383 or curStep == 512 or curStep == 896 or curStep == 1024 or curStep == 1152 or curStep == 1409 or curStep == 1664 then
            cameraFlash("game", "ffffff", 0.15, true)    
            cameraShake('game',0.005, 0.5)
            cameraShake('hud',0.003, 0.5)
        end


        if curStep == 1274 then
        doTweenZoom('dropcam', 'camGame', 0.7, 0.6, 'circInOut')
        end
    
        if curStep == 1280 then
        setProperty('defaultCamZoom', 0.6)
        setProperty('camGame.zoom', 0.6)
        end



        if curStep == 1663 then
        setProperty('blackscreen.alpha', 1)
        end

        if curStep == 1656 then
            doTweenZoom('dropcam', 'camGame', 0.7, 0.8, 'circInOut')
            end
    end


    function onBeatHit()

        if curBeat >= 224 and curBeat < 288 and curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', '0.006', '0.02') 
    
        end

        if curBeat >= 320 and curBeat < 352  and curBeat % 2 == 0 then
            triggerEvent('Add Camera Zoom', '0.006', '0.02') 

            runTimer('bgflash', 0.1)
            doTweenAlpha('flashbg', 'flashy', 0.3, 0.005, 'cubeInOut');
    
        end

        function onTimerCompleted(t)
			if t == 'bgflash' then
			doTweenAlpha('flashybg2', 'flashy', 0, 0.3, 'linear');
			end
		end 

    end