function onCreate()
makeLuaSprite('boat', 'backgrounds/ivashkaBG/first_song/boat')
makeLuaSprite('barrel', 'backgrounds/ivashkaBG/first_song/barrel',950,1314)
addLuaSprite('boat')
addLuaSprite('barrel')

makeLuaSprite('photo', 'backgrounds/ivashkaBG/first_song/photo',610,250)
addLuaSprite('photo')

makeLuaSprite('candle', 'backgrounds/ivashkaBG/first_song/candle',1510,1765)
addLuaSprite('candle', true)
makeLuaSprite('ramka', 'backgrounds/ivashkaBG/first_song/ramka')
addLuaSprite('ramka',true)

end

function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onCreatePost()
    setHealthBarColors('0E673B',rgbToHex(getProperty('boyfriend.healthColorArray')))
setObjectOrder('barrel', getObjectOrder('dadGroup') + 1)
setObjectOrder('gfGroup', getObjectOrder('barrel') + 1)
setObjectOrder('boyfriendGroup', getObjectOrder('barrel') + 2)

setProperty('photo.visible',false)
setProperty('ramka.visible',false)
end