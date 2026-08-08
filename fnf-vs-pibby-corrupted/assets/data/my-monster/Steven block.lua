function onCreate()
    makeAnimatedLuaSprite('Steven_block', 'special_Anims/block')
    addAnimationByPrefix('Steven_block', 'Block', 'Block',24,false)
    scaleObject('Steven_block', 0.9, 0.9)
    addLuaSprite('Steven_block',true)
    setProperty('Steven_block.offset.x', 0)
    setProperty('Steven_block.offset.y', 213)
end

function onCreatePost()
    setProperty('Steven_block.visible', false)
end

function onStepHit()
    if curStep == 1025 then
    setProperty('Steven_block.x', getProperty('dad.x'))
    setProperty('Steven_block.y', getProperty('dad.y'))
    end
end