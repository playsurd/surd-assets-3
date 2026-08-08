function onCreate()
makeAnimatedLuaSprite('pibby', 'characters/GFS/pibby', 2350, 1100);

addAnimationByPrefix('pibby', 'idle', 'Pibby idle', 24, false);
addAnimationByPrefix('pibby', 'singLEFT','Pibby left pose' , 24, false);
addAnimationByPrefix('pibby', 'singDOWN', 'Pibby down pose', 24, false);
addAnimationByPrefix('pibby', 'singUP', 'Pibby up pose', 24, false);
addAnimationByPrefix('pibby', 'singRIGHT', 'Pibby right pose', 24, false);

addOffset('pibby', 'idle',0,0)
addOffset('pibby', 'singLEFT',34,-3)
addOffset('pibby', 'singDOWN',5,-24)
addOffset('pibby', 'singUP',2,-16)
addOffset('pibby', 'singRIGHT',-12,-20)

addLuaSprite('pibby');
end

function onCreatePost()
    playAnim ('pibby', 'idle', true)
end

function opponentNoteHit(id, dir, noteType, isSustainNote)
    if noteType == 'PibbySing' then
        runTimer('idle back', 0.5)
        playAnim('pibby', getProperty('singAnimations')[dir + 1], true)
    end
end

function goodNoteHit(id, dir, noteType, isSustainNote)
    if noteType == 'PibbySing' then
        runTimer('idle back', 0.5)
        playAnim('pibby', getProperty('singAnimations')[dir + 1], true)
        setPropertyFromClass('GameOverSubstate', 'characterName', 'Game_Overs/pib-dead');
        else
        setPropertyFromClass('GameOverSubstate', 'characterName', 'Game_Overs/bf-dead')
    end
end


function onBeatHit()
    if curBeat % 2 == 0 and getProperty('pibby.animation.curAnim.name') == 'idle' then
        playAnim('pibby', 'idle',false);
    end
end

function onTimerCompleted(tag)
    if tag == 'idle back' then
        playAnim('pibby', 'idle',true);
    end
end