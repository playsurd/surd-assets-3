function onCreate()

makeLuaSprite('stage', 'lovestage/stage', 0, 0)
setScrollFactor('stage', 1, 1)
addLuaSprite('stage', false)

makeLuaSprite('chairs', 'lovestage/stage', 0, -250)
setScrollFactor('chairs', 1, 1)
addLuaSprite('chairs', false)

makeLuaSprite('tables', 'lovestage/stage', 0, -250)
setScrollFactor('tables', 1, 1)
addLuaSprite('tables', false)

makeLuaSprite('lamp', 'lovestage/stage', 100, 0)
setScrollFactor('lamp', 1.5, 1.5)
addLuaSprite('lamp', false)

makeLuaSprite('blackbar4', 'blac', -800, -1575);
setLuaSpriteScrollFactor('blackbar4', 0, 0);
scaleObject('blackbar4', 1, 1);
setProperty('blackbar4.alpha', 1)
setObjectCamera('blackbar4', 'camHUD')
addLuaSprite('blackbar4', false)
setObjectOrder('blackbar4', 1)

makeLuaSprite('blackbar2', 'blac', -800, 670);
setLuaSpriteScrollFactor('blackbar2', 0, 0);
scaleObject('blackba2r', 1, 1);
setProperty('blackbar2.alpha', 1)
setObjectCamera('blackbar2', 'camHUD')
addLuaSprite('blackbar2', false)

end