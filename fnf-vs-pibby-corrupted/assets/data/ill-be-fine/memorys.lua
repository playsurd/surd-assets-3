function onCreate()
   for i = 9,28 do
        makeLuaSprite('M'..i, 'memorys/M'..i);
        setObjectCamera('M'..i, 'hud')
        addLuaSprite('M'..i)
    end
end

function onCreatePost()
    for i = 9,28 do
        setProperty('M'..i..'.alpha',0)
    end
end


function onStepHit()
    if curStep == 2112 then
        setProperty('M10.alpha',1)
        doTweenAlpha('M10','M10',0,2.3)

    elseif curStep == 2144 then
        setProperty('M12.alpha',1)
        doTweenAlpha('M12','M12',0,2.3)
        removeLuaSprite('M10',true)

    elseif curStep == 2176 then
        setProperty('M13.alpha',1)
        doTweenAlpha('M13','M13',0,2.3)
        removeLuaSprite('M12',true)

    elseif curStep == 2208 then
        setProperty('M11.alpha',1)
        doTweenAlpha('M11','M11',0,1)
        removeLuaSprite('M13',true)

    elseif curStep == 2224 then
        setProperty('M9.alpha',1)
        doTweenAlpha('M9','M9',0,1)
        removeLuaSprite('M11',true)

    elseif curStep == 2240 then
        setProperty('M15.alpha',1)
        doTweenAlpha('M15','M15',0,2.3)
        removeLuaSprite('M9',true)

    elseif curStep == 2272 then
        setProperty('M16.alpha',1)
        doTweenAlpha('M16','M16',0,2.3)
        removeLuaSprite('M15',true)

    elseif curStep == 2304 then
        setProperty('M14.alpha',1)
        doTweenAlpha('M14','M14',0,2.3)
        removeLuaSprite('M16',true)

    elseif curStep == 2336 then
        setProperty('M18.alpha',1)
        doTweenAlpha('M18','M18',0,1)
        removeLuaSprite('M14',true)

    elseif curStep == 2352 then
        setProperty('M17.alpha',1)
        doTweenAlpha('M17','M17',0,1)
        removeLuaSprite('M18',true)

    elseif curStep == 2368 then
        setProperty('M19.alpha',1)
        doTweenAlpha('M19','M19',0,2.3)
        removeLuaSprite('M17',true)

    elseif curStep == 2400 then
        setProperty('M20.alpha',1)
        doTweenAlpha('M20','M20',0,2.3)
        removeLuaSprite('M19',true)

    elseif curStep == 2432 then
        setProperty('M21.alpha',1)
        doTweenAlpha('M21','M21',0,2.3)
        removeLuaSprite('M20',true)

    elseif curStep == 2464 then
        setProperty('M22.alpha',1)
        doTweenAlpha('M22','M22',0,1)
        removeLuaSprite('M21',true)

    elseif curStep == 2480 then
        setProperty('M23.alpha',1)
        doTweenAlpha('M23','M23',0,1)
        removeLuaSprite('M22',true)

    elseif curStep == 2496 then
        setProperty('M24.alpha',1)
        doTweenAlpha('M24','M24',0,2.3)
        removeLuaSprite('M23',true)

    elseif curStep == 2528 then
        setProperty('M25.alpha',1)
        doTweenAlpha('M25','M25',0,2.3)
        removeLuaSprite('M24',true)

    elseif curStep == 2560 then
        setProperty('M26.alpha',1)
        doTweenAlpha('M26','M26',0,2.3)
        removeLuaSprite('M25',true)

    elseif curStep == 2592 then
        setProperty('M27.alpha',1)
        doTweenAlpha('M27','M27',0,1)
        removeLuaSprite('M26',true)

    elseif curStep == 2608 then
        setProperty('M28.alpha',1)
        doTweenAlpha('M28','M28',0,1)
        removeLuaSprite('M27',true)

    elseif curStep == 2624 then
        removeLuaSprite('M28',true)

    end
end