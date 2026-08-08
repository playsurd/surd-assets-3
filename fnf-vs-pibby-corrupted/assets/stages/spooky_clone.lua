function onCreate()
precacheSound('thunder_1')
precacheSound('thunder_2')


makeAnimatedLuaSprite('halloweenBG', 'halloween_bg', -200, -50);
addAnimationByPrefix('halloweenBG', 'idle', 'halloweem bg0', 24, false);
addAnimationByPrefix('halloweenBG', 'thunder', 'halloweem bg lightning strike', 24, false);
addLuaSprite('halloweenBG');

makeAnimatedLuaSprite('SpookyBG', 'backgrounds/spookybg/SpookyBG', 50, 0);
addAnimationByPrefix('SpookyBG', 'idle', 'SpookyBG', 24, true);
addLuaSprite('SpookyBG');

makeLuaSprite('halloweenWhite',nil,-200,-50)
makeGraphic('halloweenWhite', 'halloweenBG.width', 'halloweenBG.height', 'FFFFFF')
setBlendMode('halloweenWhite', 'add')
addLuaSprite('halloweenWhite', true);
end

local chrColor = {'red','green','blue'}
function onCreatePost()
    setProperty('halloweenWhite.alpha', 0)

end

local lightningStrikeBeat = 0
local lightningOffset = 8
function onBeatHit()
    if getRandomBool(10) and curBeat > lightningStrikeBeat + lightningOffset and getProperty('halloweenBG.alpha') == 1 and getProperty('halloweenBG.visible') == true and getProperty('camGame.alpha') == 1 and getProperty('camGame.visible') == true and getProperty('GBG.visible') == false then

        lightningStrikeBeat = curBeat
        lightningOffset = getRandomInt(8, 24)
        playAnim('halloweenBG','thunder',true)
        playSound('thunder_'..getRandomInt(1,2), 1);
        setProperty('halloweenWhite.alpha', 0.4)
        doTweenAlpha('hWA', 'halloweenWhite', 0.5, 0.075)
         if curStep > 127 and curStep < 240 and songName == 'Spooked' then
             FUCK = 255
             FUCK2 = 255
        end
    end
end


function onTweenCompleted(t)
    if t == 'hWA' then
        doTweenAlpha('hWA0', 'halloweenWhite', 0, 0.25, 'linear')
    end
end


FUCK = -255
FUCK2 = -50
function onUpdatePost()
    if curStep > 127 and curStep < 240 and songName == 'Spooked' then
        for i = 1,#chrColor do
            setProperty('dad.colorTransform.'..chrColor[i]..'Offset',FUCK)
            setProperty('boyfriend.colorTransform.'..chrColor[i]..'Offset',FUCK)
            setProperty('SpookyBG.colorTransform.'..chrColor[i]..'Offset',FUCK)
            setProperty('halloweenBG.colorTransform.'..chrColor[i]..'Offset',FUCK2)
        end
    end
end


function boundTo(value, min, max)
return math.max(min, math.min(max, value))
end
function math.lerp(from,to,i)
return from+(to-from)*i
end


function onUpdate(elapsed)
    if curStep > 127 and curStep < 240 and songName == 'Spooked' then
        FUCK = math.lerp(FUCK, -255, boundTo(elapsed * 7, 0, 500));
        FUCK2 = math.lerp(FUCK2, -50, boundTo(elapsed * 7, 0, 500));
    end
end