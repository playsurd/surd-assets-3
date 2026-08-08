dir = 'backgrounds/williebg/Wille_BG_'
function onCreate()
--------------non animated shit---------------
makeLuaSprite("bg1",'backgrounds/williebg/Wille_BG_1',0, 0);

makeLuaSprite("bg6",'backgrounds/williebg/Wille_BG_6',0, 0);

makeLuaSprite("bg9",'backgrounds/williebg/Wille_BG_9',1820, 1390);


makeAnimatedLuaSprite('bg2', 'backgrounds/williebg/Wille_BG_2', 1690, 750);
addAnimationByPrefix('bg2','Idle', 'hill glitch', 24, true);

makeAnimatedLuaSprite('bg3', 'backgrounds/williebg/Wille_BG_3', 2390, 710);
addAnimationByPrefix('bg3','Idle', 'bush_goop', 24, true);

makeAnimatedLuaSprite('bg4', 'backgrounds/williebg/Wille_BG_4', 1365, 930);
addAnimationByPrefix('bg4','Idle', 'birds', 24, true);

makeAnimatedLuaSprite('bg5', 'backgrounds/williebg/Wille_BG_5', -20, 205);
addAnimationByPrefix('bg5','Idle', 'bird', 24, true);

makeAnimatedLuaSprite('bg7', 'backgrounds/williebg/Wille_BG_7', 0, 1195);
addAnimationByPrefix('bg7','Idle', 'boat glitch', 24, true);

makeAnimatedLuaSprite('bg8', 'backgrounds/williebg/Wille_BG_8', 1635, 625);
setProperty('bg8.angle', 35);
addAnimationByPrefix('bg8','Idle', 'flag', 24, true);

makeAnimatedLuaSprite('bg10', 'backgrounds/williebg/Wille_BG_10', 2600, 1470);
addAnimationByPrefix('bg10','Idle', 'fish', 24, true);


for i = 1,10 do--scaling the objects to be a bit bigger
scaleObject('bg'..i, 1.2, 1.2)
addLuaSprite("bg"..i);
end
end



function onCreatePost()
makeLuaSprite("vig",'vig',0, 0)
setObjectCamera('vig', 'other')
setProperty('vig.alpha', 0.3)
setObjectOrder('vig',30)
addLuaSprite("vig");

    doTweenAlpha('VigTweenOut', 'vig', 0.1, 0.1)--start Vignette fade in n out stuff
    doTweenY('moveUp', 'bg6', 50, 1, 'sineInOut')--start boat to move up and down
end

function onTweenCompleted(tag)
    if tag == 'VigTweenOut' then
        doTweenAlpha('VigTweenIn', 'vig', 0.4, getRandomFloat(0.05,0.1))
    elseif tag == 'VigTweenIn' then
        doTweenAlpha('VigTweenOut', 'vig', 0.1, getRandomFloat(0.05,0.1))
    end

    if tag == 'moveUp' then
        doTweenY('moveDown', 'bg6', 0, 1, 'sineInOut')
    elseif tag == 'moveDown' then
        doTweenY('moveUp', 'bg6', 50, 1, 'sineInOut')
    end
end

function onUpdatePost()
    setProperty('bg7.y', getProperty('bg6.y') + 1200)--move boat goo glitch
    setProperty('bg8.y', getProperty('bg6.y') + 625)--move flag
end

function onUpdate()
    if not mustHitSection and not folowcam then--makes dad camera not delayed anymore
        cameraSetTarget('dad')
    end
end