function onCreate()


	-- This is the background part for curse,
	-- Curse is used on Tabi week after the daddy dearest incident.
	-- Used for "My battle" "Last chance" and "Blind Range"

	makeLuaSprite('normal_stage', 'restaurant/normal_stage', -510, -230);
	addLuaSprite('normal_stage', false);
	
	makeLuaSprite('sumtable', 'restaurant/sumtable', -510, -230);

	addLuaSprite('sumtable', true);

	makeLuaSprite('blackbar', 'blac', -800, -1590);
    setLuaSpriteScrollFactor('blackbar', 0, 0);
    scaleObject('blackbar', 1, 1);
    setProperty('blackbar.alpha', 1)
    setObjectCamera('blackbar', 'camHUD')
	addLuaSprite('blackbar', false)

	makeLuaSprite('blackbar2', 'blac', -800, 670);
    setLuaSpriteScrollFactor('blackbar2', 0, 0);
    scaleObject('blackba2r', 1, 1);
    setProperty('blackbar2.alpha', 1)
    setObjectCamera('blackbar2', 'camHUD')
	addLuaSprite('blackbar2', false)

	close(true)
end