
local followchars = false;

function onCreatePost()
    setProperty('boyfriend.flipX', false)
    setProperty('defaultCamZoom', 0.80)
    setProperty('camGame.zoom', 0.80)
    setProperty('camZoomingMult', 1)
    triggerEvent('Camera Follow Pos', 1600, 750) 
end

function onStepHit()


    if curStep == 128 then 
        followchars = true;
        triggerEvent('Camera Follow Pos') 
        setProperty('defaultCamZoom', 0.52)
        setProperty('camGame.zoom', 0.52)
        setProperty('camZoomingMult', 1)

end
end