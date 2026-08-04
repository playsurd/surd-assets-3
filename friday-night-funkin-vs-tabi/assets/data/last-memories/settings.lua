

function onCreatePost()
	bfHpGain = 0.015
    setProperty('defaultCamZoom', 0.67)
    setProperty('camGame.zoom', 0.67)
    setProperty('gf.visible', true)

    end
    

    local allowCountdown = false;
local allowCountdownEnd = false;
local continue = false;

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.030);
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)

    totalGain = bfHpGain
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health+ totalGain)
    end
end
function onCreate()

	health = getProperty('health')

	if getProperty('health') > 0.2 then
	    setProperty('health', health+ 0.1)
	end
end