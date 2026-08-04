
function onCreate()

	-- This is the background part for the beach.
	-- The beach is used on Tabi and GF week, before all the incident.
	-- Used for Embrace.

	-- Since this is a solo song, there's no need to see either dad or gf.
	setProperty('dad.visible,', false)
	setProperty('gf.visible', false)

	makeLuaSprite('background', 'beach/beach sea', 0, 0);
	addLuaSprite('background', false);
	
	makeLuaSprite('trees', 'beach/beach trees', 0, 0);
	addLuaSprite('trees', false);

	makeLuaSprite('sand', 'beach/beachstage', 0, 0);
	addLuaSprite('sand', false);

	makeLuaSprite('bushes', 'beach/bushes', 0, 0);
	addLuaSprite('bushes', true);

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

	close(true)
end