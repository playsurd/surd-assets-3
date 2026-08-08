dir = 'backgrounds/jenny/'
function onCreate()
makeLuaSprite('bg', 'backgrounds/jenny/bg')
scaleObject('bg', 2.2,2.2)
addLuaSprite('bg')

makeAnimatedLuaSprite('HM', 'backgrounds/jenny/HM',180,100)
addAnimationByPrefix('HM', 'idle', 'bgM',24,true)
addLuaSprite('HM')

makeAnimatedLuaSprite('HR', 'backgrounds/jenny/HR',180,100)
addAnimationByPrefix('HR', 'idle', 'bgR',24,true)
addLuaSprite('HR')

makeAnimatedLuaSprite('LeavesL', 'backgrounds/jenny/LeavesL',180,0)
addAnimationByPrefix('LeavesL', 'idle', 'left_leaves',24,true)
addLuaSprite('LeavesL')

makeAnimatedLuaSprite('LeavesR', 'backgrounds/jenny/LeavesR',150,150)
addAnimationByPrefix('LeavesR', 'idle', 'right_leaves',24,true)
addLuaSprite('LeavesR')

makeAnimatedLuaSprite('skinsuit', 'backgrounds/jenny/skinsuit',220,370)
addAnimationByPrefix('skinsuit', 'idle', 'skinsuit',24,true)
addLuaSprite('skinsuit')

makeLuaSprite('HL', 'backgrounds/jenny/HL',180,98)
addLuaSprite('HL')

makeAnimatedLuaSprite('tiger', 'backgrounds/jenny/tiger',650,450)
addAnimationByPrefix('tiger', 'idle', 'tiger',24,true)
addLuaSprite('tiger')

makeAnimatedLuaSprite('krakus', 'backgrounds/jenny/krakus',500,600)
addAnimationByPrefix('krakus', 'idle', 'krakus',24,true)
setProperty('krakus.flipX',true)
addLuaSprite('krakus')

makeAnimatedLuaSprite('Glen', 'backgrounds/jenny/Glen',410,540)
addAnimationByPrefix('Glen', 'idle', 'glen',24,true)
addLuaSprite('Glen')

makeAnimatedLuaSprite('Tiff', 'backgrounds/jenny/Tiff',300,800)
addAnimationByPrefix('Tiff', 'idle', 'Tiff',24,true)
addLuaSprite('Tiff')

makeAnimatedLuaSprite('Brit', 'backgrounds/jenny/Brit',480,750)
addAnimationByPrefix('Brit', 'idle', 'Brit',24,true)
addLuaSprite('Brit')

makeAnimatedLuaSprite('killgore', 'backgrounds/jenny/killgore',2300,1050)
addAnimationByPrefix('killgore', 'idle', 'killgore',20,true)
addLuaSprite('killgore')

makeAnimatedLuaSprite('smytus', 'backgrounds/jenny/smytus',1700,500)
addAnimationByPrefix('smytus', 'idle', 'smytus',24,true)
addLuaSprite('smytus')

makeAnimatedLuaSprite('idfk', 'backgrounds/jenny/idfk',2200,700)
addAnimationByPrefix('idfk', 'idle', 'idfk',24,true)
addLuaSprite('idfk')
end


function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onCreatePost()
    setHealthBarColors('000000',rgbToHex(getProperty('boyfriend.healthColorArray')))

    if songName == 'Malware' then
        setProperty('idfk.visible',false)
        setProperty('smytus.visible',false)
        setProperty('Glen.visible',false)
        setProperty('krakus.visible',false)
        setProperty('tiger.visible',false)
        setProperty('skinsuit.visible',false)
    end
end