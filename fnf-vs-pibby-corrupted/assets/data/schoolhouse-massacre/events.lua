function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setProperty('cameraSpeed', 100)
    setProperty('dad.x', -290)
end


function onStepHit()
    if curStep == 33 then
        camX = -100

    elseif curStep == 64 then
        setProperty('dad.x', defaultOpponentX + 100)

    elseif curStep == 1153 then
        folowcam = true
        camX = -100
        setProperty('cameraSpeed', 10000)
        setProperty('boyfriend.visible', false)
        setProperty('dad.x', -290)

    elseif curStep == 1216 or curStep == 1248 then
        setProperty('boyfriend.visible', true)
        setProperty('dad.visible', false)
        camX = 1100

    elseif curStep == 1240 or curStep == 1272 then
        setProperty('dad.visible', true)
        camX = -100


    elseif curStep == 1280 then
        setProperty('boyfriend.visible', false)
        setProperty('camHUD.alpha', 0)

    end
end


function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
            camX = 770
            camY = 600
        else
            folowcam = false
        end
    end
end



folowcam = true
camX = 1100
camY = 600
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end