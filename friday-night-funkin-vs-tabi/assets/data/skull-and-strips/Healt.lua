local allowCountdown = false;
local allowCountdownEnd = false;
local continue = false;

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.02);
    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health+ 0.015);
    end
end