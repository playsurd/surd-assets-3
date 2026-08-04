local allowCountdown = false;
local allowCountdownEnd = false;
local continue = false;

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.02 then
        setProperty('health', health- 0.02);
    end
end
function onCreate()

	health = getProperty('health')

	if getProperty('health') > 0.2 then
	    setProperty('health', health+ 50)
	end
end