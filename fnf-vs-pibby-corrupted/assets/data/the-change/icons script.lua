function rgbToHex(array)return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])end
function onCreatePost()
    makeLuaSprite('iconP3', 'icons/icon-spinel', 0,0)
    setProperty('iconP3.y', getProperty('iconP1.y') - 50)
    setObjectCamera('iconP3', 'hud')
    addLuaSprite('iconP3', false)

    setProperty("iconP3._frame.frame.y", 0)
    setProperty("iconP3._frame.frame.width", 150)
    setProperty("iconP3._frame.frame.height", 150)
    setProperty('iconP3.alpha', 0)
    setObjectOrder('iconP3', getObjectOrder('iconP2') - 1)


    makeLuaSprite('helthBar2', nil, getProperty('healthBar.x'),getProperty('healthBar.y'))
    makeGraphic('helthBar2', getProperty('healthBar.width'),getProperty('healthBar.height') / 1.7, rgbToHex(getProperty('gf.healthColorArray')))
    setObjectCamera('helthBar2', 'hud')
    addLuaSprite('helthBar2')
    setProperty('helthBar2.visible', false)
    setObjectOrder('helthBar2', getObjectOrder('iconP1') - 1)
end

function onUpdatePost()
    if curStep > 863 then

        setProperty("helthBar2._frame.frame.width", (getProperty('healthBar.percent')) * -6.01 + 601)

        setProperty('iconP3.x', getProperty('iconP2.x') - 100)
        setProperty('iconP3.scale.x', getProperty('iconP2.scale.x'))
        setProperty('iconP3.scale.y', getProperty('iconP2.scale.y'))
        setProperty('iconP3.alpha', getProperty('iconP2.alpha'))
        setProperty('iconP3.visible', getProperty('iconP2.visible'))

        setProperty('helthBar2.alpha', getProperty('healthBar.alpha'))

        if getProperty('healthBar.percent') == 100 then
            setProperty('helthBar2.visible', false)
        else
            setProperty('helthBar2.visible', getProperty('healthBar.visible'))
        end

        if getProperty('healthBar.percent') >= 81 then
            setProperty("iconP3._frame.frame.x", 150)
        else
            setProperty("iconP3._frame.frame.x", 0)
        end
    end
end