
local healthDrop = 0.0000001;
local healthshouldbe = 2;
local ccap = 0;

function onCreate()
	-- background shit
	makeLuaSprite('BG', 'youhavebeendestroyed', -600, -300);
	setLuaSpriteScrollFactor('BG', 0.9, 0.9);

	makeLuaSprite('Destroyed_boombox', 'Destroyed_boombox', -490, -209);
	setLuaSpriteScrollFactor('Destroyed_boombox', 0.9, 0.9);
	scaleObject('Destroyed_boombox',0.9, 0.9);
	
	makeLuaSprite('glowyfurniture', 'glowyfurniture', -600, -300);
	setLuaSpriteScrollFactor('glowyfurniture', 0.9, 0.9);
	
	makeLuaSprite('overlayingsticks', 'overlayingsticks', -600, -340);
	setLuaSpriteScrollFactor('overlayingsticks', 0.9, 0.9);
	scaleObject('overlayingsticks',1.0, 1.0);

    makeAnimatedLuaSprite('fire1', 'FireStage',-1000 , 'BG.y + 889');
    setLuaSpriteScrollFactor('fire1', 0.9, 0.9);	
	scaleObject('fire1',2.5, 1.5);
	setPropertyLuaSprite('fire1', 'flipX', true)

    makeAnimatedLuaSprite('fire2', 'FireStage',800, 'BG.y + 889');
    setLuaSpriteScrollFactor('fire2', 0.9, 0.9);	
	scaleObject('fire2',2.5, 1);
	
    makeAnimatedLuaSprite('fire3', 'FireStage',0, 'BG.y + 889');
    setLuaSpriteScrollFactor('fire3', 0.9, 0.9);	
	scaleObject('fire3',1, 1);
	
	makeAnimatedLuaSprite('fire4', 'FireStage',500, 'BG.y + 889');
    setLuaSpriteScrollFactor('fire4', 0.9, 0.9);	
	scaleObject('fire4',1, 1);

	addLuaSprite('BG', false);
	addLuaSprite('fire3', false); 
	addAnimationByPrefix('fire3', 'idle', 'FireStage0', 30, true);
	addLuaSprite('fire4', false); 
	addAnimationByPrefix('fire4', 'idle', 'FireStage0', 30, true);
	addLuaSprite('boards', false);
	
	addLuaSprite('fire1', false); 
	addAnimationByPrefix('fire1', 'idle', 'FireStage0', 30, true);
	addLuaSprite('fire2', false); 
	addAnimationByPrefix('fire2', 'idle', 'FireStage0', 30, true);
	addLuaSprite('glowyfurniture', false);
	addLuaSprite('Destroyed_boombox', false);
	addLuaSprite('overlayingsticks', true);

	makeLuaSprite('tentas', 'vignette', 0, 0);
	setObjectCamera('tentas', 'camother');
	addLuaSprite('tentas', true);
	setProperty('tentas.alpha', 0);

	setProperty('health', healthshouldbe)

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

end

function onNoteMiss(id, direction, noteType, isSustainNote)
	
end

function onUpdate()

	--debugPrint(healthshouldbe)

	ccap = getProperty('combo');
	if getProperty('combo') > 40 then
		ccap = 40
	end
	
	setProperty('tentas.alpha', 1 - (getProperty('health') / 2));

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

