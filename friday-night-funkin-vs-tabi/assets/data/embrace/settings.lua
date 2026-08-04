function onCreatePost()
setProperty('defaultCamZoom', 0.44)
setProperty('camGame.zoom', 0.44)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end

    triggerEvent('Camera Follow Pos', 1500, 700) 
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)

end
