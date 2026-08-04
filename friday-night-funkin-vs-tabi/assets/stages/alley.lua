--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeLuaSprite('obj1', 'alley/Alley', -718, -294)
	setObjectOrder('obj1', 0)
	addLuaSprite('obj1', true)
	
	makeAnimatedLuaSprite('obj3', 'alley/overlay', -852, -2551)
	setObjectOrder('obj3', 4)
	scaleObject('obj3', 2, 2)
	addAnimationByPrefix('obj3', 'anim', 'Overlay0', 24, true)
	playAnim('obj3', 'anim', true)
	addLuaSprite('obj3', true)
	
	makeLuaSprite('obj4', 'alley/alley foreground', -717, -296)
	setObjectOrder('obj4', 5)
	addLuaSprite('obj4', true)
	
end
