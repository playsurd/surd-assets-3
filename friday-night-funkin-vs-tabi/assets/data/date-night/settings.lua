function onCreatePost()

    makeAnimatedLuaSprite('crowd', 'datesong/Crowd/crowd', 560, 120)
    addLuaSprite('crowd', false)
    scaleObject('crowd', 0.7, 0.7);

    makeAnimatedLuaSprite('crowd2', 'datesong/Crowd/crowd2', 1150, 120)
    addLuaSprite('crowd2', false)
    scaleObject('crowd2', 0.7, 0.7);
    setProperty('crowd2.flipX', false)
end

function onBeatHit()

    if curBeat % 4 == 0 then
    addAnimationByPrefix('crowd2', 'boop', 'crowd bop', 14, true)
    objectPlayAnimation('crowd2','crowd bop', true)
    
    addAnimationByPrefix('crowd', 'boop', 'crowd bop', 14, true)
    objectPlayAnimation('crowd','crowd bop', true)

end
end