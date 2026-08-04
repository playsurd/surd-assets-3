local allowCountdown = false;
local allowCountdownEnd = false;
local continue = false;

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.030);
    end
	if dadName == 'tabigenocide' then
       cameraShake('camHUD', 0.003, 0.3) 
       cameraShake('camera', 0.005, 0.5)
       endhake('camera', 0.005, 0.5)
   end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health+ 0.025);
    end
	if boyfriendName == 'tabigenocide' then
        cameraShake('camera', 0.005, 0.5)
       end
end
function onCreate()

	health = getProperty('health')

	if getProperty('health') > 0.2 then
	    setProperty('health', health+ 100)
	end
end