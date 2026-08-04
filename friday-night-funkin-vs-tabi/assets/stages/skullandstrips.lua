--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeLuaSprite('obj1', 'alley/Alley', -718, -294)
	setObjectOrder('obj1', 0)
	addLuaSprite('obj1', true)

	makeAnimatedLuaSprite('speaker', 'special/speaker', 0, 0)
	addAnimationByPrefix('speaker', 'beat', 'GF Dancing Beat', 24, true)
	scaleObject('speaker', 1.3, 1.3)
	playAnim('speaker', 'beat', true)
	addLuaSprite('speaker', false)

	makeAnimatedLuaSprite('obj3', 'alley/overlay', -852, -2551)
	setObjectOrder('obj3', 4)
	scaleObject('obj3', 2, 2)
	addAnimationByPrefix('obj3', 'anim', 'Overlay0', 24, true)
	playAnim('obj3', 'anim', true)
	addLuaSprite('obj3', true)

	makeLuaSprite('flashy', 'white', -700, -300)
	setObjectOrder('flashy', 5)
	setProperty('flashy.alpha', 0)
	scaleObject('flashy', 3, 3)
	addLuaSprite('flashy', true)

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
