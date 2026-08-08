function onCreatePost()
    setProperty('camGame.alpha',0)
    setProperty('camHUD.alpha',0)
end


function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
        else
            folowcam = false
        end
    end



    if n == 'GBG' then
        if v1 == 'on' then
        setProperty("dad.colorTransform.color", 0xffffff)
        setProperty("gf.colorTransform.color", 0xffffff)
        setProperty("pibby.colorTransform.color", 0xcdcdcd)
            for i = 1,10 do
                setProperty('bg'..i..'.visible', false)
            end
        else
        setProperty("pibby.colorTransform", nil)
        setProperty('pibby.alpha',0)
        setProperty('pibby.alpha',1)
            for i = 1,10 do
                setProperty('bg'..i..'.visible', true)
            end
        end
    end


end

folowcam = false
camX = 1500
camY = 900
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end

    if not mustHitSection and not folowcam then--makes dad camera not delayed anymore
        cameraSetTarget('dad')
    end
end



function onStepHit()
    if curStep == 32 then
        doTweenAlpha('1','countdown',0,1.6)
    elseif curStep == 48 then
        doTweenAlpha('2','camGame',1,1.6)
        doTweenAlpha('3','camHUD',1,1.6)

    elseif curStep == 1536 then
        doTweenAlpha('1','camGame',0,1.6)
        doTweenAlpha('2','camHUD',0,1.6)
    elseif curStep == 1555 then
        setProperty('boyfriend.visible',false)
        setProperty('pibby.visible',false)
    elseif curStep == 1560 then
        doTweenAlpha('1','camGame',1,3.2)
    elseif curStep == 1600 then
        setProperty('camHUD.alpha',1)
        setProperty('boyfriend.visible',true)
        setProperty('pibby.visible',true)
    end
end


function onUpdatePost()
    setProperty('gf.y', getProperty('bg6.y') + 630)
    setProperty('dad.y', getProperty('bg6.y') + 570)
end