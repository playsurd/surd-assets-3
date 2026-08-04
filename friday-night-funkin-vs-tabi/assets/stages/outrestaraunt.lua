function onCreate()


	-- This is the background for the restaurant outside o

    


	makeLuaSprite('normal_stage', 'datesong/background', 500, 0);
    scaleObject('normal_stage', 2, 2);
	addLuaSprite('normal_stage', false);

    makeLuaSprite('pilar', 'datesong/pilars', 500, 0);
	addLuaSprite('pilar', true);
    scaleObject('pilar', 2, 2);

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
