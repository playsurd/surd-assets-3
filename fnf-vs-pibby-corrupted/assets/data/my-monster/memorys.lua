function onCreate()
   for i = 1,8 do
        makeLuaSprite('M'..i, 'memorys/M'..i,-200);
        setObjectCamera('M'..i, 'hud')
        scaleObject('M'..i,1.2,1.2)
        addLuaSprite('M'..i)
    end
end

function onCreatePost()
    for i = 1,8 do
        setProperty('M'..i..'.alpha',0)
    end
end


function onStepHit()
    if curStep == 640 then
        doTweenAlpha('m','M1',1,2)
        setProperty('M1.velocity.x', 20)
    elseif curStep == 672 then
        removeLuaSprite('M1',true)
        doTweenAlpha('m','M2',1,2)
        setProperty('M2.velocity.x', 20)
    elseif curStep == 704 then
        removeLuaSprite('M2',true)
        doTweenAlpha('m','M3',1,2)
        setProperty('M3.velocity.x', 20)
    elseif curStep == 736 then
        removeLuaSprite('M3',true)
        doTweenAlpha('m','M4',1,2)
        setProperty('M4.velocity.x', 20)
    elseif curStep == 768 then
        removeLuaSprite('M4',true)
        doTweenAlpha('m','M5',1,2)
        setProperty('M5.velocity.x', 20)
    elseif curStep == 800 then
        removeLuaSprite('M5',true)
        doTweenAlpha('m','M6',1,2)
        setProperty('M6.velocity.x', 20)
    elseif curStep == 832 then
        removeLuaSprite('M6',true)
        doTweenAlpha('m','M7',1,2)
        setProperty('M7.velocity.x', 20)
    elseif curStep == 864 then
        removeLuaSprite('M7',true)
        doTweenAlpha('m','M8',1,2)
        setProperty('M8.velocity.x', 20)
    elseif curStep == 892 then
        doTweenAlpha('m','M8',0,0.32)
    elseif curStep == 896 then
        removeLuaSprite('M8',true)
    end
end