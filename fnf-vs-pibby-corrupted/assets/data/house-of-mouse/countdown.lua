function onCreate()
setProperty('skipCountdown', true)

makeAnimatedLuaSprite('countdown', 'Countdown old', 0, 0);
addAnimationByPrefix('countdown','Idle', 'Counting', 10.5, false);
scaleObject('countdown', 2, 2)
setProperty('countdown.visible', false)
setObjectCamera('countdown', 'other')
setObjectOrder('countdown',20)
addLuaSprite("countdown");
end

function onCreatePost()
    runTimer('countdownStart', 0.4)-- start the countdown in a second
end

function onTimerCompleted(t)
    if t == 'countdownStart' then
        setProperty('countdown.visible',true)--show image
        playAnim('countdown', 'Idle', true)
        runTimer('countdownDone', 6)--remove the countdown and start the song

    elseif t == 'countdownDone' then
        removeLuaSprite('countdown', true)
    end
end