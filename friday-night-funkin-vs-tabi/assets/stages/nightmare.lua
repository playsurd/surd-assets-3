--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeLuaSprite('first', 'idfk//Broken_Door_BG', 0, 0)
	setObjectOrder('first', 1)
	scaleObject('first', 1.1, 1.1)
	addLuaSprite('first', true)
	
	makeAnimatedLuaSprite('obj1', 'idfk/Main_BG', 0, 0)
	setObjectOrder('obj1', 0)
	addAnimationByPrefix('obj1', 'anim', 'MAIN BG', 24, true)
	objectPlayAnimation('obj1', 'anim', true)
	addLuaSprite('obj1', true)
	setProperty('obj1.visible', false)

	makeLuaSprite('flashy', 'white', 0, 0)
	setObjectOrder('flashy', 1)
	setProperty('flashy.alpha', 0)
	scaleObject('flashy', 1.1, 1.1)
	addLuaSprite('flashy', true)
	setProperty('flashy.visible', false)
	
	makeLuaSprite('obj2', 'idfk/MAIN_overlay', 0, 0)
	setProperty('obj2.alpha', 0.6)
	addLuaSprite('obj2', true)
	setProperty('obj2.visible', false)

	makeAnimatedLuaSprite('obj4', 'idfk/glitchy', 0, 0)
	setObjectOrder('obj4', 0)
	setObjectCamera('obj4', 'other')
	scaleObject('obj4', 0.70, 0.70);
	addAnimationByPrefix('obj4', 'anim2', 'Glitch FX', 24, true)
	objectPlayAnimation('obj4', 'anim2', true)
	addLuaSprite('obj4', true)

end

function onStepHit()
if curStep == 250 then
	setProperty('flashy.visible', true)
	setProperty('boyfriend.alpha', 0);
	setProperty('first.visible', false);
end

if curStep == 261 then
	setProperty('obj1.visible', true);
	setProperty('obj2.visible', true);
	setProperty('boyfriend.alpha', 1);
end
end

function onBeatHit()
    if curBeat >= 65 and curBeat < 193 and curBeat % 8 == 0 then
        triggerEvent('Add Camera Zoom', '0.017', '0.02')

        runTimer('halt', 0.1)
		doTweenAlpha('flashy', 'flashy', 0.3, 0.005, 'linear');
	end

		function onTimerCompleted(t)
			if t == 'halt' then
			doTweenAlpha('flashy2', 'flashy', 0, 0.3, 'linear');
			end
		end 

		if curBeat >= 257 and curBeat < 353 and curBeat % 8 == 0 then
			triggerEvent('Add Camera Zoom', '0.017', '0.02')
	
			runTimer('halt', 0.1)
			doTweenAlpha('flashy', 'flashy', 0.3, 0.005, 'linear');
		end
	
			function onTimerCompleted(t)
				if t == 'halt' then
				doTweenAlpha('flashy2', 'flashy', 0, 0.3, 'linear');
				end
			end 		

		if curBeat >= 481 and curBeat < 545 then 
				triggerEvent('Add Camera Zoom', '0.005', '0.02')
		
				runTimer('halt', 0.1)
				doTweenAlpha('flashy', 'flashy', 0.2, 0.005, 'linear');
		end
		
			function onTimerCompleted(t)
				if t == 'halt' then
				doTweenAlpha('flashy2', 'flashy', 0, 0.3, 'linear');
				end
			end 			

	if curBeat == 353 then
	
		setProperty('iconP1.alpha', 0)
		setProperty('iconP2.alpha', 0)
		setProperty('blackthing.alpha', 0)
		setProperty('foreverScore.alpha', 0)
		setProperty('tabihealthbar2.alpha', 0)
		setProperty('tabihealthbar3.alpha', 0)
		setProperty('healthBar.alpha', 0)
		setProperty('healthBarBG.alpha', 0)
	
	end

	if curBeat == 384 then
	
		setProperty('iconP1.alpha', 1)
		setProperty('iconP2.alpha', 1)
		setProperty('blackthing.alpha', 1)
		setProperty('foreverScore.alpha', 1)
		setProperty('tabihealthbar2.alpha', 1)
		setProperty('tabihealthbar3.alpha', 1)
		setProperty('healthBar.alpha', 1)
		setProperty('healthBarBG.alpha', 1)
	
	end

	if curBeat >= 612 and curBeat < 736 then 
		triggerEvent('Add Camera Zoom', '0.005', '0.02')

		runTimer('halt', 0.1)
		doTweenAlpha('flashy', 'flashy', 0.2, 0.005, 'linear');
end



end