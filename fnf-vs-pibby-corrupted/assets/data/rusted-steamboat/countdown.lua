function onCreate()
precacheSound('te')
precacheSound('te end')
setProperty('skipCountdown', true)

makeAnimatedLuaSprite('countdown', 'Countdown old', 0, 0);
addAnimationByPrefix('countdown','Idle', 'Counting', 10, false);
scaleObject('countdown', 2, 2)
setProperty('countdown.visible', false)
setObjectCamera('countdown', 'other')
setSpriteShader("countdown", "old film")--shader effect
addLuaSprite("countdown");

setObjectOrder('vig', getObjectOrder('countdown') + 1)-- below the Vignette effect
end

function onCreatePost()
runTimer('countdownStart', 1)-- start the countdown in a second
end

function onTimerCompleted(t)
if t == 'countdownStart' then
setProperty('countdown.visible',true)--show image
playAnim('countdown', 'Idle', true)
runTimer('countdownDone', 6)--remove the countdown and start the song
playSound('te', 1)
runTimer('playsound', 1,4)
runTimer('playsoundEnd', 5)


elseif t == 'playsound' then
playSound('te', 1)
elseif t == 'playsoundEnd' then
playSound('te end', 1)
elseif t == 'countdownDone' then
removeLuaSprite('countdown', true)
countdownStart = true
startCountdown()
end
end

function onUpdatePost()
setShaderFloat("countdown", "iTime", os.clock())
end

countdownStart = false
function onStartCountdown()
if not countdownStart then
return Function_Stop
else
    return Function_Continue;
end
end

--startCountdown()