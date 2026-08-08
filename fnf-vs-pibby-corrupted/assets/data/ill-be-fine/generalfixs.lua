function onCreatePost()
makeAnimatedLuaSprite('pibby', 'characters/GFS/pibby', 1530,370)
addAnimationByPrefix('pibby', 'idle', 'Pibby idle',24,false)
addLuaSprite('pibby', false)

setProperty('gf.x', getProperty('dad.x') + 400)
setProperty('gf.y', getProperty('dad.y') - 360)

setProperty('dad.y', defaultOpponentY + 310)
end

function onBeatHit()
    if curBeat %2 == 0 then
        playAnim('pibby', 'idle', true)
    end
end


function rgbToHex(array)
    return (array[1] * 65536) + (array[2] * 256) + array[3]
end


function onEvent(n,v1,v2)
    if n == 'GBG' then
        if v1 == 'on' then
            setProperty("pibby.colorTransform.color", 0xea68fe)

        elseif v1 == 'off' then
            resetColor('pibby')
        end
    end
end


function resetColor(spr)
setProperty(spr..".colorTransform", nil)
local oa = getProperty(spr..".alpha")
setProperty(spr..".alpha", 0)
setProperty(spr..".alpha", oa)
end