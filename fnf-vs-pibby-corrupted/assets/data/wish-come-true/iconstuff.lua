function rgbToHex(array)return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])end

function onCreatePost()
    makeLuaSprite('iconP3', 'icons/icon-timmy', 0,0)

    setProperty('iconP3.y', getProperty('iconP1.y') - 50)
    setObjectCamera('iconP3', 'hud')
    setProperty('iconP3.visible',false)
    addLuaSprite('iconP3')

    setProperty("iconP3._frame.frame.y", 0)
    setProperty("iconP3._frame.frame.width", 150)
    setProperty("iconP3._frame.frame.height", 150)

    setObjectOrder('iconP3', getObjectOrder('iconP2') - 1)

    makeLuaSprite('helthBar2', nil, getProperty('healthBar.x'),getProperty('healthBar.y'))
    makeGraphic('helthBar2', getProperty('healthBar.width'),getProperty('healthBar.height') / 1.7, rgbToHex(getProperty('gf.healthColorArray')))
    setObjectCamera('helthBar2', 'hud')
    addLuaSprite('helthBar2')
    setProperty('helthBar2.visible',false)
    setObjectOrder('helthBar2', getObjectOrder('iconP1') - 1)
end



function onUpdatePost()
    if curStep < 1440 then
        if getProperty('iconP2.animation.curAnim.curFrame') == 0 then
            setProperty('iconP2.offset.x', 0)
            setProperty('iconP2.offset.y', 15)
            setProperty('iconP2.angle',0)

        else
            setProperty('iconP2.offset.x', getRandomInt(-3,3))
            setProperty('iconP2.offset.y', getRandomInt(10,16))
            setProperty('iconP2.angle', getRandomInt(-3,3))

        end
    end





    if curStep >= 1440 then
        setProperty("helthBar2._frame.frame.width", (getProperty('healthBar.percent')) * -6.01 + 601)

        if getProperty('iconP2.animation.curAnim.curFrame') == 0 then
            setProperty('iconP3.x', getProperty('iconP2.x') - 90)
            setProperty('iconP3.scale.x', getProperty('iconP2.scale.x'))
            setProperty('iconP3.scale.y', getProperty('iconP2.scale.y'))

            setProperty("iconP3._frame.frame.x", 0)
            setProperty('iconP2.offset.x', 0)
            setProperty('iconP2.offset.y', 15)
            setProperty('iconP2.angle',0)

        else
            setProperty('iconP3.x', getProperty('healthBar.percent') * -6.01 + 728)
            setProperty('iconP3.scale.x', 1)
            setProperty('iconP3.scale.y', 1)

            setProperty("iconP3._frame.frame.x", 150)
            setProperty('iconP2.offset.x', getRandomInt(-3,3))
            setProperty('iconP2.offset.y', getRandomInt(10,16))
            setProperty('iconP2.angle', getRandomInt(-3,3))

        end

        setProperty('helthBar2.alpha', getProperty('healthBar.alpha'))
        setProperty('iconP3.alpha', getProperty('iconP2.alpha'))
        setProperty('iconP3.visible', getProperty('iconP2.visible'))

        if getProperty('healthBar.percent') == 100 then
            setProperty('helthBar2.visible', false)
        else
            setProperty('helthBar2.visible', getProperty('healthBar.visible'))
        end
    end
end