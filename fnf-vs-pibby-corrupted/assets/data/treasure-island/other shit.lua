color = {'red','green','blue'}
function opponentNoteHit(id, direction, noteType)
    if noteType == 'glitch_note' and getProperty('GBG.visible') == false then

        for i = 1,3 do
            setProperty('dad.colorTransform.'..color[i]..'Offset', 255)
            setProperty('dad.colorTransform.'..color[i]..'Multiplier', -1)

            if getProperty('hand.visible') == true then
                setProperty('hand.colorTransform.'..color[i]..'Offset', 255)
                setProperty('hand.colorTransform.'..color[i]..'Multiplier', -1)
            end
        end
        runTimer('removeInv', 0.1)
    end
end



function onTimerCompleted(t)
    if t == 'removeInv' then
        setProperty("dad.colorTransform", nil)
        setProperty("dad.alpha", 0)
        setProperty("dad.alpha", 1)
        if getProperty('hand.visible') == true then
            setProperty("hand.colorTransform", nil)
            setProperty("hand.alpha", 0)
            setProperty("hand.alpha", 1)
        end
    end

    if t == 'bfback' then
        setProperty('boyfriend.visible',true)
        removeLuaSprite('bfshot',true)
    end
end



function onCreate()
makeAnimatedLuaSprite('bfshot', 'special_Anims/FIRE_BF')
addAnimationByPrefix('bfshot','shot', 'shot', 24,false);
addLuaSprite('bfshot',true)
end


function onCreatePost()
    setProperty('bfshot.x',getProperty('boyfriend.x') - 895)
    setProperty('bfshot.y',getProperty('boyfriend.y') - 305)
end

function onSongStart()
    setProperty('bfshot.visible',false)
end


function goodNoteHit(id, dir, noteType, isSustainNote)
    if noteType == 'Bullet' and curStep < 1152 then
        playAnim('bfshot','shot',true)
        setProperty('boyfriend.visible',false)
        setProperty('bfshot.visible',true)
        runTimer('bfback',0.7)
    end
end